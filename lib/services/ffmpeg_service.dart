import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart' as p;

import '../cubit/compression_state.dart'
    show AudioMode, FrameRateMode, HardwareEncoder, ResolutionMode, VideoCodec;

/// Data class containing detailed progress information.
class CompressionProgress {
  final double progress;
  final double speed;
  final double? emaSpeed;
  final Duration? eta;
  final int? currentOutputSizeBytes;

  CompressionProgress({
    required this.progress,
    required this.speed,
    this.emaSpeed,
    this.eta,
    this.currentOutputSizeBytes,
  });
}

/// Service responsible for all FFmpeg and FFprobe process execution.
///
/// Resolves the executables via the system-wide PATH fallback or bundled 'bin' directory.
class FfmpegService {
  Process? _currentProcess;
  bool _isCancelled = false;

  /// Resolves the path to `ffmpeg`.
  String get ffmpegPath {
    final bundledPath = p.join(
      p.dirname(Platform.resolvedExecutable),
      'bin',
      'ffmpeg.exe',
    );
    if (File(bundledPath).existsSync()) return bundledPath;

    final localAppData = Platform.environment['LOCALAPPDATA'];
    if (localAppData != null) {
      final wingetPath = '$localAppData\\Microsoft\\WinGet\\Links\\ffmpeg.exe';
      if (File(wingetPath).existsSync()) return wingetPath;
    }
    return 'ffmpeg';
  }

