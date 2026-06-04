import 'dart:developer' as dev;
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:local_notifier/local_notifier.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'package:shared_preferences/shared_preferences.dart';

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
       super(CompressionState(themeMode: _parseTheme(prefs)));

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

  // ---------------------------------------------------------------------------
  // Settings
  // ---------------------------------------------------------------------------

  /// Updates the CRF quality value (0-51).
  void updateCrfQuality(int crf) {
    final clamped = crf.clamp(0, 51);
    emit(state.copyWith(crfQuality: clamped));
  }

  /// Updates the encoding speed preset.
  void updateEncodingPreset(EncodingPreset preset) {
    emit(state.copyWith(encodingPreset: preset));
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
    emit(state.copyWith(isSettingsExpanded: !state.isSettingsExpanded));
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
  // Queue Management
  // ---------------------------------------------------------------------------

  /// Adds files from the given paths to the compression queue.
  ///
  /// Scans directories recursively and filters to valid video extensions.
  /// Deduplicates against already-queued files by absolute path.
  /// Files are sorted using natural numerical ordering.
  Future<void> addFiles(List<String> paths) async {
    if (paths.isEmpty) return;

    final scannedPaths = await _fileScannerService.scanPaths(paths);
    if (scannedPaths.isEmpty) return;

    // Deduplicate against existing queue.
    final existingPaths = state.videos.map((v) => v.filePath).toSet();
    final newPaths = scannedPaths
        .where((p) => !existingPaths.contains(p))
        .toList();

    if (newPaths.isEmpty) return;

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
      ),
    );

    dev.log('Added ${newVideos.length} videos to queue.', name: 'Cubit');

    // Asynchronously generate thumbnails for new videos.
    _generateThumbnails(newVideos);
    // Asynchronously probe durations so ETA calculation knows the total queue length
    _probeDurationsAsync(newVideos);
  }

  Future<void> _generateThumbnails(List<VideoFile> videos) async {
    final tempDir = await getTemporaryDirectory();
    final thumbDir = Directory(p.join(tempDir.path, 'shrinkeo_thumbs'));
    if (!await thumbDir.exists()) {
      await thumbDir.create(recursive: true);
    }

    for (final video in videos) {
      if (_cancelRequested) break;

      // Fire and forget for instant UI updates as each finishes.
      () async {
        final thumbPath = p.join(thumbDir.path, '${video.id}.jpg');
        await _ffmpegService.generateThumbnail(video.filePath, thumbPath);

        if (_cancelRequested) return;

        if (File(thumbPath).existsSync()) {
          final index = state.videos.indexWhere((v) => v.id == video.id);
          if (index != -1) {
            _updateVideo(
              index,
              state.videos[index].copyWith(thumbnailPath: thumbPath),
            );
          }
        }
      }();
    }
  }

  Future<void> _probeDurationsAsync(List<VideoFile> videos) async {
    // Run sequentially in the background to avoid spawning 100 ffprobe processes
    for (final video in videos) {
      if (_cancelRequested) break;

      try {
        final totalDuration = await _ffmpegService.probeDuration(
          video.filePath,
        );
        if (_cancelRequested) return;

        final index = state.videos.indexWhere((v) => v.id == video.id);
        if (index != -1) {
          _updateVideo(
            index,
            state.videos[index].copyWith(totalDuration: totalDuration),
          );
        }
      } catch (_) {
        // Silently ignore. Will be caught when compression actually starts.
      }
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

    // Determine the source directory from the first queued video.
    final firstQueued = state.videos.firstWhere(
      (v) => v.status == VideoStatus.queued,
    );
    final sourceDir = p.dirname(firstQueued.filePath);

    // Resolve the output folder.
    String outputFolder;
    if (state.outputFolderPath != null &&
        Directory(state.outputFolderPath!).existsSync()) {
      outputFolder = state.outputFolderPath!;
    } else {
      try {
        final baseDir = state.customOutputDirectory ?? sourceDir;
        outputFolder = await _outputFolderService.resolveOutputFolder(baseDir);
      } catch (e) {
        emit(
          state.copyWith(
            phase: CompressionPhase.error,
            globalError: 'Failed to create output folder: $e',
          ),
        );
        return;
      }
    }

    emit(
      state.copyWith(
        phase: CompressionPhase.probing,
        outputFolderPath: outputFolder,
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

      await _processVideo(state.videos[nextQueuedIndex].id, outputFolder);
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
    notification.show();
  }

  /// Processes a single video: probes duration, then compresses
  Future<void> _processVideo(String videoId, String outputFolder) async {
    int getIndex() => state.videos.indexWhere((v) => v.id == videoId);
    int initialIndex = getIndex();
    if (initialIndex < 0) return;

    VideoFile video = state.videos[initialIndex];

    // Helper to safely update the video even if its index shifted.
    void safelyUpdateVideo(VideoFile updatedVideo, {Duration? globalEta}) {
      final idx = getIndex();
      if (idx >= 0) {
        _updateVideo(idx, updatedVideo, globalEta: globalEta);
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
        dev.log('Probe failed for ${video.fileName}: $e', name: 'Cubit');
        safelyUpdateVideo(
          video.copyWith(
            status: VideoStatus.failed,
            errorMessage: 'Failed to probe duration: $e',
          ),
        );
        return;
      }
    }

    if (_cancelRequested) return;

    // -- Step 2: Compress --
    // Preserve original filename (it's already in a separate output folder).
    final outputPath = p.join(outputFolder, video.fileName);

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

    try {
      await for (final progress in _ffmpegService.compress(
        inputPath: video.filePath,
        outputPath: outputPath,
        totalDuration: totalDuration,
        crf: state.crfQuality,
        preset: state.encodingPreset.value,
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
            // globalSpeed = how many milliseconds of video processed per real second
            final globalSpeed = processedDurationMs / elapsedSeconds;
            final remainingDurationMs = totalDurationMs - processedDurationMs;
            if (globalSpeed > 0) {
              newGlobalEta = Duration(
                seconds: (remainingDurationMs / globalSpeed).round(),
              );
            }
          }
        }

        video = video.copyWith(
          progress: progress.progress,
          processingSpeed: progress.speed,
          eta: progress.eta,
        );
        safelyUpdateVideo(video, globalEta: newGlobalEta);
      }

      if (_cancelRequested) return;

      // Get compressed file size.
      final outputFile = File(outputPath);
      final outputSize = await outputFile.exists()
          ? await outputFile.length()
          : 0;

      video = video.copyWith(
        status: VideoStatus.success,
        progress: 1.0,
        outputSizeBytes: outputSize,
        eta: Duration.zero,
        processingSpeed: 0.0,
      );
      safelyUpdateVideo(video);

      dev.log(
        'Compressed ${video.fileName}: '
        '${VideoFile.formatFileSize(video.fileSizeBytes)} → '
        '${VideoFile.formatFileSize(outputSize)}',
        name: 'Cubit',
      );
    } catch (e) {
      if (isCompressionCancelled(e)) {
        safelyUpdateVideo(video.copyWith(status: VideoStatus.cancelled));
      } else {
        dev.log('Compression failed for ${video.fileName}: $e', name: 'Cubit');
        safelyUpdateVideo(
          video.copyWith(
            status: VideoStatus.failed,
            errorMessage: e.toString(),
          ),
        );
      }

      // Clean up partial output file on failure.
      try {
        final partialFile = File(outputPath);
        if (await partialFile.exists()) {
          await partialFile.delete();
        }
      } catch (_) {}
    }
  }

  /// Cancels the entire compression workflow.
  ///
  /// Kills the current FFmpeg process and marks remaining queued videos
  /// as cancelled.
  void cancelCompression() {
    _cancelRequested = true;
    _ffmpegService.cancelCurrentProcess();

    // Mark the currently compressing video as cancelled.
    if (state.currentIndex >= 0 && state.currentIndex < state.videos.length) {
      final current = state.videos[state.currentIndex];
      if (current.status == VideoStatus.compressing ||
          current.status == VideoStatus.probing) {
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
  void cancelSingle(String id) {
    final index = state.videos.indexWhere((v) => v.id == id);
    if (index < 0) return;

    final video = state.videos[index];

    if (video.status == VideoStatus.compressing ||
        video.status == VideoStatus.probing) {
      // Currently processing — cancel FFmpeg.
      _ffmpegService.cancelCurrentProcess();
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
  void _updateVideo(int index, VideoFile updatedVideo, {Duration? globalEta}) {
    final updatedList = List<VideoFile>.from(state.videos);
    updatedList[index] = updatedVideo;

    if (globalEta != null) {
      emit(state.copyWith(videos: updatedList, globalEta: globalEta));
    } else {
      emit(state.copyWith(videos: updatedList));
    }
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
