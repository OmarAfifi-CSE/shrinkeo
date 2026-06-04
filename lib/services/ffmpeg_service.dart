import 'dart:async';
import 'dart:convert';

import 'dart:io';

import '../cubit/compression_state.dart';

/// Data class containing detailed progress information.
class CompressionProgress {
  final double progress;
  final double speed;
  final Duration? eta;

  CompressionProgress({required this.progress, required this.speed, this.eta});
}

/// Service responsible for all FFmpeg and FFprobe process execution.
///
/// Resolves the executables via the system-wide PATH fallback.
/// `ffmpeg` and `ffprobe` must be installed on the system (e.g. via winget).
class FfmpegService {
  Process? _currentProcess;
  bool _isCancelled = false;

  /// Resolves the path to `ffmpeg`.
  String get ffmpegPath {
    final localAppData = Platform.environment['LOCALAPPDATA'];
    if (localAppData != null) {
      final wingetPath = '$localAppData\\Microsoft\\WinGet\\Links\\ffmpeg.exe';
      if (File(wingetPath).existsSync()) return wingetPath;
    }
    return 'ffmpeg';
  }

  /// Resolves the path to `ffprobe`.
  String get ffprobePath {
    final localAppData = Platform.environment['LOCALAPPDATA'];
    if (localAppData != null) {
      final wingetPath = '$localAppData\\Microsoft\\WinGet\\Links\\ffprobe.exe';
      if (File(wingetPath).existsSync()) return wingetPath;
    }
    return 'ffprobe';
  }

  /// Verifies that FFmpeg and FFprobe are installed and accessible via PATH.
  Future<void> checkDependencies() async {
    try {
      final ffmpegResult = await Process.run(ffmpegPath, ['-version']);
      if (ffmpegResult.exitCode != 0) {
        throw Exception('FFmpeg returned exit code ${ffmpegResult.exitCode}.');
      }

      final ffprobeResult = await Process.run(ffprobePath, ['-version']);
      if (ffprobeResult.exitCode != 0) {
        throw Exception(
          'FFprobe returned exit code ${ffprobeResult.exitCode}.',
        );
      }
    } catch (e) {
      throw Exception(
        'FFmpeg or FFprobe is missing or corrupted.\n\n'
        'Please reinstall Shrinkeo or manually fix the installation using:\n'
        'winget install Gyan.FFmpeg',
      );
    }
  }

