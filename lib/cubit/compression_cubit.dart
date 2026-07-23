import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:local_notifier/local_notifier.dart';
import 'package:window_manager/window_manager.dart';

import 'package:path/path.dart' as p;

import 'package:shared_preferences/shared_preferences.dart';

import '../core/app_strings.dart';
import '../models/video_file.dart';
import '../services/ffmpeg_service.dart';
import '../services/file_scanner_service.dart';
import '../services/output_folder_service.dart';
import 'compression_state.dart';

/// Natural sort regex — pads numeric segments for proper ordering.
/// Sorts: 1, 2, 3, 10, 11 instead of 1, 10, 11, 2, 3.
final RegExp _numericRegex = RegExp(r'\d+');

String _naturalSortKey(String name) {
  return name.replaceAllMapped(
    _numericRegex,
    (match) => match.group(0)!.padLeft(10, '0'),
  );
}

/// Business logic orchestrator for the video compression workflow.
///
/// Manages the queue of videos, coordinates FFmpeg processes, and emits
/// state updates for the UI layer.
class CompressionCubit extends Cubit<CompressionState> {
  final FfmpegService _ffmpegService;
  final FileScannerService _fileScannerService;
  final OutputFolderService _outputFolderService;

  bool _cancelRequested = false;

  final SharedPreferences _prefs;

  CompressionCubit({
    FfmpegService? ffmpegService,
    FileScannerService? fileScannerService,
    OutputFolderService? outputFolderService,
    required SharedPreferences prefs,
  }) : _ffmpegService = ffmpegService ?? FfmpegService(),
       _fileScannerService = fileScannerService ?? FileScannerService(),
       _outputFolderService = outputFolderService ?? OutputFolderService(),
       _prefs = prefs,
       super(
         CompressionState(
           themeMode: _parseTheme(prefs),
           crfQuality: prefs.getInt('crfQuality') ?? 22,
           isTargetSizeMode: prefs.getBool('isTargetSizeMode') ?? false,
           targetSizeMB: prefs.getDouble('targetSizeMB') ?? 25.0,
           encodingPreset: _parsePreset(prefs),
           videoCodec: _parseCodec(prefs),
           enableVideoDenoise: prefs.getBool('enableVideoDenoise') ?? false,
           hardwareEncoder: _parseHardwareEncoder(prefs),
           audioMode: _parseAudioMode(prefs),
           enableAudioDenoise: prefs.getBool('enableAudioDenoise') ?? false,
           audioNormalizeMode: _parseAudioNormalizeMode(prefs),
           audioChannelsMode: _parseAudioChannelsMode(prefs),
           resolutionMode: _parseResolutionMode(prefs),
           frameRateMode: _parseFrameRateMode(prefs),
           outputFormat: _parseOutputFormat(prefs),
           outputLocationMode: _parseOutputLocationMode(prefs),
           deleteOriginalOnSuccess:
               prefs.getBool('deleteOriginalOnSuccess') ?? false,
           globalSavedBytes: prefs.getInt('globalSavedBytes') ?? 0,
           languageCode: prefs.getString('languageCode') ?? 'en',
         ),
       );

  static ThemeMode _parseTheme(SharedPreferences prefs) {
    final themeStr = prefs.getString('themeMode');
    if (themeStr != null) {
      return ThemeMode.values.firstWhere(
        (e) => e.toString() == themeStr,
        orElse: () => ThemeMode.system,
      );
    }
    return ThemeMode.system;
  }

  static EncodingPreset _parsePreset(SharedPreferences prefs) {
    final presetStr = prefs.getString('encodingPreset');
    if (presetStr != null) {
      return EncodingPreset.values.firstWhere(
        (e) => e.name == presetStr,
        orElse: () => EncodingPreset.fast,
      );
    }
    return EncodingPreset.fast;
  }

  static VideoCodec _parseCodec(SharedPreferences prefs) {
    final codecStr = prefs.getString('videoCodec');
    if (codecStr != null) {
      return VideoCodec.values.firstWhere(
        (e) => e.name == codecStr,
        orElse: () => VideoCodec.h264,
      );
    }
    return VideoCodec.h264;
  }

  static HardwareEncoder _parseHardwareEncoder(SharedPreferences prefs) {
    final encStr = prefs.getString('hardwareEncoder');
    if (encStr != null) {
      return HardwareEncoder.values.firstWhere(
        (e) => e.name == encStr,
        orElse: () => HardwareEncoder.software,
      );
    }
    return HardwareEncoder.software;
  }

  static AudioMode _parseAudioMode(SharedPreferences prefs) {
    final modeStr = prefs.getString('audioMode');
    if (modeStr != null) {
      return AudioMode.values.firstWhere(
        (e) => e.name == modeStr,
        orElse: () => AudioMode.copy,
      );
    }
    return AudioMode.copy;
  }

  static AudioNormalizeMode _parseAudioNormalizeMode(SharedPreferences prefs) {
    final modeStr = prefs.getString('audioNormalizeMode');
    if (modeStr != null) {
      return AudioNormalizeMode.values.firstWhere(
        (e) => e.name == modeStr,
        orElse: () => AudioNormalizeMode.off,
      );
    }
    return AudioNormalizeMode.off;
  }

  static AudioChannelsMode _parseAudioChannelsMode(SharedPreferences prefs) {
    final modeStr = prefs.getString('audioChannelsMode');
    if (modeStr != null) {
      return AudioChannelsMode.values.firstWhere(
        (e) => e.name == modeStr,
        orElse: () => AudioChannelsMode.original,
      );
    }
    return AudioChannelsMode.original;
  }

