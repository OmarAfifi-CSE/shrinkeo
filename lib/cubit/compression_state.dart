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
  ultrafast('ultrafast'),
  superfast('superfast'),
  veryfast('veryfast'),
  faster('faster'),
  fast('fast'),
  medium('medium'),
  slow('slow'),
  veryslow('veryslow');

  final String value;

  const EncodingPreset(this.value);

  String get label {
    switch (this) {
      case EncodingPreset.ultrafast: return AppStrings.presetUltrafastLabel;
      case EncodingPreset.superfast: return AppStrings.presetSuperfastLabel;
      case EncodingPreset.veryfast: return AppStrings.presetVeryfastLabel;
      case EncodingPreset.faster: return AppStrings.presetFasterLabel;
      case EncodingPreset.fast: return AppStrings.presetFastLabel;
      case EncodingPreset.medium: return AppStrings.presetMediumLabel;
      case EncodingPreset.slow: return AppStrings.presetSlowLabel;
      case EncodingPreset.veryslow: return AppStrings.presetVeryslowLabel;
    }
  }

  String get description {
    switch (this) {
      case EncodingPreset.ultrafast: return AppStrings.presetUltrafastDesc;
      case EncodingPreset.superfast: return AppStrings.presetSuperfastDesc;
      case EncodingPreset.veryfast: return AppStrings.presetVeryfastDesc;
      case EncodingPreset.faster: return AppStrings.presetFasterDesc;
      case EncodingPreset.fast: return AppStrings.presetFastDesc;
      case EncodingPreset.medium: return AppStrings.presetMediumDesc;
      case EncodingPreset.slow: return AppStrings.presetSlowDesc;
      case EncodingPreset.veryslow: return AppStrings.presetVeryslowDesc;
    }
  }
}

enum VideoCodec {
  h264,
  h265,
  av1;

  String get label {
    switch (this) {
      case VideoCodec.h264: return AppStrings.codecH264Label;
      case VideoCodec.h265: return AppStrings.codecH265Label;
      case VideoCodec.av1: return AppStrings.codecAv1Label;
    }
  }

  String get description {
    switch (this) {
      case VideoCodec.h264: return AppStrings.codecH264Desc;
      case VideoCodec.h265: return AppStrings.codecH265Desc;
      case VideoCodec.av1: return AppStrings.codecAv1Desc;
    }
  }
}

enum HardwareEncoder {
  software,
  nvidia,
  amd,
  intel;

  String get label {
    switch (this) {
      case HardwareEncoder.software: return AppStrings.hwSoftwareLabel;
      case HardwareEncoder.nvidia: return AppStrings.hwNvidiaLabel;
      case HardwareEncoder.amd: return AppStrings.hwAmdLabel;
      case HardwareEncoder.intel: return AppStrings.hwIntelLabel;
    }
  }

  String get description {
    switch (this) {
      case HardwareEncoder.software: return AppStrings.hwSoftwareDesc;
      case HardwareEncoder.nvidia: return AppStrings.hwNvidiaDesc;
      case HardwareEncoder.amd: return AppStrings.hwAmdDesc;
      case HardwareEncoder.intel: return AppStrings.hwIntelDesc;
    }
  }
}

/// Options for Audio Compression/Muting.
enum AudioMode {
  copy,
  aac256,
  aac128,
  aac64,
  mute;

  String get label {
    switch (this) {
      case AudioMode.copy: return AppStrings.audioOriginalLabel;
      case AudioMode.aac256: return AppStrings.audioAac256Label;
      case AudioMode.aac128: return AppStrings.audioAac128Label;
      case AudioMode.aac64: return AppStrings.audioAac64Label;
      case AudioMode.mute: return AppStrings.audioMuteLabel;
    }
  }

  String get description {
    switch (this) {
      case AudioMode.copy: return AppStrings.audioOriginalDesc;
      case AudioMode.aac256: return AppStrings.audioAac256Desc;
      case AudioMode.aac128: return AppStrings.audioAac128Desc;
      case AudioMode.aac64: return AppStrings.audioAac64Desc;
      case AudioMode.mute: return AppStrings.audioMuteDesc;
    }
  }
}