  /// Probes the total duration of a video file using FFprobe.
  ///
  /// Returns the [Duration] of the video. Throws on failure or if the
  /// duration cannot be parsed.
  Future<Duration> probeDuration(String filePath) async {
    final probe = ffprobePath;

    final result = await Process.run(probe, [
      '-v',
      'error',
      '-show_entries',
      'format=duration',
      '-of',
      'csv=p=0',
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

  /// Generates a thumbnail for a video file instantly by fast-seeking to 2 seconds.
  /// Falls back to the first frame if the video is shorter than 2 seconds.
  Future<void> generateThumbnail(String videoPath, String outputPath) async {
    final ffmpeg = ffmpegPath;

    var result = await Process.run(ffmpeg, [
      '-y',
      '-ss', '2', // Fast-seek BEFORE input for near-instant extraction
      '-i', videoPath,
      '-vframes', '1',
      '-vf', 'scale=320:-1', // Resize width to 320, maintain aspect ratio
      outputPath,
    ]);

    // If it fails (e.g., video is shorter than 2 seconds), fallback to the first frame.
    if (result.exitCode != 0) {
      result = await Process.run(ffmpeg, [
        '-y',
        '-i',
        videoPath,
        '-vframes',
        '1',
        '-vf',
        'scale=320:-1',
        outputPath,
      ]);
    }

    if (result.exitCode != 0) {
      // Thumbnail generation failed.
    }
  }

  /// Compresses a video file using FFmpeg and yields progress updates.
  ///
  /// Emits progress values from 0.0 to 1.0 as FFmpeg processes the video.
  /// The progress is calculated by parsing `time=` from FFmpeg's stderr output
  /// and comparing it to [totalDuration].
  ///
  /// [crf] controls quality (0-51, lower = better). Default: 22.
  /// [preset] controls encoding speed. Default: 'fast'.
  ///
  /// Throws on non-zero exit code (unless cancelled).
  Stream<CompressionProgress> compress({
    required String inputPath,
    required String outputPath,
    required Duration totalDuration,
    int crf = 22,
    String preset = 'fast',
    VideoCodec codec = VideoCodec.h264,
    HardwareEncoder hardwareEncoder = HardwareEncoder.software,
  }) async* {
    _isCancelled = false;
    final ffmpeg = ffmpegPath;
    final totalMs = totalDuration.inMilliseconds;

    if (totalMs <= 0) {
      throw ArgumentError('totalDuration must be positive, got $totalDuration');
    }

    String vcodec;
    if (codec == VideoCodec.h265) {
      if (hardwareEncoder == HardwareEncoder.nvidia) {
        vcodec = 'hevc_nvenc';
      } else if (hardwareEncoder == HardwareEncoder.amd) {
        vcodec = 'hevc_amf';
      } else if (hardwareEncoder == HardwareEncoder.intel) {
        vcodec = 'hevc_qsv';
      } else {
        vcodec = 'libx265';
      }
    } else {
      if (hardwareEncoder == HardwareEncoder.nvidia) {
        vcodec = 'h264_nvenc';
      } else if (hardwareEncoder == HardwareEncoder.amd) {
        vcodec = 'h264_amf';
      } else if (hardwareEncoder == HardwareEncoder.intel) {
        vcodec = 'h264_qsv';
      } else {
        vcodec = 'libx264';
      }
    }

    // Hardware encoders usually don't support crf the same way as libx264,
    // they use -cq instead of -crf.
    // For simplicity, we just pass -crf to software, and -cq for nvenc/amf.
    // Wait, FFmpeg handles -crf for many, but to be perfectly safe, let's use standard arguments.
    // Actually, -crf works for libx264 and libx265.
    // For nvenc, -cq is used. Let's adjust args dynamically.
    final args = [
      '-y',
      '-hide_banner',
      '-loglevel',
      'error',
      '-stats',
      '-i',
      inputPath,
      '-vcodec',
      vcodec,
    ];

    String mappedPreset = preset;
    if (hardwareEncoder == HardwareEncoder.nvidia) {
      switch (preset) {
        case 'ultrafast':
        case 'superfast': mappedPreset = 'p1'; break;
        case 'veryfast': mappedPreset = 'p2'; break;
        case 'faster': mappedPreset = 'p3'; break;
        case 'fast': mappedPreset = 'p4'; break;
        case 'medium': mappedPreset = 'p5'; break;
        case 'slow': mappedPreset = 'p6'; break;
        case 'veryslow': mappedPreset = 'p7'; break;
      }
    } else if (hardwareEncoder == HardwareEncoder.amd) {
      switch (preset) {
        case 'ultrafast':
        case 'superfast':
        case 'veryfast':
        case 'faster': mappedPreset = 'speed'; break;
        case 'fast':
        case 'medium': mappedPreset = 'balanced'; break;
        case 'slow':
        case 'veryslow': mappedPreset = 'quality'; break;
      }
    } else if (hardwareEncoder == HardwareEncoder.intel) {
      switch (preset) {
        case 'ultrafast':
        case 'superfast': mappedPreset = 'veryfast'; break;
        // The rest are natively supported by QSV: veryfast, faster, fast, medium, slow, slower, veryslow
      }
    }

    if (hardwareEncoder == HardwareEncoder.software) {
      args.addAll(['-crf', crf.toString(), '-preset', mappedPreset]);
    } else if (hardwareEncoder == HardwareEncoder.nvidia) {
      args.addAll(['-cq', crf.toString(), '-preset', mappedPreset]);
    } else {
      // AMF and QSV can be tricky with CRF. We'll just pass -q:v for simplicity or -crf if it supports it.
      // Often, a fallback global quality is best.
      args.addAll(['-global_quality', crf.toString(), '-preset', mappedPreset]);
    }

    args.addAll(['-pix_fmt', 'yuv420p', '-acodec', 'copy', outputPath]);

    _currentProcess = await Process.start(ffmpeg, args);

    final process = _currentProcess!;

    // Regex to extract time=HH:MM:SS.xx and speed=1.5x from FFmpeg stderr progress lines.
    final timeRegex = RegExp(r'time=(\d+):(\d+):(\d+(?:\.\d+)?)');
    final speedRegex = RegExp(r'speed=\s*(\d+(?:\.\d+)?)x');

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

          // Extract speed
          double speed = 0.0;
          final speedMatch = speedRegex.firstMatch(line);
          if (speedMatch != null) {
            speed = double.tryParse(speedMatch.group(1)!) ?? 0.0;
          }

          Duration? eta;
          if (speed > 0.0 && progress < 1.0) {
            final remainingMs = (totalMs - currentMs) / speed;
            eta = Duration(milliseconds: remainingMs.round());
          }

          // Throttle: emit if delta >= 0.5% or >= 100ms since last emit.
          if ((progress - lastEmittedProgress).abs() >= 0.005 ||
              now.difference(lastEmitTime).inMilliseconds >= 100) {
            lastEmittedProgress = progress;
            lastEmitTime = now;
            yield CompressionProgress(
              progress: progress,
              speed: speed,
              eta: eta,
            );
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
      throw Exception('FFmpeg failed (exit code $exitCode):\n$errorOutput');
    }

    // Ensure we emit 1.0 at completion.
    yield CompressionProgress(progress: 1.0, speed: 0.0, eta: Duration.zero);
  }

  /// Cancels the currently running FFmpeg process, if any.
  void cancelCurrentProcess() {
    _isCancelled = true;
    if (_currentProcess != null) {
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
