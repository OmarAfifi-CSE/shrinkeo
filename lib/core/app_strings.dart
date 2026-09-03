import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';

class AppStrings {
  static BuildContext? _context;

  static void setContext(BuildContext context) {
    _context = context;
  }

  static AppLocalizations? get _l10n {
    if (_context != null) {
      try {
        return AppLocalizations.of(_context!);
      } catch (_) {}
    }
    return null;
  }

  // ===========================================================================
  // 1. APP BRANDING & TITLE BAR
  // ===========================================================================
  static String get appName => _l10n?.appName ?? 'Shrinkeo';
  static String get totalSpaceSaved => _l10n?.totalSpaceSaved ?? 'Total Space Saved Globally';
  static String get savedSpacePrefix => _l10n?.savedSpacePrefix ?? 'Saved:';
  static String get supportButtonText => _l10n?.supportButtonText ?? 'Buy me a coffee';

  // Title Bar Tooltips
  static String get lightThemeTooltip => _l10n?.lightThemeTooltip ?? 'Light Theme';
  static String get darkThemeTooltip => _l10n?.darkThemeTooltip ?? 'Dark Theme';
  static String get settingsTooltip => _l10n?.settingsTooltip ?? 'Settings';
  static String get minimizeTooltip => _l10n?.minimizeTooltip ?? 'Minimize';
  static String get closeTooltip => _l10n?.closeTooltip ?? 'Close';
  static String get restoreTooltip => _l10n?.restoreTooltip ?? 'Restore';
  static String get maximizeTooltip => _l10n?.maximizeTooltip ?? 'Maximize';

  // ===========================================================================
  // 2. MAIN NAVIGATION TABS
  // ===========================================================================
  static String get tabCompressionQuality => _l10n?.tabCompressionQuality ?? 'Compression & Quality';
  static String get tabVideoEditingTools => _l10n?.tabVideoEditingTools ?? 'Video Editing & Tools';
  static String get tabAudioSettings => _l10n?.tabAudioSettings ?? 'Audio Settings';
  static String get tabEngineOutput => _l10n?.tabEngineOutput ?? 'Engine & Output';

  // ===========================================================================
  // 3. TAB 1: COMPRESSION & QUALITY SETTINGS
  // ===========================================================================
  static String get compressionSettingsTitle => _l10n?.compressionSettingsTitle ?? 'Compression Settings';
  static String get resetToDefaults => _l10n?.resetToDefaults ?? 'Reset to Defaults';
  static String get resetDefaultTooltip => _l10n?.resetDefaultTooltip ?? 'Reset to default';

  // Compression Mode & Target Size
  static String get modeTargetSizeTitle => _l10n?.modeTargetSizeTitle ?? 'Compression Target Mode';
  static String get modeCrfLabel => _l10n?.modeCrfLabel ?? 'Quality (CRF)';
  static String get modeTargetSizeLabel => _l10n?.modeTargetSizeLabel ?? 'Target Size (MB)';
  static String get crfQualityTitle => _l10n?.crfQualityTitle ?? 'CRF Quality (Constant Rate Factor)';
  static String get crfLossless => _l10n?.crfLossless ?? 'Lossless';
  static String get crfHighQuality => _l10n?.crfHighQuality ?? 'High Quality';
  static String get crfBalanced => _l10n?.crfBalanced ?? 'Balanced';
  static String get crfHighCompression => _l10n?.crfHighCompression ?? 'High Compression';
  static String get crfLowQuality => _l10n?.crfLowQuality ?? 'Low Quality';
  static String get crfUltraCompressed => _l10n?.crfUltraCompressed ?? 'Ultra Compressed';
  static String get targetSizeLabel => _l10n?.targetSizeLabel ?? 'Target File Size (MB)';
  static String get targetSizeDesc => _l10n?.targetSizeDesc ?? 'Calculates bitrate to fit within size limit (Min: 1 MB). Extremely low limits on long videos will lower visual resolution.';

  // Encoding Speed Presets
  static String get encodingSpeedTitle => _l10n?.encodingSpeedTitle ?? 'Encoding Speed';
  static String get presetUltrafastLabel => _l10n?.presetUltrafastLabel ?? 'Ultrafast';
  static String get presetUltrafastDesc => _l10n?.presetUltrafastDesc ?? 'Max speed, but achieves the least file size reduction.';
  static String get presetSuperfastLabel => _l10n?.presetSuperfastLabel ?? 'Superfast';
  static String get presetSuperfastDesc => _l10n?.presetSuperfastDesc ?? 'Very quick encoding with lower compression efficiency.';
  static String get presetVeryfastLabel => _l10n?.presetVeryfastLabel ?? 'Very Fast';
  static String get presetVeryfastDesc => _l10n?.presetVeryfastDesc ?? 'Faster than average, providing moderate size reduction.';
  static String get presetFasterLabel => _l10n?.presetFasterLabel ?? 'Faster';
  static String get presetFasterDesc => _l10n?.presetFasterDesc ?? 'A slight speed boost with good overall compression.';
  static String get presetFastLabel => _l10n?.presetFastLabel ?? 'Fast';
  static String get presetFastDesc => _l10n?.presetFastDesc ?? 'Great balance of speed and size reduction. Recommended.';
  static String get presetMediumLabel => _l10n?.presetMediumLabel ?? 'Medium';
  static String get presetMediumDesc => _l10n?.presetMediumDesc ?? 'Default balance of encoding speed and compression.';
  static String get presetSlowLabel => _l10n?.presetSlowLabel ?? 'Slow';
  static String get presetSlowDesc => _l10n?.presetSlowDesc ?? 'Slower process, but yields significantly smaller files.';
  static String get presetVeryslowLabel => _l10n?.presetVeryslowLabel ?? 'Very Slow';
  static String get presetVeryslowDesc => _l10n?.presetVeryslowDesc ?? 'Takes longest, but guarantees maximum file size reduction.';