/// Options for Audio Volume Normalization.
enum AudioNormalizeMode {
  off,
  speech,
  dynamic,
  boost;

  String get label {
    switch (this) {
      case AudioNormalizeMode.off: return AppStrings.audioNormOffLabel;
      case AudioNormalizeMode.speech: return AppStrings.audioNormSpeechLabel;
      case AudioNormalizeMode.dynamic: return AppStrings.audioNormDynamicLabel;
      case AudioNormalizeMode.boost: return AppStrings.audioNormBoostLabel;
    }
  }

  String get description {
    switch (this) {
      case AudioNormalizeMode.off: return AppStrings.audioNormOffDesc;
      case AudioNormalizeMode.speech: return AppStrings.audioNormSpeechDesc;
      case AudioNormalizeMode.dynamic: return AppStrings.audioNormDynamicDesc;
      case AudioNormalizeMode.boost: return AppStrings.audioNormBoostDesc;
    }
  }
}

/// Options for Audio Channels Downmixing.
enum AudioChannelsMode {
  original,
  stereo,
  mono;

  String get label {
    switch (this) {
      case AudioChannelsMode.original: return AppStrings.audioChanOriginalLabel;
      case AudioChannelsMode.stereo: return AppStrings.audioChanStereoLabel;
      case AudioChannelsMode.mono: return AppStrings.audioChanMonoLabel;
    }
  }

  String get description {
    switch (this) {
      case AudioChannelsMode.original: return AppStrings.audioChanOriginalDesc;
      case AudioChannelsMode.stereo: return AppStrings.audioChanStereoDesc;
      case AudioChannelsMode.mono: return AppStrings.audioChanMonoDesc;
    }
  }
}

/// Options for Downscaling Resolution.
enum ResolutionMode {
  original,
  p2160,
  p1440,
  p1080,
  p720,
  p480,
  p360;

  String get label {
    switch (this) {
      case ResolutionMode.original: return AppStrings.resOriginalLabel;
      case ResolutionMode.p2160: return AppStrings.res4kLabel;
      case ResolutionMode.p1440: return AppStrings.res2kLabel;
      case ResolutionMode.p1080: return AppStrings.res1080pLabel;
      case ResolutionMode.p720: return AppStrings.res720pLabel;
      case ResolutionMode.p480: return AppStrings.res480pLabel;
      case ResolutionMode.p360: return AppStrings.res360pLabel;
    }
  }

  String get description {
    switch (this) {
      case ResolutionMode.original: return AppStrings.resOriginalDesc;
      case ResolutionMode.p2160: return AppStrings.res4kDesc;
      case ResolutionMode.p1440: return AppStrings.res2kDesc;
      case ResolutionMode.p1080: return AppStrings.res1080pDesc;
      case ResolutionMode.p720: return AppStrings.res720pDesc;
      case ResolutionMode.p480: return AppStrings.res480pDesc;
      case ResolutionMode.p360: return AppStrings.res360pDesc;
    }
  }
}

enum FrameRateMode {
  original,
  fps60,
  fps30,
  fps24;

  String get label {
    switch (this) {
      case FrameRateMode.original: return AppStrings.fpsOriginalLabel;
      case FrameRateMode.fps60: return AppStrings.fps60Label;
      case FrameRateMode.fps30: return AppStrings.fps30Label;
      case FrameRateMode.fps24: return AppStrings.fps24Label;
    }
  }

  String get description {
    switch (this) {
      case FrameRateMode.original: return AppStrings.fpsOriginalDesc;
      case FrameRateMode.fps60: return AppStrings.fps60Desc;
      case FrameRateMode.fps30: return AppStrings.fps30Desc;
      case FrameRateMode.fps24: return AppStrings.fps24Desc;
    }
  }
}

/// Options for Video Container Format.
enum OutputFormat {
  original(null),
  mp4('.mp4'),
  mkv('.mkv'),
  mov('.mov');

