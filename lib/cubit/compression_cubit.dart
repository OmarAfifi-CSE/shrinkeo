import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:local_notifier/local_notifier.dart';
import 'package:window_manager/window_manager.dart';

import 'package:path/path.dart' as p;

import 'package:shared_preferences/shared_preferences.dart';

import '../core/app_strings.dart';
import '../models/file_item.dart';
import '../services/ffmpeg_service.dart';
import '../services/file_scanner_service.dart';
import '../services/output_folder_service.dart';
import '../services/image_compression_service.dart';
import '../models/image_progress.dart';
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
  final ImageCompressionService _imageCompressionService;
  final int maxConcurrentImages;

  bool _cancelRequested = false;
  bool _workflowRunning = false;

  final SharedPreferences _prefs;

  CompressionCubit({
    FfmpegService? ffmpegService,
    FileScannerService? fileScannerService,
    OutputFolderService? outputFolderService,
    ImageCompressionService? imageCompressionService,
    int? maxConcurrentImages,
    required SharedPreferences prefs,
  }) : _ffmpegService = ffmpegService ?? FfmpegService(),
       _fileScannerService = fileScannerService ?? FileScannerService(),
       _outputFolderService = outputFolderService ?? OutputFolderService(),
       _imageCompressionService = imageCompressionService ?? ImageCompressionService(),
       maxConcurrentImages = maxConcurrentImages ??
           (Platform.numberOfProcessors ~/ 2).clamp(2, 4),
       _prefs = prefs,
       super(
         CompressionState(
           themeMode: _parseTheme(prefs),
           crfQuality: prefs.getInt('crfQuality') ?? 22,
           isTargetSizeMode: prefs.getBool('isTargetSizeMode') ?? false,
           targetSizeMB: prefs.getDouble('targetSizeMB') ?? 25.0,
           encodingPreset: parseEnum(
               prefs, 'encodingPreset', EncodingPreset.values, EncodingPreset.fast),
           videoCodec:
               parseEnum(prefs, 'videoCodec', VideoCodec.values, VideoCodec.h264),
           enableVideoDenoise: prefs.getBool('enableVideoDenoise') ?? false,
           hardwareEncoder: parseEnum(prefs, 'hardwareEncoder',
               HardwareEncoder.values, HardwareEncoder.software),
           audioMode:
               parseEnum(prefs, 'audioMode', AudioMode.values, AudioMode.copy),
           enableAudioDenoise: prefs.getBool('enableAudioDenoise') ?? false,
           audioNormalizeMode: parseEnum(prefs, 'audioNormalizeMode',
               AudioNormalizeMode.values, AudioNormalizeMode.off),
           audioChannelsMode: parseEnum(prefs, 'audioChannelsMode',
               AudioChannelsMode.values, AudioChannelsMode.original),
           resolutionMode: parseEnum(prefs, 'resolutionMode',
               ResolutionMode.values, ResolutionMode.original),
           frameRateMode: parseEnum(prefs, 'frameRateMode', FrameRateMode.values,
               FrameRateMode.original),
           outputFormat: parseEnum(
               prefs, 'outputFormat', OutputFormat.values, OutputFormat.original),
           outputLocationMode: parseEnum(prefs, 'outputLocationMode',
               OutputLocationMode.values, OutputLocationMode.unified),
           deleteOriginalOnSuccess:
               prefs.getBool('deleteOriginalOnSuccess') ?? false,
           globalSavedBytes: prefs.getInt('globalSavedBytes') ?? 0,
           languageCode: prefs.getString('languageCode') ?? 'en',
           imageQuality: prefs.getInt('imageQuality') ?? 75,
           imageOutputFormat: parseEnum(prefs, 'imageOutputFormat',
               ImageOutputFormat.values, ImageOutputFormat.original),
           imageResizeMode: parseEnum(prefs, 'imageResizeMode',
               ImageResizeMode.values, ImageResizeMode.original),
           stripImageExif: prefs.getBool('stripImageExif') ?? false,
           imageTargetSizeKB: prefs.getDouble('imageTargetSizeKB') ?? 500.0,
           isImageTargetSizeMode: prefs.getBool('isImageTargetSizeMode') ?? false,
         ),
       ) {
    _cleanupOrphanedTempFiles();
  }

  /// Parses a persisted enum stored by [Enum.name], falling back to
  /// [fallback] when the key is missing or holds an unknown value.
  static T parseEnum<T extends Enum>(
    SharedPreferences prefs,
    String key,
    List<T> values,
    T fallback,
  ) {
    final str = prefs.getString(key);
    if (str == null) return fallback;
    for (final value in values) {
      if (value.name == str) return value;
    }
    return fallback;
  }

  /// Parses the persisted theme, tolerating legacy `ThemeMode.x` values
  /// written by older app versions.
  static ThemeMode _parseTheme(SharedPreferences prefs) {
    final str = prefs.getString('themeMode');
    if (str == null) return ThemeMode.system;
    for (final value in ThemeMode.values) {
      if (value.name == str || 'ThemeMode.${value.name}' == str) {
        return value;
      }
    }
    return ThemeMode.system;
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
    _prefs.setString('themeMode', newMode.name);
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

  // ---------------------------------------------------------------------------
  // Image Compression & Conversion Settings
  // ---------------------------------------------------------------------------

  /// Updates image quality (1-100).
  void updateImageQuality(int quality) {
    final clamped = quality.clamp(1, 100);
    _prefs.setInt('imageQuality', clamped);
    emit(state.copyWith(imageQuality: clamped));
  }

  /// Updates image output format.
  void updateImageOutputFormat(ImageOutputFormat format) {
    _prefs.setString('imageOutputFormat', format.name);
    emit(state.copyWith(imageOutputFormat: format));
  }

  /// Updates image dimension resize mode.
  void updateImageResizeMode(ImageResizeMode mode) {
    _prefs.setString('imageResizeMode', mode.name);
    emit(state.copyWith(imageResizeMode: mode));
  }

  /// Toggles EXIF/GPS camera privacy metadata stripping.
  void toggleStripImageExif(bool enabled) {
    _prefs.setBool('stripImageExif', enabled);
    emit(state.copyWith(stripImageExif: enabled));
  }

  /// Updates target image size in KB (10 KB – 50 MB).
  void updateImageTargetSizeKB(double targetKB) {
    final clamped = targetKB.clamp(10.0, 51200.0);
    _prefs.setDouble('imageTargetSizeKB', clamped);
    emit(state.copyWith(imageTargetSizeKB: clamped));
  }

  /// Toggles target size mode for images.
  void toggleImageTargetSizeMode(bool enabled) {
    _prefs.setBool('isImageTargetSizeMode', enabled);
    emit(state.copyWith(isImageTargetSizeMode: enabled));
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
    _prefs.setInt('imageQuality', 75);
    _prefs.setString('imageOutputFormat', ImageOutputFormat.original.name);
    _prefs.setString('imageResizeMode', ImageResizeMode.original.name);
    _prefs.setBool('stripImageExif', false);
    _prefs.setDouble('imageTargetSizeKB', 500.0);
    _prefs.setBool('isImageTargetSizeMode', false);

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
        customAspectRatio: '16:10',
        customRotationAngle: 45.0,
        imageQuality: 75,
        imageOutputFormat: ImageOutputFormat.original,
        imageResizeMode: ImageResizeMode.original,
        stripImageExif: false,
        imageTargetSizeKB: 500.0,
        isImageTargetSizeMode: false,
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
      } catch (e) {
        debugPrint('Failed to retrieve file length for $path: $e');
      }

      final id = '${path.hashCode}_${DateTime.now().microsecondsSinceEpoch}';

      final ext = p.extension(path).toLowerCase();
      final isImage = VideoFile.isValidImageExtension(ext);
      final mediaType = isImage ? MediaType.image : MediaType.video;

      newVideos.add(
        VideoFile(
          id: id,
          filePath: path,
          fileName: p.basename(path),
          extension: ext,
          fileSizeBytes: fileSize,
          mediaType: mediaType,
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
        if (video.mediaType == MediaType.image) continue;
        try {
          final totalDuration = await _ffmpegService.probeDuration(
            video.filePath,
          );
          if (_cancelRequested) return;
          batchDurations[video.id] = totalDuration;
        } catch (e) {
          debugPrint('Failed to probe duration for ${video.filePath}: $e');
        }
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
    if (isClosed || _workflowRunning || !state.canStart || state.isProcessing) return;
    _workflowRunning = true;
    try {
      await _runCompression();
    } finally {
      _workflowRunning = false;
    }
  }

  Future<void> _runCompression() async {
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

    if (_cancelRequested || isClosed) return;

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

    if (_cancelRequested || isClosed) return;

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

    // Concurrency limit for image processing:
    final Set<String> activeImageIds = {};
    final Set<Future<void>> activeImageTasks = {};

    // Process queued media items:
    // - Videos are processed strictly sequentially (1 at a time) to avoid CPU/GPU starvation.
    // - Images are processed concurrently in a bounded worker pool (up to maxConcurrentImages).
    while (true) {
      if (_cancelRequested || isClosed) break;

      final queuedItems = state.videos.where((v) => v.status == VideoStatus.queued).toList();
      if (queuedItems.isEmpty && activeImageTasks.isEmpty) {
        break; // All queued media items are complete!
      }

      // If the next queued item is a video:
      if (queuedItems.isNotEmpty && queuedItems.first.mediaType == MediaType.video) {
        // Drain all active in-flight image workers so the video has 100% of CPU/GPU resources
        if (activeImageTasks.isNotEmpty) {
          await Future.any(activeImageTasks);
          continue;
        }

        // Process video sequentially
        await _processVideo(
          queuedItems.first.id,
          outputFolder,
          resolvedOutputFolders,
        );
        continue;
      }

      // Find the next queued image before any queued video to preserve queue ordering
      VideoFile? nextQueuedImage;
      for (final v in queuedItems) {
        if (v.mediaType == MediaType.video) {
          break; // Do not jump over a queued video
        }
        if (v.mediaType == MediaType.image && !activeImageIds.contains(v.id)) {
          nextQueuedImage = v;
          break;
        }
      }

      // If we have an image to process and pool capacity is available:
      if (nextQueuedImage != null && activeImageTasks.length < maxConcurrentImages) {
        final imageId = nextQueuedImage.id;
        activeImageIds.add(imageId);

        late Future<void> task;
        task = _processImageItem(
          imageId,
          outputFolder,
          resolvedOutputFolders,
        ).whenComplete(() {
          activeImageIds.remove(imageId);
          activeImageTasks.remove(task);
        });

        activeImageTasks.add(task);
        continue; // Immediately fill remaining pool slots up to maxConcurrentImages
      }

      // Wait for any active image worker to complete
      if (activeImageTasks.isNotEmpty) {
        await Future.any(activeImageTasks);
      } else if (queuedItems.isEmpty) {
        break;
      }
    }

    // Await any remaining active image tasks before declaring queue completion
    if (activeImageTasks.isNotEmpty) {
      await Future.wait(activeImageTasks);
    }

    // Mark as completed.
    if (!_cancelRequested && !isClosed) {
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
      title: AppStrings.notifyCompressionCompleteTitle,
      body:
          '${AppStrings.notifyCompressionCompleteSuccess(success)}${failed > 0 ? AppStrings.notifyCompressionCompleteFailed(failed) : ''}',
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

    if (video.mediaType == MediaType.image) {
      await _processImageItem(videoId, globalOutputFolder, resolvedOutputFolders);
      return;
    }

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
    bool exceededOriginalSize = false;
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
                    title: AppStrings.notifyOutputLargerTitle,
                    body: AppStrings.notifyOutputLargerDesc(video.fileName),
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

          // If the output file being written has exceeded or reached the original file size,
          // abort early to avoid wasting CPU/time and revert to original video.
          if (state.exportType == ExportType.video &&
              video.fileSizeBytes > 0 &&
              progress.currentOutputSizeBytes != null &&
              progress.currentOutputSizeBytes! >= video.fileSizeBytes) {
            exceededOriginalSize = true;
            await _ffmpegService.cancelCurrentProcess();
            break;
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
        int outputSize = await outputFile.exists()
            ? await outputFile.length()
            : 0;

        // If compression resulted in a file larger than or equal to the original video,
        // revert to the original video so the file size does not increase.
        if (state.exportType == ExportType.video &&
            (exceededOriginalSize || outputSize >= video.fileSizeBytes) &&
            video.fileSizeBytes > 0) {
          if (p.normalize(video.filePath) != p.normalize(outputPath)) {
            await _deleteFileWithRetry(outputPath);
            await File(video.filePath).copy(outputPath);
          }
          outputSize = video.fileSizeBytes;
        }

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
          clearHasWarnedLargerSize: true,
          clearLargerSizeWarningStartTime: true,
        );
        safelyUpdateVideo(video, globalSavedBytes: newGlobalSavedBytes);

        // Optionally delete the original file to Recycle Bin ONLY if space was actually saved
        if (state.deleteOriginalOnSuccess &&
            outputSize < video.fileSizeBytes &&
            p.normalize(video.filePath) != p.normalize(outputPath) &&
            await File(outputPath).exists()) {
          await _sendToRecycleBin(video.filePath);
        }
        break; // Success, break the retry loop
      } catch (e) {
        if (exceededOriginalSize && !_cancelRequested) {
          // Revert to original video (no space saved, original file is never deleted)
          if (p.normalize(video.filePath) != p.normalize(outputPath)) {
            await _deleteFileWithRetry(outputPath);
            await File(video.filePath).copy(outputPath);
          }

          video = video.copyWith(
            status: VideoStatus.success,
            progress: 1.0,
            outputSizeBytes: video.fileSizeBytes,
            eta: Duration.zero,
            processingSpeed: 0.0,
            clearHasWarnedLargerSize: true,
            clearLargerSizeWarningStartTime: true,
          );
          safelyUpdateVideo(video);
          break;
        }

        // Clean up partial output file on failure or cancellation.
        await _deleteFileWithRetry(outputPath);

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
          await _deleteFileWithRetry(video.outputPath!);
        }
        safelyUpdateVideo(
          video.copyWith(status: VideoStatus.failed, errorMessage: errorMsg),
        );
        break;
      }
    }
  }

  Future<void> _processImageItem(
    String videoId,
    String? globalOutputFolder,
    Map<String, String> resolvedOutputFolders,
  ) async {
    int getIndex() => state.videos.indexWhere((v) => v.id == videoId);
    bool imageCancelled() => isClosed || _cancelRequested || getIndex() < 0 ||
        state.videos[getIndex()].status == VideoStatus.cancelled;
    int initialIndex = getIndex();
    if (initialIndex < 0) return;

    VideoFile video = state.videos[initialIndex];

    void safelyUpdateVideo(VideoFile updatedVideo, {int? globalSavedBytes}) {
      final idx = getIndex();
      if (idx >= 0 && !imageCancelled()) {
        _updateVideo(idx, updatedVideo, globalSavedBytes: globalSavedBytes);
      }
    }

    safelyUpdateVideo(video.copyWith(status: VideoStatus.compressing, progress: 0,
      imageProgress: const ImageProgress(), clearEta: true));
    emit(state.copyWith(currentIndex: getIndex(), phase: CompressionPhase.compressing));

    // Resolve output folder
    String outputFolder;
    if (state.outputLocationMode == OutputLocationMode.unified && globalOutputFolder != null) {
      outputFolder = globalOutputFolder;
    } else {
      final sourceDir = p.dirname(video.filePath);
      if (resolvedOutputFolders.containsKey(sourceDir)) {
        outputFolder = resolvedOutputFolders[sourceDir]!;
      } else {
        outputFolder = await _outputFolderService.resolveOutputFolder(sourceDir);
        resolvedOutputFolders[sourceDir] = outputFolder;
      }
    }

    if (imageCancelled()) {
      return;
    }
    if (state.outputFolderPath == null || !Directory(state.outputFolderPath!).existsSync()) {
      emit(state.copyWith(outputFolderPath: outputFolder));
    }

    // Determine target extension
    String targetExt = p.extension(video.fileName);
    if (state.imageOutputFormat != ImageOutputFormat.original) {
      targetExt = '.${state.imageOutputFormat.name}';
    }

    String baseName = p.basenameWithoutExtension(video.fileName);
    String outputPath = p.join(outputFolder, '$baseName$targetExt');
    int counter = 1;
    while (File(outputPath).existsSync()) {
      outputPath = p.join(outputFolder, '${baseName}_$counter$targetExt');
      counter++;
    }

    // Parse max width/height if resize is enabled
    int? maxDim;
    if (state.imageResizeMode != ImageResizeMode.original) {
      maxDim = int.tryParse(state.imageResizeMode.value);
    }

    try {
      final result = await _imageCompressionService.processImage(
        inputPath: video.filePath,
        outputPath: outputPath,
        quality: state.imageQuality,
        targetFormat: state.imageOutputFormat.value,
        maxWidth: maxDim,
        maxHeight: maxDim,
        stripExif: state.stripImageExif,
        targetSizeKB: state.isImageTargetSizeMode ? state.imageTargetSizeKB : null,
        isCancelled: imageCancelled,
        onStatus: (progress) {
          if (imageCancelled()) {
            return;
          }
          safelyUpdateVideo(video.copyWith(imageProgress: progress, status: VideoStatus.compressing));
        },
      );

      // The user cancelled while processing — discard any output that was
      // still written and leave the item cancelled (set by cancelSingle /
      // cancelCompression).
      if (imageCancelled()) {
        _tryDeleteFile(outputPath);
        return;
      }

      final outputFile = File(outputPath);
      final fileExists = await outputFile.exists();
      final fileLength = fileExists ? await outputFile.length() : 0;
      if (result.exitCode == 0 && fileExists && fileLength > 0) {
        int outSizeBytes = fileLength;
        if (imageCancelled()) {
          _tryDeleteFile(outputPath);
          return;
        }

        // If compressed image ended up larger than or equal to the original,
        // revert to original image so size does not increase.
        if (state.imageOutputFormat == ImageOutputFormat.original &&
            outSizeBytes >= video.fileSizeBytes &&
            video.fileSizeBytes > 0) {
          if (p.normalize(video.filePath) != p.normalize(outputPath)) {
            await _deleteFileWithRetry(outputPath);
            await File(video.filePath).copy(outputPath);
          }
          outSizeBytes = video.fileSizeBytes;
        }

        final savedBytes = (video.fileSizeBytes - outSizeBytes).clamp(0, video.fileSizeBytes);

        safelyUpdateVideo(
          video.copyWith(
            status: VideoStatus.success,
            progress: 1.0,
            clearImageProgress: true,
            outputPath: outputPath,
            outputSizeBytes: outSizeBytes,
          ),
        );
        _addGlobalSavedBytes(savedBytes);

        if (state.deleteOriginalOnSuccess &&
            outSizeBytes < video.fileSizeBytes &&
            p.normalize(video.filePath) != p.normalize(outputPath) &&
            await File(outputPath).exists()) {
          await _sendToRecycleBin(video.filePath);
        }
      } else {
        _tryDeleteFile(outputPath);
        safelyUpdateVideo(
          video.copyWith(
            status: VideoStatus.failed,
            errorMessage: '${AppStrings.imageProcessingFailedError}: ${result.stderr}',
          ),
        );
      }
    } catch (e) {
      _tryDeleteFile(outputPath);
      safelyUpdateVideo(
        video.copyWith(
          status: VideoStatus.failed,
          errorMessage: '${AppStrings.imageProcessingErrorMsg}: $e',
        ),
      );
    }
  }

  /// Moves a file to the Recycle Bin (Windows) or deletes it on other platforms.
  Future<void> _sendToRecycleBin(String filePath) async {
    try {
      if (Platform.isWindows) {
        await Process.run('powershell.exe', [
          '-NoProfile',
          '-NonInteractive',
          '-Command',
          'Add-Type -AssemblyName Microsoft.VisualBasic; [Microsoft.VisualBasic.FileIO.FileSystem]::DeleteFile("${filePath.replaceAll("'", "''")}", "OnlyErrorDialogs", "SendToRecycleBin")',
        ]);
      } else {
        await File(filePath).delete();
      }
    } catch (e) {
      // Ignore deletion errors to not fail the successful compression
      debugPrint('Failed to move original to recycle bin: $e');
    }
  }

  /// Deletes a file with retries to handle temporary OS file locks (e.g. on Windows).
  Future<void> _deleteFileWithRetry(String path) async {
    final file = File(path);
    int retries = 0;
    while (retries < 5) {
      try {
        if (await file.exists()) {
          await file.delete();
        }
        break;
      } catch (e) {
        retries++;
        if (retries < 5) {
          await Future.delayed(const Duration(milliseconds: 100));
        } else {
          debugPrint(
            'Failed to delete file with retry after $retries attempts ($path): $e',
          );
        }
      }
    }
  }

  /// Best-effort deletion used for cleaning up cancelled output files.
  void _tryDeleteFile(String path) {
    try {
      final file = File(path);
      if (file.existsSync()) {
        file.deleteSync();
      }
    } catch (e) {
      debugPrint('Sync deletion failed for $path, falling back to retry: $e');
      _deleteFileWithRetry(path);
    }
  }

  /// Cancels the entire compression workflow.
  ///
  /// Kills the current FFmpeg process and marks remaining queued videos
  /// as cancelled.
  Future<void> cancelCompression() async {
    _cancelRequested = true;
    await _ffmpegService.cancelCurrentProcess();

    // Mark any active compressing or probing items as cancelled.
    for (int i = 0; i < state.videos.length; i++) {
      final current = state.videos[i];
      if (current.status == VideoStatus.compressing ||
          current.status == VideoStatus.probing) {
        if (current.outputPath != null) {
          _tryDeleteFile(current.outputPath!);
        }

        _updateVideo(
          i,
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
      if (video.mediaType == MediaType.image) {
        // The image job observes this state and terminates its own encoder.
        _updateVideo(index, video.copyWith(status: VideoStatus.cancelled));
        return;
      }
      // Currently processing — cancel FFmpeg.
      await _ffmpegService.cancelCurrentProcess();
      
      // Delete partial file
      if (video.outputPath != null) {
        await _deleteFileWithRetry(video.outputPath!);
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

  /// Retries an individual failed or cancelled video/image.
  ///
  /// Resets status to [FileStatus.queued], clears errors, progress, and previous outputs,
  /// and automatically triggers compression if the cubit is currently idle.
  Future<void> retrySingle(String id) async {
    final index = state.videos.indexWhere((v) => v.id == id);
    if (index < 0) return;

    final video = state.videos[index];
    if (video.status != VideoStatus.failed &&
        video.status != VideoStatus.cancelled) {
      return;
    }

    final resetVideo = video.copyWith(
      status: VideoStatus.queued,
      progress: 0.0,
      clearImageProgress: true,
      clearOutputPath: true,
      clearOutputSizeBytes: true,
      clearCurrentOutputSizeBytes: true,
      clearErrorMessage: true,
      clearHasWarnedLargerSize: true,
      clearLargerSizeWarningStartTime: true,
      clearEta: true,
      clearProcessingSpeed: true,
    );

    _updateVideo(index, resetVideo);

    if (!state.isProcessing) {
      emit(state.copyWith(phase: CompressionPhase.idle));
      await startCompression();
    }
  }

  /// Safely cleans up leftover temporary files or folders from previous crashed sessions.
  void _cleanupOrphanedTempFiles() {
    Future.microtask(() async {
      try {
        final tempDir = Directory.systemTemp;
        if (!await tempDir.exists()) return;

        final oneHourAgo = DateTime.now().subtract(const Duration(hours: 1));
        await for (final entity in tempDir.list(followLinks: false)) {
          final name = p.basename(entity.path).toLowerCase();
          if (name.startsWith('shrinkeo_')) {
            try {
              final stat = await entity.stat();
              if (stat.modified.isBefore(oneHourAgo)) {
                await entity.delete(recursive: true);
              }
            } catch (_) {}
          }
        }
      } catch (_) {}
    });
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

  /// Atomically accumulates global saved bytes into state and SharedPreferences.
  void _addGlobalSavedBytes(int deltaBytes) {
    if (deltaBytes <= 0) return;
    final updated = state.globalSavedBytes + deltaBytes;
    _prefs.setInt('globalSavedBytes', updated);
    emit(state.copyWith(globalSavedBytes: updated));
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
