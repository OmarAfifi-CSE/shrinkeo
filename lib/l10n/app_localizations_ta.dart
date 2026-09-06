// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Tamil (`ta`).
class AppLocalizationsTa extends AppLocalizations {
  AppLocalizationsTa([String locale = 'ta']) : super(locale);

  @override
  String get appName => 'Shrinkeo';

  @override
  String get totalSpaceSaved => 'மொத்த சேமிக்கப்பட்ட இடம்';

  @override
  String get savedSpacePrefix => 'சேமிக்கப்பட்டது:';

  @override
  String get supportButtonText => 'திட்டத்தை ஆதரிக்கவும்';

  @override
  String get lightThemeTooltip => 'லைட் تھیம்';

  @override
  String get darkThemeTooltip => 'டார்க் تھیம்';

  @override
  String get settingsTooltip => 'அமைப்புகள்';

  @override
  String get minimizeTooltip => 'சிறிதாக்கு';

  @override
  String get closeTooltip => 'மூடு';

  @override
  String get restoreTooltip => 'மீட்டமை';

  @override
  String get maximizeTooltip => 'பெரிதாக்கு';

  @override
  String get tabCompressionQuality => 'அமுக்கம் & தரம்';

  @override
  String get tabVideoEditingTools => 'வீடியோ எடிட்டிங் & கருவிகள்';

  @override
  String get tabAudioSettings => 'ஆடியோ அமைப்புகள்';

  @override
  String get tabEngineOutput => 'இயந்திரம் & வெளியீட்டு கோப்பு';

  @override
  String get compressionSettingsTitle => 'அமுக்க அமைப்புகள்';

  @override
  String get resetToDefaults => 'இயல்புநிலைக்கு மீட்டமை';

  @override
  String get resetDefaultTooltip => 'ஆரம்ப மதிப்புகளுக்கு மீட்டமைக்கவும்';

  @override
  String get modeTargetSizeTitle => 'அமுக்க இலக்கு பயன்முறை';

  @override
  String get modeCrfLabel => 'தரம் (CRF)';

  @override
  String get modeTargetSizeLabel => 'இலக்கு அளவு (MB)';

  @override
  String get crfQualityTitle => 'CRF தரக் காரணி';

  @override
  String get crfLossless => 'இழப்பற்றது';

  @override
  String get crfHighQuality => 'உயர் தரம்';

  @override
  String get crfBalanced => 'சமச்சீர்';

  @override
  String get crfHighCompression => 'உயர் சுருக்கம்';

  @override
  String get crfLowQuality => 'குறைந்த தரம்';

  @override
  String get crfUltraCompressed => 'அல்ட்ரா சுருக்கப்பட்டது';

  @override
  String get targetSizeLabel => 'இலக்கு கோப்பு அளவு (MB)';

  @override
  String get targetSizeDesc =>
      'அளவு வரம்பிற்குள் அடங்க பிட்ரேட்டைக் கணக்கிடுகிறது.';

  @override
  String get encodingSpeedTitle => 'என்கோடிங் வேகம்';

  @override
  String get presetUltrafastLabel => 'அதிவேகம்';

  @override
  String get presetUltrafastDesc =>
      'அதிகபட்ச வேகம், ஆனால் மிகக் குறைந்த அளவு குறைப்பு.';

  @override
  String get presetSuperfastLabel => 'சூப்பர் ஃபாஸ்ட்';

  @override
  String get presetSuperfastDesc => 'மிகவும் வேகமான என்கோடிங்.';

  @override
  String get presetVeryfastLabel => 'மிகவும் வேகம்';

  @override
  String get presetVeryfastDesc => 'சராசரியை விட வேகம்.';

  @override
  String get presetFasterLabel => 'வேகமானது';

  @override
  String get presetFasterDesc => 'நல்ல வேகம் மற்றும் சிறந்த அமுக்கம்.';

  @override
  String get presetFastLabel => 'வேகம்';

  @override
  String get presetFastDesc => 'வேகம் மற்றும் அளவின் சிறந்த சமநிலை.';

  @override
  String get presetMediumLabel => 'நடுத்தர';

  @override
  String get presetMediumDesc => 'இயல்புநிலை சமநிலை.';

  @override
  String get presetSlowLabel => 'மெதுவான';

  @override
  String get presetSlowDesc =>
      'மெதுவானது ஆனால் சிறிய கோப்புகளை உருவாக்குகிறது.';

  @override
  String get presetVeryslowLabel => 'மிகவும் மெதுவான';

  @override
  String get presetVeryslowDesc => 'அதிகபட்ச அளவு குறைப்பு.';