  final String? extension;

  const OutputFormat(this.extension);

  String get label {
    switch (this) {
      case OutputFormat.original: return AppStrings.formatOriginalLabel;
      case OutputFormat.mp4: return AppStrings.formatMp4Label;
      case OutputFormat.mkv: return AppStrings.formatMkvLabel;
      case OutputFormat.mov: return AppStrings.formatMovLabel;
    }
  }

  String get description {
    switch (this) {
      case OutputFormat.original: return AppStrings.formatOriginalDesc;
      case OutputFormat.mp4: return AppStrings.formatMp4Desc;
      case OutputFormat.mkv: return AppStrings.formatMkvDesc;
      case OutputFormat.mov: return AppStrings.formatMovDesc;
    }
  }
}

/// Options for Output Folder Behavior
enum OutputLocationMode {
  unified,
  sameAsOriginal;

  String get label {
    switch (this) {
      case OutputLocationMode.unified: return AppStrings.outputLocationUnifiedLabel;
      case OutputLocationMode.sameAsOriginal: return AppStrings.outputLocationSameLabel;
    }
  }

  String get description {
    switch (this) {
      case OutputLocationMode.unified: return AppStrings.outputLocationUnifiedDesc;
      case OutputLocationMode.sameAsOriginal: return AppStrings.outputLocationSameDesc;
    }
  }
}

enum VideoRotationMode {
  original,
  deg90,
  deg180,
  deg270,
  flipH,
  flipV,
  custom;

  String get label {
    switch (this) {
      case VideoRotationMode.original: return AppStrings.rotOriginalLabel;
      case VideoRotationMode.deg90: return AppStrings.rot90Label;
      case VideoRotationMode.deg180: return AppStrings.rot180Label;
      case VideoRotationMode.deg270: return AppStrings.rot270Label;
      case VideoRotationMode.flipH: return AppStrings.rotFlipHLabel;
      case VideoRotationMode.flipV: return AppStrings.rotFlipVLabel;
      case VideoRotationMode.custom: return AppStrings.rotCustomLabel;
    }
  }

  String get description {
    switch (this) {
      case VideoRotationMode.original: return AppStrings.rotOriginalDesc;
      case VideoRotationMode.deg90: return AppStrings.rot90Desc;
      case VideoRotationMode.deg180: return AppStrings.rot180Desc;
      case VideoRotationMode.deg270: return AppStrings.rot270Desc;
      case VideoRotationMode.flipH: return AppStrings.rotFlipHDesc;
      case VideoRotationMode.flipV: return AppStrings.rotFlipVDesc;
      case VideoRotationMode.custom: return AppStrings.rotCustomDesc;
    }
  }
}

enum VideoSpeedMode {
  original,
  slow05,
  fast15,
  fast20,
  timelapse40;

  String get label {
    switch (this) {
      case VideoSpeedMode.original: return AppStrings.speedOriginalLabel;
      case VideoSpeedMode.slow05: return AppStrings.speedSlow05Label;
      case VideoSpeedMode.fast15: return AppStrings.speedFast15Label;
      case VideoSpeedMode.fast20: return AppStrings.speedFast20Label;
      case VideoSpeedMode.timelapse40: return AppStrings.speedTimelapse40Label;
    }
  }

  String get description {
    switch (this) {
      case VideoSpeedMode.original: return AppStrings.speedOriginalDesc;
      case VideoSpeedMode.slow05: return AppStrings.speedSlow05Desc;
      case VideoSpeedMode.fast15: return AppStrings.speedFast15Desc;
      case VideoSpeedMode.fast20: return AppStrings.speedFast20Desc;
      case VideoSpeedMode.timelapse40: return AppStrings.speedTimelapse40Desc;
    }
  }
}

enum AspectRatioMode {
  original,
  shorts916,
  square11,
  portrait45,
  widescreen169,
  classic43,
  cinema219,
  custom;