  /// Resolves the path to `ffprobe`.
  String get ffprobePath {
    final bundledPath = p.join(
      p.dirname(Platform.resolvedExecutable),
      'bin',
      'ffprobe.exe',
    );
    if (File(bundledPath).existsSync()) return bundledPath;

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
    required VideoCodec codec,
    required HardwareEncoder hardwareEncoder,
    required AudioMode audioMode,
    bool enableAudioDenoise = false,
    required ResolutionMode resolutionMode,
    required FrameRateMode frameRateMode,
  }) async* {
    _isCancelled = false;
    final ffmpeg = ffmpegPath;
    final totalMs = totalDuration.inMilliseconds;

    if (totalMs <= 0) {
      throw ArgumentError('totalDuration must be positive, got $totalDuration');
    }

    String vcodec;
    if (codec == VideoCodec.av1) {
      if (hardwareEncoder == HardwareEncoder.nvidia) {
        vcodec = 'av1_nvenc';
      } else if (hardwareEncoder == HardwareEncoder.amd) {
        vcodec = 'av1_amf';
      } else if (hardwareEncoder == HardwareEncoder.intel) {
        vcodec = 'av1_qsv';
      } else {
        vcodec = 'libaom-av1';
      }
    } else if (codec == VideoCodec.h265) {
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
        case 'superfast':
          mappedPreset = 'p1';
          break;
        case 'veryfast':
          mappedPreset = 'p2';
          break;
        case 'faster':
          mappedPreset = 'p3';
          break;
        case 'fast':
          mappedPreset = 'p4';
          break;
        case 'medium':
          mappedPreset = 'p5';
          break;
        case 'slow':
          mappedPreset = 'p6';
          break;
        case 'veryslow':
          mappedPreset = 'p7';
          break;
      }
    } else if (hardwareEncoder == HardwareEncoder.amd) {
      switch (preset) {
        case 'ultrafast':
        case 'superfast':
        case 'veryfast':
        case 'faster':
          mappedPreset = 'speed';
          break;
        case 'fast':
        case 'medium':
          mappedPreset = 'balanced';
          break;
        case 'slow':
        case 'veryslow':
          mappedPreset = 'quality';
          break;
      }
    } else if (hardwareEncoder == HardwareEncoder.intel) {
      switch (preset) {
        case 'ultrafast':
        case 'superfast':
          mappedPreset = 'veryfast';
          break;
        // The rest are natively supported by QSV: veryfast, faster, fast, medium, slow, slower, veryslow
      }
    }

    // Map primary video and ALL audio streams (don't crash if audio missing)
    // Note: Subtitles are ignored to prevent MP4 container crashes with unsupported subtitle formats (like PGS/SRT).
    args.addAll(['-map', '0:v:0', '-map', '0:a?']);

    args.addAll(['-pix_fmt', 'yuv420p']);

    // --- Audio Settings ---
    if (audioMode == AudioMode.mute) {
      args.add('-an');
    } else {
      if (enableAudioDenoise) {
        args.addAll(['-af', 'afftdn']);
      }
      if (audioMode == AudioMode.copy && enableAudioDenoise) {
        // Must re-encode audio when audio filters are applied
        args.addAll(['-acodec', 'aac', '-b:a', '256k']);
      } else if (audioMode == AudioMode.copy) {
        args.addAll(['-acodec', 'copy']);
      } else if (audioMode == AudioMode.aac256) {
        args.addAll(['-acodec', 'aac', '-b:a', '256k']);
      } else if (audioMode == AudioMode.aac128) {
        args.addAll(['-acodec', 'aac', '-b:a', '128k']);
      } else if (audioMode == AudioMode.aac64) {
        args.addAll(['-acodec', 'aac', '-b:a', '64k']);
      }
    }

    if (hardwareEncoder == HardwareEncoder.software) {
      if (vcodec == 'libaom-av1') {
        int cpuUsed = 6;
        switch (preset) {
          case 'ultrafast':
          case 'superfast':
            cpuUsed = 8;
            break;
          case 'veryfast':
            cpuUsed = 7;
            break;
          case 'faster':
            cpuUsed = 6;
            break;
          case 'fast':
          case 'medium':
            cpuUsed = 5;
            break;
          case 'slow':
          case 'veryslow':
            cpuUsed = 4;
            break;
        }
        args.addAll(['-crf', crf.toString(), '-b:v', '0', '-cpu-used', cpuUsed.toString()]);
      } else {
        args.addAll(['-crf', crf.toString(), '-preset', mappedPreset]);
      }
    } else if (hardwareEncoder == HardwareEncoder.nvidia) {
      args.addAll(['-cq', crf.toString(), '-preset', mappedPreset]);
    } else if (hardwareEncoder == HardwareEncoder.amd) {
      args.addAll([
        '-rc',
        'cqp',
        '-qp_i',
        crf.toString(),
        '-qp_p',
        crf.toString(),
        '-qp_b',
        crf.toString(),
        '-preset',
        mappedPreset,
      ]);
    } else if (hardwareEncoder == HardwareEncoder.intel) {
      args.addAll(['-q:v', crf.toString(), '-preset', mappedPreset]);
    }

    // --- Resolution Downscaling ---
    String? scaleFilter;
    if (resolutionMode == ResolutionMode.p2160) {
      scaleFilter =
          "scale='if(gt(iw,ih),3840,2160)':'if(gt(iw,ih),2160,3840)':force_original_aspect_ratio=decrease";
    } else if (resolutionMode == ResolutionMode.p1440) {
      scaleFilter =
          "scale='if(gt(iw,ih),2560,1440)':'if(gt(iw,ih),1440,2560)':force_original_aspect_ratio=decrease";
    } else if (resolutionMode == ResolutionMode.p1080) {
      scaleFilter =
          "scale='if(gt(iw,ih),1920,1080)':'if(gt(iw,ih),1080,1920)':force_original_aspect_ratio=decrease";
    } else if (resolutionMode == ResolutionMode.p720) {
      scaleFilter =
          "scale='if(gt(iw,ih),1280,720)':'if(gt(iw,ih),720,1280)':force_original_aspect_ratio=decrease";
    } else if (resolutionMode == ResolutionMode.p480) {
      scaleFilter =
          "scale='if(gt(iw,ih),854,480)':'if(gt(iw,ih),480,854)':force_original_aspect_ratio=decrease";
    } else if (resolutionMode == ResolutionMode.p360) {
      scaleFilter =
          "scale='if(gt(iw,ih),640,360)':'if(gt(iw,ih),360,640)':force_original_aspect_ratio=decrease";
    }

    if (scaleFilter != null) {
      // Chain a second scale to guarantee even dimensions (required by most encoders)
      args.addAll(['-vf', '$scaleFilter,scale=trunc(iw/2)*2:trunc(ih/2)*2']);
    } else {
      // Even if Original resolution, we MUST ensure even dimensions to prevent encoder crashes
      args.addAll(['-vf', 'scale=trunc(iw/2)*2:trunc(ih/2)*2']);
    }

    // --- Frame Rate ---
    if (frameRateMode == FrameRateMode.fps60) {
      args.addAll(['-r', '60']);
    } else if (frameRateMode == FrameRateMode.fps30) {
      args.addAll(['-r', '30']);
    } else if (frameRateMode == FrameRateMode.fps24) {
      args.addAll(['-r', '24']);
    }

    args.add(outputPath);

    _currentProcess = await Process.start(ffmpeg, args);

    final process = _currentProcess!;

    // Lower the process priority to prevent CPU/GPU starvation and OS lag.
    try {
      if (Platform.isWindows) {
        Process.run('powershell', [
          '-NoProfile',
          '-NonInteractive',
          '-Command',
          "(Get-Process -Id ${process.pid}).PriorityClass = 'BelowNormal'",
        ]);
      } else if (Platform.isLinux || Platform.isMacOS) {
        Process.run('renice', ['-n', '10', '-p', '${process.pid}']);
      }
    } catch (_) {
      // Ignore errors if priority cannot be changed
    }

    // Regex to extract time=HH:MM:SS.xx and speed=1.5x from FFmpeg stderr progress lines.
    final timeRegex = RegExp(r'time=(\d+):(\d+):(\d+(?:\.\d+)?)');
    final speedRegex = RegExp(r'speed=\s*(\d+(?:\.\d+)?)x');

    // Throttle progress emissions: min 100ms between updates or 0.5% delta.
    double lastEmittedProgress = 0.0;
    DateTime lastEmitTime = DateTime.now();
    double? emaSpeed;

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

          // Smart ETA: Adaptive Exponential Moving Average (EMA)
          if (speed > 0) {
            if (emaSpeed == null) {
              emaSpeed = speed;
            } else {
              double alpha = 0.1; // Default smoothing factor (highly stable)

              // 1. Warm-up Phase: React faster in the first 5% of compression
              if (progress < 0.05) {
                alpha = 0.5;
              }
              // 2. Short Videos: If video is < 15 seconds, be more responsive overall
              else if (totalMs < 15000) {
                alpha = 0.4;
              }
              // 3. Drastic Speed Shifts (Staircase problem): Catch up faster if speed changes by > 50%
              else if ((speed - emaSpeed).abs() / emaSpeed > 0.5) {
                alpha = 0.3;
              }

              emaSpeed = (emaSpeed * (1.0 - alpha)) + (speed * alpha);
            }
          }

          Duration? eta;
          if (emaSpeed != null && emaSpeed > 0.0 && progress < 1.0) {
            final remainingMs = (totalMs - currentMs) / emaSpeed;
            eta = Duration(milliseconds: remainingMs.round());
          }

          // Throttle: emit if delta >= 0.5% or >= 100ms since last emit.
          if ((progress - lastEmittedProgress).abs() >= 0.005 ||
              now.difference(lastEmitTime).inMilliseconds >= 100) {
            lastEmittedProgress = progress;
            lastEmitTime = now;

            int? currentOutputSize;
            try {
              final file = File(outputPath);
              if (file.existsSync()) {
                currentOutputSize = file.lengthSync();
              }
            } catch (_) {}

            yield CompressionProgress(
              progress: progress,
              speed: speed,
              emaSpeed: emaSpeed,
              eta: eta,
              currentOutputSizeBytes: currentOutputSize,
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
  Future<void> cancelCurrentProcess() async {
    _isCancelled = true;
    if (_currentProcess != null) {
      final process = _currentProcess!;
      process.kill(ProcessSignal.sigkill);
      try {
        await process.exitCode.timeout(const Duration(milliseconds: 1500));
      } catch (_) {}
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