  @override
  String get videoCodecTitle => 'வீடியோ கோடெக்';

  @override
  String get codecH264Label => 'H.264';

  @override
  String get codecH264Desc => 'அதிகபட்ச இணக்கத்தன்மை.';

  @override
  String get codecH265Label => 'H.265 / HEVC';

  @override
  String get codecH265Desc => 'சிறந்த அமுக்கத் திறன்.';

  @override
  String get codecAv1Label => 'AV1';

  @override
  String get codecAv1Desc => 'அடுத்த தலைமுறை கோடெக் (H.265 ஐ விட 30% சிறியது).';

  @override
  String get hardwareEncoderTitle => 'ஹார்டுவேர் முடுக்கம் (GPU)';

  @override
  String get hwSoftwareLabel => 'மென்பொருள் (CPU)';

  @override
  String get hwSoftwareDesc => 'மெதுவானது ஆனால் சிறந்த இணக்கத்தன்மை.';

  @override
  String get hwNvidiaLabel => 'Nvidia (NVENC)';

  @override
  String get hwNvidiaDesc => 'Nvidia GPU க்கான மிக வேகமான என்கோடிங்.';

  @override
  String get hwAmdLabel => 'AMD (AMF)';

  @override
  String get hwAmdDesc => 'AMD GPU க்கான மிக வேகமான என்கோடிங்.';

  @override
  String get hwIntelLabel => 'Intel (QSV)';

  @override
  String get hwIntelDesc => 'Intel GPU க்கான மிக வேகமான என்கோடிங்.';

  @override
  String get resolutionTitle => 'அதிகபட்ச தெளிவுத்திறன்';

  @override
  String get resOriginalLabel => 'அசல்';

  @override
  String get resOriginalDesc => 'அசல் தெளிவுத்திறனைத் தக்கவைக்கவும்.';

  @override
  String get res4kLabel => '4K';

  @override
  String get res4kDesc => 'அதிகபட்சம் 4K ஆகக் குறைக்கவும்.';

  @override
  String get res2kLabel => '2K';

  @override
  String get res2kDesc => 'அதிகபட்சம் 2K ஆகக் குறைக்கவும்.';

  @override
  String get res1080pLabel => '1080p';

  @override
  String get res1080pDesc => 'அதிகபட்சம் 1080p Full HD ஆகக் குறைக்கவும்.';

  @override
  String get res720pLabel => '720p';

  @override
  String get res720pDesc => 'அதிகபட்சம் 720p HD ஆகக் குறைக்கவும்.';

  @override
  String get res480pLabel => '480p';

  @override
  String get res480pDesc => '480p ஆகக் குறைக்கவும்.';

  @override
  String get res360pLabel => '360p';

  @override
  String get res360pDesc => 'அதிகபட்ச அமுக்கம்.';

  @override
  String get frameRateTitle => 'பிரேம் ரேட் (FPS)';

  @override
  String get fpsOriginalLabel => 'அசல்';

  @override
  String get fpsOriginalDesc => 'மூல வீடியோவின் அதே FPS.';

  @override
  String get fps60Label => '60 fps';

  @override
  String get fps60Desc => 'கேமிங் அல்லது விளையாட்டுகளுக்கு ஏற்றது.';

  @override
  String get fps30Label => '30 fps';

  @override
  String get fps30Desc => 'பெரும்பாலான வீடியோக்களுக்கான தரநிலை.';

  @override
  String get fps24Label => '24 fps';

  @override
  String get fps24Desc => 'சினிமா பாணி.';

  @override
  String get enableVideoDenoiseTitle => 'வீடியோ இரைச்சல் நீக்கம்';

  @override
  String get enableVideoDenoiseDesc => 'இரைச்சலைக் குறைக்க 3D ஃபில்டர்.';

  @override
  String get exportFormatTitle => 'ஏற்றுமதி வடிவம்';

  @override
  String get exportVideoLabel => 'தரநிலையான வீடியோ';

  @override
  String get exportVideoDesc => 'MP4/MKV/MOV ஆக ஏற்றுமதி செய்';

  @override
  String get exportGifLabel => 'அனிமேஷன் GIF';

  @override
  String get exportGifDesc => 'உயர் தரமான GIF ஐ உருவாக்கவும்';

  @override
  String get exportMp3Label => 'MP3 பிரித்தெடு';

  @override
  String get exportMp3Desc => 'ஆடியோவை 320kbps MP3 ஆகப் பிரித்தெடு';

  @override
  String get exportAacLabel => 'AAC பிரித்தெடு';

  @override
  String get exportAacDesc => 'ஆடியோவை AAC ஆகப் பிரித்தெடு';