  // Video Codecs
  static String get videoCodecTitle => _l10n?.videoCodecTitle ?? 'Video Codec';
  static String get codecH264Label => _l10n?.codecH264Label ?? 'H.264';
  static String get codecH264Desc => _l10n?.codecH264Desc ?? 'Maximum compatibility with older devices & browsers.';
  static String get codecH265Label => _l10n?.codecH265Label ?? 'H.265 / HEVC';
  static String get codecH265Desc => _l10n?.codecH265Desc ?? 'Better compression efficiency (smaller files).';
  static String get codecAv1Label => _l10n?.codecAv1Label ?? 'AV1';
  static String get codecAv1Desc => _l10n?.codecAv1Desc ?? 'Next-gen codec: Maximum compression efficiency (30% smaller than H.265).';

  // Hardware Acceleration (GPU)
  static String get hardwareEncoderTitle => _l10n?.hardwareEncoderTitle ?? 'Hardware Encoder (GPU)';
  static String get hwSoftwareLabel => _l10n?.hwSoftwareLabel ?? 'Software (CPU)';
  static String get hwSoftwareDesc => _l10n?.hwSoftwareDesc ?? 'Slowest, but maximum compatibility & smallest files.';
  static String get hwNvidiaLabel => _l10n?.hwNvidiaLabel ?? 'Nvidia (NVENC)';
  static String get hwNvidiaDesc => _l10n?.hwNvidiaDesc ?? 'Extremely fast encoding for Nvidia GPUs (slightly larger files).';
  static String get hwAmdLabel => _l10n?.hwAmdLabel ?? 'AMD (AMF)';
  static String get hwAmdDesc => _l10n?.hwAmdDesc ?? 'Extremely fast encoding for AMD GPUs (slightly larger files).';
  static String get hwIntelLabel => _l10n?.hwIntelLabel ?? 'Intel (QSV)';
  static String get hwIntelDesc => _l10n?.hwIntelDesc ?? 'Extremely fast encoding for Intel GPUs (slightly larger files).';

  // Resolution Downscaling
  static String get resolutionTitle => _l10n?.resolutionTitle ?? 'Max Resolution';
  static String get resOriginalLabel => _l10n?.resOriginalLabel ?? 'Original';
  static String get resOriginalDesc => _l10n?.resOriginalDesc ?? 'Keep the original video resolution.';
  static String get res4kLabel => _l10n?.res4kLabel ?? '4K';
  static String get res4kDesc => _l10n?.res4kDesc ?? 'Scale down to 4K max (Extremely high quality).';
  static String get res2kLabel => _l10n?.res2kLabel ?? '2K';
  static String get res2kDesc => _l10n?.res2kDesc ?? 'Scale down to 2K max (High quality).';
  static String get res1080pLabel => _l10n?.res1080pLabel ?? '1080p';
  static String get res1080pDesc => _l10n?.res1080pDesc ?? 'Scale down to 1080p max (Standard HD quality).';
  static String get res720pLabel => _l10n?.res720pLabel ?? '720p';
  static String get res720pDesc => _l10n?.res720pDesc ?? 'Scale down to 720p max (Good for mobile viewing).';
  static String get res480pLabel => _l10n?.res480pLabel ?? '480p';
  static String get res480pDesc => _l10n?.res480pDesc ?? 'Scale down to 480p max (DVD quality, very small size).';
  static String get res360pLabel => _l10n?.res360pLabel ?? '360p';
  static String get res360pDesc => _l10n?.res360pDesc ?? 'Scale down to 360p max (Extreme compression, low quality).';

  // Frame Rate (FPS)
  static String get frameRateTitle => _l10n?.frameRateTitle ?? 'Frame Rate (FPS)';
  static String get fpsOriginalLabel => _l10n?.fpsOriginalLabel ?? 'Original';
  static String get fpsOriginalDesc => _l10n?.fpsOriginalDesc ?? 'Keeps the exact same framerate as the source video.';
  static String get fps60Label => _l10n?.fps60Label ?? '60 fps';
  static String get fps60Desc => _l10n?.fps60Desc ?? 'Ultra smooth, ideal for gaming or sports (creates larger files).';
  static String get fps30Label => _l10n?.fps30Label ?? '30 fps';
  static String get fps30Desc => _l10n?.fps30Desc ?? 'Standard smoothness, great balance for most videos.';
  static String get fps24Label => _l10n?.fps24Label ?? '24 fps';
  static String get fps24Desc => _l10n?.fps24Desc ?? 'Cinematic look, useful for movies and saving space.';

  // Video Grain & Noise Clean
  static String get enableVideoDenoiseTitle => _l10n?.enableVideoDenoiseTitle ?? 'Clean Video Noise & Grain';
  static String get enableVideoDenoiseDesc => _l10n?.enableVideoDenoiseDesc ?? 'Applies 3D spatial-temporal filtering to remove low-light digital grain and boost compression by 15-25%.';

