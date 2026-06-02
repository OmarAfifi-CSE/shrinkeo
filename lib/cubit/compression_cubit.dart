import 'dart:developer' as dev;
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:path/path.dart' as p;

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

  CompressionCubit({
    FfmpegService? ffmpegService,
    FileScannerService? fileScannerService,
    OutputFolderService? outputFolderService,
  })  : _ffmpegService = ffmpegService ?? FfmpegService(),
        _fileScannerService = fileScannerService ?? FileScannerService(),
        _outputFolderService = outputFolderService ?? OutputFolderService(),
        super(const CompressionState());

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

  /// Toggles the settings panel expansion.
  void toggleSettings() {
    emit(state.copyWith(isSettingsExpanded: !state.isSettingsExpanded));
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
    final newPaths =
        scannedPaths.where((p) => !existingPaths.contains(p)).toList();

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

      final id =
          '${path.hashCode}_${DateTime.now().microsecondsSinceEpoch}';

      newVideos.add(VideoFile(
        id: id,
        filePath: path,
        fileName: p.basename(path),
        extension: p.extension(path).toLowerCase(),
        fileSizeBytes: fileSize,
      ));
    }

    emit(state.copyWith(
      videos: [...state.videos, ...newVideos],
      clearGlobalError: true,
    ));

    dev.log('Added ${newVideos.length} videos to queue.', name: 'Cubit');
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

    emit(state.copyWith(
      videos: state.videos.where((v) => v.id != id).toList(),
    ));
  }

  /// Removes all videos with success, failed, or cancelled status.
  void clearCompleted() {
    emit(state.copyWith(
      videos: state.videos
          .where((v) =>
              v.status != VideoStatus.success &&
              v.status != VideoStatus.failed &&
              v.status != VideoStatus.cancelled)
          .toList(),
      phase: CompressionPhase.idle,
      currentIndex: -1,
    ));
  }

  /// Clears the entire queue (only when idle).
  void clearAll() {
    if (state.isProcessing) return;
    emit(const CompressionState());
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
    if (!state.canStart) return;
    _cancelRequested = false;

    // Determine the source directory from the first queued video.
    final firstQueued = state.videos.firstWhere(
      (v) => v.status == VideoStatus.queued,
    );
    final sourceDir = p.dirname(firstQueued.filePath);

    // Resolve the output folder.
    String outputFolder;
    try {
      outputFolder =
          await _outputFolderService.resolveOutputFolder(sourceDir);
    } catch (e) {
      emit(state.copyWith(
        phase: CompressionPhase.error,
        globalError: 'Failed to create output folder: $e',
      ));
      return;
    }

    emit(state.copyWith(
      phase: CompressionPhase.probing,
      outputFolderPath: outputFolder,
      clearGlobalError: true,
    ));

    // Get indices of queued videos.
    final queuedIndices = <int>[];
    for (int i = 0; i < state.videos.length; i++) {
      if (state.videos[i].status == VideoStatus.queued) {
        queuedIndices.add(i);
      }
    }

    // Process each queued video sequentially.
    for (final index in queuedIndices) {
      if (_cancelRequested) break;

      await _processVideo(index, outputFolder);
    }

    // Mark as completed.
    if (!_cancelRequested) {
      emit(state.copyWith(
        phase: CompressionPhase.completed,
        currentIndex: -1,
      ));
    }

    _cancelRequested = false;
  }

  /// Processes a single video: probes duration, then compresses.
  Future<void> _processVideo(int index, String outputFolder) async {
    if (_cancelRequested) return;

    final video = state.videos[index];

    // -- Step 1: Probe duration --
    _updateVideo(index, video.copyWith(status: VideoStatus.probing));
    emit(state.copyWith(currentIndex: index, phase: CompressionPhase.probing));

    Duration totalDuration;
    try {
      totalDuration = await _ffmpegService.probeDuration(video.filePath);
      _updateVideo(
          index, state.videos[index].copyWith(totalDuration: totalDuration));
    } catch (e) {
      dev.log('Probe failed for ${video.fileName}: $e', name: 'Cubit');
      _updateVideo(
        index,
        state.videos[index].copyWith(
          status: VideoStatus.failed,
          errorMessage: 'Failed to probe duration: $e',
        ),
      );
      return;
    }

    if (_cancelRequested) return;

    // -- Step 2: Compress --
    // Preserve original filename (it's already in a separate output folder).
    final outputPath = p.join(outputFolder, video.fileName);

    _updateVideo(
      index,
      state.videos[index].copyWith(
        status: VideoStatus.compressing,
        progress: 0.0,
        outputPath: outputPath,
      ),
    );
    emit(state.copyWith(phase: CompressionPhase.compressing));

    try {
      await for (final progress in _ffmpegService.compress(
        inputPath: video.filePath,
        outputPath: outputPath,
        totalDuration: totalDuration,
        crf: state.crfQuality,
        preset: state.encodingPreset.value,
      )) {
        if (_cancelRequested) break;
        _updateVideo(
          index,
          state.videos[index].copyWith(progress: progress),
        );
      }

      if (_cancelRequested) return;

      // Get compressed file size.
      final outputFile = File(outputPath);
      final outputSize =
          await outputFile.exists() ? await outputFile.length() : 0;

      _updateVideo(
        index,
        state.videos[index].copyWith(
          status: VideoStatus.success,
          progress: 1.0,
          outputSizeBytes: outputSize,
        ),
      );

      dev.log(
        'Compressed ${video.fileName}: '
        '${VideoFile.formatFileSize(video.fileSizeBytes)} → '
        '${VideoFile.formatFileSize(outputSize)}',
        name: 'Cubit',
      );
    } catch (e) {
      if (isCompressionCancelled(e)) {
        _updateVideo(
          index,
          state.videos[index].copyWith(status: VideoStatus.cancelled),
        );
      } else {
        dev.log('Compression failed for ${video.fileName}: $e',
            name: 'Cubit');
        _updateVideo(
          index,
          state.videos[index].copyWith(
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
    if (state.currentIndex >= 0 &&
        state.currentIndex < state.videos.length) {
      final current = state.videos[state.currentIndex];
      if (current.status == VideoStatus.compressing ||
          current.status == VideoStatus.probing) {
        _updateVideo(
          state.currentIndex,
          current.copyWith(status: VideoStatus.cancelled),
        );
      }
    }

    emit(state.copyWith(
      phase: CompressionPhase.idle,
      currentIndex: -1,
    ));
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
      _updateVideo(
        index,
        video.copyWith(status: VideoStatus.cancelled),
      );
    } else if (video.status == VideoStatus.queued) {
      // Not yet started — remove from queue.
      emit(state.copyWith(
        videos: state.videos.where((v) => v.id != id).toList(),
      ));
    }
  }

  // ---------------------------------------------------------------------------
  // Helpers
  // ---------------------------------------------------------------------------

  /// Updates a single video in the state by index.
  void _updateVideo(int index, VideoFile updatedVideo) {
    final updatedList = List<VideoFile>.from(state.videos);
    updatedList[index] = updatedVideo;
    emit(state.copyWith(videos: updatedList));
  }
}