  @override
  String get exportWavLabel => 'WAV பிரித்தெடு';

  @override
  String get exportWavDesc => 'அமுக்கப்படாத WAV ஆடியோவைப் பிரித்தெடு';

  @override
  String get privacyScrubbingTitle => 'தனியுரிமை & GPS';

  @override
  String get keepMetadataLabel => 'தரவை வைத்துக்கொள்';

  @override
  String get stripGpsExifLabel => 'GPS/EXIF நீக்கு';

  @override
  String get stripGpsExifInfoTitle => 'மெட்டாடேட்டாவை நீக்கு';

  @override
  String get stripGpsExifInfoDesc =>
      'கேமரா விவரங்கள் மற்றும் GPS இருப்பிடத்தை நீக்குகிறது.';

  @override
  String get keepMetadataInfoDesc =>
      'அனைத்து அசல் மெட்டாடேட்டாவையும் தக்கவைக்கிறது.';

  @override
  String get autoCropBlackBarsTitle => 'கருப்பு பார்களைத் தானாக செதுக்கு';

  @override
  String get autoCropLabel => 'ஆட்டோ கிராப்';

  @override
  String get autoCropActiveTitle => 'ஆட்டோ கிராப் இயங்குகிறது';

  @override
  String get autoCropActiveDesc => 'கருப்பு பார்களைத் தானாக நீக்குகிறது.';

  @override
  String get autoCropDisabledDesc => 'அசல் எல்லையைத் தக்கவைக்கிறது.';

  @override
  String get playbackSpeedTitle => 'இயக்க வேகம்';

  @override
  String get speedOriginalLabel => '1.0x';

  @override
  String get speedOriginalDesc => 'சாதாரண வேகம்';

  @override
  String get speedSlow05Label => '0.5x மெதுவாக';

  @override
  String get speedSlow05Desc => 'பாதி வேகத்தில் இயக்கவும்';

  @override
  String get speedFast15Label => '1.5x';

  @override
  String get speedFast15Desc => '1.5 மடங்கு వేగం';

  @override
  String get speedFast20Label => '2.0x வேகமாக';

  @override
  String get speedFast20Desc => 'இரட்டிப்பு வேகம்';

  @override
  String get speedTimelapse40Label => '4.0x டைம்லேப்ஸ்';

  @override
  String get speedTimelapse40Desc => 'டைம்லேப்ஸுக்கு 4x வேகம்';

  @override
  String get canvasAspectRatioTitle => 'விகிதம்';

  @override
  String get aspectOriginalLabel => 'அசல்';

  @override
  String get aspectOriginalDesc => 'அசல் விகிதத்தைத் தக்கவைக்கவும்';

  @override
  String get aspectShortsLabel => '9:16 Shorts';

  @override
  String get aspectShortsDesc => 'TikTok மற்றும் Reels க்காக';

  @override
  String get aspectSquareLabel => '1:1 சதுரம்';

  @override
  String get aspectSquareDesc => 'Instagram பதிவுகளுக்கு';

  @override
  String get aspectPortraitLabel => '4:5 போர்ட்ரெய்ட்';

  @override
  String get aspectPortraitDesc => 'செங்குத்து Instagram க்காக';

  @override
  String get aspectWidescreenLabel => '16:9 அகலத்திரை';

  @override
  String get aspectWidescreenDesc => 'YouTube மற்றும் டிவிக்கு';

  @override
  String get aspectClassicLabel => '4:3 கிளாசிக்';

  @override
  String get aspectClassicDesc => 'பழைய திரைகளுக்கு';

  @override
  String get aspectCinemaLabel => '21:9 சினிமா';

  @override
  String get aspectCinemaDesc => 'அல்ட்ராவைடு திரைகளுக்கு';

  @override
  String get aspectCustomLabel => 'விருப்ப விகிதம்';

  @override
  String get aspectCustomDesc => 'உங்கள் விருப்ப விகிதம்';

  @override
  String get customRatioTooltip => 'உதா: 16:10, 2:1';

  @override
  String get rotationFlipTitle => 'சுழற்சி & திருப்புதல்';

  @override
  String get rotOriginalLabel => 'அசல் (0°)';

  @override
  String get rotOriginalDesc => 'அசல் திசையைத் தக்கவைக்கவும்';

  @override
  String get rot90Label => '90° வலப்பக்கம்';

  @override
  String get rot90Desc => 'வலப்பக்கமாக 90 டிகிரி சுழற்று';

  @override
  String get rot180Label => '180° தலைகீழ்';

  @override
  String get rot180Desc => 'தலைகீழாகச் சுழற்று';