  // ===========================================================================
  // 4. TAB 2: VIDEO EDITING & TOOLS
  // ===========================================================================
  // Export Format
  static String get exportFormatTitle => _l10n?.exportFormatTitle ?? 'Export Format';
  static String get exportVideoLabel => _l10n?.exportVideoLabel ?? 'Standard Video';
  static String get exportVideoDesc => _l10n?.exportVideoDesc ?? 'Export to MP4/MKV/MOV container';
  static String get exportGifLabel => _l10n?.exportGifLabel ?? 'Animated GIF';
  static String get exportGifDesc => _l10n?.exportGifDesc ?? 'Export high-quality animated GIF clip';
  static String get exportMp3Label => _l10n?.exportMp3Label ?? 'Extract MP3';
  static String get exportMp3Desc => _l10n?.exportMp3Desc ?? 'Extract audio track as 320kbps MP3';
  static String get exportAacLabel => _l10n?.exportAacLabel ?? 'Extract AAC';
  static String get exportAacDesc => _l10n?.exportAacDesc ?? 'Extract audio track as high-quality AAC';
  static String get exportWavLabel => _l10n?.exportWavLabel ?? 'Extract WAV';
  static String get exportWavDesc => _l10n?.exportWavDesc ?? 'Extract uncompressed studio WAV audio';

  // Privacy & GPS Scrubbing
  static String get privacyScrubbingTitle => _l10n?.privacyScrubbingTitle ?? 'Privacy & GPS Scrubbing';
  static String get stripGpsExifLabel => _l10n?.stripGpsExifLabel ?? 'Strip GPS/EXIF';
  static String get stripGpsExifInfoTitle => _l10n?.stripGpsExifInfoTitle ?? 'Strip GPS & Metadata';
  static String get stripGpsExifInfoDesc => _l10n?.stripGpsExifInfoDesc ?? 'Removes camera info, GPS location, & timestamps.';
  static String get keepMetadataInfoDesc => _l10n?.keepMetadataInfoDesc ?? 'Preserves original video EXIF metadata.';

  // Auto-Crop Black Bars
  static String get autoCropBlackBarsTitle => _l10n?.autoCropBlackBarsTitle ?? 'Auto-Crop Black Bars';
  static String get autoCropLabel => _l10n?.autoCropLabel ?? 'Auto-Crop';
  static String get autoCropActiveTitle => _l10n?.autoCropActiveTitle ?? 'Auto-Crop Active';
  static String get autoCropActiveDesc => _l10n?.autoCropActiveDesc ?? 'Removes black letterbox borders from video.';
  static String get autoCropDisabledDesc => _l10n?.autoCropDisabledDesc ?? 'Keeps original video frame borders.';

  // Playback Speed
  static String get playbackSpeedTitle => _l10n?.playbackSpeedTitle ?? 'Playback Speed';
  static String get speedOriginalLabel => _l10n?.speedOriginalLabel ?? '1.0x';
  static String get speedOriginalDesc => _l10n?.speedOriginalDesc ?? 'Normal video speed';
  static String get speedSlow05Label => _l10n?.speedSlow05Label ?? '0.5x Slow-mo';
  static String get speedSlow05Desc => _l10n?.speedSlow05Desc ?? 'Half speed playback';
  static String get speedFast15Label => _l10n?.speedFast15Label ?? '1.5x Speed';
  static String get speedFast15Desc => _l10n?.speedFast15Desc ?? 'Slight speed up';
  static String get speedFast20Label => _l10n?.speedFast20Label ?? '2.0x Fast';
  static String get speedFast20Desc => _l10n?.speedFast20Desc ?? 'Double speed playback';
  static String get speedTimelapse40Label => _l10n?.speedTimelapse40Label ?? '4.0x Timelapse';
  static String get speedTimelapse40Desc => _l10n?.speedTimelapse40Desc ?? 'Ultra fast timelapse';

  // Canvas Aspect Ratio
  static String get canvasAspectRatioTitle => _l10n?.canvasAspectRatioTitle ?? 'Canvas Aspect Ratio';
  static String get aspectOriginalLabel => _l10n?.aspectOriginalLabel ?? 'Original';
  static String get aspectOriginalDesc => _l10n?.aspectOriginalDesc ?? 'Keep original video dimensions';
  static String get aspectShortsLabel => _l10n?.aspectShortsLabel ?? '9:16 Shorts';
  static String get aspectShortsDesc => _l10n?.aspectShortsDesc ?? 'Padded canvas for TikTok & Reels';
  static String get aspectSquareLabel => _l10n?.aspectSquareLabel ?? '1:1 Square';
  static String get aspectSquareDesc => _l10n?.aspectSquareDesc ?? 'Padded canvas for Instagram feed posts';
  static String get aspectPortraitLabel => _l10n?.aspectPortraitLabel ?? '4:5 Portrait';
  static String get aspectPortraitDesc => _l10n?.aspectPortraitDesc ?? 'Padded canvas for Instagram vertical posts';
  static String get aspectWidescreenLabel => _l10n?.aspectWidescreenLabel ?? '16:9 Wide';
  static String get aspectWidescreenDesc => _l10n?.aspectWidescreenDesc ?? 'Padded canvas for YouTube & TV screens';
  static String get aspectClassicLabel => _l10n?.aspectClassicLabel ?? '4:3 Classic';
  static String get aspectClassicDesc => _l10n?.aspectClassicDesc ?? 'Padded canvas for classic TV screens';
  static String get aspectCinemaLabel => _l10n?.aspectCinemaLabel ?? '21:9 Cinema';
  static String get aspectCinemaDesc => _l10n?.aspectCinemaDesc ?? 'Padded canvas for Ultrawide cinema monitors';
  static String get aspectCustomLabel => _l10n?.aspectCustomLabel ?? 'Custom Ratio';
  static String get aspectCustomDesc => _l10n?.aspectCustomDesc ?? 'Padded canvas for custom aspect ratio';
  static String get customRatioTooltip => _l10n?.customRatioTooltip ?? 'Type custom ratio e.g. 16:10, 2:1, 18:9';

