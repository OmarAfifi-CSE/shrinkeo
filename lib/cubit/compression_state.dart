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
  h265(AppStrings.codecH265Label, AppStrings.codecH265Desc),
  av1(AppStrings.codecAv1Label, AppStrings.codecAv1Desc);

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

/// Options for Audio Volume Normalization.
enum AudioNormalizeMode {
  off(AppStrings.audioNormOffLabel, AppStrings.audioNormOffDesc),
  speech(AppStrings.audioNormSpeechLabel, AppStrings.audioNormSpeechDesc),
  dynamic(AppStrings.audioNormDynamicLabel, AppStrings.audioNormDynamicDesc),
  boost(AppStrings.audioNormBoostLabel, AppStrings.audioNormBoostDesc);

  final String label;
  final String description;

  const AudioNormalizeMode(this.label, this.description);
}

/// Options for Audio Channels Downmixing.
enum AudioChannelsMode {
  original(AppStrings.audioChanOriginalLabel, AppStrings.audioChanOriginalDesc),
  stereo(AppStrings.audioChanStereoLabel, AppStrings.audioChanStereoDesc),
  mono(AppStrings.audioChanMonoLabel, AppStrings.audioChanMonoDesc);

  final String label;
  final String description;

  const AudioChannelsMode(this.label, this.description);
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

enum VideoRotationMode {
  original(AppStrings.rotOriginalLabel, AppStrings.rotOriginalDesc),
  deg90(AppStrings.rot90Label, AppStrings.rot90Desc),
  deg180(AppStrings.rot180Label, AppStrings.rot180Desc),
  deg270(AppStrings.rot270Label, AppStrings.rot270Desc),
  flipH(AppStrings.rotFlipHLabel, AppStrings.rotFlipHDesc),
  flipV(AppStrings.rotFlipVLabel, AppStrings.rotFlipVDesc),
  custom(AppStrings.rotCustomLabel, AppStrings.rotCustomDesc);

  final String label;
  final String description;

  const VideoRotationMode(this.label, this.description);
}

enum VideoSpeedMode {
  original(AppStrings.speedOriginalLabel, AppStrings.speedOriginalDesc),
  slow05(AppStrings.speedSlow05Label, AppStrings.speedSlow05Desc),
  fast15(AppStrings.speedFast15Label, AppStrings.speedFast15Desc),
  fast20(AppStrings.speedFast20Label, AppStrings.speedFast20Desc),
  timelapse40(AppStrings.speedTimelapse40Label, AppStrings.speedTimelapse40Desc);

  final String label;
  final String description;

  const VideoSpeedMode(this.label, this.description);
}

enum AspectRatioMode {
  original(AppStrings.aspectOriginalLabel, AppStrings.aspectOriginalDesc),
  shorts916(AppStrings.aspectShortsLabel, AppStrings.aspectShortsDesc),
  square11(AppStrings.aspectSquareLabel, AppStrings.aspectSquareDesc),
  portrait45(AppStrings.aspectPortraitLabel, AppStrings.aspectPortraitDesc),
  widescreen169(AppStrings.aspectWidescreenLabel, AppStrings.aspectWidescreenDesc),
  classic43(AppStrings.aspectClassicLabel, AppStrings.aspectClassicDesc),
  cinema219(AppStrings.aspectCinemaLabel, AppStrings.aspectCinemaDesc),
  custom(AppStrings.aspectCustomLabel, AppStrings.aspectCustomDesc);

  final String label;
  final String description;

  const AspectRatioMode(this.label, this.description);
}

enum ExportType {
  video(AppStrings.exportVideoLabel, AppStrings.exportVideoDesc),
  gif(AppStrings.exportGifLabel, AppStrings.exportGifDesc),
  mp3(AppStrings.exportMp3Label, AppStrings.exportMp3Desc),
  aac(AppStrings.exportAacLabel, AppStrings.exportAacDesc),
  wav(AppStrings.exportWavLabel, AppStrings.exportWavDesc);

  final String label;
  final String description;

