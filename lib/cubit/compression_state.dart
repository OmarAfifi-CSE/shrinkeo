import 'package:equatable/equatable.dart';

import '../models/video_file.dart';

/// Overall phase of the compression workflow.
enum CompressionPhase {
  /// No compression in progress; user can add/remove files.
  idle,

  /// Currently probing video durations before compression starts.
  probing,

  /// Actively compressing videos sequentially.
  compressing,

  /// All queued videos have been processed.
  completed,

  /// A fatal error occurred (e.g., FFmpeg not found).
  error,
}

/// Available FFmpeg encoding speed presets, ordered fastest to slowest.
enum EncodingPreset {
  ultrafast('ultrafast', 'Ultrafast', 'Blazing fast, largest files'),
  superfast('superfast', 'Superfast', 'Very fast, larger files'),
  veryfast('veryfast', 'Very Fast', 'Fast encoding, larger files'),
  faster('faster', 'Faster', 'Above average speed'),
  fast('fast', 'Fast', 'Balanced speed & size'),
  medium('medium', 'Medium', 'Default FFmpeg preset'),
  slow('slow', 'Slow', 'Smaller files, slower'),
  veryslow('veryslow', 'Very Slow', 'Smallest files, slowest');

  final String value;
  final String label;
  final String description;

  const EncodingPreset(this.value, this.label, this.description);
}

/// Immutable state for the [CompressionCubit].
class CompressionState extends Equatable {
  /// List of all video files in the queue.
  final List<VideoFile> videos;

  /// Current phase of the compression workflow.
  final CompressionPhase phase;

  /// Index of the currently processing video (-1 if idle).
  final int currentIndex;

  /// Absolute path to the resolved output folder.
  final String? outputFolderPath;

  /// Global error message (e.g., FFmpeg not found).
  final String? globalError;

  /// Whether the user is currently hovering files over the drop zone.
  final bool isDragHovering;

  // ---- Compression Settings ----

  /// CRF quality value (0-51). Lower = better quality, larger file.
  /// Default: 22 (balanced).
  final int crfQuality;

  /// FFmpeg encoding speed preset.
  /// Default: fast (balanced speed & size).
  final EncodingPreset encodingPreset;

  /// Whether the settings panel is expanded in the UI.
  final bool isSettingsExpanded;

  const CompressionState({
    this.videos = const [],
    this.phase = CompressionPhase.idle,
    this.currentIndex = -1,
    this.outputFolderPath,
    this.globalError,
    this.isDragHovering = false,
    this.crfQuality = 22,
    this.encodingPreset = EncodingPreset.fast,
    this.isSettingsExpanded = false,
  });

  /// Creates a copy with the given fields overridden.
  CompressionState copyWith({
    List<VideoFile>? videos,
    CompressionPhase? phase,
    int? currentIndex,
    String? outputFolderPath,
    String? globalError,
    bool? isDragHovering,
    int? crfQuality,
    EncodingPreset? encodingPreset,
    bool? isSettingsExpanded,
    bool clearOutputFolderPath = false,
    bool clearGlobalError = false,
  }) {
    return CompressionState(
      videos: videos ?? this.videos,
      phase: phase ?? this.phase,
      currentIndex: currentIndex ?? this.currentIndex,
      outputFolderPath: clearOutputFolderPath
          ? null
          : (outputFolderPath ?? this.outputFolderPath),
      globalError:
          clearGlobalError ? null : (globalError ?? this.globalError),
      isDragHovering: isDragHovering ?? this.isDragHovering,
      crfQuality: crfQuality ?? this.crfQuality,
      encodingPreset: encodingPreset ?? this.encodingPreset,
      isSettingsExpanded: isSettingsExpanded ?? this.isSettingsExpanded,
    );
  }

  /// Number of videos that have been successfully compressed.
  int get successCount =>
      videos.where((v) => v.status == VideoStatus.success).length;

  /// Number of videos that failed compression.
  int get failedCount =>
      videos.where((v) => v.status == VideoStatus.failed).length;

  /// Number of videos still queued for processing.
  int get queuedCount =>
      videos.where((v) => v.status == VideoStatus.queued).length;

  /// Whether compression can be started (has queued videos and is idle).
  bool get canStart =>
      phase == CompressionPhase.idle &&
      videos.any((v) => v.status == VideoStatus.queued);

  /// Whether the compression is actively running.
  bool get isProcessing =>
      phase == CompressionPhase.probing ||
      phase == CompressionPhase.compressing;

  /// Human-readable label for the current CRF quality tier.
  String get crfLabel {
    if (crfQuality <= 17) return 'Near Lossless';
    if (crfQuality <= 20) return 'Visually Lossless';
    if (crfQuality <= 23) return 'Balanced';
    if (crfQuality <= 26) return 'High Compression';
    return 'Ultra Compressed';
  }

  @override
  List<Object?> get props => [
    videos,
    phase,
    currentIndex,
    outputFolderPath,
    globalError,
    isDragHovering,
    crfQuality,
    encodingPreset,
    isSettingsExpanded,
  ];
}