  @override
  String get rot270Label => '270° இடப்பக்கம்';

  @override
  String get rot270Desc => 'இடப்பக்கமாக 90 டிகிரி சுழற்று';

  @override
  String get rotFlipHLabel => 'கிடைமட்ட திருப்பு';

  @override
  String get rotFlipHDesc => 'கிடைமட்ட கண்ணாடியாக திருப்பு';

  @override
  String get rotFlipVLabel => 'செங்குத்து திருப்பு';

  @override
  String get rotFlipVDesc => 'செங்குத்து கண்ணாடியாக திருப்பு';

  @override
  String get rotCustomLabel => 'விருப்ப கோணம்';

  @override
  String get rotCustomDesc => 'குறிப்பிட்ட கோணத்தில் சுழற்று';

  @override
  String get customRotationTooltip => 'கோணம் டிகிரியில் உதா. 45';

  @override
  String get trimVideoTitle => 'வீடியோவை நறுக்கு';

  @override
  String get fullVideoLabel => 'முழு வீடியோ';

  @override
  String get cutClipLabel => 'கிளிப்பை நறுக்கு';

  @override
  String get trimStartLabel => 'தொடக்கம்';

  @override
  String get trimEndLabel => 'முடிவு';

  @override
  String get trimActiveTitle => 'நறுக்குதல் இயங்குகிறது';

  @override
  String get fullVideoDesc => 'நறுக்காமல் முழு வீடியோவையும் செயலாக்கு.';

  @override
  String get audioModeTitle => 'ஆடியோ டிராக் பயன்முறை';

  @override
  String get audioOriginalLabel => 'அசல்';

  @override
  String get audioOriginalDesc => 'ஆடியோ தரம் குறையாது.';

  @override
  String get audioAac256Label => 'உயர் தரம் (256k)';

  @override
  String get audioAac256Desc => 'AAC 256kbps';

  @override
  String get audioAac128Label => 'சீரானது (128k)';

  @override
  String get audioAac128Desc => 'AAC 128kbps (இணைய தரநிலை)';

  @override
  String get audioAac64Label => 'குறைந்த அளவு (64k)';

  @override
  String get audioAac64Desc => 'குரலுக்கு AAC 64kbps';

  @override
  String get audioMuteLabel => 'ஒலியை முடக்கு';

  @override
  String get audioMuteDesc => 'ஆடியோவை முற்றிலும் நீக்கு.';

  @override
  String get audioNormTitle => 'ஒலி அளவைச் சமமாக்கல்';

  @override
  String get audioNormOffLabel => 'ஆஃப்';

  @override
  String get audioNormOffDesc => 'அசல் ஒலி அளவு.';

  @override
  String get audioNormSpeechLabel => 'மனித குரல்';

  @override
  String get audioNormSpeechDesc => 'தெளிவான பேச்சுக்கு EBU R128.';

  @override
  String get audioNormDynamicLabel => 'சினிமா டைனமிக்';

  @override
  String get audioNormDynamicDesc =>
      'மெதுவான மற்றும் உரத்த ஒலிகளைச் சமமாக்குகிறது.';

  @override
  String get audioNormBoostLabel => 'லேசான உயர்வு';

  @override
  String get audioNormBoostDesc => '+3dB ஒலி உயர்வு.';

  @override
  String get audioChanTitle => 'ஆடியோ சேனல்கள்';

  @override
  String get audioChanOriginalLabel => 'அசல்';

  @override
  String get audioChanOriginalDesc => 'அசல் சேனல்களைத் தக்கவைக்கவும்.';

  @override
  String get audioChanStereoLabel => 'ஸ்டீரியோ (2.0)';

  @override
  String get audioChanStereoDesc => 'தரநிலையான 2-சேனல் ஸ்டீரியோ.';

  @override
  String get audioChanMonoLabel => 'மோனோ (1.0)';

  @override
  String get audioChanMonoDesc => 'ஒற்றை சேனல் - 50% ஆடியோ அளவு சேமிப்பு.';

  @override
  String get removeNoiseLabel => 'இரைச்சலை நீக்கு';

  @override
  String get enableAudioDenoiseTitle => 'மைக்கின் இரைச்சலை நீக்கு';

  @override
  String get enableAudioDenoiseDesc => 'பின்னணி இரைச்சலை நீக்க ஃபில்டர்.';

  @override
  String get outputDirectoryTitle => 'வெளியீட்டு கோப்புறை';

  @override
  String get defaultOutputDirectory => 'இயல்புநிலை (அசல் கோப்பின் அருகில்)';