  const ExportType(this.label, this.description);
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

  /// Warning message to show in the UI for auto-fallbacks.
  final String? fallbackWarningMessage;

  /// Whether the user is currently hovering files over the drop zone.
  final bool isDragHovering;

  /// Whether the app is currently recursively scanning folders for files.
  final bool isScanningFiles;

  // ---- Compression Settings ----

  /// CRF quality value (0-51). Lower = better quality, larger file.
  /// Default: 22 (balanced).
  final int crfQuality;

  /// Whether target file size mode is enabled (compressing to an exact MB limit).
  final bool isTargetSizeMode;

  /// Target file size limit in MB (used when isTargetSizeMode is true). Default: 25.0 MB.
  final double targetSizeMB;

  /// FFmpeg encoding speed preset.
  /// Default: fast (balanced speed & size).
  final EncodingPreset encodingPreset;

  /// Selected Video Codec.
  final VideoCodec videoCodec;

  /// Whether Video Denoise (3D spatial-temporal grain reduction) is enabled.
  final bool enableVideoDenoise;

  /// Selected Hardware Encoder.
  final HardwareEncoder hardwareEncoder;

  /// Selected Audio Mode.
  final AudioMode audioMode;

  /// Whether Audio Denoise (FFT mic & fan noise reduction) is enabled.
  final bool enableAudioDenoise;

  /// Selected Audio Normalization Mode.
  final AudioNormalizeMode audioNormalizeMode;

  /// Selected Audio Channels Mode.
  final AudioChannelsMode audioChannelsMode;

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

  // ---- Quick Tools & Editing Settings ----

  /// Whether Lossless Trim is enabled.
  final bool trimEnabled;

  /// Start time for video trimming (format HH:MM:SS or MM:SS).
  final String trimStartTime;

  /// End time for video trimming (format HH:MM:SS or MM:SS).
  final String trimEndTime;

  /// Selected Video Rotation & Flip orientation.
  final VideoRotationMode videoRotationMode;

  /// Selected Video Playback Speed.
  final VideoSpeedMode videoSpeedMode;

  /// Selected Aspect Ratio Padding.
  final AspectRatioMode aspectRatioMode;

  /// Selected Export Type (Video vs GIF).
  final ExportType exportType;

  /// Whether to strip metadata/EXIF/GPS info for privacy.
  final bool stripMetadata;

  /// Whether to auto-crop black bars from the top/bottom of video.
  final bool autoCropBlackBars;

  /// Custom aspect ratio string (e.g. "16:10", "2:1", "18:9").
  final String customAspectRatio;

  /// Custom rotation degree angle (e.g. 45.0, 30.0).
  final double customRotationAngle;

