// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'Shrinkeo';

  @override
  String get totalSpaceSaved => 'Total Space Saved Globally';

  @override
  String get savedSpacePrefix => 'Saved:';

  @override
  String get supportButtonText => 'Support Project';

  @override
  String get lightThemeTooltip => 'Light Theme';

  @override
  String get darkThemeTooltip => 'Dark Theme';

  @override
  String get settingsTooltip => 'Settings';

  @override
  String get minimizeTooltip => 'Minimize';

  @override
  String get closeTooltip => 'Close';

  @override
  String get restoreTooltip => 'Restore';

  @override
  String get maximizeTooltip => 'Maximize';

  @override
  String get tabCompressionQuality => 'Compression & Quality';

  @override
  String get tabVideoEditingTools => 'Video Editing & Tools';

  @override
  String get tabAudioSettings => 'Audio Settings';

  @override
  String get tabEngineOutput => 'Engine & Output';

  @override
  String get compressionSettingsTitle => 'Compression Settings';

  @override
  String get resetToDefaults => 'Reset to Defaults';

  @override
  String get resetDefaultTooltip => 'Reset to default';

  @override
  String get modeTargetSizeTitle => 'Compression Target Mode';

  @override
  String get modeCrfLabel => 'Quality (CRF)';

  @override
  String get modeTargetSizeLabel => 'Target Size (MB)';

  @override
  String get crfQualityTitle => 'CRF Quality (Constant Rate Factor)';

  @override
  String get crfLossless => 'Lossless';

  @override
  String get crfHighQuality => 'High Quality';

  @override
  String get crfBalanced => 'Balanced';

  @override
  String get crfHighCompression => 'High Compression';

  @override
  String get crfLowQuality => 'Low Quality';

  @override
  String get crfUltraCompressed => 'Ultra Compressed';

  @override
  String get targetSizeLabel => 'Target File Size (MB)';

  @override
  String get targetSizeDesc =>
      'Calculates bitrate to fit within size limit (Min: 1 MB). Extremely low limits on long videos will lower visual resolution.';

  @override
  String get encodingSpeedTitle => 'Encoding Speed';

  @override
  String get presetUltrafastLabel => 'Ultrafast';

  @override
  String get presetUltrafastDesc =>
      'Max speed, but achieves the least file size reduction.';

  @override
  String get presetSuperfastLabel => 'Superfast';

  @override
  String get presetSuperfastDesc =>
      'Very quick encoding with lower compression efficiency.';

  @override
  String get presetVeryfastLabel => 'Very Fast';

  @override
  String get presetVeryfastDesc =>
      'Faster than average, providing moderate size reduction.';

  @override
  String get presetFasterLabel => 'Faster';

  @override
  String get presetFasterDesc =>
      'A slight speed boost with good overall compression.';

  @override
  String get presetFastLabel => 'Fast';

  @override
  String get presetFastDesc =>
      'Great balance of speed and size reduction. Recommended.';

  @override
  String get presetMediumLabel => 'Medium';

  @override
  String get presetMediumDesc =>
      'Default balance of encoding speed and compression.';

  @override
  String get presetSlowLabel => 'Slow';

  @override
  String get presetSlowDesc =>
      'Slower process, but yields significantly smaller files.';

  @override
  String get presetVeryslowLabel => 'Very Slow';

  @override
  String get presetVeryslowDesc =>
      'Takes longest, but guarantees maximum file size reduction.';

  @override
  String get videoCodecTitle => 'Video Codec';

  @override
  String get codecH264Label => 'H.264';

  @override
  String get codecH264Desc =>
      'Maximum compatibility with older devices & browsers.';

  @override
  String get codecH265Label => 'H.265 / HEVC';

  @override
  String get codecH265Desc => 'Better compression efficiency (smaller files).';

  @override
  String get codecAv1Label => 'AV1';

  @override
  String get codecAv1Desc =>
      'Next-gen codec: Maximum compression efficiency (30% smaller than H.265).';

  @override
  String get hardwareEncoderTitle => 'Hardware Encoder (GPU)';

  @override
  String get hwSoftwareLabel => 'Software (CPU)';

  @override
  String get hwSoftwareDesc =>
      'Slowest, but maximum compatibility & smallest files.';

  @override
  String get hwNvidiaLabel => 'Nvidia (NVENC)';

  @override
  String get hwNvidiaDesc =>
      'Extremely fast encoding for Nvidia GPUs (slightly larger files).';

  @override
  String get hwAmdLabel => 'AMD (AMF)';

  @override
  String get hwAmdDesc =>
      'Extremely fast encoding for AMD GPUs (slightly larger files).';

  @override
  String get hwIntelLabel => 'Intel (QSV)';

  @override
  String get hwIntelDesc =>
      'Extremely fast encoding for Intel GPUs (slightly larger files).';

  @override
  String get resolutionTitle => 'Max Resolution';

  @override
  String get resOriginalLabel => 'Original';

  @override
  String get resOriginalDesc => 'Keep the original video resolution.';

  @override
  String get res4kLabel => '4K';

  @override
  String get res4kDesc => 'Scale down to 4K max (Extremely high quality).';

  @override
  String get res2kLabel => '2K';

  @override
  String get res2kDesc => 'Scale down to 2K max (High quality).';

  @override
  String get res1080pLabel => '1080p';

  @override
  String get res1080pDesc => 'Scale down to 1080p max (Standard HD quality).';

  @override
  String get res720pLabel => '720p';

  @override
  String get res720pDesc => 'Scale down to 720p max (Good for mobile viewing).';

  @override
  String get res480pLabel => '480p';

  @override
  String get res480pDesc =>
      'Scale down to 480p max (DVD quality, very small size).';

  @override
  String get res360pLabel => '360p';

  @override
  String get res360pDesc =>
      'Scale down to 360p max (Extreme compression, low quality).';

  @override
  String get frameRateTitle => 'Frame Rate (FPS)';

  @override
  String get fpsOriginalLabel => 'Original';

  @override
  String get fpsOriginalDesc =>
      'Keeps the exact same framerate as the source video.';

  @override
  String get fps60Label => '60 fps';

  @override
  String get fps60Desc =>
      'Ultra smooth, ideal for gaming or sports (creates larger files).';

  @override
  String get fps30Label => '30 fps';

  @override
  String get fps30Desc => 'Standard smoothness, great balance for most videos.';

  @override
  String get fps24Label => '24 fps';

  @override
  String get fps24Desc => 'Cinematic look, useful for movies and saving space.';

  @override
  String get enableVideoDenoiseTitle => 'Clean Video Noise & Grain';

  @override
  String get enableVideoDenoiseDesc =>
      'Applies 3D spatial-temporal filtering to remove low-light digital grain and boost compression by 15-25%.';

  @override
  String get exportFormatTitle => 'Export Format';

  @override
  String get exportVideoLabel => 'Standard Video';

  @override
  String get exportVideoDesc => 'Export to MP4/MKV/MOV container';

  @override
  String get exportGifLabel => 'Animated GIF';

  @override
  String get exportGifDesc => 'Export high-quality animated GIF clip';

  @override
  String get exportMp3Label => 'Extract MP3';

  @override
  String get exportMp3Desc => 'Extract audio track as 320kbps MP3';

  @override
  String get exportAacLabel => 'Extract AAC';

  @override
  String get exportAacDesc => 'Extract audio track as high-quality AAC';

  @override
  String get exportWavLabel => 'Extract WAV';

  @override
  String get exportWavDesc => 'Extract uncompressed studio WAV audio';

  @override
  String get privacyScrubbingTitle => 'Privacy & GPS Scrubbing';

  @override
  String get keepMetadataLabel => 'Keep Metadata';

  @override
  String get stripGpsExifLabel => 'Strip GPS/EXIF';

  @override
  String get stripGpsExifInfoTitle => 'Strip GPS & Metadata';

  @override
  String get stripGpsExifInfoDesc =>
      'Removes camera info, GPS location, & timestamps.';

  @override
  String get keepMetadataInfoDesc => 'Preserves original video EXIF metadata.';

  @override
  String get autoCropBlackBarsTitle => 'Auto-Crop Black Bars';

  @override
  String get autoCropLabel => 'Auto-Crop';

  @override
  String get autoCropActiveTitle => 'Auto-Crop Active';

  @override
  String get autoCropActiveDesc =>
      'Removes black letterbox borders from video.';

  @override
  String get autoCropDisabledDesc => 'Keeps original video frame borders.';

  @override
  String get playbackSpeedTitle => 'Playback Speed';

  @override
  String get speedOriginalLabel => '1.0x';

  @override
  String get speedOriginalDesc => 'Normal video speed';

  @override
  String get speedSlow05Label => '0.5x Slow-mo';

  @override
  String get speedSlow05Desc => 'Half speed playback';

  @override
  String get speedFast15Label => '1.5x Speed';

  @override
  String get speedFast15Desc => 'Slight speed up';

  @override
  String get speedFast20Label => '2.0x Fast';

  @override
  String get speedFast20Desc => 'Double speed playback';

  @override
  String get speedTimelapse40Label => '4.0x Timelapse';

  @override
  String get speedTimelapse40Desc => 'Ultra fast timelapse';

  @override
  String get canvasAspectRatioTitle => 'Canvas Aspect Ratio';

  @override
  String get aspectOriginalLabel => 'Original';

  @override
  String get aspectOriginalDesc => 'Keep original video dimensions';

  @override
  String get aspectShortsLabel => '9:16 Shorts';

  @override
  String get aspectShortsDesc => 'Padded canvas for TikTok & Reels';

  @override
  String get aspectSquareLabel => '1:1 Square';

  @override
  String get aspectSquareDesc => 'Padded canvas for Instagram feed posts';

  @override
  String get aspectPortraitLabel => '4:5 Portrait';

  @override
  String get aspectPortraitDesc => 'Padded canvas for Instagram vertical posts';

  @override
  String get aspectWidescreenLabel => '16:9 Wide';

  @override
  String get aspectWidescreenDesc => 'Padded canvas for YouTube & TV screens';

  @override
  String get aspectClassicLabel => '4:3 Classic';

  @override
  String get aspectClassicDesc => 'Padded canvas for classic TV screens';

  @override
  String get aspectCinemaLabel => '21:9 Cinema';

  @override
  String get aspectCinemaDesc => 'Padded canvas for Ultrawide cinema monitors';

  @override
  String get aspectCustomLabel => 'Custom Ratio';

  @override
  String get aspectCustomDesc => 'Padded canvas for custom aspect ratio';

  @override
  String get customRatioTooltip => 'Type custom ratio e.g. 16:10, 2:1, 18:9';

  @override
  String get rotationFlipTitle => 'Rotation & Flip';

  @override
  String get rotOriginalLabel => 'Original (0°)';

  @override
  String get rotOriginalDesc => 'Keep original orientation';

  @override
  String get rot90Label => '90° CW';

  @override
  String get rot90Desc => 'Rotate 90 degrees right';

  @override
  String get rot180Label => '180° Flip';

  @override
  String get rot180Desc => 'Rotate upside down';

  @override
  String get rot270Label => '270° CW';

  @override
  String get rot270Desc => 'Rotate 90 degrees left';

  @override
  String get rotFlipHLabel => 'Flip H';

  @override
  String get rotFlipHDesc => 'Mirror image horizontally';

  @override
  String get rotFlipVLabel => 'Flip V';

  @override
  String get rotFlipVDesc => 'Mirror image vertically';

  @override
  String get rotCustomLabel => 'Custom Angle';

  @override
  String get rotCustomDesc => 'Rotate by custom degree angle';

  @override
  String get customRotationTooltip => 'Type degree angle e.g. 45, 30, 120';

  @override
  String get trimVideoTitle => 'Trim Video';

  @override
  String get fullVideoLabel => 'Full Video';

  @override
  String get cutClipLabel => 'Cut Clip';

  @override
  String get trimStartLabel => 'Start';

  @override
  String get trimEndLabel => 'End';

  @override
  String get trimActiveTitle => 'Trim Active';

  @override
  String get fullVideoDesc =>
      'Processes the entire video duration without trimming.';

  @override
  String get audioModeTitle => 'Audio Track Mode';

  @override
  String get audioOriginalLabel => 'Original';

  @override
  String get audioOriginalDesc =>
      'Preserves original audio track (No quality loss).';

  @override
  String get audioAac256Label => 'High Quality';

  @override
  String get audioAac256Desc =>
      'Compresses to AAC 256kbps (Excellent quality, moderate size).';

  @override
  String get audioAac128Label => 'Balanced';

  @override
  String get audioAac128Desc =>
      'Compresses to AAC 128kbps (Good quality, small size - Web Standard).';

  @override
  String get audioAac64Label => 'Low Quality';

  @override
  String get audioAac64Desc =>
      'Compresses to AAC 64kbps (Best for speech/podcasts, tiny size).';

  @override
  String get audioMuteLabel => 'Mute Audio';

  @override
  String get audioMuteDesc =>
      'Removes the audio track completely to save space.';

  @override
  String get audioNormTitle => 'Audio Volume Normalization';

  @override
  String get audioNormOffLabel => 'Off';

  @override
  String get audioNormOffDesc => 'Keep original dynamic volume.';

  @override
  String get audioNormSpeechLabel => 'Speech';

  @override
  String get audioNormSpeechDesc =>
      'EBU R128 (-16 LUFS) broadcast loudness for clear dialogue.';

  @override
  String get audioNormDynamicLabel => 'Movie Dynamic';

  @override
  String get audioNormDynamicDesc =>
      'Dynaudnorm smooths quiet & loud scenes smoothly.';

  @override
  String get audioNormBoostLabel => 'Soft Boost';

  @override
  String get audioNormBoostDesc =>
      'Fixed +3dB volume gain boost for low-audio videos.';

  @override
  String get audioChanTitle => 'Audio Channels Downmix';

  @override
  String get audioChanOriginalLabel => 'Original';

  @override
  String get audioChanOriginalDesc =>
      'Preserve exact source audio channels (Mono, Stereo, 5.1, etc.).';

  @override
  String get audioChanStereoLabel => 'Stereo (2.0)';

  @override
  String get audioChanStereoDesc =>
      'Standard 2-channel compatibility for all screens.';

  @override
  String get audioChanMonoLabel => 'Mono (1.0)';

  @override
  String get audioChanMonoDesc =>
      'Single channel downmix - 50% extra audio size savings.';

  @override
  String get removeNoiseLabel => 'Remove Noise';

  @override
  String get enableAudioDenoiseTitle => 'Remove Mic & Fan Noise';

  @override
  String get enableAudioDenoiseDesc =>
      'Applies FFT spectral filtering to eliminate background mic hiss, fan noise, and room hum.';

  @override
  String get outputDirectoryTitle => 'Output Directory';

  @override
  String get defaultOutputDirectory => 'Default (Next to original file)';

  @override
  String get selectOutputFolderTitle => 'Select Output Folder';

  @override
  String get clearOutputFolder => 'Clear custom folder (Use default)';

  @override
  String get changeBtn => 'Change';

  @override
  String get outputLocationTitle => 'Output Location Behavior';

  @override
  String get outputLocationUnifiedLabel => 'Unified Folder';

  @override
  String get outputLocationUnifiedDesc =>
      'All compressed videos are saved into a single folder.';

  @override
  String get outputLocationSameLabel => 'Same as Original';

  @override
  String get outputLocationSameDesc =>
      'Each video is saved in a subfolder next to its original location.';

  @override
  String get fileManagementTitle => 'File Management';

  @override
  String get keepOriginalsLabel => 'Keep Originals';

  @override
  String get keepOriginalsDesc =>
      'Keeps the original videos untouched after compression.';

  @override
  String get toRecycleBinLabel => 'To Recycle Bin';

  @override
  String get toRecycleBinDesc =>
      'Moves originals to the Recycle Bin after successful compression.';

  @override
  String get outputFormatTitle => 'Output Format (Container)';

  @override
  String get formatOriginalLabel => 'Original';

  @override
  String get formatOriginalDesc =>
      'Keep original format (Fastest, no container changes).';

  @override
  String get formatMp4Label => 'MP4';

  @override
  String get formatMp4Desc =>
      'Maximum compatibility across all devices and web browsers.';

  @override
  String get formatMkvLabel => 'MKV';

  @override
  String get formatMkvDesc =>
      'Resilient format, great for multiple audio/subtitle tracks.';

  @override
  String get formatMovLabel => 'MOV';

  @override
  String get formatMovDesc =>
      'High quality Apple QuickTime format, great for editing.';

  @override
  String get scanningFilesMsg => 'Scanning files... This may take a moment.';

  @override
  String get addFilesBtn => 'Add Files';

  @override
  String get addFolderBtn => 'Add Folder';

  @override
  String get dragDropMoreMsg => 'Or drag & drop more videos anywhere';

  @override
  String get openOutputFolderTooltip => 'Open Output Folder';

  @override
  String get statusQueued => 'Queued';

  @override
  String get statusAnalyzing => 'Analyzing';

  @override
  String get statusCompressing => 'Compressing';

  @override
  String get statusDone => 'Done';

  @override
  String get statusFailed => 'Failed';

  @override
  String get statusCancelled => 'Cancelled';

  @override
  String get savedPrefix => 'Saved';

  @override
  String get largerSuffix => 'Larger';

  @override
  String get largerSizeWarning =>
      'Output size might be larger than original. Consider cancelling and resetting settings to default.';

  @override
  String get clearCompletedBtn => 'Clear Completed';

  @override
  String get clearAllBtn => 'Clear All';

  @override
  String get stopAllBtn => 'Stop All';

  @override
  String get startCompressionBtn => 'Start Compression';

  @override
  String get allDoneLabel => 'All Done!';

  @override
  String get openFolderBtn => 'Open Folder';

  @override
  String get totalEtaLabel => 'Total ETA';

  @override
  String get totalSavedLabel => 'Total Saved';

  @override
  String get videoSingle => 'video';

  @override
  String get videosPlural => 'videos';

  @override
  String get releaseToAddVideosMsg => 'Release to add videos';

  @override
  String get dragDropHereMsg => 'Drag & drop video files or folders here';

  @override
  String get supportedFormatsMsg =>
      'Seamlessly supports MP4, MKV, MOV, AVI, WMV';

  @override
  String get selectFilesBtn => 'Select Files';

  @override
  String get selectFolderBtn => 'Select Folder';

  @override
  String get releaseToShrinkTitle => 'Release to Shrink';

  @override
  String get filesWillBeAddedDesc => 'Your files will be added to the queue.';

  @override
  String get disabledLabel => 'Disabled';

  @override
  String get compressionInProgressTitle => 'Compression in Progress';

  @override
  String get confirmCloseDesc =>
      'Are you sure you want to close Shrinkeo?\nThis will cancel all current compressions and you might lose your progress.';

  @override
  String get keepCompressingBtn => 'Keep Compressing';

  @override
  String get closeAppBtn => 'Close App';

  @override
  String get lockedSettingsWarning => 'Locked during compression';

  @override
  String get updateRequiredTitle => 'Update Required';

  @override
  String get updateRequiredDescNewVersion =>
      'A new version of Shrinkeo is available with important improvements. Please update to continue.';

  @override
  String get updateRequiredDescOldVersion =>
      'Your version is no longer supported. Please update to continue using the app.';

  @override
  String get updateNowBtn => 'Update Now';

  @override
  String get laterBtn => 'Later';

  @override
  String get updateAvailableTitle => 'Update Available';

  @override
  String get whatsNewTitle => 'What\'s New:';

  @override
  String get exitAppBtn => 'Exit App';

  @override
  String get retryBtn => 'Retry';

  @override
  String get downloadFromWebsiteBtn => 'Download from Website';

  @override
  String get skipUpdateConfirmTitle => 'Skip Critical Update?';

  @override
  String get skipUpdateConfirmDesc =>
      'This update contains critical bug fixes and improvements. We highly recommend updating now to ensure the app functions correctly.\n\nAre you sure you want to skip it for now?';

  @override
  String get skipUpdateCancelBtn => 'Cancel';

  @override
  String get skipUpdateConfirmBtn => 'I understand, Skip it';

  @override
  String get maintenanceTitle => 'System Maintenance';

  @override
  String get maintenanceDescDefault =>
      'Shrinkeo is currently undergoing maintenance. Please try again later.';

  @override
  String versionAvailableMsg(String version) {
    return 'Version $version is now available.';
  }

  @override
  String get hwEncoderNotSupportedTitle => 'Hardware Encoder Not Supported';

  @override
  String get failedCreateFolderError => 'Failed to create output folder';

  @override
  String get failedProbeDurationError => 'Failed to probe duration';

  @override
  String get ffmpegNotFoundGlobalError =>
      'FFmpeg was not found. Please ensure FFmpeg is bundled in the data directory.';

  @override
  String get ffmpegMissingError =>
      'FFmpeg or FFprobe is missing or corrupted.\n\nPlease reinstall Shrinkeo or manually fix the installation using:\nwinget install Gyan.FFmpeg';

  @override
  String hwFallbackNotificationBody(String encoderLabel) {
    return '$encoderLabel failed. Automatically switched to Software (CPU) encoding.';
  }

  @override
  String get failedDownloadUpdateMsg =>
      'Failed to download update. Please try again.';

  @override
  String customRatioActiveTitle(Object ratio) {
    return 'Custom Ratio ($ratio)';
  }

  @override
  String customRatioActiveDesc(Object ratio) {
    return 'Padded canvas for custom $ratio ratio.';
  }

  @override
  String customAngleActiveTitle(Object angle) {
    return 'Custom Angle ($angle°)';
  }

  @override
  String customAngleActiveDesc(Object angle) {
    return 'Rotates video by custom $angle° degree angle.';
  }

  @override
  String trimActiveDesc(Object end, Object start) {
    return 'Cuts video clip between $start and $end.';
  }

  @override
  String targetSizeLimitLabel(Object size) {
    return '$size MB Limit';
  }

  @override
  String get customMbSizeTooltip => 'Type custom MB size';

  @override
  String get trimTimeTooltip =>
      'Enter time e.g. 5 (5s), 1:30 (1m30s), or 00:01:30';

  @override
  String get tabImageSuite => 'Image Suite';

  @override
  String get compressionModeTitle => 'Compression Mode';

  @override
  String get smartAutoLabel => 'Smart Auto';

  @override
  String get smartAutoDesc =>
      'Automatically reduces file size by ~60-80% with 100% pristine visual clarity. Perfect for everyday photo optimization.';

  @override
  String get maxSavingsLabel => 'Max Savings';

  @override
  String get maxSavingsDesc =>
      'Aggressive compression saving up to 85-90% file size. Best for fast messaging, web uploads, and email attachments.';

  @override
  String get ultraFidelityLabel => 'Ultra Fidelity';

  @override
  String get ultraFidelityDesc =>
      'Preserves raw visual fidelity with minimal compression. Ideal for photography archives and high-res print work.';

  @override
  String get targetImageFormatTitle => 'Target Image Format';

  @override
  String get dimensionResizingTitle => 'Dimension Resizing';

  @override
  String get exifCameraPrivacyTitle => 'EXIF / Camera Privacy';

  @override
  String get stripGpsCameraInfoLabel => 'Strip GPS & Camera Info';

  @override
  String get intentCompressOnly => 'Compress Only';

  @override
  String get intentCompressOnlyTooltip =>
      'Focus purely on reducing file size (Quality % or Target KB/MB)';

  @override
  String get intentEditConvertOnly => 'Edit / Convert Only';

  @override
  String get intentEditConvertOnlyTooltip =>
      'Resize, rotate, trim, or convert format without reducing visual quality';

  @override
  String get intentCompressAndEdit => 'Compress & Edit';

  @override
  String get intentCompressAndEditTooltip =>
      'Full control: Edit, resize, rotate AND compress file size together';
}
