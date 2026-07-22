class AppStrings {
  // ---- App Info ----
  static const String appName = 'Shrinkeo';
  static const String totalSpaceSaved = 'Total Space Saved Globally';
  static const String savedSpacePrefix = 'Saved:';
  static const String resetToDefaults = 'Reset to Defaults';
  static const String supportButtonText = 'Buy me a coffee';

  // ---- Settings Titles ----
  static const String compressionSettingsTitle = 'Compression Settings';
  static const String crfQualityTitle = 'CRF Quality (Constant Rate Factor)';
  static const String encodingSpeedTitle = 'Encoding Speed';
  static const String videoCodecTitle = 'Video Codec';
  static const String hardwareEncoderTitle = 'Hardware Encoder (GPU)';
  static const String resolutionTitle = 'Max Resolution';
  static const String frameRateTitle = 'Frame Rate (FPS)';
  static const String audioModeTitle = 'Audio Track Mode';
  static const String outputFormatTitle = 'Output Format (Container)';
  static const String outputDirectoryTitle = 'Output Directory';
  static const String outputLocationTitle = 'Output Location Behavior';

  static const String defaultOutputDirectory = 'Default (Next to original file)';

  // ---- Error Messages ----
  static const String ffmpegNotFoundGlobalError =
      'FFmpeg was not found. Please ensure FFmpeg is bundled in the data directory.';
  static const String selectOutputFolderTitle = 'Select Output Folder';
  static const String clearOutputFolder = 'Clear custom folder (Use default)';
  static const String largerSizeWarning =
      'Output size might be larger than original. Consider cancelling and resetting settings to default.';

  // ---- Encoding Presets ----
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

  // ---- Video Codecs ----
  static const String codecH264Label = 'H.264';
  static const String codecH264Desc = 'Maximum compatibility with older devices & browsers.';
  static const String codecH265Label = 'H.265 / HEVC';
  static const String codecH265Desc = 'Better compression efficiency (smaller files).';
  static const String codecAv1Label = 'AV1';
  static const String codecAv1Desc = 'Next-gen codec: Maximum compression efficiency (30% smaller than H.265).';

  // ---- Hardware Encoders ----
  static const String hwSoftwareLabel = 'Software (CPU)';
  static const String hwSoftwareDesc = 'Slowest, but maximum compatibility & smallest files.';
  static const String hwNvidiaLabel = 'Nvidia (NVENC)';
  static const String hwNvidiaDesc = 'Extremely fast encoding for Nvidia GPUs (slightly larger files).';
  static const String hwAmdLabel = 'AMD (AMF)';
  static const String hwAmdDesc = 'Extremely fast encoding for AMD GPUs (slightly larger files).';
  static const String hwIntelLabel = 'Intel (QSV)';
  static const String hwIntelDesc = 'Extremely fast encoding for Intel GPUs (slightly larger files).';

  // ---- Audio Modes ----
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

  // ---- Resolutions ----
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

  // ---- Frame Rates ----
  static const String fpsOriginalLabel = 'Original';
  static const String fpsOriginalDesc = 'Keeps the exact same framerate as the source video.';
  static const String fps60Label = '60 fps';
  static const String fps60Desc = 'Ultra smooth, ideal for gaming or sports (creates larger files).';
  static const String fps30Label = '30 fps';
  static const String fps30Desc = 'Standard smoothness, great balance for most videos.';
  static const String fps24Label = '24 fps';
  static const String fps24Desc = 'Cinematic look, useful for movies and saving space.';

  // ---- Output Formats ----
  static const String formatOriginalLabel = 'Original';
  static const String formatOriginalDesc = 'Keep original format (Fastest, no container changes).';
  static const String formatMp4Label = 'MP4';
  static const String formatMp4Desc = 'Maximum compatibility across all devices and web browsers.';
  static const String formatMkvLabel = 'MKV';
  static const String formatMkvDesc = 'Resilient format, great for multiple audio/subtitle tracks.';
  static const String formatMovLabel = 'MOV';
  static const String formatMovDesc = 'High quality Apple QuickTime format, great for editing.';

  // ---- Output Locations ----
  static const String outputLocationUnifiedLabel = 'Unified Folder';
  static const String outputLocationUnifiedDesc = 'All compressed videos are saved into a single folder.';
  static const String outputLocationSameLabel = 'Same as Original';
  static const String outputLocationSameDesc = 'Each video is saved in a subfolder next to its original location.';

  // ---- Remote Config / Block Screen ----
  static const String updateRequiredTitle = 'Update Required';
  static const String updateRequiredDescNewVersion = 'A new version of Shrinkeo is available with important improvements. Please update to continue.';
  static const String updateRequiredDescOldVersion = 'Your version is no longer supported. Please update to continue using the app.';
  static const String updateNowBtn = 'Update Now';
  static const String laterBtn = 'Later';
  static const String skipUpdateConfirmTitle = 'Skip Critical Update?';
  static const String skipUpdateConfirmDesc = 'This update contains critical bug fixes and improvements. We highly recommend updating now to ensure the app functions correctly.\n\nAre you sure you want to skip it for now?';
  static const String skipUpdateCancelBtn = 'Cancel';
  static const String skipUpdateConfirmBtn = 'I understand, Skip it';

  static const String maintenanceTitle = 'System Maintenance';
  static const String maintenanceDescDefault = 'Shrinkeo is currently undergoing maintenance. Please try again later.';
}
