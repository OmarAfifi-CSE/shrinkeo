import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../core/app_strings.dart';
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
  ultrafast('ultrafast', AppStrings.presetUltrafastLabel, AppStrings.presetUltrafastDesc),
  superfast('superfast', AppStrings.presetSuperfastLabel, AppStrings.presetSuperfastDesc),
  veryfast('veryfast', AppStrings.presetVeryfastLabel, AppStrings.presetVeryfastDesc),
  faster('faster', AppStrings.presetFasterLabel, AppStrings.presetFasterDesc),
  fast('fast', AppStrings.presetFastLabel, AppStrings.presetFastDesc),
  medium('medium', AppStrings.presetMediumLabel, AppStrings.presetMediumDesc),
  slow('slow', AppStrings.presetSlowLabel, AppStrings.presetSlowDesc),
  veryslow('veryslow', AppStrings.presetVeryslowLabel, AppStrings.presetVeryslowDesc);

  final String value;
  final String label;
  final String description;

  const EncodingPreset(this.value, this.label, this.description);
}

enum VideoCodec {
  h264(AppStrings.codecH264Label, AppStrings.codecH264Desc),
  h265(AppStrings.codecH265Label, AppStrings.codecH265Desc);

  final String label;
  final String description;

  const VideoCodec(this.label, this.description);
}

enum HardwareEncoder {
  software(AppStrings.hwSoftwareLabel, AppStrings.hwSoftwareDesc),
  nvidia(AppStrings.hwNvidiaLabel, AppStrings.hwNvidiaDesc),
  amd(AppStrings.hwAmdLabel, AppStrings.hwAmdDesc),
  intel(AppStrings.hwIntelLabel, AppStrings.hwIntelDesc);

  final String label;
  final String description;

  const HardwareEncoder(this.label, this.description);
}

/// Options for Audio Compression/Muting.
enum AudioMode {
  copy(AppStrings.audioOriginalLabel, AppStrings.audioOriginalDesc),
  aac256(AppStrings.audioAac256Label, AppStrings.audioAac256Desc),
  aac128(AppStrings.audioAac128Label, AppStrings.audioAac128Desc),
  aac64(AppStrings.audioAac64Label, AppStrings.audioAac64Desc),
  mute(AppStrings.audioMuteLabel, AppStrings.audioMuteDesc);

  final String label;
  final String description;

  const AudioMode(this.label, this.description);
}

/// Options for Downscaling Resolution.
enum ResolutionMode {
  original(AppStrings.resOriginalLabel, AppStrings.resOriginalDesc),
  p2160(AppStrings.res4kLabel, AppStrings.res4kDesc),
  p1440(AppStrings.res2kLabel, AppStrings.res2kDesc),
  p1080(AppStrings.res1080pLabel, AppStrings.res1080pDesc),
  p720(AppStrings.res720pLabel, AppStrings.res720pDesc),
  p480(AppStrings.res480pLabel, AppStrings.res480pDesc),
  p360(AppStrings.res360pLabel, AppStrings.res360pDesc);

  final String label;
  final String description;

  const ResolutionMode(this.label, this.description);
}

enum FrameRateMode {
  original(AppStrings.fpsOriginalLabel, AppStrings.fpsOriginalDesc),
  fps60(AppStrings.fps60Label, AppStrings.fps60Desc),
  fps30(AppStrings.fps30Label, AppStrings.fps30Desc),
  fps24(AppStrings.fps24Label, AppStrings.fps24Desc);

  final String label;
  final String description;

  const FrameRateMode(this.label, this.description);
}

/// Options for Video Container Format.
enum OutputFormat {
  original(AppStrings.formatOriginalLabel, AppStrings.formatOriginalDesc, null),
  mp4(AppStrings.formatMp4Label, AppStrings.formatMp4Desc, '.mp4'),
  mkv(AppStrings.formatMkvLabel, AppStrings.formatMkvDesc, '.mkv'),
  mov(AppStrings.formatMovLabel, AppStrings.formatMovDesc, '.mov');

  final String label;
  final String description;
  final String? extension;

  const OutputFormat(this.label, this.description, this.extension);
}

/// Options for Output Folder Behavior
enum OutputLocationMode {
  unified(AppStrings.outputLocationUnifiedLabel, AppStrings.outputLocationUnifiedDesc),
  sameAsOriginal(AppStrings.outputLocationSameLabel, AppStrings.outputLocationSameDesc);

  final String label;
  final String description;

  const OutputLocationMode(this.label, this.description);
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

  /// Whether the app is currently recursively scanning folders for files.
  final bool isScanningFiles;

  // ---- Compression Settings ----

  /// CRF quality value (0-51). Lower = better quality, larger file.
  /// Default: 22 (balanced).
  final int crfQuality;

  /// FFmpeg encoding speed preset.
  /// Default: fast (balanced speed & size).
  final EncodingPreset encodingPreset;

  /// Selected Video Codec.
  final VideoCodec videoCodec;

  /// Selected Hardware Encoder.
  final HardwareEncoder hardwareEncoder;