  // Rotation & Flip
  static String get rotationFlipTitle => _l10n?.rotationFlipTitle ?? 'Rotation & Flip';
  static String get rotOriginalLabel => _l10n?.rotOriginalLabel ?? 'Original (0°)';
  static String get rotOriginalDesc => _l10n?.rotOriginalDesc ?? 'Keep original orientation';
  static String get rot90Label => _l10n?.rot90Label ?? '90° CW';
  static String get rot90Desc => _l10n?.rot90Desc ?? 'Rotate 90 degrees right';
  static String get rot180Label => _l10n?.rot180Label ?? '180° Flip';
  static String get rot180Desc => _l10n?.rot180Desc ?? 'Rotate upside down';
  static String get rot270Label => _l10n?.rot270Label ?? '270° CW';
  static String get rot270Desc => _l10n?.rot270Desc ?? 'Rotate 90 degrees left';
  static String get rotFlipHLabel => _l10n?.rotFlipHLabel ?? 'Flip H';
  static String get rotFlipHDesc => _l10n?.rotFlipHDesc ?? 'Mirror image horizontally';
  static String get rotFlipVLabel => _l10n?.rotFlipVLabel ?? 'Flip V';
  static String get rotFlipVDesc => _l10n?.rotFlipVDesc ?? 'Mirror image vertically';
  static String get rotCustomLabel => _l10n?.rotCustomLabel ?? 'Custom Angle';
  static String get rotCustomDesc => _l10n?.rotCustomDesc ?? 'Rotate by custom degree angle';
  static String get customRotationTooltip => _l10n?.customRotationTooltip ?? 'Type degree angle e.g. 45, 30, 120';

  // Trim Video
  static String get trimVideoTitle => _l10n?.trimVideoTitle ?? 'Trim Video';
  static String get fullVideoLabel => _l10n?.fullVideoLabel ?? 'Full Video';
  static String get cutClipLabel => _l10n?.cutClipLabel ?? 'Cut Clip';
  static String get trimStartLabel => _l10n?.trimStartLabel ?? 'Start';
  static String get trimEndLabel => _l10n?.trimEndLabel ?? 'End';
  static String get trimActiveTitle => _l10n?.trimActiveTitle ?? 'Trim Active';
  static String get fullVideoDesc => _l10n?.fullVideoDesc ?? 'Processes the entire video duration without trimming.';

  // ===========================================================================
  // 5. TAB 3: AUDIO SETTINGS
  // ===========================================================================
  // Audio Track Mode
  static String get audioModeTitle => _l10n?.audioModeTitle ?? 'Audio Track Mode';
  static String get audioOriginalLabel => _l10n?.audioOriginalLabel ?? 'Original';
  static String get audioOriginalDesc => _l10n?.audioOriginalDesc ?? 'Preserves original audio track (No quality loss).';
  static String get audioAac256Label => _l10n?.audioAac256Label ?? 'High Quality';
  static String get audioAac256Desc => _l10n?.audioAac256Desc ?? 'Compresses to AAC 256kbps (Excellent quality, moderate size).';
  static String get audioAac128Label => _l10n?.audioAac128Label ?? 'Balanced';
  static String get audioAac128Desc => _l10n?.audioAac128Desc ?? 'Compresses to AAC 128kbps (Good quality, small size - Web Standard).';
  static String get audioAac64Label => _l10n?.audioAac64Label ?? 'Low Quality';
  static String get audioAac64Desc => _l10n?.audioAac64Desc ?? 'Compresses to AAC 64kbps (Best for speech/podcasts, tiny size).';
  static String get audioMuteLabel => _l10n?.audioMuteLabel ?? 'Mute Audio';
  static String get audioMuteDesc => _l10n?.audioMuteDesc ?? 'Removes the audio track completely to save space.';

  // Audio Normalization
  static String get audioNormTitle => _l10n?.audioNormTitle ?? 'Audio Volume Normalization';
  static String get audioNormOffLabel => _l10n?.audioNormOffLabel ?? 'Off';
  static String get audioNormOffDesc => _l10n?.audioNormOffDesc ?? 'Keep original dynamic volume.';
  static String get audioNormSpeechLabel => _l10n?.audioNormSpeechLabel ?? 'Speech';
  static String get audioNormSpeechDesc => _l10n?.audioNormSpeechDesc ?? 'EBU R128 (-16 LUFS) broadcast loudness for clear dialogue.';
  static String get audioNormDynamicLabel => _l10n?.audioNormDynamicLabel ?? 'Movie Dynamic';
  static String get audioNormDynamicDesc => _l10n?.audioNormDynamicDesc ?? 'Dynaudnorm smooths quiet & loud scenes smoothly.';
  static String get audioNormBoostLabel => _l10n?.audioNormBoostLabel ?? 'Soft Boost';
  static String get audioNormBoostDesc => _l10n?.audioNormBoostDesc ?? 'Fixed +3dB volume gain boost for low-audio videos.';