  @override
  String get selectOutputFolderTitle => 'கோப்புறையைத் தேர்ந்தெடு';

  @override
  String get clearOutputFolder => 'இயல்புநிலை இடத்தைப் பயன்படுத்தவும்';

  @override
  String get changeBtn => 'மாற்று';

  @override
  String get outputLocationTitle => 'வெளியீட்டு நடத்தை';

  @override
  String get outputLocationUnifiedLabel => 'ஒற்றைக் கோப்புறை';

  @override
  String get outputLocationUnifiedDesc =>
      'அனைத்து அமுக்கப்பட்ட வீடியோக்களும் ஒரே கோப்புறையில்.';

  @override
  String get outputLocationSameLabel => 'அசல் கோப்பின் அருகில்';

  @override
  String get outputLocationSameDesc =>
      'ஒவ்வொரு வீடியோவும் அதன் மூலக் கோப்பின் அருகில்.';

  @override
  String get fileManagementTitle => 'கோப்பு மேலாண்மை';

  @override
  String get keepOriginalsLabel => 'அசலை வைத்துக்கொள்';

  @override
  String get keepOriginalsDesc => 'அசல் கோப்புகளை மாற்றாமல் விட்டுவிடுங்கள்.';

  @override
  String get toRecycleBinLabel => 'குப்பைத்தொட்டிக்கு அனுப்பு';

  @override
  String get toRecycleBinDesc =>
      'அமுக்கம் முடிந்ததும் அசலை குப்பைத்தொட்டிக்கு அனுப்பு.';

  @override
  String get outputFormatTitle => 'கொள்கலன் வடிவம்';

  @override
  String get formatOriginalLabel => 'அசல்';

  @override
  String get formatOriginalDesc => 'அசல் வடிவத்தைத் தக்கவைக்கவும்.';

  @override
  String get formatMp4Label => 'MP4';

  @override
  String get formatMp4Desc => 'அதிகபட்ச இணக்கத்தன்மை.';

  @override
  String get formatMkvLabel => 'MKV';

  @override
  String get formatMkvDesc => 'பல டிராக் ஆதரவு.';

  @override
  String get formatMovLabel => 'MOV';

  @override
  String get formatMovDesc => 'Apple QuickTime வடிவம்.';

  @override
  String get scanningFilesMsg => 'கோப்புகள் பரிசோதிக்கப்படுகின்றன...';

  @override
  String get addFilesBtn => 'கோப்புகளைச் சேர்';

  @override
  String get addFolderBtn => 'கோப்புறையைச் சேர்';

  @override
  String get dragDropMoreMsg =>
      'அல்லது மேலும் கோப்புகளை எங்கும் இழுத்து விடுங்கள்';

  @override
  String get openOutputFolderTooltip => 'வெளியீட்டு கோப்புறையைத் திற';

  @override
  String get statusQueued => 'வரிசையில்';

  @override
  String get statusAnalyzing => 'ஆராய்கிறது';

  @override
  String get statusCompressing => 'அமுக்கப்படுகிறது';

  @override
  String get statusDone => 'முடிந்தது';

  @override
  String get statusFailed => 'தோல்வி';

  @override
  String get statusCancelled => 'ரத்து செய்யப்பட்டது';

  @override
  String get savedPrefix => 'சேமிப்பு';

  @override
  String get largerSuffix => 'பெரிது';

  @override
  String get largerSizeWarning =>
      'வெளியீட்டு அளவு அசலை விடப் பெரிதாக இருக்கலாம்.';

  @override
  String get clearCompletedBtn => 'முடிந்தவற்றை நீக்கு';

  @override
  String get clearAllBtn => 'அனைத்தையும் நீக்கு';

  @override
  String get stopAllBtn => 'அனைத்தையும் நிறுத்து';

  @override
  String get startCompressionBtn => 'அமுக்கத்தைத் தொடங்கு';

  @override
  String get allDoneLabel => 'அனைத்தும் முடிந்தது!';

  @override
  String get openFolderBtn => 'கோப்புறையைத் திற';

  @override
  String get totalEtaLabel => 'மீதமுள்ள நேரம்';

  @override
  String get totalSavedLabel => 'மொத்த சேமிப்பு';

  @override
  String get videoSingle => 'வீடியோ';

  @override
  String get videosPlural => 'வீடியோக்கள்';

  @override
  String get fileSingle => 'கோப்பு';

  @override
  String get filesPlural => 'கோப்புகள்';

  @override
  String get releaseToAddVideosMsg => 'கோப்புகளைச் சேர்க்க விடுங்கள்';

  @override
  String get dragDropHereMsg => 'வீடியோ அல்லது படங்களை இங்கே இழுத்து விடுங்கள்';