  String get label {
    switch (this) {
      case AspectRatioMode.original: return AppStrings.aspectOriginalLabel;
      case AspectRatioMode.shorts916: return AppStrings.aspectShortsLabel;
      case AspectRatioMode.square11: return AppStrings.aspectSquareLabel;
      case AspectRatioMode.portrait45: return AppStrings.aspectPortraitLabel;
      case AspectRatioMode.widescreen169: return AppStrings.aspectWidescreenLabel;
      case AspectRatioMode.classic43: return AppStrings.aspectClassicLabel;
      case AspectRatioMode.cinema219: return AppStrings.aspectCinemaLabel;
      case AspectRatioMode.custom: return AppStrings.aspectCustomLabel;
    }
  }

  String get description {
    switch (this) {
      case AspectRatioMode.original: return AppStrings.aspectOriginalDesc;
      case AspectRatioMode.shorts916: return AppStrings.aspectShortsDesc;
      case AspectRatioMode.square11: return AppStrings.aspectSquareDesc;
      case AspectRatioMode.portrait45: return AppStrings.aspectPortraitDesc;
      case AspectRatioMode.widescreen169: return AppStrings.aspectWidescreenDesc;
      case AspectRatioMode.classic43: return AppStrings.aspectClassicDesc;
      case AspectRatioMode.cinema219: return AppStrings.aspectCinemaDesc;
      case AspectRatioMode.custom: return AppStrings.aspectCustomDesc;
    }
  }
}

enum ExportType {
  video,
  gif,
  mp3,
  aac,
  wav;

  String get label {
    switch (this) {
      case ExportType.video: return AppStrings.exportVideoLabel;
      case ExportType.gif: return AppStrings.exportGifLabel;
      case ExportType.mp3: return AppStrings.exportMp3Label;
      case ExportType.aac: return AppStrings.exportAacLabel;
      case ExportType.wav: return AppStrings.exportWavLabel;
    }
  }

  String get description {
    switch (this) {
      case ExportType.video: return AppStrings.exportVideoDesc;
      case ExportType.gif: return AppStrings.exportGifDesc;
      case ExportType.mp3: return AppStrings.exportMp3Desc;
      case ExportType.aac: return AppStrings.exportAacDesc;
      case ExportType.wav: return AppStrings.exportWavDesc;
    }
  }
}

/// Options for Image Output Format.
enum ImageOutputFormat {
  original('original'),
  png('png'),
  jpg('jpg'),
  webp('webp'),
  avif('avif');

  final String value;
  const ImageOutputFormat(this.value);

  String get label {
    switch (this) {
      case ImageOutputFormat.original: return 'Original Format';
      case ImageOutputFormat.png: return 'PNG Image (.png)';
      case ImageOutputFormat.jpg: return 'JPEG Image (.jpg)';
      case ImageOutputFormat.webp: return 'WebP Image (.webp)';
      case ImageOutputFormat.avif: return 'AVIF Image (.avif)';
    }
  }

  String get description {
    switch (this) {
      case ImageOutputFormat.original: return 'Keep original format (Fastest, no conversion).';
      case ImageOutputFormat.png: return 'Lossless PNG format with transparency support.';
      case ImageOutputFormat.jpg: return 'Standard compressed JPEG format for universal compatibility.';
      case ImageOutputFormat.webp: return 'Modern WebP format offering superior compression and small size.';
      case ImageOutputFormat.avif: return 'Next-gen AVIF format with ultra-high compression efficiency.';
    }
  }
}

/// Options for Image Max Dimension Resizing.
enum ImageResizeMode {
  original('original'),
  p4k('3840'),
  p1080('1920'),
  p720('1280'),
  p480('854');

  final String value;
  const ImageResizeMode(this.value);

  String get label {
    switch (this) {
      case ImageResizeMode.original: return 'Original Dimensions';
      case ImageResizeMode.p4k: return '4K Max (3840px)';
      case ImageResizeMode.p1080: return 'Full HD Max (1920px)';
      case ImageResizeMode.p720: return 'HD Max (1280px)';
      case ImageResizeMode.p480: return 'SD Max (854px)';
    }
  }