  static ResolutionMode _parseResolutionMode(SharedPreferences prefs) {
    final modeStr = prefs.getString('resolutionMode');
    if (modeStr != null) {
      return ResolutionMode.values.firstWhere(
        (e) => e.name == modeStr,
        orElse: () => ResolutionMode.original,
      );
    }
    return ResolutionMode.original;
  }

  static FrameRateMode _parseFrameRateMode(SharedPreferences prefs) {
    final modeStr = prefs.getString('frameRateMode');
    if (modeStr != null) {
      return FrameRateMode.values.firstWhere(
        (e) => e.name == modeStr,
        orElse: () => FrameRateMode.original,
      );
    }
    return FrameRateMode.original;
  }

  static OutputFormat _parseOutputFormat(SharedPreferences prefs) {
    final formatStr = prefs.getString('outputFormat');
    if (formatStr != null) {
      return OutputFormat.values.firstWhere(
        (e) => e.name == formatStr,
        orElse: () => OutputFormat.original,
      );
    }
    return OutputFormat.original;
  }

  static OutputLocationMode _parseOutputLocationMode(SharedPreferences prefs) {
    final modeStr = prefs.getString('outputLocationMode');
    if (modeStr != null) {
      return OutputLocationMode.values.firstWhere(
        (e) => e.name == modeStr,
        orElse: () => OutputLocationMode.unified,
      );
    }
    return OutputLocationMode.unified;
  }

  // ---------------------------------------------------------------------------
  // Settings
  // ---------------------------------------------------------------------------

  /// Updates the CRF quality value (0-51).
  void updateCrfQuality(int crf) {
    final clamped = crf.clamp(0, 51);
    _prefs.setInt('crfQuality', clamped);
    emit(state.copyWith(crfQuality: clamped));
  }

  /// Toggles between Quality (CRF) mode and Target File Size (MB) mode.
  void toggleTargetSizeMode(bool enabled) {
    _prefs.setBool('isTargetSizeMode', enabled);
    emit(state.copyWith(isTargetSizeMode: enabled));
  }

  /// Calculates the physical minimum achievable target size in MB based on video duration.
  double get minAchievableTargetSizeMB {
    double maxDurationMinutes = 0;
    for (final video in state.videos) {
      if (video.totalDuration != null) {
        final mins = video.totalDuration!.inSeconds / 60.0;
        if (mins > maxDurationMinutes) maxDurationMinutes = mins;
      }
    }
    return maxDurationMinutes > 0 ? (maxDurationMinutes * 1.40).clamp(1.0, 500.0) : 1.0;
  }

  /// Updates the target file size in MB.
  void updateTargetSizeMB(double sizeMB) {
    final validSize = sizeMB.clamp(0.5, 10000.0);
    _prefs.setDouble('targetSizeMB', validSize);
    emit(state.copyWith(targetSizeMB: validSize));
  }

  /// Updates the encoding speed preset.
  void updateEncodingPreset(EncodingPreset preset) {
    _prefs.setString('encodingPreset', preset.name);
    emit(state.copyWith(encodingPreset: preset));
  }

  /// Updates the video codec.
  void updateVideoCodec(VideoCodec codec) {
    _prefs.setString('videoCodec', codec.name);
    emit(state.copyWith(videoCodec: codec));
  }

  /// Toggles video noise reduction (3D spatial-temporal grain reduction).
  void toggleVideoDenoise(bool enabled) {
    _prefs.setBool('enableVideoDenoise', enabled);
    emit(state.copyWith(enableVideoDenoise: enabled));
  }

  /// Updates the hardware encoder setting.
  void updateHardwareEncoder(HardwareEncoder encoder) {
    _prefs.setString('hardwareEncoder', encoder.name);
    emit(state.copyWith(hardwareEncoder: encoder));
  }

  /// Updates the audio mode setting.
  void updateAudioMode(AudioMode mode) {
    _prefs.setString('audioMode', mode.name);
    emit(state.copyWith(audioMode: mode));
  }

  /// Toggles the audio noise reduction (FFT mic & fan noise reduction).
  void toggleAudioDenoise(bool enabled) {
    _prefs.setBool('enableAudioDenoise', enabled);
    emit(state.copyWith(enableAudioDenoise: enabled));
  }

  /// Updates the audio volume normalization mode.
  void updateAudioNormalizeMode(AudioNormalizeMode mode) {
    _prefs.setString('audioNormalizeMode', mode.name);
    emit(state.copyWith(audioNormalizeMode: mode));
  }

  /// Updates the audio channels mode.
  void updateAudioChannelsMode(AudioChannelsMode mode) {
    _prefs.setString('audioChannelsMode', mode.name);
    emit(state.copyWith(audioChannelsMode: mode));
  }

  /// Updates the resolution mode setting.
  void updateResolutionMode(ResolutionMode mode) {
    _prefs.setString('resolutionMode', mode.name);
    emit(state.copyWith(resolutionMode: mode));
  }

  /// Updates the frame rate mode setting.
  void updateFrameRateMode(FrameRateMode mode) {
    _prefs.setString('frameRateMode', mode.name);
    emit(state.copyWith(frameRateMode: mode));
  }

  /// Updates the application language.
  void changeLanguage(String code) {
    _prefs.setString('languageCode', code);
    emit(state.copyWith(languageCode: code));
  }