  @override
  String get supportedFormatsMsg =>
      'MP4, MKV, MOV, AVI, WMV, WebM • PNG, JPG, WebP, AVIF மற்றும் பலவற்றை ஆதரிக்கிறது';

  @override
  String get selectFilesBtn => 'கோப்புகளைத் தேர்ந்தெடு';

  @override
  String get selectFolderBtn => 'கோப்புறையைத் தேர்ந்தெடு';

  @override
  String get releaseToShrinkTitle => 'அமுக்க விடுவிக்கவும்';

  @override
  String get filesWillBeAddedDesc =>
      'உங்கள் கோப்புகள் வரிசையில் சேர்க்கப்படும்.';

  @override
  String get disabledLabel => 'செயலிழக்கப்பட்டது';

  @override
  String get compressionInProgressTitle => 'அமுக்கம் நடைபெறுகிறது';

  @override
  String get confirmCloseDesc =>
      'நீங்கள் நிச்சயம் Shrinkeo ஐ மூட விரும்புகிறீர்களா?';

  @override
  String get keepCompressingBtn => 'அமுக்கத்தைத் தொடர்';

  @override
  String get closeAppBtn => 'செயலியை மூடு';

  @override
  String get lockedSettingsWarning => 'அமுக்கத்தின் போது பூட்டப்பட்டுள்ளது';

  @override
  String get updateRequiredTitle => 'புதுப்பிப்பு தேவை';

  @override
  String get updateRequiredDescNewVersion => 'புதிய பதிப்பு கிடைக்கிறது.';

  @override
  String get updateRequiredDescOldVersion =>
      'உங்கள் பதிப்பு இனி ஆதரிக்கப்படாது.';

  @override
  String get updateNowBtn => 'இப்போதே புதுப்பி';

  @override
  String get laterBtn => 'பிறகு';

  @override
  String get updateAvailableTitle => 'புதுப்பிப்பு கிடைக்கிறது';

  @override
  String get whatsNewTitle => 'புதியவை:';

  @override
  String get exitAppBtn => 'வெளியேறு';

  @override
  String get retryBtn => 'மீண்டும் முயற்சி செய்';

  @override
  String get downloadFromWebsiteBtn => 'இணையதளத்தில் பதிவிறக்கு';

  @override
  String get skipUpdateConfirmTitle => 'புதுப்பிப்பைத் தவிர்க்கவா?';

  @override
  String get skipUpdateConfirmDesc =>
      'இந்த புதுப்பிப்பில் முக்கியமான திருத்தங்கள் உள்ளன.';

  @override
  String get skipUpdateCancelBtn => 'ரத்து செய்';

  @override
  String get skipUpdateConfirmBtn => 'புதுப்பிப்பைத் தவிர்';

  @override
  String get maintenanceTitle => 'பராமரிப்பு';

  @override
  String get maintenanceDescDefault => 'Shrinkeo தற்போது பராமரிப்பில் உள்ளது.';

  @override
  String versionAvailableMsg(String version) {
    return 'பதிப்பு $version கிடைக்கிறது.';
  }

  @override
  String get hwEncoderNotSupportedTitle =>
      'ஹார்டுவேர் முடுக்கம் ஆதரிக்கப்படவில்லை';

  @override
  String get failedCreateFolderError => 'கோப்புறையை உருவாக்க முடியவில்லை';

  @override
  String get failedProbeDurationError => 'கால அளவைக் கண்டறிய முடியவில்லை';

  @override
  String get ffmpegNotFoundGlobalError => 'FFmpeg கிடைக்கவில்லை.';

  @override
  String get ffmpegMissingError =>
      'FFmpeg அல்லது FFprobe இல்லை அல்லது சேதமடைந்துள்ளது.';

  @override
  String hwFallbackNotificationBody(String encoderLabel) {
    return '$encoderLabel தோல்வியடைந்தது. CPU க்கு மாறபட்டது.';
  }

  @override
  String get failedDownloadUpdateMsg =>
      'புதுப்பிப்பைப் பதிவிறக்க முடியவில்லை. மீண்டும் முயற்சிக்கவும்.';

  @override
  String customRatioActiveTitle(Object ratio) {
    return 'தனிப்பயன் விகிதம் ($ratio)';
  }

  @override
  String customRatioActiveDesc(Object ratio) {
    return 'தனிப்பயன் $ratio விகிதത്തിற்கான கேன்வாஸ்.';
  }

  @override
  String customAngleActiveTitle(Object angle) {
    return 'தனிப்பயன் கோணம் ($angle°)';
  }