  // Audio Channels
  static String get audioChanTitle => _l10n?.audioChanTitle ?? 'Audio Channels Downmix';
  static String get audioChanOriginalLabel => _l10n?.audioChanOriginalLabel ?? 'Original';
  static String get audioChanOriginalDesc => _l10n?.audioChanOriginalDesc ?? 'Preserve exact source audio channels (Mono, Stereo, 5.1, etc.).';
  static String get audioChanStereoLabel => _l10n?.audioChanStereoLabel ?? 'Stereo (2.0)';
  static String get audioChanStereoDesc => _l10n?.audioChanStereoDesc ?? 'Standard 2-channel compatibility for all screens.';
  static String get audioChanMonoLabel => _l10n?.audioChanMonoLabel ?? 'Mono (1.0)';
  static String get audioChanMonoDesc => _l10n?.audioChanMonoDesc ?? 'Single channel downmix - 50% extra audio size savings.';

  // Audio Noise Removal
  static String get removeNoiseLabel => _l10n?.removeNoiseLabel ?? 'Remove Noise';
  static String get enableAudioDenoiseTitle => _l10n?.enableAudioDenoiseTitle ?? 'Remove Mic & Fan Noise';
  static String get enableAudioDenoiseDesc => _l10n?.enableAudioDenoiseDesc ?? 'Applies FFT spectral filtering to eliminate background mic hiss, fan noise, and room hum.';

  // ===========================================================================
  // 6. TAB 4: ENGINE & OUTPUT SETTINGS
  // ===========================================================================
  // Output Directory
  static String get outputDirectoryTitle => _l10n?.outputDirectoryTitle ?? 'Output Directory';
  static String get defaultOutputDirectory => _l10n?.defaultOutputDirectory ?? 'Default (Next to original file)';
  static String get selectOutputFolderTitle => _l10n?.selectOutputFolderTitle ?? 'Select Output Folder';
  static String get clearOutputFolder => _l10n?.clearOutputFolder ?? 'Clear custom folder (Use default)';
  static String get changeBtn => _l10n?.changeBtn ?? 'Change';

  // Output Location Behavior
  static String get outputLocationTitle => _l10n?.outputLocationTitle ?? 'Output Location Behavior';
  static String get outputLocationUnifiedLabel => _l10n?.outputLocationUnifiedLabel ?? 'Unified Folder';
  static String get outputLocationUnifiedDesc => _l10n?.outputLocationUnifiedDesc ?? 'All compressed videos are saved into a single folder.';
  static String get outputLocationSameLabel => _l10n?.outputLocationSameLabel ?? 'Same as Original';
  static String get outputLocationSameDesc => _l10n?.outputLocationSameDesc ?? 'Each video is saved in a subfolder next to its original location.';

  // File Management
  static String get fileManagementTitle => _l10n?.fileManagementTitle ?? 'File Management';
  static String get keepOriginalsLabel => _l10n?.keepOriginalsLabel ?? 'Keep Originals';
  static String get keepOriginalsDesc => _l10n?.keepOriginalsDesc ?? 'Keeps the original videos untouched after compression.';
  static String get toRecycleBinLabel => _l10n?.toRecycleBinLabel ?? 'To Recycle Bin';
  static String get toRecycleBinDesc => _l10n?.toRecycleBinDesc ?? 'Moves originals to the Recycle Bin after successful compression.';

  // Output Container Options
  static String get outputFormatTitle => _l10n?.outputFormatTitle ?? 'Output Format (Container)';
  static String get formatOriginalLabel => _l10n?.formatOriginalLabel ?? 'Original';
  static String get formatOriginalDesc => _l10n?.formatOriginalDesc ?? 'Keep original format (Fastest, no container changes).';
  static String get formatMp4Label => _l10n?.formatMp4Label ?? 'MP4';
  static String get formatMp4Desc => _l10n?.formatMp4Desc ?? 'Maximum compatibility across all devices and web browsers.';
  static String get formatMkvLabel => _l10n?.formatMkvLabel ?? 'MKV';
  static String get formatMkvDesc => _l10n?.formatMkvDesc ?? 'Resilient format, great for multiple audio/subtitle tracks.';
  static String get formatMovLabel => _l10n?.formatMovLabel ?? 'MOV';
  static String get formatMovDesc => _l10n?.formatMovDesc ?? 'High quality Apple QuickTime format, great for editing.';

  // ===========================================================================
  // 7. VIDEO QUEUE, CARDS & STATUS CHIPS
  // ===========================================================================
  static String get scanningFilesMsg => _l10n?.scanningFilesMsg ?? 'Scanning files... This may take a moment.';
  static String get addFilesBtn => _l10n?.addFilesBtn ?? 'Add Files';
  static String get addFolderBtn => _l10n?.addFolderBtn ?? 'Add Folder';
  static String get dragDropMoreMsg => _l10n?.dragDropMoreMsg ?? 'Or drag & drop more videos anywhere';
  static String get openOutputFolderTooltip => _l10n?.openOutputFolderTooltip ?? 'Open Output Folder';

  // Processing Statuses
  static String get statusQueued => _l10n?.statusQueued ?? 'Queued';
  static String get statusAnalyzing => _l10n?.statusAnalyzing ?? 'Analyzing';
  static String get statusCompressing => _l10n?.statusCompressing ?? 'Compressing';
  static String get statusDone => _l10n?.statusDone ?? 'Done';
  static String get statusFailed => _l10n?.statusFailed ?? 'Failed';
  static String get statusCancelled => _l10n?.statusCancelled ?? 'Cancelled';

