import 'dart:async';
import 'dart:convert';
import 'dart:developer' as dev;
import 'dart:io';

import 'package:path/path.dart' as p;

/// Service responsible for all FFmpeg and FFprobe process execution.
///
/// Resolves the bundled executables relative to the application's running
/// directory (no system-wide PATH fallback). Both `ffmpeg.exe` and
/// `ffprobe.exe` must be placed alongside the application executable or
/// in a `ffmpeg/` subdirectory next to it.
class FfmpegService {
  Process? _currentProcess;
  bool _isCancelled = false;

  /// Resolves the absolute path to the bundled `ffmpeg.exe`.
  ///
  /// Lookup order:
  /// 1. `<exe_dir>/ffmpeg.exe`
  /// 2. `<exe_dir>/ffmpeg/ffmpeg.exe`
  ///
  /// Throws [FileSystemException] if not found.
  String get ffmpegPath {
    final exeDir = p.dirname(Platform.resolvedExecutable);

    final candidate1 = p.join(exeDir, 'ffmpeg.exe');
    if (File(candidate1).existsSync()) return candidate1;

    final candidate2 = p.join(exeDir, 'ffmpeg', 'ffmpeg.exe');
    if (File(candidate2).existsSync()) return candidate2;

    throw FileSystemException(
      'Bundled ffmpeg.exe not found. Looked in:\n'
      '  1. $candidate1\n'
      '  2. $candidate2\n'
      'Please ensure ffmpeg.exe is bundled with the application.',
    );
  }

  /// Resolves the absolute path to the bundled `ffprobe.exe`.
  ///
  /// Lookup order:
  /// 1. `<exe_dir>/ffprobe.exe`
  /// 2. `<exe_dir>/ffmpeg/ffprobe.exe`
  ///
  /// Throws [FileSystemException] if not found.
  String get ffprobePath {
    final exeDir = p.dirname(Platform.resolvedExecutable);

    final candidate1 = p.join(exeDir, 'ffprobe.exe');
    if (File(candidate1).existsSync()) return candidate1;

    final candidate2 = p.join(exeDir, 'ffmpeg', 'ffprobe.exe');
    if (File(candidate2).existsSync()) return candidate2;

    throw FileSystemException(
      'Bundled ffprobe.exe not found. Looked in:\n'
      '  1. $candidate1\n'
      '  2. $candidate2\n'
      'Please ensure ffprobe.exe is bundled with the application.',
    );
  }

  /// Probes the total duration of a video file using FFprobe.
  ///
  /// Returns the [Duration] of the video. Throws on failure or if the
  /// duration cannot be parsed.
  Future<Duration> probeDuration(String filePath) async {
    final probe = ffprobePath;

    final result = await Process.run(probe, [
      '-v', 'error',
      '-show_entries', 'format=duration',
      '-of', 'csv=p=0',
      filePath,
    ]);

    if (result.exitCode != 0) {
      final stderr = (result.stderr as String).trim();
      throw Exception(
        'FFprobe failed for "$filePath" (exit code ${result.exitCode}): $stderr',
      );
    }

    final output = (result.stdout as String).trim();
    final seconds = double.tryParse(output);

    if (seconds == null || seconds <= 0) {
      throw Exception(
        'FFprobe returned invalid duration "$output" for "$filePath".',
      );
    }

    return Duration(milliseconds: (seconds * 1000).round());
  }