  @override
  String customAngleActiveDesc(Object angle) {
    return 'தனிப்பயன் $angle° கோணத்தில் வீடியோவை சுழற்றுகிறது.';
  }

  @override
  String trimActiveDesc(Object end, Object start) {
    return '$start மற்றும் $end இடையே வீடியோவை வெட்டுகிறது.';
  }

  @override
  String targetSizeLimitLabel(Object size) {
    return '$size எம்பி வரம்பு';
  }

  @override
  String get customMbSizeTooltip => 'தனிப்பயன் எம்பி அளவை தட்டச்சு செய்க';

  @override
  String get trimTimeTooltip =>
      'நேரத்தை உள்ளிடவும் எ.கா. 5 (5 விநாடி), 1:30 (1 நிமி 30 விநாடி), அல்லது 00:01:30';

  @override
  String get tabImageSuite => 'பட தொகுப்பு';

  @override
  String get compressionModeTitle => 'சுருக்க முறை';

  @override
  String get smartAutoLabel => 'ஸ்மார்ட் ஆட்டோ';

  @override
  String get smartAutoDesc =>
      '100% அழகிய காட்சித் தெளிவுடன் கோப்பு அளவை ~60-80% தானாகக் குறைக்கிறது. தினசரி புகைப்பட தேர்வுமுறைக்கு ஏற்றது.';

  @override
  String get maxSavingsLabel => 'அதிகபட்ச சேமிப்பு';

  @override
  String get maxSavingsDesc =>
      'ஆக்கிரமிப்பு சுருக்கம் 85-90% கோப்பு அளவு வரை சேமிக்கிறது. விரைவான செய்தியிடல், இணையப் பதிவேற்றங்கள் மற்றும் மின்னஞ்சல் இணைப்புகளுக்கு சிறந்தது.';

  @override
  String get ultraFidelityLabel => 'அல்ட்ரா ஃபிடிலிட்டி';

  @override
  String get ultraFidelityDesc =>
      'குறைந்த சுருக்கத்துடன் மூல காட்சி நம்பகத்தன்மையை பாதுகாக்கிறது. புகைப்படக் காப்பகங்கள் மற்றும் உயர்-ரெஸ் அச்சுப் பணிகளுக்கு ஏற்றது.';

  @override
  String get targetImageFormatTitle => 'இலக்கு பட வடிவம்';

  @override
  String get dimensionResizingTitle => 'பரிமாண மறுஅளவிடுதல்';

  @override
  String get exifCameraPrivacyTitle => 'EXIF / கேமரா தனியுரிமை';

  @override
  String get stripGpsCameraInfoLabel => 'ஸ்டிரிப் ஜிபிஎஸ் & கேமரா தகவல்';

  @override
  String get imgFmtOriginalLabel => 'அசல் வடிவம்';

  @override
  String get imgFmtOriginalDesc =>
      'அசல் வடிவமைப்பை வைத்திருங்கள் (வேகமானது, மாற்றம் இல்லை).';

  @override
  String get imgFmtPngLabel => 'PNG படம் (.png)';

  @override
  String get imgFmtPngDesc => 'வெளிப்படைத்தன்மை ஆதரவுடன் இழப்பற்ற PNG வடிவம்.';

  @override
  String get imgFmtJpgLabel => 'JPEG படம் (.jpg)';

  @override
  String get imgFmtJpgDesc =>
      'உலகளாவிய இணக்கத்தன்மைக்கான நிலையான சுருக்கப்பட்ட JPEG வடிவம்.';

  @override
  String get imgFmtWebpLabel => 'WebP படம் (.webp)';

  @override
  String get imgFmtWebpDesc =>
      'நவீன WebP வடிவமைப்பு சிறந்த சுருக்கத்தையும் சிறிய அளவையும் வழங்குகிறது.';

  @override
  String get imgFmtAvifLabel => 'AVIF படம் (.avif)';

  @override
  String get imgFmtAvifDesc =>
      'அதி உயர் சுருக்க திறன் கொண்ட அடுத்த தலைமுறை AVIF வடிவம்.';

  @override
  String get imgResOriginalLabel => 'அசல் பரிமாணங்கள்';

  @override
  String get imgResOriginalDesc =>
      'அசல் படத்தின் அகலம் மற்றும் உயர பரிமாணங்களை வைத்திருங்கள்.';

  @override
  String get imgRes4kLabel => '4K அதிகபட்சம் (3840px)';

  @override
  String get imgRes4kDesc =>
      'படத்தின் அதிகபட்ச பரிமாணத்தை 3840pxக்கு (4K அதிகபட்சம்) அளவிடவும்.';

