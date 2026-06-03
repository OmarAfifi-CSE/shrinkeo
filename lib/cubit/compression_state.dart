import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

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
  ultrafast('ultrafast', 'Ultrafast', 'Max speed, but achieves the least file size reduction.'),
  superfast('superfast', 'Superfast', 'Very quick encoding with lower compression efficiency.'),
  veryfast('veryfast', 'Very Fast', 'Faster than average, providing moderate size reduction.'),
  faster('faster', 'Faster', 'A slight speed boost with good overall compression.'),
  fast('fast', 'Fast', 'Great balance of speed and size reduction. Recommended.'),
  medium('medium', 'Medium', 'Default balance of encoding speed and compression.'),
  slow('slow', 'Slow', 'Slower process, but yields significantly smaller files.'),
  veryslow('veryslow', 'Very Slow', 'Takes longest, but guarantees maximum file size reduction.');

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

  /// Current theme mode (light, dark, or system).
  final ThemeMode themeMode;

  /// Whether the settings panel is expanded in the UI.
  final bool isSettingsExpanded;

  /// User-defined custom output directory.
  /// If null, the default behavior (saving next to the original) is used.
  final String? customOutputDirectory;

  /// Estimated time remaining for the entire queue.
  final Duration? globalEta;

  /// Time when the current compression batch started.
  final DateTime? compressionStartTime;

  const CompressionState({
    this.videos = const [],
    this.phase = CompressionPhase.idle,
    this.currentIndex = -1,
    this.outputFolderPath,
    this.globalError,
    this.isDragHovering = false,
    this.crfQuality = 22,
    this.encodingPreset = EncodingPreset.fast,
    this.themeMode = ThemeMode.system,
    this.isSettingsExpanded = false,
    this.customOutputDirectory,
    this.globalEta,
    this.compressionStartTime,
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
    ThemeMode? themeMode,
    bool? isSettingsExpanded,
    String? customOutputDirectory,
    Duration? globalEta,
    DateTime? compressionStartTime,
    bool clearOutputFolderPath = false,
    bool clearGlobalError = false,
    bool clearCustomOutputDirectory = false,
    bool clearGlobalEta = false,
    bool clearCompressionStartTime = false,
  }) {
    return CompressionState(
      videos: videos ?? this.videos,
      phase: phase ?? this.phase,
      currentIndex: currentIndex ?? this.currentIndex,
      outputFolderPath: clearOutputFolderPath
          ? null
          : (outputFolderPath ?? this.outputFolderPath),
      globalError: clearGlobalError ? null : (globalError ?? this.globalError),
      isDragHovering: isDragHovering ?? this.isDragHovering,
      crfQuality: crfQuality ?? this.crfQuality,
      encodingPreset: encodingPreset ?? this.encodingPreset,
      themeMode: themeMode ?? this.themeMode,
      isSettingsExpanded: isSettingsExpanded ?? this.isSettingsExpanded,
      customOutputDirectory: clearCustomOutputDirectory
          ? null
          : (customOutputDirectory ?? this.customOutputDirectory),
      globalEta: clearGlobalEta ? null : (globalEta ?? this.globalEta),
      compressionStartTime: clearCompressionStartTime
          ? null
          : (compressionStartTime ?? this.compressionStartTime),
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
    if (crfQuality == 0) return 'Lossless';
    if (crfQuality <= 18) return 'High Quality';
    if (crfQuality <= 24) return 'Balanced';
    if (crfQuality <= 30) return 'High Compression';
    if (crfQuality <= 40) return 'Low Quality';
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
    themeMode,
    isSettingsExpanded,
    customOutputDirectory,
    globalEta,
    compressionStartTime,
  ];
}