  String get description {
    switch (this) {
      case ImageResizeMode.original: return 'Keep original image width and height dimensions.';
      case ImageResizeMode.p4k: return 'Scale down image max dimension to 3840px (4K max).';
      case ImageResizeMode.p1080: return 'Scale down image max dimension to 1920px (Full HD max).';
      case ImageResizeMode.p720: return 'Scale down image max dimension to 1280px (HD max).';
      case ImageResizeMode.p480: return 'Scale down image max dimension to 854px (SD max).';
    }
  }
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

  /// Whether the language panel is expanded in the UI.
  final bool isLanguageExpanded;

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

  /// Active application language code (e.g. 'en', 'ar', 'es', 'fr', etc.).
  final String languageCode;

  // ---- Image Compression & Conversion Settings ----

  /// Target image quality (1-100). Default: 80.
  final int imageQuality;

  /// Target output format for images.
  final ImageOutputFormat imageOutputFormat;

  /// Target dimension resize mode for images.
  final ImageResizeMode imageResizeMode;

  /// Whether EXIF/GPS camera privacy metadata is stripped from images.
  final bool stripImageExif;

  /// Target image size in KB.
  final double imageTargetSizeKB;

  /// Whether target size mode is enabled for images.
  final bool isImageTargetSizeMode;

  /// Target action intent (Compress Only, Edit/Convert Only, or Compress & Edit).
  final MediaActionIntent mediaActionIntent;

  const CompressionState({
    this.videos = const [],
    this.phase = CompressionPhase.idle,
    this.currentIndex = -1,
    this.outputFolderPath,
    this.globalError,
    this.fallbackWarningMessage,
    this.isDragHovering = false,
    this.isScanningFiles = false,
    this.mediaActionIntent = MediaActionIntent.compressAndConvert,
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
    this.isLanguageExpanded = false,
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
    this.languageCode = 'en',
    this.imageQuality = 80,
    this.imageOutputFormat = ImageOutputFormat.original,
    this.imageResizeMode = ImageResizeMode.original,
    this.stripImageExif = true,
    this.imageTargetSizeKB = 200.0,
    this.isImageTargetSizeMode = false,
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
    bool? isLanguageExpanded,
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
    String? languageCode,
    int? imageQuality,
    ImageOutputFormat? imageOutputFormat,
    ImageResizeMode? imageResizeMode,
    bool? enablePngQuantization,
    bool? stripImageExif,
    double? imageTargetSizeKB,
    bool? isImageTargetSizeMode,
    MediaActionIntent? mediaActionIntent,
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
      mediaActionIntent: mediaActionIntent ?? this.mediaActionIntent,
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
      isLanguageExpanded: isLanguageExpanded ?? this.isLanguageExpanded,
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
      languageCode: languageCode ?? this.languageCode,
      imageQuality: imageQuality ?? this.imageQuality,
      imageOutputFormat: imageOutputFormat ?? this.imageOutputFormat,
      imageResizeMode: imageResizeMode ?? this.imageResizeMode,
      stripImageExif: stripImageExif ?? this.stripImageExif,
      imageTargetSizeKB: imageTargetSizeKB ?? this.imageTargetSizeKB,
      isImageTargetSizeMode: isImageTargetSizeMode ?? this.isImageTargetSizeMode,
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
    if (crfQuality == 0) return AppStrings.crfLossless;
    if (crfQuality <= 18) return AppStrings.crfHighQuality;
    if (crfQuality <= 24) return AppStrings.crfBalanced;
    if (crfQuality <= 30) return AppStrings.crfHighCompression;
    if (crfQuality <= 40) return AppStrings.crfLowQuality;
    return AppStrings.crfUltraCompressed;
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
    isLanguageExpanded,
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
    languageCode,
    imageQuality,
    imageOutputFormat,
    imageResizeMode,
    stripImageExif,
    imageTargetSizeKB,
    isImageTargetSizeMode,
    mediaActionIntent,
  ];
}