  @override
  String get imgRes1080pLabel => 'முழு HD மேக்ஸ் (1920px)';

  @override
  String get imgRes1080pDesc =>
      'படத்தின் அதிகபட்ச பரிமாணத்தை 1920pxக்கு (முழு HD அதிகபட்சம்) அளவிடவும்.';

  @override
  String get imgRes720pLabel => 'HD மேக்ஸ் (1280px)';

  @override
  String get imgRes720pDesc =>
      'படத்தின் அதிகபட்ச பரிமாணத்தை 1280pxக்கு (HD அதிகபட்சம்) அளவிடவும்.';

  @override
  String get imgRes480pLabel => 'SD அதிகபட்சம் (854px)';

  @override
  String get imgRes480pDesc =>
      'படத்தின் அதிகபட்ச பரிமாணத்தை 854pxக்கு (SD அதிகபட்சம்) அளவிடவும்.';

  @override
  String get keepMetadataImageInfoDesc =>
      'அசல் படம் EXIF ​​& கேமரா மெட்டாடேட்டாவைப் பாதுகாக்கிறது.';

  @override
  String get imageQualityModeLabel => 'தர நிலை';

  @override
  String get imageQualityModeDesc =>
      'நிலையான தர நிலையில் குறியாக்குகிறது — அதிக தரம் என்றால் பெரிய கோப்புகள்.';

  @override
  String get imageTargetSizeModeLabel => 'இலக்கு அளவு';

  @override
  String get imageTargetSizeModeDesc =>
      'அளவு வரம்பிற்குள் அடங்கும் உயர்ந்த தரத்தை தானாகக் கண்டறிகிறது.';

  @override
  String get imageQualitySliderTitle => 'படத் தரம்';

  @override
  String get imageTargetSizeTitle => 'இலக்கு கோப்பு அளவு';

  @override
  String get imageTargetSizeDesc =>
      'கோப்பு வரம்பிற்குள் அடங்கும் வரை குறையும் தரத்துடன் மீண்டும் மீண்டும் குறியாக்குகிறது. மிகச் சிறிய வரம்புகள் தரத்தைக் குறைக்கலாம்.';

  @override
  String imageTargetSizeLimitLabel(String size) {
    return 'வரம்பு $size';
  }

  @override
  String get customKbSizeTooltip => 'விருப்ப KB அளவை தட்டச்சு செய்க';

  @override
  String get imageProcessingFailedError => 'பட செயலாக்கம் தோல்வியடைந்தது';

  @override
  String get imageProcessingErrorMsg => 'பட செயலாக்கப் பிழை';

  @override
  String get cleanNoiseLabel => 'இரைச்சலை நீக்கு';

  @override
  String get outputLargerTooltip =>
      'Output will be larger than original!\nStop and try Reset to Defaults.';

  @override
  String get estimatedSizePrefix => 'Est:';

  @override
  String get cancelBtnTooltip => 'Cancel';

  @override
  String get removeBtnTooltip => 'Remove';

  @override
  String get selectLanguageTitle => 'Select Language';

  @override
  String get searchLanguageHint => 'Search language by name or code...';

  @override
  String get noLanguagesMatchSearch => 'No languages match your search.';

  @override
  String get languageTooltip => 'Language';

  @override
  String get notifyCompressionCompleteTitle => 'Shrinkeo Compression Complete';

  @override
  String get notifyOutputLargerTitle => 'Output Larger Than Original';

  @override
  String languagesCountLabel(String count) {
    return '$count Languages';
  }

  @override
  String notifyCompressionCompleteSuccess(String success) {
    return '$success கோப்புகள் வெற்றிகரமாக சுருக்கப்பட்டன.';
  }

  @override
  String notifyCompressionCompleteFailed(String failed) {
    return ' ($failed failed)';
  }

  @override
  String notifyOutputLargerDesc(String fileName) {
    return '$fileName is expected to be larger than the original file size. Consider cancelling and resetting settings to default.';
  }

  @override
  String get imagePreparing => 'படம் தயாராகிறது';

  @override
  String get imageEncoding => 'படம் சுருக்கப்படுகிறது';

  @override
  String get imageSaving => 'முடிவு சேமிக்கப்படுகிறது';

  @override
  String imageTargetProgress(String size) {
    return 'இலக்கு: $size';
  }

  @override
  String imageAttempt(int count) {
    return 'முயற்சி $count';
  }

  @override
  String imageBestResult(String size) {
    return 'சிறந்த முடிவு: $size';
  }

  @override
  String queueCompleted(int done, int total) {
    return '$total இல் $done முடிந்தது';
  }
}
