import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart' as p;

import '../cubit/compression_state.dart'
    show AudioChannelsMode, AudioMode, AudioNormalizeMode, FrameRateMode, HardwareEncoder, ResolutionMode, VideoCodec;

/// Data class containing detailed progress information.
class CompressionProgress {
  final double progress;
  final double speed;
  final double? emaSpeed;
  final Duration? eta;
  final int? currentOutputSizeBytes;
  final String? passStep;

  CompressionProgress({
    required this.progress,
    required this.speed,
    this.emaSpeed,
    this.eta,
    this.currentOutputSizeBytes,
    this.passStep,
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
    bool isTargetSizeMode = false,
    double targetSizeMB = 25.0,
    String preset = 'fast',
    required VideoCodec codec,
    bool enableVideoDenoise = false,
    required HardwareEncoder hardwareEncoder,
    required AudioMode audioMode,
    bool enableAudioDenoise = false,
    AudioNormalizeMode audioNormalizeMode = AudioNormalizeMode.off,
    AudioChannelsMode audioChannelsMode = AudioChannelsMode.original,
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

    args.addAll(['-pix_fmt', 'yuv420p', '-movflags', '+faststart']);

    // Build Audio Filters chain & processing flags
    final List<String> audioFilterList = [];
    if (enableAudioDenoise) audioFilterList.add('afftdn');
    if (audioNormalizeMode == AudioNormalizeMode.speech) {
      audioFilterList.add('loudnorm=I=-16:TP=-1.5:LRA=11');
    } else if (audioNormalizeMode == AudioNormalizeMode.dynamic) {
      audioFilterList.add('dynaudnorm=f=150:g=15');
    } else if (audioNormalizeMode == AudioNormalizeMode.boost) {
      audioFilterList.add('volume=3dB');
    }

    final bool hasAudioProcessing = audioFilterList.isNotEmpty || audioChannelsMode != AudioChannelsMode.original;

    // --- Audio & Video Rate Control ---
    if (isTargetSizeMode && totalMs > 0) {
      // Use 95% safety margin to account for MP4 container muxing overhead and prevent target overshoots
      final totalBits = targetSizeMB * 0.95 * 8 * 1024 * 1024;
      final durationSec = totalMs / 1000.0;
      final totalBitrateBps = totalBits / durationSec;

      // Smart Proportional Audio Bitrate Allocation
      int audioBitrateBps = 128000;
      if (audioMode == AudioMode.mute) {
        args.add('-an');
        audioBitrateBps = 0;
      } else {
        if (audioFilterList.isNotEmpty) {
          args.addAll(['-af', audioFilterList.join(',')]);
        }
        if (audioChannelsMode == AudioChannelsMode.mono) {
          args.addAll(['-ac', '1']);
        } else if (audioChannelsMode == AudioChannelsMode.stereo) {
          args.addAll(['-ac', '2']);
        }

        if (audioMode == AudioMode.aac256) {
          args.addAll(['-acodec', 'aac', '-b:a', '256k']);
          audioBitrateBps = 256000;
        } else if (audioMode == AudioMode.aac128) {
          args.addAll(['-acodec', 'aac', '-b:a', '128k']);
          audioBitrateBps = 128000;
        } else if (audioMode == AudioMode.aac64) {
          args.addAll(['-acodec', 'aac', '-b:a', '64k']);
          audioBitrateBps = 64000;
        } else {
          // Default / AudioMode.copy in Target Size Mode:
          if (hasAudioProcessing) {
            final String fallbackBitrate = audioChannelsMode == AudioChannelsMode.mono ? '96k' : '128k';
            args.addAll(['-acodec', 'aac', '-b:a', fallbackBitrate]);
            audioBitrateBps = audioChannelsMode == AudioChannelsMode.mono ? 96000 : 128000;
          } else if (totalBitrateBps >= 650000) {
            args.addAll(['-acodec', 'copy']);
            audioBitrateBps = 160000;
          } else if (totalBitrateBps >= 300000) {
            args.addAll(['-acodec', 'aac', '-b:a', '96k']);
            audioBitrateBps = 96000;
          } else {
            args.addAll(['-acodec', 'aac', '-b:a', '64k']);
            audioBitrateBps = 64000;
          }
        }
      }

      // Calculate Video Bitrate
      int videoBitrateBps = (totalBitrateBps - audioBitrateBps).toInt();
      if (videoBitrateBps < 20000) videoBitrateBps = 20000;

      final videoBitrateKbps = (videoBitrateBps / 1000).round();
      // Perceptual Constrained VBR Rate Control Parameters
      final maxrateKbps = (videoBitrateKbps * 1.35).round();
      final bufsizeKbps = (videoBitrateKbps * 2.0).round();

      // Video Encoder Arguments
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
          args.addAll([
            '-b:v', '${videoBitrateKbps}k',
            '-maxrate', '${maxrateKbps}k',
            '-bufsize', '${bufsizeKbps}k',
            '-cpu-used', cpuUsed.toString()
          ]);
        } else {
          // Perceptual Constrained VBR for software codecs (Enables AQ perceptual quality matching CRF mode)
          final softArgs = <String>[
            '-b:v', '${videoBitrateKbps}k',
            '-maxrate', '${maxrateKbps}k',
            '-bufsize', '${bufsizeKbps}k',
            '-qmin', '1',
            '-preset', mappedPreset,
          ];
          args.addAll(softArgs);
        }
      } else if (hardwareEncoder == HardwareEncoder.nvidia) {
        args.addAll([
          '-rc:v', 'vbr',
          '-b:v', '${videoBitrateKbps}k',
          '-maxrate', '${maxrateKbps}k',
          '-bufsize', '${bufsizeKbps}k',
          '-preset', mappedPreset
        ]);
      } else if (hardwareEncoder == HardwareEncoder.amd) {
        args.addAll([
          '-rc', 'vbr_latency',
          '-b:v', '${videoBitrateKbps}k',
          '-maxrate', '${maxrateKbps}k',
          '-bufsize', '${bufsizeKbps}k',
          '-quality', mappedPreset
        ]);
      } else if (hardwareEncoder == HardwareEncoder.intel) {
        args.addAll([
          '-b:v', '${videoBitrateKbps}k',
          '-maxrate', '${maxrateKbps}k',
          '-bufsize', '${bufsizeKbps}k',
          '-preset', mappedPreset
        ]);
      }
    } else {
      // Normal CRF / Quality Mode
      if (audioMode == AudioMode.mute) {
        args.add('-an');
      } else {
        if (audioFilterList.isNotEmpty) {
          args.addAll(['-af', audioFilterList.join(',')]);
        }
        if (audioChannelsMode == AudioChannelsMode.mono) {
          args.addAll(['-ac', '1']);
        } else if (audioChannelsMode == AudioChannelsMode.stereo) {
          args.addAll(['-ac', '2']);
        }

        if (audioMode == AudioMode.copy && hasAudioProcessing) {
          final String fallbackBitrate = audioChannelsMode == AudioChannelsMode.mono ? '96k' : '128k';
          args.addAll(['-acodec', 'aac', '-b:a', fallbackBitrate]);
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

    final videoFilters = <String>[];

    if (enableVideoDenoise) {
      // Light, razor-sharp spatial-temporal denoise filter that removes noise without smearing visual details
      videoFilters.add('hqdn3d=1.2:1.2:2.4:2.4');
    }

    if (scaleFilter != null) {
      videoFilters.add(scaleFilter);
    }
    videoFilters.add('scale=trunc(iw/2)*2:trunc(ih/2)*2');

    if (videoFilters.isNotEmpty) {
      args.addAll(['-vf', videoFilters.join(',')]);
    }

    if (frameRateMode == FrameRateMode.fps60) {
      args.addAll(['-r', '60']);
    } else if (frameRateMode == FrameRateMode.fps30) {
      args.addAll(['-r', '30']);
    } else if (frameRateMode == FrameRateMode.fps24) {
      args.addAll(['-r', '24']);
    }

    final is2Pass = isTargetSizeMode && hardwareEncoder == HardwareEncoder.software && vcodec != 'libaom-av1';

    if (is2Pass) {
      final passLogPrefix = p.join(
        Directory.systemTemp.path,
        'shrinkeo_2pass_${DateTime.now().microsecondsSinceEpoch}',
      );

      // --- PASS 1: Fast Analysis Pass (0% -> 20% Progress) ---
      final pass1Args = List<String>.from(args);
      pass1Args.addAll(['-passlogfile', passLogPrefix, '-pass', '1', '-an', '-f', 'null', Platform.isWindows ? 'NUL' : '/dev/null']);

      _currentProcess = await Process.start(ffmpeg, pass1Args);
      final process1 = _currentProcess!;

      double? pass1LastEmaSpeed;
      Duration? pass1LastEta;

      await for (final p in _streamFFmpegProgress(
        process1,
        totalMs,
        outputPath,
        progressOffset: 0.0,
        progressScale: 0.20,
        passNumber: 1,
      )) {
        if (_isCancelled) break;
        if (p.emaSpeed != null) pass1LastEmaSpeed = p.emaSpeed;
        if (p.eta != null) pass1LastEta = p.eta;
        yield p;
      }
      final exit1 = await process1.exitCode;
      if (_isCancelled) {
        _cleanup2PassLogs(passLogPrefix);
        _isCancelled = false;
        throw _CompressionCancelledException();
      }
      if (exit1 != 0) {
        _cleanup2PassLogs(passLogPrefix);
        throw Exception('FFmpeg Pass 1 failed with exit code $exit1');
      }

      // --- PASS 2: Precision Target Encoding Pass (20% -> 100% Progress) ---
      final pass2Args = List<String>.from(args);
      pass2Args.addAll(['-passlogfile', passLogPrefix, '-pass', '2', outputPath]);

      _currentProcess = await Process.start(ffmpeg, pass2Args);
      final process2 = _currentProcess!;

      // Seed Pass 2 with expected encoding speed derived from Pass 1 analysis to prevent ETA spike!
      final pass2InitialSpeed = pass1LastEmaSpeed != null ? pass1LastEmaSpeed * 0.50 : null;

      await for (final p in _streamFFmpegProgress(
        process2,
        totalMs,
        outputPath,
        progressOffset: 0.20,
        progressScale: 0.80,
        passNumber: 2,
        initialEmaSpeed: pass2InitialSpeed,
        initialEta: pass1LastEta,
      )) {
        if (_isCancelled) break;
        yield p;
      }
      final exit2 = await process2.exitCode;
      _currentProcess = null;
      _cleanup2PassLogs(passLogPrefix);

      if (_isCancelled) {
        _isCancelled = false;
        throw _CompressionCancelledException();
      }
      if (exit2 != 0) {
        throw Exception('FFmpeg Pass 2 failed with exit code $exit2');
      }

      yield CompressionProgress(progress: 1.0, speed: 0.0, eta: Duration.zero);
      return;
    }

    // --- SINGLE PASS ---
    args.add(outputPath);

    _currentProcess = await Process.start(ffmpeg, args);
    final process = _currentProcess!;

    await for (final p in _streamFFmpegProgress(process, totalMs, outputPath)) {
      if (_isCancelled) break;
      yield p;
    }

    final exitCode = await process.exitCode;
    _currentProcess = null;

    if (_isCancelled) {
      _isCancelled = false;
      throw _CompressionCancelledException();
    }

    if (exitCode != 0) {
      throw Exception('FFmpeg failed with exit code $exitCode');
    }

    yield CompressionProgress(progress: 1.0, speed: 0.0, eta: Duration.zero);
  }

  Stream<CompressionProgress> _streamFFmpegProgress(
    Process process,
    int totalMs,
    String outputPath, {
    double progressOffset = 0.0,
    double progressScale = 1.0,
    int passNumber = 0,
    double? initialEmaSpeed,
    Duration? initialEta,
  }) async* {
    // Lower process priority
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
    } catch (_) {}

    final timeRegex = RegExp(r'time=(\d+):(\d+):(\d+(?:\.\d+)?)');
    final speedRegex = RegExp(r'speed=\s*(\d+(?:\.\d+)?)x');

    double lastEmittedProgress = 0.0;
    DateTime lastEmitTime = DateTime.now();
    double? emaSpeed;
    Duration? lastEmittedEta;

    String stderrBuffer = '';

    await for (final chunk in process.stderr.transform(utf8.decoder)) {
      if (_isCancelled) break;

      stderrBuffer += chunk;
      final lines = stderrBuffer.split(RegExp(r'[\r\n]+'));
      stderrBuffer = lines.removeLast();

      for (final line in lines) {
        if (line.trim().isEmpty) continue;

        final match = timeRegex.firstMatch(line);
        if (match != null) {
          final hours = int.parse(match.group(1)!);
          final minutes = int.parse(match.group(2)!);
          final seconds = double.parse(match.group(3)!);

          final currentMs =
              (hours * 3600000) + (minutes * 60000) + (seconds * 1000).round();

          final rawProgress = (currentMs / totalMs).clamp(0.0, 1.0);
          final overallProgress = (progressOffset + (rawProgress * progressScale)).clamp(0.0, 1.0);
          final now = DateTime.now();

          double speed = 0.0;
          final speedMatch = speedRegex.firstMatch(line);
          if (speedMatch != null) {
            speed = double.tryParse(speedMatch.group(1)!) ?? 0.0;
          }

          if (speed > 0) {
            if (emaSpeed == null) {
              emaSpeed = speed;
            } else {
              double alpha = 0.1;
              if (rawProgress < 0.05) {
                alpha = passNumber == 2 ? 0.02 : 0.5;
              } else if (totalMs < 15000) {
                alpha = 0.4;
              } else if ((speed - emaSpeed).abs() / emaSpeed > 0.5) {
                alpha = 0.3;
              }
              emaSpeed = (emaSpeed * (1.0 - alpha)) + (speed * alpha);
            }
          }

          Duration? eta;
          if (emaSpeed != null && emaSpeed > 0.0 && overallProgress < 1.0) {
            double remainingMs;
            if (passNumber == 1) {
              final pass1Remaining = (totalMs - currentMs) / emaSpeed;
              final estPass2Ms = totalMs / (emaSpeed * 0.50);
              remainingMs = pass1Remaining + estPass2Ms;
            } else {
              remainingMs = (totalMs - currentMs) / emaSpeed;
            }

            final calculatedEta = Duration(milliseconds: remainingMs.round());

            // Strictly Monotonic Non-Increasing Clamp:
            // When progress is advancing, ETA can NEVER increase above previously emitted ETA.
            if (lastEmittedEta != null && calculatedEta > lastEmittedEta) {
              eta = lastEmittedEta;
            } else {
              eta = calculatedEta;
            }
          }

          if ((overallProgress - lastEmittedProgress).abs() >= 0.005 ||
              now.difference(lastEmitTime).inMilliseconds >= 100) {
            lastEmittedProgress = overallProgress;
            lastEmitTime = now;
            if (eta != null) lastEmittedEta = eta;

            int? currentOutputSize;
            try {
              final file = File(outputPath);
              if (file.existsSync()) {
                currentOutputSize = file.lengthSync();
              }
            } catch (_) {}

            String? stepText;
            if (passNumber == 1) {
              stepText = 'Pass 1/2: Analyzing...';
            } else if (passNumber == 2) {
              stepText = 'Pass 2/2: Encoding...';
            }

            yield CompressionProgress(
              progress: overallProgress,
              speed: speed,
              emaSpeed: emaSpeed,
              eta: eta,
              currentOutputSizeBytes: currentOutputSize,
              passStep: stepText,
            );
          }
        }
      }
    }
  }

  void _cleanup2PassLogs(String passLogPrefix) {
    try {
      final tempDir = Directory.systemTemp;
      for (final entity in tempDir.listSync()) {
        if (entity is File && entity.path.startsWith(passLogPrefix)) {
          try {
            entity.deleteSync();
          } catch (_) {}
        }
      }
    } catch (_) {}
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