  // File Card Results & Badges
  static String get savedPrefix => _l10n?.savedPrefix ?? 'Saved';
  static String get largerSuffix => _l10n?.largerSuffix ?? 'Larger';
  static String get largerSizeWarning => _l10n?.largerSizeWarning ?? 'Output size might be larger than original. Consider cancelling and resetting settings to default.';

  // ===========================================================================
  // 8. BOTTOM ACTION BAR & QUEUE SUMMARY
  // ===========================================================================
  static String get clearCompletedBtn => _l10n?.clearCompletedBtn ?? 'Clear Completed';
  static String get clearAllBtn => _l10n?.clearAllBtn ?? 'Clear All';
  static String get stopAllBtn => _l10n?.stopAllBtn ?? 'Stop All';
  static String get startCompressionBtn => _l10n?.startCompressionBtn ?? 'Start Compression';
  static String get allDoneLabel => _l10n?.allDoneLabel ?? 'All Done!';
  static String get openFolderBtn => _l10n?.openFolderBtn ?? 'Open Folder';
  static String get totalEtaLabel => _l10n?.totalEtaLabel ?? 'Total ETA';
  static String get totalSavedLabel => _l10n?.totalSavedLabel ?? 'Total Saved';
  static String get videoSingle => _l10n?.videoSingle ?? 'video';
  static String get videosPlural => _l10n?.videosPlural ?? 'videos';
  static String get fileSingle => _l10n?.fileSingle ?? 'file';
  static String get filesPlural => _l10n?.filesPlural ?? 'files';

  // ===========================================================================
  // 9. DROP ZONE & FULLSCREEN OVERLAY
  // ===========================================================================
  static String get releaseToAddVideosMsg => _l10n?.releaseToAddVideosMsg ?? 'Release to add videos';
  static String get dragDropHereMsg => _l10n?.dragDropHereMsg ?? 'Drag & drop video files or folders here';
  static String get supportedFormatsMsg => _l10n?.supportedFormatsMsg ?? 'Seamlessly supports MP4, MKV, MOV, AVI, WMV';
  static String get selectFilesBtn => _l10n?.selectFilesBtn ?? 'Select Files';
  static String get selectFolderBtn => _l10n?.selectFolderBtn ?? 'Select Folder';
  static String get releaseToShrinkTitle => _l10n?.releaseToShrinkTitle ?? 'Release to Shrink';
  static String get filesWillBeAddedDesc => _l10n?.filesWillBeAddedDesc ?? 'Your files will be added to the queue.';
  static String get disabledLabel => _l10n?.disabledLabel ?? 'Disabled';

  // ===========================================================================
  // 10. DIALOGS, UPDATES & MAINTENANCE
  // ===========================================================================
  // App Close Confirmation
  static String get compressionInProgressTitle => _l10n?.compressionInProgressTitle ?? 'Compression in Progress';
  static String get confirmCloseDesc => _l10n?.confirmCloseDesc ?? 'Are you sure you want to close Shrinkeo?\nThis will cancel all current compressions and you might lose your progress.';
  static String get keepCompressingBtn => _l10n?.keepCompressingBtn ?? 'Keep Compressing';
  static String get closeAppBtn => _l10n?.closeAppBtn ?? 'Close App';
  static String get lockedSettingsWarning => _l10n?.lockedSettingsWarning ?? 'Locked during compression';

  // Software Updates & Remote Config
  static String get updateRequiredTitle => _l10n?.updateRequiredTitle ?? 'Update Required';
  static String get updateRequiredDescNewVersion => _l10n?.updateRequiredDescNewVersion ?? 'A new version of Shrinkeo is available with important improvements. Please update to continue.';
  static String get updateRequiredDescOldVersion => _l10n?.updateRequiredDescOldVersion ?? 'Your version is no longer supported. Please update to continue using the app.';
  static String get updateNowBtn => _l10n?.updateNowBtn ?? 'Update Now';
  static String get laterBtn => _l10n?.laterBtn ?? 'Later';
  static String get updateAvailableTitle => _l10n?.updateAvailableTitle ?? 'Update Available';
  static String get whatsNewTitle => _l10n?.whatsNewTitle ?? "What's New:";
  static String get exitAppBtn => _l10n?.exitAppBtn ?? 'Exit App';
  static String get retryBtn => _l10n?.retryBtn ?? 'Retry';
  static String get downloadFromWebsiteBtn => _l10n?.downloadFromWebsiteBtn ?? 'Download from Website';
  static String get failedDownloadUpdateMsg => _l10n?.failedDownloadUpdateMsg ?? 'Failed to download update. Please try again.';

  static String get skipUpdateConfirmTitle => _l10n?.skipUpdateConfirmTitle ?? 'Skip Critical Update?';
  static String get skipUpdateConfirmDesc => _l10n?.skipUpdateConfirmDesc ?? 'This update contains critical bug fixes and improvements. We highly recommend updating now to ensure the app functions correctly.\n\nAre you sure you want to skip it for now?';
  static String get skipUpdateCancelBtn => _l10n?.skipUpdateCancelBtn ?? 'Cancel';
  static String get skipUpdateConfirmBtn => _l10n?.skipUpdateConfirmBtn ?? 'I understand, Skip it';