  const CompressionState({
    this.videos = const [],
    this.phase = CompressionPhase.idle,
    this.currentIndex = -1,
    this.outputFolderPath,
    this.globalError,
    this.fallbackWarningMessage,
    this.isDragHovering = false,
    this.isScanningFiles = false,
    this.crfQuality = 22,
    this.isTargetSizeMode = false,
    this.targetSizeMB = 25.0,
    this.encodingPreset = EncodingPreset.fast,
    this.videoCodec = VideoCodec.h264,
    this.enableVideoDenoise = false,
    this.hardwareEncoder = HardwareEncoder.software,
    this.audioMode = AudioMode.copy, // Copy Original by default
    this.enableAudioDenoise = false,
    this.audioNormalizeMode = AudioNormalizeMode.off, // Off by default
    this.audioChannelsMode = AudioChannelsMode.original, // Original by default
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
    this.trimEnabled = false,
    this.trimStartTime = '00:00:00',
    this.trimEndTime = '00:00:00',
    this.videoRotationMode = VideoRotationMode.original,
    this.videoSpeedMode = VideoSpeedMode.original,
    this.aspectRatioMode = AspectRatioMode.original,
    this.exportType = ExportType.video,
    this.stripMetadata = false,
    this.autoCropBlackBars = false,
    this.customAspectRatio = '16:10',
    this.customRotationAngle = 45.0,
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
    String? fallbackWarningMessage,
    bool clearFallbackWarningMessage = false,
    bool? isDragHovering,
    bool? isScanningFiles,
    int? crfQuality,
    bool? isTargetSizeMode,
    double? targetSizeMB,
    EncodingPreset? encodingPreset,
    VideoCodec? videoCodec,
    bool? enableVideoDenoise,
    HardwareEncoder? hardwareEncoder,
    AudioMode? audioMode,
    bool? enableAudioDenoise,
    AudioNormalizeMode? audioNormalizeMode,
    AudioChannelsMode? audioChannelsMode,
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
    bool? trimEnabled,
    String? trimStartTime,
    String? trimEndTime,
    VideoRotationMode? videoRotationMode,
    VideoSpeedMode? videoSpeedMode,
    AspectRatioMode? aspectRatioMode,
    ExportType? exportType,
    bool? stripMetadata,
    bool? autoCropBlackBars,
    String? customAspectRatio,
    double? customRotationAngle,
  }) {
    return CompressionState(
      videos: videos ?? this.videos,
      phase: phase ?? this.phase,
      currentIndex: currentIndex ?? this.currentIndex,
      outputFolderPath: clearOutputFolderPath
          ? null
          : (outputFolderPath ?? this.outputFolderPath),
      globalError: clearGlobalError ? null : (globalError ?? this.globalError),
      fallbackWarningMessage: clearFallbackWarningMessage ? null : (fallbackWarningMessage ?? this.fallbackWarningMessage),
      isDragHovering: isDragHovering ?? this.isDragHovering,
      isScanningFiles: isScanningFiles ?? this.isScanningFiles,
      crfQuality: crfQuality ?? this.crfQuality,
      isTargetSizeMode: isTargetSizeMode ?? this.isTargetSizeMode,
      targetSizeMB: targetSizeMB ?? this.targetSizeMB,
      encodingPreset: encodingPreset ?? this.encodingPreset,
      videoCodec: videoCodec ?? this.videoCodec,
      enableVideoDenoise: enableVideoDenoise ?? this.enableVideoDenoise,
      hardwareEncoder: hardwareEncoder ?? this.hardwareEncoder,
      audioMode: audioMode ?? this.audioMode,
      enableAudioDenoise: enableAudioDenoise ?? this.enableAudioDenoise,
      audioNormalizeMode: audioNormalizeMode ?? this.audioNormalizeMode,
      audioChannelsMode: audioChannelsMode ?? this.audioChannelsMode,
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
      trimEnabled: trimEnabled ?? this.trimEnabled,
      trimStartTime: trimStartTime ?? this.trimStartTime,
      trimEndTime: trimEndTime ?? this.trimEndTime,
      videoRotationMode: videoRotationMode ?? this.videoRotationMode,
      videoSpeedMode: videoSpeedMode ?? this.videoSpeedMode,
      aspectRatioMode: aspectRatioMode ?? this.aspectRatioMode,
      exportType: exportType ?? this.exportType,
      stripMetadata: stripMetadata ?? this.stripMetadata,
      autoCropBlackBars: autoCropBlackBars ?? this.autoCropBlackBars,
      customAspectRatio: customAspectRatio ?? this.customAspectRatio,
      customRotationAngle: customRotationAngle ?? this.customRotationAngle,
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
    fallbackWarningMessage,
    isDragHovering,
    isScanningFiles,
    crfQuality,
    isTargetSizeMode,
    targetSizeMB,
    encodingPreset,
    videoCodec,
    enableVideoDenoise,
    hardwareEncoder,
    audioMode,
    enableAudioDenoise,
    audioNormalizeMode,
    audioChannelsMode,
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
    trimEnabled,
    trimStartTime,
    trimEndTime,
    videoRotationMode,
    videoSpeedMode,
    aspectRatioMode,
    exportType,
    stripMetadata,
    autoCropBlackBars,
    customAspectRatio,
    customRotationAngle,
  ];
}