  /// Updates the output format setting.
  void updateOutputFormat(OutputFormat format) {
    _prefs.setString('outputFormat', format.name);
    emit(state.copyWith(outputFormat: format));
  }

  /// Updates the output location behavior.
  void updateOutputLocationMode(OutputLocationMode mode) {
    _prefs.setString('outputLocationMode', mode.name);
    emit(state.copyWith(outputLocationMode: mode));
  }

  /// Toggles whether to delete the original file after successful compression.
  void updateDeleteOriginalOnSuccess(bool delete) {
    _prefs.setBool('deleteOriginalOnSuccess', delete);
    emit(state.copyWith(deleteOriginalOnSuccess: delete));
  }

  /// Toggles Lossless Video Trimming.
  void toggleTrim(bool enabled) {
    emit(state.copyWith(trimEnabled: enabled));
  }

  /// Updates Video Trim Start Time.
  void updateTrimStartTime(String time) {
    emit(state.copyWith(trimStartTime: time));
  }

  /// Updates Video Trim End Time.
  void updateTrimEndTime(String time) {
    emit(state.copyWith(trimEndTime: time));
  }

  /// Updates Video Rotation & Flip orientation.
  void updateVideoRotationMode(VideoRotationMode mode) {
    if (mode == VideoRotationMode.custom) {
      final currentAngle = state.customRotationAngle;
      final angleToUse = (currentAngle <= 0) ? 45.0 : currentAngle;
      emit(state.copyWith(videoRotationMode: mode, customRotationAngle: angleToUse));
    } else {
      emit(state.copyWith(videoRotationMode: mode));
    }
  }

  /// Updates Video Playback Speed.
  void updateVideoSpeedMode(VideoSpeedMode mode) {
    emit(state.copyWith(videoSpeedMode: mode));
  }

  /// Updates Aspect Ratio Padding Mode.
  void updateAspectRatioMode(AspectRatioMode mode) {
    if (mode == AspectRatioMode.custom) {
      final currentRatio = state.customAspectRatio.trim();
      final ratioToUse = currentRatio.isEmpty ? '16:10' : currentRatio;
      emit(state.copyWith(aspectRatioMode: mode, customAspectRatio: ratioToUse));
    } else {
      emit(state.copyWith(aspectRatioMode: mode));
    }
  }

  /// Updates Custom Aspect Ratio string (e.g. "16:10", "2:1", "18:9").
  void updateCustomAspectRatio(String ratio) {
    emit(state.copyWith(customAspectRatio: ratio));
  }

  /// Updates Custom Rotation Degree Angle (e.g. 45.0, 30.0).
  void updateCustomRotationAngle(double angle) {
    emit(state.copyWith(customRotationAngle: angle));
  }

  /// Updates Export Type (Video vs GIF vs Audio Extract).
  void updateExportType(ExportType type) {
    emit(state.copyWith(exportType: type));
  }

  /// Toggles Privacy & Metadata Scrubbing (-map_metadata -1).
  void toggleStripMetadata(bool enabled) {
    emit(state.copyWith(stripMetadata: enabled));
  }

  /// Toggles Auto-Crop Black Bars.
  void toggleAutoCropBlackBars(bool enabled) {
    emit(state.copyWith(autoCropBlackBars: enabled));
  }

  /// Toggles between light and dark theme mode.
  void toggleTheme() {
    final newMode = state.themeMode == ThemeMode.dark
        ? ThemeMode.light
        : ThemeMode.dark;
    _prefs.setString('themeMode', newMode.toString());
    emit(state.copyWith(themeMode: newMode));
  }

  /// Toggles the settings panel expansion.
  void toggleSettings() {
    final nextSettings = !state.isSettingsExpanded;
    emit(state.copyWith(
      isSettingsExpanded: nextSettings,
      isLanguageExpanded: nextSettings ? false : state.isLanguageExpanded,
    ));
  }

  /// Toggles the language section expansion.
  void toggleLanguageSection() {
    final nextLanguage = !state.isLanguageExpanded;
    emit(state.copyWith(
      isLanguageExpanded: nextLanguage,
      isSettingsExpanded: nextLanguage ? false : state.isSettingsExpanded,
    ));
  }

  /// Updates the custom output directory.
  void updateCustomOutputDirectory(String? path) {
    emit(
      state.copyWith(
        customOutputDirectory: path,
        clearCustomOutputDirectory: path == null,
      ),
    );
  }