  /// Selected Audio Mode.
  final AudioMode audioMode;

  /// Selected Resolution Downscale.
  final ResolutionMode resolutionMode;

  /// Selected Framerate (FPS).
  final FrameRateMode frameRateMode;

  /// Selected Output Format.
  final OutputFormat outputFormat;

  /// Selected Output Location Behavior.
  final OutputLocationMode outputLocationMode;

  /// Current theme mode (light, dark, or system).
  final ThemeMode themeMode;

  /// Whether the settings panel is expanded in the UI.
  final bool isSettingsExpanded;

  /// User-defined custom output directory.
  /// If null, the default behavior (saving next to the original) is used.
  final String? customOutputDirectory;

  /// Whether to delete the original video (move to Recycle Bin) after successful compression.
  final bool deleteOriginalOnSuccess;

  /// Estimated time remaining for the entire queue.
  final Duration? globalEta;

  /// Time when the current compression batch started.
  final DateTime? compressionStartTime;

  /// Total bytes saved globally across all compressions
  final int globalSavedBytes;

  const CompressionState({
    this.videos = const [],
    this.phase = CompressionPhase.idle,
    this.currentIndex = -1,
    this.outputFolderPath,
    this.globalError,
    this.isDragHovering = false,
    this.isScanningFiles = false,
    this.crfQuality = 22,
    this.encodingPreset = EncodingPreset.fast,
    this.videoCodec = VideoCodec.h264,
    this.hardwareEncoder = HardwareEncoder.software,
    this.audioMode = AudioMode.copy, // Copy Original by default
    this.resolutionMode = ResolutionMode.original,
    this.frameRateMode = FrameRateMode.original,
    this.outputFormat = OutputFormat.original, // Original by default
    this.outputLocationMode = OutputLocationMode.unified, // Unified by default
    this.themeMode = ThemeMode.system,
    this.isSettingsExpanded = false,
    this.customOutputDirectory,
    this.deleteOriginalOnSuccess = false,
    this.globalEta,
    this.compressionStartTime,
    this.globalSavedBytes = 0,
  });

  /// Creates a copy with the given fields overridden.
  CompressionState copyWith({
    List<VideoFile>? videos,
    CompressionPhase? phase,
    int? currentIndex,
    String? outputFolderPath,
    bool clearOutputFolderPath = false,
    String? globalError,
    bool clearGlobalError = false,
    bool? isDragHovering,
    bool? isScanningFiles,
    int? crfQuality,
    EncodingPreset? encodingPreset,
    VideoCodec? videoCodec,
    HardwareEncoder? hardwareEncoder,
    AudioMode? audioMode,
    ResolutionMode? resolutionMode,
    FrameRateMode? frameRateMode,
    OutputFormat? outputFormat,
    OutputLocationMode? outputLocationMode,
    ThemeMode? themeMode,
    bool? isSettingsExpanded,
    String? customOutputDirectory,
    bool clearCustomOutputDirectory = false,
    bool? deleteOriginalOnSuccess,
    Duration? globalEta,
    bool clearGlobalEta = false,
    DateTime? compressionStartTime,
    bool clearCompressionStartTime = false,
    int? globalSavedBytes,
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
      isScanningFiles: isScanningFiles ?? this.isScanningFiles,
      crfQuality: crfQuality ?? this.crfQuality,
      encodingPreset: encodingPreset ?? this.encodingPreset,
      videoCodec: videoCodec ?? this.videoCodec,
      hardwareEncoder: hardwareEncoder ?? this.hardwareEncoder,
      audioMode: audioMode ?? this.audioMode,
      resolutionMode: resolutionMode ?? this.resolutionMode,
      frameRateMode: frameRateMode ?? this.frameRateMode,
      outputFormat: outputFormat ?? this.outputFormat,
      outputLocationMode: outputLocationMode ?? this.outputLocationMode,
      themeMode: themeMode ?? this.themeMode,
      isSettingsExpanded: isSettingsExpanded ?? this.isSettingsExpanded,
      customOutputDirectory: clearCustomOutputDirectory
          ? null
          : (customOutputDirectory ?? this.customOutputDirectory),
      deleteOriginalOnSuccess: deleteOriginalOnSuccess ?? this.deleteOriginalOnSuccess,
      globalEta: clearGlobalEta ? null : (globalEta ?? this.globalEta),
      compressionStartTime: clearCompressionStartTime
          ? null
          : (compressionStartTime ?? this.compressionStartTime),
      globalSavedBytes: globalSavedBytes ?? this.globalSavedBytes,
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
    isScanningFiles,
    crfQuality,
    encodingPreset,
    videoCodec,
    hardwareEncoder,
    audioMode,
    resolutionMode,
    frameRateMode,
    outputFormat,
    outputLocationMode,
    themeMode,
    isSettingsExpanded,
    customOutputDirectory,
    deleteOriginalOnSuccess,
    globalEta,
    compressionStartTime,
    globalSavedBytes,
  ];
}
