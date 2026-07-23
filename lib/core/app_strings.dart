class AppStrings {
  // ===========================================================================
  // 1. APP BRANDING & TITLE BAR
  // ===========================================================================
  static const String appName = 'Shrinkeo';
  static const String totalSpaceSaved = 'Total Space Saved Globally';
  static const String savedSpacePrefix = 'Saved:';
  static const String supportButtonText = 'Buy me a coffee';

  // Title Bar Tooltips
  static const String lightThemeTooltip = 'Light Theme';
  static const String darkThemeTooltip = 'Dark Theme';
  static const String settingsTooltip = 'Settings';
  static const String minimizeTooltip = 'Minimize';
  static const String closeTooltip = 'Close';
  static const String restoreTooltip = 'Restore';
  static const String maximizeTooltip = 'Maximize';

  // ===========================================================================
  // 2. MAIN NAVIGATION TABS
  // ===========================================================================
  static const String tabCompressionQuality = 'Compression & Quality';
  static const String tabVideoEditingTools = 'Video Editing & Tools';
  static const String tabAudioSettings = 'Audio Settings';
  static const String tabEngineOutput = 'Engine & Output';

  // ===========================================================================
  // 3. TAB 1: COMPRESSION & QUALITY SETTINGS
  // ===========================================================================
  static const String compressionSettingsTitle = 'Compression Settings';
  static const String resetToDefaults = 'Reset to Defaults';
  static const String resetDefaultTooltip = 'Reset to default';

  // Compression Mode & Target Size
  static const String modeTargetSizeTitle = 'Compression Target Mode';
  static const String modeCrfLabel = 'Quality (CRF)';
  static const String modeTargetSizeLabel = 'Target Size (MB)';
  static const String crfQualityTitle = 'CRF Quality (Constant Rate Factor)';
  static const String targetSizeLabel = 'Target File Size (MB)';
  static const String targetSizeDesc =
      'Calculates bitrate to fit within size limit (Min: 1 MB). Extremely low limits on long videos will lower visual resolution.';

  // Encoding Speed Presets
  static const String encodingSpeedTitle = 'Encoding Speed';
  static const String presetUltrafastLabel = 'Ultrafast';
  static const String presetUltrafastDesc = 'Max speed, but achieves the least file size reduction.';
  static const String presetSuperfastLabel = 'Superfast';
  static const String presetSuperfastDesc = 'Very quick encoding with lower compression efficiency.';
  static const String presetVeryfastLabel = 'Very Fast';
  static const String presetVeryfastDesc = 'Faster than average, providing moderate size reduction.';
  static const String presetFasterLabel = 'Faster';
  static const String presetFasterDesc = 'A slight speed boost with good overall compression.';
  static const String presetFastLabel = 'Fast';
  static const String presetFastDesc = 'Great balance of speed and size reduction. Recommended.';
  static const String presetMediumLabel = 'Medium';
  static const String presetMediumDesc = 'Default balance of encoding speed and compression.';
  static const String presetSlowLabel = 'Slow';
  static const String presetSlowDesc = 'Slower process, but yields significantly smaller files.';
  static const String presetVeryslowLabel = 'Very Slow';
  static const String presetVeryslowDesc = 'Takes longest, but guarantees maximum file size reduction.';

  // Video Codecs
  static const String videoCodecTitle = 'Video Codec';
  static const String codecH264Label = 'H.264';
  static const String codecH264Desc = 'Maximum compatibility with older devices & browsers.';
  static const String codecH265Label = 'H.265 / HEVC';
  static const String codecH265Desc = 'Better compression efficiency (smaller files).';
  static const String codecAv1Label = 'AV1';
  static const String codecAv1Desc = 'Next-gen codec: Maximum compression efficiency (30% smaller than H.265).';

  // Hardware Acceleration (GPU)
  static const String hardwareEncoderTitle = 'Hardware Encoder (GPU)';
  static const String hwSoftwareLabel = 'Software (CPU)';
  static const String hwSoftwareDesc = 'Slowest, but maximum compatibility & smallest files.';
  static const String hwNvidiaLabel = 'Nvidia (NVENC)';
  static const String hwNvidiaDesc = 'Extremely fast encoding for Nvidia GPUs (slightly larger files).';
  static const String hwAmdLabel = 'AMD (AMF)';
  static const String hwAmdDesc = 'Extremely fast encoding for AMD GPUs (slightly larger files).';
  static const String hwIntelLabel = 'Intel (QSV)';
  static const String hwIntelDesc = 'Extremely fast encoding for Intel GPUs (slightly larger files).';

  // Resolution Downscaling
  static const String resolutionTitle = 'Max Resolution';
  static const String resOriginalLabel = 'Original';
  static const String resOriginalDesc = 'Keep the original video resolution.';
  static const String res4kLabel = '4K';
  static const String res4kDesc = 'Scale down to 4K max (Extremely high quality).';
  static const String res2kLabel = '2K';
  static const String res2kDesc = 'Scale down to 2K max (High quality).';
  static const String res1080pLabel = '1080p';
  static const String res1080pDesc = 'Scale down to 1080p max (Standard HD quality).';
  static const String res720pLabel = '720p';
  static const String res720pDesc = 'Scale down to 720p max (Good for mobile viewing).';
  static const String res480pLabel = '480p';
  static const String res480pDesc = 'Scale down to 480p max (DVD quality, very small size).';
  static const String res360pLabel = '360p';
  static const String res360pDesc = 'Scale down to 360p max (Extreme compression, low quality).';

  // Frame Rate (FPS)
  static const String frameRateTitle = 'Frame Rate (FPS)';
  static const String fpsOriginalLabel = 'Original';
  static const String fpsOriginalDesc = 'Keeps the exact same framerate as the source video.';
  static const String fps60Label = '60 fps';
  static const String fps60Desc = 'Ultra smooth, ideal for gaming or sports (creates larger files).';
  static const String fps30Label = '30 fps';
  static const String fps30Desc = 'Standard smoothness, great balance for most videos.';
  static const String fps24Label = '24 fps';
  static const String fps24Desc = 'Cinematic look, useful for movies and saving space.';

  // Video Grain & Noise Clean
  static const String enableVideoDenoiseTitle = 'Clean Video Noise & Grain';
  static const String enableVideoDenoiseDesc = 'Applies 3D spatial-temporal filtering to remove low-light digital grain and boost compression by 15-25%.';

  // ===========================================================================
  // 4. TAB 2: VIDEO EDITING & TOOLS
  // ===========================================================================
  // Export Format
  static const String exportFormatTitle = 'Export Format';
  static const String exportVideoLabel = 'Standard Video';
  static const String exportVideoDesc = 'Export to MP4/MKV/MOV container';
  static const String exportGifLabel = 'Animated GIF';
  static const String exportGifDesc = 'Export high-quality animated GIF clip';
  static const String exportMp3Label = 'Extract MP3';
  static const String exportMp3Desc = 'Extract audio track as 320kbps MP3';
  static const String exportAacLabel = 'Extract AAC';
  static const String exportAacDesc = 'Extract audio track as high-quality AAC';
  static const String exportWavLabel = 'Extract WAV';
  static const String exportWavDesc = 'Extract uncompressed studio WAV audio';

  // Privacy & GPS Scrubbing
  static const String privacyScrubbingTitle = 'Privacy & GPS Scrubbing';
  static const String keepMetadataLabel = 'Keep Metadata';
  static const String stripGpsExifLabel = 'Strip GPS/EXIF';
  static const String stripGpsExifInfoTitle = 'Strip GPS & Metadata';
  static const String stripGpsExifInfoDesc = 'Removes camera info, GPS location, & timestamps.';
  static const String keepMetadataInfoDesc = 'Preserves original video EXIF metadata.';

  // Auto-Crop Black Bars
  static const String autoCropBlackBarsTitle = 'Auto-Crop Black Bars';
  static const String autoCropLabel = 'Auto-Crop';
  static const String autoCropActiveTitle = 'Auto-Crop Active';
  static const String autoCropActiveDesc = 'Removes black letterbox borders from video.';
  static const String autoCropDisabledDesc = 'Keeps original video frame borders.';

  // Playback Speed
  static const String playbackSpeedTitle = 'Playback Speed';
  static const String speedOriginalLabel = '1.0x';
  static const String speedOriginalDesc = 'Normal video speed';
  static const String speedSlow05Label = '0.5x Slow-mo';
  static const String speedSlow05Desc = 'Half speed playback';
  static const String speedFast15Label = '1.5x Speed';
  static const String speedFast15Desc = 'Slight speed up';
  static const String speedFast20Label = '2.0x Fast';
  static const String speedFast20Desc = 'Double speed playback';
  static const String speedTimelapse40Label = '4.0x Timelapse';
  static const String speedTimelapse40Desc = 'Ultra fast timelapse';

  // Canvas Aspect Ratio
  static const String canvasAspectRatioTitle = 'Canvas Aspect Ratio';
  static const String aspectOriginalLabel = 'Original';
  static const String aspectOriginalDesc = 'Keep original video dimensions';
  static const String aspectShortsLabel = '9:16 Shorts';
  static const String aspectShortsDesc = 'Padded canvas for TikTok & Reels';
  static const String aspectSquareLabel = '1:1 Square';
  static const String aspectSquareDesc = 'Padded canvas for Instagram feed posts';
  static const String aspectPortraitLabel = '4:5 Portrait';
  static const String aspectPortraitDesc = 'Padded canvas for Instagram vertical posts';
  static const String aspectWidescreenLabel = '16:9 Wide';
  static const String aspectWidescreenDesc = 'Padded canvas for YouTube & TV screens';
  static const String aspectClassicLabel = '4:3 Classic';
  static const String aspectClassicDesc = 'Padded canvas for classic TV screens';
  static const String aspectCinemaLabel = '21:9 Cinema';
  static const String aspectCinemaDesc = 'Padded canvas for Ultrawide cinema monitors';
  static const String aspectCustomLabel = 'Custom Ratio';
  static const String aspectCustomDesc = 'Padded canvas for custom aspect ratio';
  static const String customRatioTooltip = 'Type custom ratio e.g. 16:10, 2:1, 18:9';

  // Rotation & Flip
  static const String rotationFlipTitle = 'Rotation & Flip';
  static const String rotOriginalLabel = 'Original (0°)';
  static const String rotOriginalDesc = 'Keep original orientation';
  static const String rot90Label = '90° CW';
  static const String rot90Desc = 'Rotate 90 degrees right';
  static const String rot180Label = '180° Flip';
  static const String rot180Desc = 'Rotate upside down';
  static const String rot270Label = '270° CW';
  static const String rot270Desc = 'Rotate 90 degrees left';
  static const String rotFlipHLabel = 'Flip H';
  static const String rotFlipHDesc = 'Mirror image horizontally';
  static const String rotFlipVLabel = 'Flip V';
  static const String rotFlipVDesc = 'Mirror image vertically';
  static const String rotCustomLabel = 'Custom Angle';
  static const String rotCustomDesc = 'Rotate by custom degree angle';
  static const String customRotationTooltip = 'Type degree angle e.g. 45, 30, 120';

  // Trim Video
  static const String trimVideoTitle = 'Trim Video';
  static const String fullVideoLabel = 'Full Video';
  static const String cutClipLabel = 'Cut Clip';
  static const String trimStartLabel = 'Start';
  static const String trimEndLabel = 'End';
  static const String trimActiveTitle = 'Trim Active';
  static const String fullVideoDesc = 'Processes the entire video duration without trimming.';

  // ===========================================================================
  // 5. TAB 3: AUDIO SETTINGS
  // ===========================================================================
  // Audio Track Mode
  static const String audioModeTitle = 'Audio Track Mode';
  static const String audioOriginalLabel = 'Original';
  static const String audioOriginalDesc = 'Preserves original audio track (No quality loss).';
  static const String audioAac256Label = 'High Quality';
  static const String audioAac256Desc = 'Compresses to AAC 256kbps (Excellent quality, moderate size).';
  static const String audioAac128Label = 'Balanced';
  static const String audioAac128Desc = 'Compresses to AAC 128kbps (Good quality, small size - Web Standard).';
  static const String audioAac64Label = 'Low Quality';
  static const String audioAac64Desc = 'Compresses to AAC 64kbps (Best for speech/podcasts, tiny size).';
  static const String audioMuteLabel = 'Mute Audio';
  static const String audioMuteDesc = 'Removes the audio track completely to save space.';

  // Audio Normalization
  static const String audioNormTitle = 'Audio Volume Normalization';
  static const String audioNormOffLabel = 'Off';
  static const String audioNormOffDesc = 'Keep original dynamic volume.';
  static const String audioNormSpeechLabel = 'Speech';
  static const String audioNormSpeechDesc = 'EBU R128 (-16 LUFS) broadcast loudness for clear dialogue.';
  static const String audioNormDynamicLabel = 'Movie Dynamic';
  static const String audioNormDynamicDesc = 'Dynaudnorm smooths quiet & loud scenes smoothly.';
  static const String audioNormBoostLabel = 'Soft Boost';
  static const String audioNormBoostDesc = 'Fixed +3dB volume gain boost for low-audio videos.';

  // Audio Channels
  static const String audioChanTitle = 'Audio Channels Downmix';
  static const String audioChanOriginalLabel = 'Original';
  static const String audioChanOriginalDesc = 'Preserve exact source audio channels (Mono, Stereo, 5.1, etc.).';
  static const String audioChanStereoLabel = 'Stereo (2.0)';
  static const String audioChanStereoDesc = 'Standard 2-channel compatibility for all screens.';
  static const String audioChanMonoLabel = 'Mono (1.0)';
  static const String audioChanMonoDesc = 'Single channel downmix - 50% extra audio size savings.';

  // Audio Noise Removal
  static const String removeNoiseLabel = 'Remove Noise';
  static const String enableAudioDenoiseTitle = 'Remove Mic & Fan Noise';
  static const String enableAudioDenoiseDesc = 'Applies FFT spectral filtering to eliminate background mic hiss, fan noise, and room hum.';

  // ===========================================================================
  // 6. TAB 4: ENGINE & OUTPUT SETTINGS
  // ===========================================================================
  // Output Directory
  static const String outputDirectoryTitle = 'Output Directory';
  static const String defaultOutputDirectory = 'Default (Next to original file)';
  static const String selectOutputFolderTitle = 'Select Output Folder';
  static const String clearOutputFolder = 'Clear custom folder (Use default)';
  static const String changeBtn = 'Change';

  // Output Location Behavior
  static const String outputLocationTitle = 'Output Location Behavior';
  static const String outputLocationUnifiedLabel = 'Unified Folder';
  static const String outputLocationUnifiedDesc = 'All compressed videos are saved into a single folder.';
  static const String outputLocationSameLabel = 'Same as Original';
  static const String outputLocationSameDesc = 'Each video is saved in a subfolder next to its original location.';

  // File Management
  static const String fileManagementTitle = 'File Management';
  static const String keepOriginalsLabel = 'Keep Originals';
  static const String keepOriginalsDesc = 'Keeps the original videos untouched after compression.';
  static const String toRecycleBinLabel = 'To Recycle Bin';
  static const String toRecycleBinDesc = 'Moves originals to the Recycle Bin after successful compression.';

  // Output Container Options
  static const String outputFormatTitle = 'Output Format (Container)';
  static const String formatOriginalLabel = 'Original';
  static const String formatOriginalDesc = 'Keep original format (Fastest, no container changes).';
  static const String formatMp4Label = 'MP4';
  static const String formatMp4Desc = 'Maximum compatibility across all devices and web browsers.';
  static const String formatMkvLabel = 'MKV';
  static const String formatMkvDesc = 'Resilient format, great for multiple audio/subtitle tracks.';
  static const String formatMovLabel = 'MOV';
  static const String formatMovDesc = 'High quality Apple QuickTime format, great for editing.';

  // ===========================================================================
  // 7. VIDEO QUEUE, CARDS & STATUS CHIPS
  // ===========================================================================
  static const String scanningFilesMsg = 'Scanning files... This may take a moment.';
  static const String addFilesBtn = 'Add Files';
  static const String addFolderBtn = 'Add Folder';
  static const String dragDropMoreMsg = 'Or drag & drop more videos anywhere';
  static const String openOutputFolderTooltip = 'Open Output Folder';

  // Processing Statuses
  static const String statusQueued = 'Queued';
  static const String statusAnalyzing = 'Analyzing';
  static const String statusCompressing = 'Compressing';
  static const String statusDone = 'Done';
  static const String statusFailed = 'Failed';
  static const String statusCancelled = 'Cancelled';

  // File Card Results & Badges
  static const String savedPrefix = 'Saved';
  static const String largerSuffix = 'Larger';
  static const String largerSizeWarning =
      'Output size might be larger than original. Consider cancelling and resetting settings to default.';

  // ===========================================================================
  // 8. BOTTOM ACTION BAR & QUEUE SUMMARY
  // ===========================================================================
  static const String clearCompletedBtn = 'Clear Completed';
  static const String clearAllBtn = 'Clear All';
  static const String stopAllBtn = 'Stop All';
  static const String startCompressionBtn = 'Start Compression';
  static const String allDoneLabel = 'All Done!';
  static const String openFolderBtn = 'Open Folder';
  static const String totalEtaLabel = 'Total ETA';
  static const String totalSavedLabel = 'Total Saved';
  static const String videoSingle = 'video';
  static const String videosPlural = 'videos';

  // ===========================================================================
  // 9. DROP ZONE & FULLSCREEN OVERLAY
  // ===========================================================================
  static const String releaseToAddVideosMsg = 'Release to add videos';
  static const String dragDropHereMsg = 'Drag & drop video files or folders here';
  static const String supportedFormatsMsg = 'Seamlessly supports MP4, MKV, MOV, AVI, WMV';
  static const String selectFilesBtn = 'Select Files';
  static const String selectFolderBtn = 'Select Folder';
  static const String releaseToShrinkTitle = 'Release to Shrink';
  static const String filesWillBeAddedDesc = 'Your files will be added to the queue.';
  static const String disabledLabel = 'Disabled';

  // ===========================================================================
  // 10. DIALOGS, UPDATES & MAINTENANCE
  // ===========================================================================
  // App Close Confirmation
  static const String compressionInProgressTitle = 'Compression in Progress';
  static const String confirmCloseDesc =
      'Are you sure you want to close Shrinkeo?\nThis will cancel all current compressions and you might lose your progress.';
  static const String keepCompressingBtn = 'Keep Compressing';
  static const String closeAppBtn = 'Close App';
  static const String lockedSettingsWarning = 'Locked during compression';

  // Software Updates & Remote Config
  static const String updateRequiredTitle = 'Update Required';
  static const String updateRequiredDescNewVersion =
      'A new version of Shrinkeo is available with important improvements. Please update to continue.';
  static const String updateRequiredDescOldVersion =
      'Your version is no longer supported. Please update to continue using the app.';
  static const String updateNowBtn = 'Update Now';
  static const String laterBtn = 'Later';
  static const String updateAvailableTitle = 'Update Available';
  static const String whatsNewTitle = "What's New:";
  static const String exitAppBtn = 'Exit App';
  static const String retryBtn = 'Retry';
  static const String downloadFromWebsiteBtn = 'Download from Website';
  static const String failedDownloadUpdateMsg = 'Failed to download update. Please try again.';

  static const String skipUpdateConfirmTitle = 'Skip Critical Update?';
  static const String skipUpdateConfirmDesc =
      'This update contains critical bug fixes and improvements. We highly recommend updating now to ensure the app functions correctly.\n\nAre you sure you want to skip it for now?';
  static const String skipUpdateCancelBtn = 'Cancel';
  static const String skipUpdateConfirmBtn = 'I understand, Skip it';

  static const String maintenanceTitle = 'System Maintenance';
  static const String maintenanceDescDefault =
      'Shrinkeo is currently undergoing maintenance. Please try again later.';

  static String versionAvailableMsg(String version) => 'Version $version is now available.';

  // ===========================================================================
  // 11. HARDWARE ENCODER & SYSTEM ERRORS
  // ===========================================================================
  static const String hwEncoderNotSupportedTitle = 'Hardware Encoder Not Supported';
  static const String failedCreateFolderError = 'Failed to create output folder';
  static const String failedProbeDurationError = 'Failed to probe duration';
  static const String ffmpegNotFoundGlobalError =
      'FFmpeg was not found. Please ensure FFmpeg is bundled in the data directory.';
  static const String ffmpegMissingError =
      'FFmpeg or FFprobe is missing or corrupted.\n\nPlease reinstall Shrinkeo or manually fix the installation using:\nwinget install Gyan.FFmpeg';

  static String hwFallbackNotificationBody(String encoderLabel) =>
      '$encoderLabel failed. Automatically switched to Software (CPU) encoding.';
}