  /// Resets all compression settings to their defaults.
  void resetToDefaults() {
    _prefs.setInt('crfQuality', 22);
    _prefs.setBool('isTargetSizeMode', false);
    _prefs.setDouble('targetSizeMB', 25.0);
    _prefs.setString('encodingPreset', EncodingPreset.fast.name);
    _prefs.setString('videoCodec', VideoCodec.h264.name);
    _prefs.setBool('enableVideoDenoise', false);
    _prefs.setString('hardwareEncoder', HardwareEncoder.software.name);
    _prefs.setString('audioMode', AudioMode.copy.name);
    _prefs.setBool('enableAudioDenoise', false);
    _prefs.setString('audioNormalizeMode', AudioNormalizeMode.off.name);
    _prefs.setString('audioChannelsMode', AudioChannelsMode.original.name);
    _prefs.setString('resolutionMode', ResolutionMode.original.name);
    _prefs.setString('frameRateMode', FrameRateMode.original.name);
    _prefs.setString('outputFormat', OutputFormat.original.name);
    _prefs.setString('outputLocationMode', OutputLocationMode.unified.name);
    _prefs.setBool('deleteOriginalOnSuccess', false);

    emit(
      state.copyWith(
        crfQuality: 22,
        isTargetSizeMode: false,
        targetSizeMB: 25.0,
        encodingPreset: EncodingPreset.fast,
        videoCodec: VideoCodec.h264,
        enableVideoDenoise: false,
        hardwareEncoder: HardwareEncoder.software,
        audioMode: AudioMode.copy,
        enableAudioDenoise: false,
        audioNormalizeMode: AudioNormalizeMode.off,
        audioChannelsMode: AudioChannelsMode.original,
        resolutionMode: ResolutionMode.original,
        frameRateMode: FrameRateMode.original,
        outputFormat: OutputFormat.original,
        outputLocationMode: OutputLocationMode.unified,
        deleteOriginalOnSuccess: false,
        customOutputDirectory: null,
        clearCustomOutputDirectory: true,
        trimEnabled: false,
        trimStartTime: '00:00:00',
        trimEndTime: '00:00:00',
        videoRotationMode: VideoRotationMode.original,
        videoSpeedMode: VideoSpeedMode.original,
        aspectRatioMode: AspectRatioMode.original,
        exportType: ExportType.video,
        stripMetadata: false,
        autoCropBlackBars: false,
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // Queue Management
  // ---------------------------------------------------------------------------

  /// Adds files from the given paths to the compression queue.
  ///
  /// Scans directories recursively and filters to valid video extensions.
  /// Deduplicates against already-queued files by absolute path.
  /// Files are sorted using natural numerical ordering.
  Future<void> addFiles(List<String> paths) async {
    if (paths.isEmpty) return;

    emit(state.copyWith(isScanningFiles: true));

    final scannedPaths = await _fileScannerService.scanPaths(paths);
    if (scannedPaths.isEmpty) {
      emit(state.copyWith(isScanningFiles: false));
      return;
    }

    // Deduplicate against existing queue.
    final existingPaths = state.videos.map((v) => v.filePath).toSet();
    final newPaths = scannedPaths
        .where((p) => !existingPaths.contains(p))
        .toList();

    if (newPaths.isEmpty) {
      emit(state.copyWith(isScanningFiles: false));
      return;
    }

    // Natural sort: 1, 2, 3, 10, 11 instead of 1, 10, 11, 2, 3.
    newPaths.sort((a, b) {
      final nameA = p.basename(a);
      final nameB = p.basename(b);
      return _naturalSortKey(nameA).compareTo(_naturalSortKey(nameB));
    });

    final newVideos = <VideoFile>[];
    for (final path in newPaths) {
      final file = File(path);
      int fileSize = 0;
      try {
        fileSize = await file.length();
      } catch (_) {
        // If we can't get the file size, still add it with 0.
      }

      final id = '${path.hashCode}_${DateTime.now().microsecondsSinceEpoch}';

      newVideos.add(
        VideoFile(
          id: id,
          filePath: path,
          fileName: p.basename(path),
          extension: p.extension(path).toLowerCase(),
          fileSizeBytes: fileSize,
        ),
      );
    }

    emit(
      state.copyWith(
        videos: [...state.videos, ...newVideos],
        clearGlobalError: true,
        phase: state.isProcessing ? null : CompressionPhase.idle,
        isScanningFiles: false,
      ),
    );

    // Asynchronously probe durations so ETA calculation knows the total queue length
    _probeDurationsAsync(newVideos);
  }

  Future<void> _probeDurationsAsync(List<VideoFile> videos) async {
    // Run sequentially, but update state in batches to prevent UI freezes
    const probeBatchSize = 10;
    for (int i = 0; i < videos.length; i += probeBatchSize) {
      if (_cancelRequested) break;

      final batch = videos.skip(i).take(probeBatchSize);
      final batchDurations = <String, Duration>{};

      for (final video in batch) {
        if (_cancelRequested) break;
        try {
          final totalDuration = await _ffmpegService.probeDuration(
            video.filePath,
          );
          if (_cancelRequested) return;
          batchDurations[video.id] = totalDuration;
        } catch (_) {}
      }

      if (batchDurations.isNotEmpty) {
        final newVideos = state.videos.map((v) {
          if (batchDurations.containsKey(v.id)) {
            return v.copyWith(totalDuration: batchDurations[v.id]);
          }
          return v;
        }).toList();
        emit(state.copyWith(videos: newVideos));
        // Automatically clamp target size to physical duration minimum
        final minMB = minAchievableTargetSizeMB;
        if (state.targetSizeMB < minMB) {
          updateTargetSizeMB(minMB);
        }
      }

      await Future.delayed(const Duration(milliseconds: 10));
    }
  }

  /// Removes a video from the queue by its ID.
  ///
  /// Only removes if the video is not currently being compressed.
  void removeFile(String id) {
    final video = state.videos.firstWhere(
      (v) => v.id == id,
      orElse: () => throw StateError('Video not found: $id'),
    );

    // Don't remove if currently compressing.
    if (video.status == VideoStatus.compressing ||
        video.status == VideoStatus.probing) {
      return;
    }

    final newVideos = state.videos.where((v) => v.id != id).toList();
    emit(
      state.copyWith(
        videos: newVideos,
        phase: state.isProcessing ? null : CompressionPhase.idle,
        clearOutputFolderPath: newVideos.isEmpty && !state.isProcessing,
      ),
    );
  }

  /// Removes all videos with success, failed, or cancelled status.
  void clearCompleted() {
    emit(
      state.copyWith(
        videos: state.videos
            .where(
              (v) =>
                  v.status != VideoStatus.success &&
                  v.status != VideoStatus.failed &&
                  v.status != VideoStatus.cancelled,
            )
            .toList(),
        phase: state.isProcessing ? null : CompressionPhase.idle,
        currentIndex: -1,
        clearCompressionStartTime: true,
        clearGlobalEta: true,
        clearOutputFolderPath: !state.isProcessing,
      ),
    );
  }

  /// Clears the entire queue (only when idle).
  void clearAll() {
    if (state.isProcessing) return;
    emit(
      state.copyWith(
        videos: const [],
        phase: CompressionPhase.idle,
        currentIndex: -1,
        clearOutputFolderPath: true,
        clearGlobalError: true,
        clearGlobalEta: true,
        clearCompressionStartTime: true,
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // Drag & Drop UI State
  // ---------------------------------------------------------------------------

  /// Updates the drag hovering state for visual feedback.
  void setDragHovering(bool hovering) {
    emit(state.copyWith(isDragHovering: hovering));
  }

  // ---------------------------------------------------------------------------
  // Compression Workflow
  // ---------------------------------------------------------------------------

  /// Starts the sequential compression of all queued videos.
  ///
  /// 1. Resolves the output folder (auto-incremented name).
  /// 2. Probes each video's duration using FFprobe.
  /// 3. Compresses each video sequentially using FFmpeg.
  /// 4. Updates state with progress for each video.
  Future<void> startCompression() async {
    if (!state.canStart || state.isProcessing) return; // Prevent double-clicks
    _cancelRequested = false;

    // Reset any videos that failed due to hardware encoder issues back to queued
    // so they are automatically retried when the user clicks Start Compression again.
    final resetVideos = state.videos.map((v) {
      if (v.status == VideoStatus.failed &&
          v.errorMessage != null &&
          v.errorMessage!.contains('This hardware encoder')) {
        // Clear the error and set back to queued
        return v.copyWith(status: VideoStatus.queued, clearErrorMessage: true);
      }
      return v;
    }).toList();

    if (resetVideos.any((v) => v.status == VideoStatus.queued)) {
      emit(state.copyWith(videos: resetVideos));
    }

    try {
      await _ffmpegService.checkDependencies();
    } catch (e) {
      emit(
        state.copyWith(
          phase: CompressionPhase.error,
          globalError: e.toString().replaceFirst('Exception: ', ''),
        ),
      );
      return;
    }

    // Cache resolved folders for "Same as Original" to avoid creating duplicate folders.
    final Map<String, String> resolvedOutputFolders = {};

    // Resolve the unified output folder if applicable.
    String? outputFolder;
    if (state.outputLocationMode == OutputLocationMode.unified) {
      if (state.outputFolderPath != null &&
          Directory(state.outputFolderPath!).existsSync()) {
        outputFolder = state.outputFolderPath!;
      } else {
        try {
          final firstQueued = state.videos.firstWhere(
            (v) => v.status == VideoStatus.queued,
          );
          final sourceDir = p.dirname(firstQueued.filePath);
          final baseDir = state.customOutputDirectory ?? sourceDir;
          outputFolder = await _outputFolderService.resolveOutputFolder(
            baseDir,
          );
        } catch (e) {
          emit(
            state.copyWith(
              phase: CompressionPhase.error,
              globalError: '${AppStrings.failedCreateFolderError}: $e',
            ),
          );
          return;
        }
      }
    }

    emit(
      state.copyWith(
        phase: CompressionPhase.probing,
        outputFolderPath: outputFolder,
        clearOutputFolderPath:
            outputFolder == null &&
            state.outputLocationMode == OutputLocationMode.sameAsOriginal,
        clearGlobalError: true,
        compressionStartTime: DateTime.now(),
        clearGlobalEta: true,
      ),
    );

    emit(
      state.copyWith(phase: CompressionPhase.probing),
    ); // Immediate emit to lock UI

    // Process each queued video sequentially.
    // Use a while loop to dynamically pick up any videos added DURING compression.
    while (true) {
      if (_cancelRequested) break;

      final nextQueuedIndex = state.videos.indexWhere(
        (v) => v.status == VideoStatus.queued,
      );

      if (nextQueuedIndex == -1) {
        break; // No more queued videos, exit loop.
      }

      await _processVideo(
        state.videos[nextQueuedIndex].id,
        outputFolder,
        resolvedOutputFolders,
      );
    }

    // Mark as completed.
    if (!_cancelRequested) {
      emit(
        state.copyWith(
          phase: CompressionPhase.completed,
          currentIndex: -1,
          clearGlobalEta: true,
          clearCompressionStartTime: true,
        ),
      );

      _showCompletionNotification(state.successCount, state.failedCount);
    }

    _cancelRequested = false;
  }

  void _showCompletionNotification(int success, int failed) {
    final notification = LocalNotification(
      title: 'Shrinkeo Compression Complete',
      body:
          'Successfully compressed $success videos.${failed > 0 ? ' ($failed failed)' : ''}',
    );
    notification.onClick = () async {
      await windowManager.show();
      await windowManager.focus();
    };
    notification.show();
  }

  /// Processes a single video: probes duration, then compresses
  Future<void> _processVideo(
    String videoId,
    String? globalOutputFolder,
    Map<String, String> resolvedOutputFolders,
  ) async {
    int getIndex() => state.videos.indexWhere((v) => v.id == videoId);
    int initialIndex = getIndex();
    if (initialIndex < 0) return;

    VideoFile video = state.videos[initialIndex];

    // Helper to safely update the video even if its index shifted.
    void safelyUpdateVideo(
      VideoFile updatedVideo, {
      Duration? globalEta,
      int? globalSavedBytes,
    }) {
      final idx = getIndex();
      if (idx >= 0) {
        _updateVideo(
          idx,
          updatedVideo,
          globalEta: globalEta,
          globalSavedBytes: globalSavedBytes,
        );
      }
    }

    // -- Step 1: Probe duration (if not already probed in background) --
    Duration totalDuration;
    if (video.totalDuration != null) {
      totalDuration = video.totalDuration!;
    } else {
      safelyUpdateVideo(video.copyWith(status: VideoStatus.probing));
      emit(
        state.copyWith(
          currentIndex: getIndex(),
          phase: CompressionPhase.probing,
        ),
      );

      try {
        totalDuration = await _ffmpegService.probeDuration(video.filePath);
        video = video.copyWith(totalDuration: totalDuration);
        safelyUpdateVideo(video);
      } catch (e) {
        safelyUpdateVideo(
          video.copyWith(
            status: VideoStatus.failed,
            errorMessage: '${AppStrings.failedProbeDurationError}: $e',
          ),
        );
        return;
      }
    }

    if (_cancelRequested) return;

    // -- Step 2: Compress --

    // Resolve output folder for this specific video
    String outputFolder;
    if (state.outputLocationMode == OutputLocationMode.unified &&
        globalOutputFolder != null) {
      outputFolder = globalOutputFolder;
    } else {
      final sourceDir = p.dirname(video.filePath);
      if (resolvedOutputFolders.containsKey(sourceDir)) {
        outputFolder = resolvedOutputFolders[sourceDir]!;
      } else {
        outputFolder = await _outputFolderService.resolveOutputFolder(
          sourceDir,
        );
        resolvedOutputFolders[sourceDir] = outputFolder;
      }
    }

    // Set outputFolderPath in state to the first generated folder so the "Open Output Folder" button has a valid path
    if (state.outputFolderPath == null ||
        !Directory(state.outputFolderPath!).existsSync()) {
      emit(state.copyWith(outputFolderPath: outputFolder));
    }

    // Preserve original filename but change extension to the selected output format, GIF, or audio format.
    String baseFileName = p.basenameWithoutExtension(video.fileName);
    String targetExtension;
    if (state.exportType == ExportType.gif) {
      targetExtension = '.gif';
    } else if (state.exportType == ExportType.mp3) {
      targetExtension = '.mp3';
    } else if (state.exportType == ExportType.aac) {
      targetExtension = '.m4a';
    } else if (state.exportType == ExportType.wav) {
      targetExtension = '.wav';
    } else {
      targetExtension = state.outputFormat == OutputFormat.original
          ? p.extension(video.fileName)
          : state.outputFormat.extension!;
    }

    String newFileName = '$baseFileName$targetExtension';
    String outputPath = p.join(outputFolder, newFileName);

    // Prevent overwriting files with the exact same name
    int counter = 1;
    while (File(outputPath).existsSync()) {
      newFileName = '${baseFileName}_$counter$targetExtension';
      outputPath = p.join(outputFolder, newFileName);
      counter++;
    }

    video = video.copyWith(
      status: VideoStatus.compressing,
      progress: 0.0,
      outputPath: outputPath,
    );
    safelyUpdateVideo(video);
    emit(
      state.copyWith(
        currentIndex: getIndex(),
        phase: CompressionPhase.compressing,
      ),
    );
    int retryCount = 0;
    while (retryCount < 2) {
      try {
        await for (final progress in _ffmpegService.compress(
          inputPath: video.filePath,
          outputPath: outputPath,
          totalDuration: totalDuration,
          crf: state.crfQuality,
          isTargetSizeMode: state.isTargetSizeMode,
          targetSizeMB: state.targetSizeMB.clamp(minAchievableTargetSizeMB, 10000.0),
          preset: state.encodingPreset.value,
          codec: state.videoCodec,
          enableVideoDenoise: state.enableVideoDenoise,
          hardwareEncoder: state.hardwareEncoder,
          audioMode: state.audioMode,
          enableAudioDenoise: state.enableAudioDenoise,
          audioNormalizeMode: state.audioNormalizeMode,
          audioChannelsMode: state.audioChannelsMode,
          resolutionMode: state.resolutionMode,
          frameRateMode: state.frameRateMode,
          trimEnabled: state.trimEnabled,
          trimStartTime: state.trimStartTime,
          trimEndTime: state.trimEndTime,
          videoRotationMode: state.videoRotationMode,
          videoSpeedMode: state.videoSpeedMode,
          aspectRatioMode: state.aspectRatioMode,
          exportType: state.exportType,
          stripMetadata: state.stripMetadata,
          autoCropBlackBars: state.autoCropBlackBars,
          customAspectRatio: state.customAspectRatio,
          customRotationAngle: state.customRotationAngle,
        )) {
          if (_cancelRequested) break;

          // Calculate Global ETA based on video duration
          Duration? newGlobalEta = state.globalEta;
          if (state.compressionStartTime != null) {
            int totalDurationMs = 0;
            int processedDurationMs = 0;

            int probedBytes = 0;
            int probedDurationMs = 0;
            int unprobedBytes = 0;

            for (int i = 0; i < state.videos.length; i++) {
              final v = state.videos[i];
              if (v.status == VideoStatus.queued ||
                  v.status == VideoStatus.compressing ||
                  v.status == VideoStatus.probing ||
                  v.status == VideoStatus.success) {
                if (v.totalDuration != null) {
                  final durMs = v.totalDuration!.inMilliseconds;
                  totalDurationMs += durMs;

                  probedBytes += v.fileSizeBytes;
                  probedDurationMs += durMs;

                  if (v.status == VideoStatus.success) {
                    processedDurationMs += durMs;
                  } else if (v.id == videoId) {
                    processedDurationMs += (durMs * progress.progress).round();
                  }
                } else {
                  unprobedBytes += v.fileSizeBytes;
                }
              }
            }

            // Estimate totalDurationMs for unprobed videos so the ETA doesn't
            // constantly increase as background probes finish and add to the total.
            if (unprobedBytes > 0) {
              if (probedBytes > 0) {
                final avgMsPerByte = probedDurationMs / probedBytes;
                totalDurationMs += (unprobedBytes * avgMsPerByte).round();
              } else {
                // Fallback guess: 1ms per 1KB (~1s per 1MB) if nothing probed yet
                totalDurationMs += unprobedBytes;
              }
            }

            final elapsedSeconds =
                DateTime.now()
                    .difference(state.compressionStartTime!)
                    .inMilliseconds /
                1000.0;

            if (elapsedSeconds > 3.0 && processedDurationMs > 0) {
              final hasOtherVideosWaiting = state.videos.any(
                (v) => v.id != video.id && 
                       (v.status == VideoStatus.queued || v.status == VideoStatus.probing)
              );

              if (!hasOtherVideosWaiting && progress.eta != null) {
                // If this is the only/last video remaining, Global ETA is exactly the Video ETA
                newGlobalEta = progress.eta;
              } else {
                // Cumulative average is the most mathematically accurate for a heterogeneous queue
                final globalSpeed = processedDurationMs / elapsedSeconds;
                final remainingDurationMs = totalDurationMs - processedDurationMs;
                if (globalSpeed > 0) {
                  newGlobalEta = Duration(
                    seconds: (remainingDurationMs / globalSpeed).round(),
                  );
                }
              }
            }
          }

          if (progress.progress > 0.05 &&
              progress.currentOutputSizeBytes != null) {
            final projected =
                (progress.currentOutputSizeBytes! / progress.progress).round();

            if (projected > (video.fileSizeBytes * 1.05)) {
              if (video.largerSizeWarningStartTime == null) {
                video = video.copyWith(
                  largerSizeWarningStartTime: DateTime.now(),
                );
              } else if (!video.hasWarnedLargerSize) {
                final elapsed = DateTime.now().difference(
                  video.largerSizeWarningStartTime!,
                );
                if (elapsed.inSeconds > 15) {
                  video = video.copyWith(hasWarnedLargerSize: true);
                  final notification = LocalNotification(
                    title: 'Output Larger Than Original',
                    body:
                        '${video.fileName} is expected to be larger than the original file size. Consider cancelling and resetting settings to default.',
                  );
                  notification.show();
                }
              }
            } else {
              if (video.largerSizeWarningStartTime != null ||
                  video.hasWarnedLargerSize) {
                video = video.copyWith(
                  clearLargerSizeWarningStartTime: true,
                  clearHasWarnedLargerSize: true,
                );
              }
            }
          }

          video = video.copyWith(
            progress: progress.progress,
            processingSpeed: progress.speed,
            eta: progress.eta,
            currentOutputSizeBytes: progress.currentOutputSizeBytes,
          );
          safelyUpdateVideo(video, globalEta: newGlobalEta);
        }

        if (_cancelRequested) return;

        // Get compressed file size.
        final outputFile = File(outputPath);
        final outputSize = await outputFile.exists()
            ? await outputFile.length()
            : 0;

        int? newGlobalSavedBytes;
        if (outputSize > 0 && outputSize < video.fileSizeBytes) {
          final savedBytes = video.fileSizeBytes - outputSize;
          newGlobalSavedBytes = state.globalSavedBytes + savedBytes;
          _prefs.setInt('globalSavedBytes', newGlobalSavedBytes);
        }

        video = video.copyWith(
          status: VideoStatus.success,
          progress: 1.0,
          outputSizeBytes: outputSize,
          eta: Duration.zero,
          processingSpeed: 0.0,
        );
        safelyUpdateVideo(video, globalSavedBytes: newGlobalSavedBytes);

        // Optionally delete the original file to Recycle Bin
        if (state.deleteOriginalOnSuccess) {
          try {
            await Process.run('powershell.exe', [
              '-NoProfile',
              '-NonInteractive',
              '-Command',
              'Add-Type -AssemblyName Microsoft.VisualBasic; [Microsoft.VisualBasic.FileIO.FileSystem]::DeleteFile("${video.filePath.replaceAll("'", "''")}", "OnlyErrorDialogs", "SendToRecycleBin")',
            ]);
          } catch (e) {
            // Ignore deletion errors to not fail the successful compression
            debugPrint('Failed to move original to recycle bin: $e');
          }
        }
        break; // Success, break the retry loop
      } catch (e) {
        // Clean up partial output file on failure or cancellation.
        try {
          final partialFile = File(outputPath);
          if (await partialFile.exists()) {
            await partialFile.delete();
          }
        } catch (_) {}

        if (isCompressionCancelled(e)) {
          safelyUpdateVideo(video.copyWith(status: VideoStatus.cancelled));
          break;
        }

        String errorMsg = e.toString();
        bool isHardwareError =
            state.hardwareEncoder != HardwareEncoder.software &&
            (errorMsg.contains('Device creation failed') ||
                errorMsg.contains('No capable devices found') ||
                errorMsg.contains('Cannot load') ||
                errorMsg.contains('not found') ||
                errorMsg.contains('Error while opening encoder') ||
                errorMsg.contains('Generic error') ||
                errorMsg.toLowerCase().contains('not supported'));

        if (isHardwareError && retryCount == 0) {
          // Auto-fallback to software encoder
          debugPrint(
            'Hardware encoder failed. Auto-falling back to software: $errorMsg',
          );

          final warningMsg = AppStrings.hwFallbackNotificationBody(state.hardwareEncoder.label);
          final notification = LocalNotification(
            title: AppStrings.hwEncoderNotSupportedTitle,
            body: warningMsg,
          );
          notification.show();

          emit(
            state.copyWith(
              hardwareEncoder: HardwareEncoder.software,
              fallbackWarningMessage: warningMsg,
            ),
          );

          // Clear it immediately after so it doesn't persist forever
          Future.microtask(() {
            if (!isClosed) {
              emit(state.copyWith(clearFallbackWarningMessage: true));
            }
          });

          _prefs.setString('hardwareEncoder', HardwareEncoder.software.name);
          retryCount++;
          await Future.delayed(const Duration(milliseconds: 500));
          continue; // Retry compression
        }

        // Genuine failure (or second attempt failed)
        if (video.outputPath != null) {
          final file = File(video.outputPath!);
          int retries = 0;
          while (file.existsSync() && retries < 5) {
            try {
              file.deleteSync();
              break;
            } catch (_) {
              await Future.delayed(const Duration(milliseconds: 100));
              retries++;
            }
          }
        }
        safelyUpdateVideo(
          video.copyWith(status: VideoStatus.failed, errorMessage: errorMsg),
        );
        break;
      }
    }
  }

  /// Cancels the entire compression workflow.
  ///
  /// Kills the current FFmpeg process and marks remaining queued videos
  /// as cancelled.
  Future<void> cancelCompression() async {
    _cancelRequested = true;
    await _ffmpegService.cancelCurrentProcess();

    // Mark the currently compressing video as cancelled.
    if (state.currentIndex >= 0 && state.currentIndex < state.videos.length) {
      final current = state.videos[state.currentIndex];
      if (current.status == VideoStatus.compressing ||
          current.status == VideoStatus.probing) {
        
        // Delete partial file
        if (current.outputPath != null) {
          final file = File(current.outputPath!);
          int retries = 0;
          while (file.existsSync() && retries < 5) {
            try {
              file.deleteSync();
              break;
            } catch (_) {
              await Future.delayed(const Duration(milliseconds: 100));
              retries++;
            }
          }
        }

        _updateVideo(
          state.currentIndex,
          current.copyWith(status: VideoStatus.cancelled),
        );
      }
    }

    emit(
      state.copyWith(
        phase: CompressionPhase.idle,
        currentIndex: -1,
        clearGlobalEta: true,
        clearCompressionStartTime: true,
      ),
    );
  }

  /// Cancels or removes a single video by its ID.
  ///
  /// If the video is currently being processed, kills the FFmpeg process.
  /// If queued, removes it from the list.
  Future<void> cancelSingle(String id) async {
    final index = state.videos.indexWhere((v) => v.id == id);
    if (index < 0) return;

    final video = state.videos[index];

    if (video.status == VideoStatus.compressing ||
        video.status == VideoStatus.probing) {
      // Currently processing — cancel FFmpeg.
      await _ffmpegService.cancelCurrentProcess();
      
      // Delete partial file
      if (video.outputPath != null) {
        final file = File(video.outputPath!);
        int retries = 0;
        while (file.existsSync() && retries < 5) {
          try {
            file.deleteSync();
            break;
          } catch (_) {
            await Future.delayed(const Duration(milliseconds: 100));
            retries++;
          }
        }
      }

      _updateVideo(index, video.copyWith(status: VideoStatus.cancelled));
    } else {
      // For all other statuses (queued, success, failed, cancelled) — remove from queue.
      final newVideos = state.videos.where((v) => v.id != id).toList();
      emit(
        state.copyWith(
          videos: newVideos,
          phase: state.isProcessing ? null : CompressionPhase.idle,
          clearOutputFolderPath: newVideos.isEmpty && !state.isProcessing,
        ),
      );
    }
  }

  // ---------------------------------------------------------------------------
  // Helpers
  // ---------------------------------------------------------------------------

  /// Updates a single video in the state by index.
  void _updateVideo(
    int index,
    VideoFile updatedVideo, {
    Duration? globalEta,
    int? globalSavedBytes,
  }) {
    final updatedList = List<VideoFile>.from(state.videos);
    updatedList[index] = updatedVideo;

    emit(
      state.copyWith(
        videos: updatedList,
        globalEta: globalEta,
        globalSavedBytes: globalSavedBytes,
      ),
    );
  }

  /// Opens the given folder in the native file explorer.
  void openOutputFolder(String path) {
    if (Platform.isWindows) {
      Process.run('explorer', [path]);
    } else if (Platform.isMacOS) {
      Process.run('open', [path]);
    } else if (Platform.isLinux) {
      Process.run('xdg-open', [path]);
    }
  }
}