  static String get maintenanceTitle => _l10n?.maintenanceTitle ?? 'System Maintenance';
  static String get maintenanceDescDefault => _l10n?.maintenanceDescDefault ?? 'Shrinkeo is currently undergoing maintenance. Please try again later.';

  static String versionAvailableMsg(String version) => _l10n?.versionAvailableMsg(version) ?? 'Version $version is now available.';

  // ===========================================================================
  // 11. HARDWARE ENCODER & SYSTEM ERRORS
  // ===========================================================================
  static String get hwEncoderNotSupportedTitle => _l10n?.hwEncoderNotSupportedTitle ?? 'Hardware Encoder Not Supported';
  static String get failedCreateFolderError => _l10n?.failedCreateFolderError ?? 'Failed to create output folder';
  static String get failedProbeDurationError => _l10n?.failedProbeDurationError ?? 'Failed to probe duration';
  static String get ffmpegNotFoundGlobalError => _l10n?.ffmpegNotFoundGlobalError ?? 'FFmpeg was not found. Please ensure FFmpeg is bundled in the data directory.';
  static String get ffmpegMissingError => _l10n?.ffmpegMissingError ?? 'FFmpeg or FFprobe is missing or corrupted.\n\nPlease reinstall Shrinkeo or manually fix the installation using:\nwinget install Gyan.FFmpeg';

  static String hwFallbackNotificationBody(String encoderLabel) => _l10n?.hwFallbackNotificationBody(encoderLabel) ?? '$encoderLabel failed. Automatically switched to Software (CPU) encoding.';

  static String customRatioActiveTitle(String ratio) => _l10n?.customRatioActiveTitle(ratio) ?? 'Custom Ratio ($ratio)';
  static String customRatioActiveDesc(String ratio) => _l10n?.customRatioActiveDesc(ratio) ?? 'Padded canvas for custom $ratio ratio.';
  static String customAngleActiveTitle(String angle) => _l10n?.customAngleActiveTitle(angle) ?? 'Custom Angle ($angle°)';
  static String customAngleActiveDesc(String angle) => _l10n?.customAngleActiveDesc(angle) ?? 'Rotates video by custom $angle° degree angle.';
  static String trimActiveDesc(String start, String end) => _l10n?.trimActiveDesc(start, end) ?? 'Cuts video clip between $start and $end.';
  static String targetSizeLimitLabel(String size) => _l10n?.targetSizeLimitLabel(size) ?? '$size MB Limit';
  static String get customMbSizeTooltip => _l10n?.customMbSizeTooltip ?? 'Type custom MB size';
  static String get trimTimeTooltip => _l10n?.trimTimeTooltip ?? 'Enter time e.g. 5 (5s), 1:30 (1m30s), or 00:01:30';

  // ===========================================================================
  // 12. IMAGE SUITE SETTINGS
  // ===========================================================================
  static String get tabImageSuite => _l10n?.tabImageSuite ?? 'Image Suite';
  static String get compressionModeTitle => _l10n?.compressionModeTitle ?? 'Compression Mode';
  static String get smartAutoLabel => _l10n?.smartAutoLabel ?? 'Smart Auto';
  static String get smartAutoDesc => _l10n?.smartAutoDesc ?? 'Automatically reduces file size by ~60-80% with 100% pristine visual clarity. Perfect for everyday photo optimization.';
  static String get maxSavingsLabel => _l10n?.maxSavingsLabel ?? 'Max Savings';
  static String get maxSavingsDesc => _l10n?.maxSavingsDesc ?? 'Aggressive compression saving up to 85-90% file size. Best for fast messaging, web uploads, and email attachments.';
  static String get ultraFidelityLabel => _l10n?.ultraFidelityLabel ?? 'Ultra Fidelity';
  static String get ultraFidelityDesc => _l10n?.ultraFidelityDesc ?? 'Preserves raw visual fidelity with minimal compression. Ideal for photography archives and high-res print work.';
  static String get targetImageFormatTitle => _l10n?.targetImageFormatTitle ?? 'Target Image Format';
  static String get dimensionResizingTitle => _l10n?.dimensionResizingTitle ?? 'Dimension Resizing';
  static String get exifCameraPrivacyTitle => _l10n?.exifCameraPrivacyTitle ?? 'EXIF / Camera Privacy';
  static String get keepMetadataLabel => _l10n?.keepMetadataLabel ?? 'Keep Metadata';
  static String get stripGpsCameraInfoLabel => _l10n?.stripGpsCameraInfoLabel ?? 'Strip GPS & Camera Info';

  // Image Compression Modes
  static String get imageQualityModeLabel => _l10n?.imageQualityModeLabel ?? 'Quality Level';
  static String get imageQualityModeDesc => _l10n?.imageQualityModeDesc ?? 'Encodes at a fixed quality level — higher quality means larger files.';
  static String get imageTargetSizeModeLabel => _l10n?.imageTargetSizeModeLabel ?? 'Target Size';
  static String get imageTargetSizeModeDesc => _l10n?.imageTargetSizeModeDesc ?? 'Automatically finds the highest quality that fits under the size limit.';
  static String get imageQualitySliderTitle => _l10n?.imageQualitySliderTitle ?? 'Image Quality';
  static String get imageTargetSizeTitle => _l10n?.imageTargetSizeTitle ?? 'Target File Size';
  static String get imageTargetSizeDesc => _l10n?.imageTargetSizeDesc ?? 'Encodes repeatedly at decreasing quality until the file fits under the limit. Very small limits may reduce quality.';
  static String imageTargetSizeLimitLabel(String size) => _l10n?.imageTargetSizeLimitLabel(size) ?? '$size Limit';
  static String get customKbSizeTooltip => _l10n?.customKbSizeTooltip ?? 'Type custom KB size';