  /// Compresses a video file using FFmpeg and yields progress updates.
  ///
  /// Emits progress values from 0.0 to 1.0 as FFmpeg processes the video.
  /// The progress is calculated by parsing `time=` from FFmpeg's stderr output
  /// and comparing it to [totalDuration].
  ///
  /// FFmpeg flags used:
  /// `-y -hide_banner -loglevel error -stats -vcodec libx264 -crf 22
  ///  -preset fast -pix_fmt yuv420p -acodec copy`
  ///
  /// Throws on non-zero exit code (unless cancelled).
  Stream<double> compress({
    required String inputPath,
    required String outputPath,
    required Duration totalDuration,
  }) async* {
    _isCancelled = false;
    final ffmpeg = ffmpegPath;
    final totalMs = totalDuration.inMilliseconds;

    if (totalMs <= 0) {
      throw ArgumentError('totalDuration must be positive, got $totalDuration');
    }

    _currentProcess = await Process.start(ffmpeg, [
      '-y',
      '-hide_banner',
      '-loglevel', 'error',
      '-stats',
      '-i', inputPath,
      '-vcodec', 'libx264',
      '-crf', '22',
      '-preset', 'fast',
      '-pix_fmt', 'yuv420p',
      '-acodec', 'copy',
      outputPath,
    ]);

    final process = _currentProcess!;

    // Regex to extract time=HH:MM:SS.xx from FFmpeg stderr progress lines.
    final timeRegex = RegExp(r'time=(\d+):(\d+):(\d+(?:\.\d+)?)');

    // Throttle progress emissions: min 100ms between updates or 0.5% delta.
    double lastEmittedProgress = 0.0;
    DateTime lastEmitTime = DateTime.now();

    // Buffer for partial lines from stderr.
    String stderrBuffer = '';

    // Collect stderr for error reporting.
    final stderrLines = <String>[];

    // Listen to stderr line-by-line (FFmpeg writes progress here).
    await for (final chunk in process.stderr.transform(utf8.decoder)) {
      if (_isCancelled) break;

      stderrBuffer += chunk;

      // Process complete lines (split by \r or \n).
      final lines = stderrBuffer.split(RegExp(r'[\r\n]+'));
      // Keep the last element as it may be an incomplete line.
      stderrBuffer = lines.removeLast();

      for (final line in lines) {
        if (line.trim().isEmpty) continue;
        stderrLines.add(line);

        final match = timeRegex.firstMatch(line);
        if (match != null) {
          final hours = int.parse(match.group(1)!);
          final minutes = int.parse(match.group(2)!);
          final seconds = double.parse(match.group(3)!);

          final currentMs =
              (hours * 3600000) + (minutes * 60000) + (seconds * 1000).round();

          final progress = (currentMs / totalMs).clamp(0.0, 1.0);
          final now = DateTime.now();

          // Throttle: emit if delta >= 0.5% or >= 100ms since last emit.
          if ((progress - lastEmittedProgress).abs() >= 0.005 ||
              now.difference(lastEmitTime).inMilliseconds >= 100) {
            lastEmittedProgress = progress;
            lastEmitTime = now;
            yield progress;
          }
        }
      }
    }

    final exitCode = await process.exitCode;
    _currentProcess = null;

    if (_isCancelled) {
      _isCancelled = false;
      throw _CompressionCancelledException();
    }

    if (exitCode != 0) {
      final errorOutput = stderrLines.join('\n').trim();
      throw Exception(
        'FFmpeg failed (exit code $exitCode):\n$errorOutput',
      );
    }

    // Ensure we emit 1.0 at completion.
    yield 1.0;
  }

  /// Cancels the currently running FFmpeg process, if any.
  void cancelCurrentProcess() {
    _isCancelled = true;
    if (_currentProcess != null) {
      dev.log('Killing FFmpeg process (PID: ${_currentProcess!.pid})',
          name: 'FfmpegService');
      _currentProcess!.kill(ProcessSignal.sigkill);
      _currentProcess = null;
    }
  }

  /// Whether a compression process is currently running.
  bool get isRunning => _currentProcess != null;
}

/// Internal exception used to signal cancellation.
class _CompressionCancelledException implements Exception {
  @override
  String toString() => 'Compression was cancelled by the user.';
}

/// Public type alias for checking cancellation in the cubit.
/// ignore: library_private_types_in_public_api
bool isCompressionCancelled(Object error) =>
    error is _CompressionCancelledException;