  // Image Processing Errors
  static String get imageProcessingFailedError => _l10n?.imageProcessingFailedError ?? 'Image processing failed';
  static String get imageProcessingErrorMsg => _l10n?.imageProcessingErrorMsg ?? 'Image processing error';

  // Image Format Labels & Descriptions
  static String get imgFmtOriginalLabel => _l10n?.imgFmtOriginalLabel ?? 'Original Format';
  static String get imgFmtOriginalDesc => _l10n?.imgFmtOriginalDesc ?? 'Keep original format (Fastest, no conversion).';
  static String get imgFmtPngLabel => _l10n?.imgFmtPngLabel ?? 'PNG Image (.png)';
  static String get imgFmtPngDesc => _l10n?.imgFmtPngDesc ?? 'Lossless PNG format with transparency support.';
  static String get imgFmtJpgLabel => _l10n?.imgFmtJpgLabel ?? 'JPEG Image (.jpg)';
  static String get imgFmtJpgDesc => _l10n?.imgFmtJpgDesc ?? 'Standard compressed JPEG format for universal compatibility.';
  static String get imgFmtWebpLabel => _l10n?.imgFmtWebpLabel ?? 'WebP Image (.webp)';
  static String get imgFmtWebpDesc => _l10n?.imgFmtWebpDesc ?? 'Modern WebP format offering superior compression and small size.';
  static String get imgFmtAvifLabel => _l10n?.imgFmtAvifLabel ?? 'AVIF Image (.avif)';
  static String get imgFmtAvifDesc => _l10n?.imgFmtAvifDesc ?? 'Next-gen AVIF format with ultra-high compression efficiency.';

  // Image Resize Labels & Descriptions
  static String get imgResOriginalLabel => _l10n?.imgResOriginalLabel ?? 'Original Dimensions';
  static String get imgResOriginalDesc => _l10n?.imgResOriginalDesc ?? 'Keep original image width and height dimensions.';
  static String get imgRes4kLabel => _l10n?.imgRes4kLabel ?? '4K Max (3840px)';
  static String get imgRes4kDesc => _l10n?.imgRes4kDesc ?? 'Scale down image max dimension to 3840px (4K max).';
  static String get imgRes1080pLabel => _l10n?.imgRes1080pLabel ?? 'Full HD Max (1920px)';
  static String get imgRes1080pDesc => _l10n?.imgRes1080pDesc ?? 'Scale down image max dimension to 1920px (Full HD max).';
  static String get imgRes720pLabel => _l10n?.imgRes720pLabel ?? 'HD Max (1280px)';
  static String get imgRes720pDesc => _l10n?.imgRes720pDesc ?? 'Scale down image max dimension to 1280px (HD max).';
  static String get imgRes480pLabel => _l10n?.imgRes480pLabel ?? 'SD Max (854px)';
  static String get imgRes480pDesc => _l10n?.imgRes480pDesc ?? 'Scale down image max dimension to 854px (SD max).';
  static String get keepMetadataImageInfoDesc => _l10n?.keepMetadataImageInfoDesc ?? 'Preserves original image EXIF & camera metadata.';

  // Additional UI Localizations
  static String get cleanNoiseLabel => _l10n?.cleanNoiseLabel ?? 'Clean Noise';
  static String get outputLargerTooltip => _l10n?.outputLargerTooltip ?? 'Output will be larger than original!\nStop and try Reset to Defaults.';
  static String get estimatedSizePrefix => _l10n?.estimatedSizePrefix ?? 'Est:';
  static String get cancelBtnTooltip => _l10n?.cancelBtnTooltip ?? 'Cancel';
  static String get removeBtnTooltip => _l10n?.removeBtnTooltip ?? 'Remove';
  static String get selectLanguageTitle => _l10n?.selectLanguageTitle ?? 'Select Language';
  static String languagesCountLabel(int count) => _l10n?.languagesCountLabel(count.toString()) ?? '$count Languages';
  static String get searchLanguageHint => _l10n?.searchLanguageHint ?? 'Search language by name or code...';
  static String get noLanguagesMatchSearch => _l10n?.noLanguagesMatchSearch ?? 'No languages match your search.';
  static String get languageTooltip => _l10n?.languageTooltip ?? 'Language';
  static String get notifyCompressionCompleteTitle => _l10n?.notifyCompressionCompleteTitle ?? 'Shrinkeo Compression Complete';
  static String notifyCompressionCompleteSuccess(int success) => _l10n?.notifyCompressionCompleteSuccess(success.toString()) ?? 'Successfully compressed $success videos.';
  static String notifyCompressionCompleteFailed(int failed) => _l10n?.notifyCompressionCompleteFailed(failed.toString()) ?? ' ($failed failed)';
  static String get notifyOutputLargerTitle => _l10n?.notifyOutputLargerTitle ?? 'Output Larger Than Original';
  static String notifyOutputLargerDesc(String fileName) => _l10n?.notifyOutputLargerDesc(fileName) ?? '$fileName is expected to be larger than the original file size. Consider cancelling and resetting settings to default.';
}
