// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Marathi (`mr`).
class AppLocalizationsMr extends AppLocalizations {
  AppLocalizationsMr([String locale = 'mr']) : super(locale);

  @override
  String get appName => 'Shrinkeo';

  @override
  String get totalSpaceSaved => 'एकूण जतन केलेली जागा';

  @override
  String get savedSpacePrefix => 'जतन केले:';

  @override
  String get supportButtonText => 'प्रकल्पाला पाठिंबा द्या';

  @override
  String get lightThemeTooltip => 'लाइट थीम';

  @override
  String get darkThemeTooltip => 'डार्क थीम';

  @override
  String get settingsTooltip => 'सेटिंग्ज';

  @override
  String get minimizeTooltip => 'लहान करा';

  @override
  String get closeTooltip => 'बंद करा';

  @override
  String get restoreTooltip => 'पुनर्संचयित करा';

  @override
  String get maximizeTooltip => 'मोठे करा';

  @override
  String get tabCompressionQuality => 'कंप्रेशन आणि गुणवत्ता';

  @override
  String get tabVideoEditingTools => 'व्हिडिओ एडिटिंग आणि टूल';

  @override
  String get tabAudioSettings => 'ऑडिओ सेटिंग्ज';

  @override
  String get tabEngineOutput => 'इंजिन आणि आउटपुट फाईल';

  @override
  String get compressionSettingsTitle => 'कंप्रेशन सेटिंग्ज';

  @override
  String get resetToDefaults => 'डिफॉल्टवर रिसेट करा';

  @override
  String get resetDefaultTooltip => 'मूळ मूल्यांवर रिसेट करा';

  @override
  String get modeTargetSizeTitle => 'कंप्रेशन मोड';

  @override
  String get modeCrfLabel => 'गुणवत्ता (CRF)';

  @override
  String get modeTargetSizeLabel => 'लक्ष्य आकार (MB)';

  @override
  String get crfQualityTitle => 'CRF गुणवत्ता घटक';

  @override
  String get crfLossless => 'दोषरहित';

  @override
  String get crfHighQuality => 'उच्च गुणवत्ता';

  @override
  String get crfBalanced => 'समतोल';

  @override
  String get crfHighCompression => 'उच्च कम्प्रेशन';

  @override
  String get crfLowQuality => 'कमी गुणवत्ता';

  @override
  String get crfUltraCompressed => 'अल्ट्रा कॉम्प्रेस्ड';

  @override
  String get targetSizeLabel => 'लक्ष्य फाईल आकार (MB)';

  @override
  String get targetSizeDesc => 'आकार मर्यादेत बसण्यासाठी बिटरेटची गणना करते.';

  @override
  String get encodingSpeedTitle => 'एनकोडिंग गती';

  @override
  String get presetUltrafastLabel => 'अत्यंत वेगवान';

  @override
  String get presetUltrafastDesc => 'कमाल वेग, पण सर्वात कमी आकारात घट.';

  @override
  String get presetSuperfastLabel => 'सुपर फास्ट';

  @override
  String get presetSuperfastDesc => 'खूप जलद एनकोडिंग.';

  @override
  String get presetVeryfastLabel => 'खूप वेगवान';

  @override
  String get presetVeryfastDesc => 'सरासरीपेक्षा वेगवान.';

  @override
  String get presetFasterLabel => 'अधिक वेगवान';

  @override
  String get presetFasterDesc => 'चांगला वेग आणि उत्तम कंप्रेशन.';

  @override
  String get presetFastLabel => 'जलद';

  @override
  String get presetFastDesc => 'वेग आणि आकाराचा उत्तम समतोल.';

  @override
  String get presetMediumLabel => 'मध्यम';

  @override
  String get presetMediumDesc => 'डिफॉल्ट समतोल.';

  @override
  String get presetSlowLabel => 'हळू';

  @override
  String get presetSlowDesc => 'हळू पण लक्षणीयरीत्या लहान फाईल्स.';

  @override
  String get presetVeryslowLabel => 'खूप हळू';

  @override
  String get presetVeryslowDesc => 'कमाल आकार कमी करणे.';

  @override
  String get videoCodecTitle => 'व्हिडिओ कोडेक';

  @override
  String get codecH264Label => 'H.264';

  @override
  String get codecH264Desc => 'कमाल सुसंगतता.';

  @override
  String get codecH265Label => 'H.265 / HEVC';

  @override
  String get codecH265Desc => 'उत्तम कंप्रेशन कार्यक्षमता.';

  @override
  String get codecAv1Label => 'AV1';

  @override
  String get codecAv1Desc => 'नवीन पिढीचे कोडेक (H.265 पेक्षा 30% लहान).';

  @override
  String get hardwareEncoderTitle => 'हार्डवेअर प्रवेग (GPU)';

  @override
  String get hwSoftwareLabel => 'सॉफ्टवेअर (CPU)';

  @override
  String get hwSoftwareDesc => 'सर्वात हळू, पण सर्वोच्च सुसंगतता.';

  @override
  String get hwNvidiaLabel => 'Nvidia (NVENC)';

  @override
  String get hwNvidiaDesc => 'Nvidia GPU साठी अत्यंत जलद एनकोडिंग.';

  @override
  String get hwAmdLabel => 'AMD (AMF)';

  @override
  String get hwAmdDesc => 'AMD GPU साठी अत्यंत जलद एनकोडिंग.';

  @override
  String get hwIntelLabel => 'Intel (QSV)';

  @override
  String get hwIntelDesc => 'Intel GPU साठी अत्यंत जलद एनकोडिंग.';

  @override
  String get resolutionTitle => 'कमाल रिझोल्यूशन';

  @override
  String get resOriginalLabel => 'मूळ';

  @override
  String get resOriginalDesc => 'मूळ रिझोल्यूशन ठेवा.';

  @override
  String get res4kLabel => '4K';

  @override
  String get res4kDesc => 'जास्तीत जास्त 4K पर्यंत कमी करा.';

  @override
  String get res2kLabel => '2K';

  @override
  String get res2kDesc => 'जास्तीत जास्त 2K पर्यंत कमी करा.';

  @override
  String get res1080pLabel => '1080p';

  @override
  String get res1080pDesc => 'जास्तीत जास्त 1080p Full HD पर्यंत कमी करा.';

  @override
  String get res720pLabel => '720p';

  @override
  String get res720pDesc => 'जास्तीत जास्त 720p HD पर्यंत कमी करा.';

  @override
  String get res480pLabel => '480p';

  @override
  String get res480pDesc => '480p पर्यंत कमी करा.';

  @override
  String get res360pLabel => '360p';

  @override
  String get res360pDesc => 'कमाल कंप्रेशन.';

  @override
  String get frameRateTitle => 'फ्रेम रेट (FPS)';

  @override
  String get fpsOriginalLabel => 'मूळ';

  @override
  String get fpsOriginalDesc => 'स्रोत व्हिडिओप्रमाणे समान FPS.';

  @override
  String get fps60Label => '60 fps';

  @override
  String get fps60Desc => 'गेमिंग किंवा खेळासाठी स्मूथ.';

  @override
  String get fps30Label => '30 fps';

  @override
  String get fps30Desc => 'बहुतेक व्हिडिओसाठी मानक.';

  @override
  String get fps24Label => '24 fps';

  @override
  String get fps24Desc => 'सिनेमॅटिक लुक.';

  @override
  String get enableVideoDenoiseTitle => 'व्हिडिओ नॉईज कमी करा';

  @override
  String get enableVideoDenoiseDesc => 'नॉईज कमी करण्यासाठी 3D फिल्टर.';

  @override
  String get exportFormatTitle => 'निर्यात स्वरूप';

  @override
  String get exportVideoLabel => 'मानक व्हिडिओ';

  @override
  String get exportVideoDesc => 'MP4/MKV/MOV म्हणून निर्यात करा';

  @override
  String get exportGifLabel => 'अ‍ॅनिमेटेड GIF';

  @override
  String get exportGifDesc => 'उच्च गुणवत्तेचा GIF तयार करा';

  @override
  String get exportMp3Label => 'MP3 काढा';

  @override
  String get exportMp3Desc => 'ऑडिओ 320kbps MP3 म्हणून काढा';

  @override
  String get exportAacLabel => 'AAC काढा';

  @override
  String get exportAacDesc => 'ऑडिओ AAC म्हणून काढा';

  @override
  String get exportWavLabel => 'WAV काढा';

  @override
  String get exportWavDesc => 'न कॉम्प्रेस केलेला WAV ऑडिओ काढा';

  @override
  String get privacyScrubbingTitle => 'गोपनीयता आणि GPS';

  @override
  String get keepMetadataLabel => 'डेटा ठेवा';

  @override
  String get stripGpsExifLabel => 'GPS/EXIF हटवा';

  @override
  String get stripGpsExifInfoTitle => 'मेटाडेटा साफ करा';

  @override
  String get stripGpsExifInfoDesc => 'कॅमेरा माहिती आणि GPS स्थान हटवते.';

  @override
  String get keepMetadataInfoDesc => 'सर्व मूळ मेटाडेटा जतन करते.';

  @override
  String get autoCropBlackBarsTitle => 'काळ्या पट्ट्या आपोआप क्रॉप करा';

  @override
  String get autoCropLabel => 'ऑटो क्रॉप';

  @override
  String get autoCropActiveTitle => 'ऑटो क्रॉप सुरू आहे';

  @override
  String get autoCropActiveDesc => 'काळ्या पट्ट्या आपोआप हटवते.';

  @override
  String get autoCropDisabledDesc => 'मूळ बॉर्डर जतन करते.';

  @override
  String get playbackSpeedTitle => 'प्लेबॅक गती';

  @override
  String get speedOriginalLabel => '1.0x';

  @override
  String get speedOriginalDesc => 'सामान्य गती';

  @override
  String get speedSlow05Label => '0.5x हळू';

  @override
  String get speedSlow05Desc => 'अर्ध्या वेगाने चालवा';

  @override
  String get speedFast15Label => '1.5x';

  @override
  String get speedFast15Desc => '1.5 पट वेगाने';

  @override
  String get speedFast20Label => '2.0x वेगाने';

  @override
  String get speedFast20Desc => 'दुप्पट वेग';

  @override
  String get speedTimelapse40Label => '4.0x टाइमलॅप्स';

  @override
  String get speedTimelapse40Desc => 'टाइमलॅप्ससाठी 4x वेग';

  @override
  String get canvasAspectRatioTitle => 'आकारमान प्रमाण';

  @override
  String get aspectOriginalLabel => 'मूळ';

  @override
  String get aspectOriginalDesc => 'मूळ प्रमाण ठेवा';

  @override
  String get aspectShortsLabel => '9:16 Shorts';

  @override
  String get aspectShortsDesc => 'TikTok आणि Reels साठी';

  @override
  String get aspectSquareLabel => '1:1 चौरस';

  @override
  String get aspectSquareDesc => 'Instagram पोस्टसाठी';

  @override
  String get aspectPortraitLabel => '4:5 पोर्ट्रेट';

  @override
  String get aspectPortraitDesc => 'उभ्या Instagram साठी';

  @override
  String get aspectWidescreenLabel => '16:9 वाईडस्क्रीन';

  @override
  String get aspectWidescreenDesc => 'YouTube आणि टीव्हीसाठी';

  @override
  String get aspectClassicLabel => '4:3 क्लासिक';

  @override
  String get aspectClassicDesc => 'क्लासिक स्क्रीनसाठी';

  @override
  String get aspectCinemaLabel => '21:9 सिनेमा';

  @override
  String get aspectCinemaDesc => 'अल्ट्रावाईड मॉनिटर्ससाठी';

  @override
  String get aspectCustomLabel => 'कस्टम प्रमाण';

  @override
  String get aspectCustomDesc => 'तुमचे सानुकूल प्रमाण';

  @override
  String get customRatioTooltip => 'उदा: 16:10, 2:1';

  @override
  String get rotationFlipTitle => 'रोटेशन आणि फिरवा';

  @override
  String get rotOriginalLabel => 'मूळ (0°)';

  @override
  String get rotOriginalDesc => 'मूळ दिशा ठेवा';

  @override
  String get rot90Label => '90° उजवीकडे';

  @override
  String get rot90Desc => 'घड्याळाच्या दिशेने 90 अंश फिरवा';

  @override
  String get rot180Label => '180° उलटे';

  @override
  String get rot180Desc => 'उलटे फिरवा';

  @override
  String get rot270Label => '270° डावीकडे';

  @override
  String get rot270Desc => 'घड्याळाच्या विरुद्ध दिशेने 90 अंश फिरवा';

  @override
  String get rotFlipHLabel => 'आडवे फिरवा';

  @override
  String get rotFlipHDesc => 'आडव्या आरशाप्रमाणे फिरवा';

  @override
  String get rotFlipVLabel => 'उभे फिरवा';

  @override
  String get rotFlipVDesc => 'उभ्या आरशाप्रमाणे फिरवा';

  @override
  String get rotCustomLabel => 'कस्टम कोन';

  @override
  String get rotCustomDesc => 'विशिष्ट कोनात फिरवा';

  @override
  String get customRotationTooltip => 'अंशात कोन उदा. 45';

  @override
  String get trimVideoTitle => 'व्हिडिओ कट करा';

  @override
  String get fullVideoLabel => 'संपूर्ण व्हिडिओ';

  @override
  String get cutClipLabel => 'क्लिप कट करा';

  @override
  String get trimStartLabel => 'शुरू';

  @override
  String get trimEndLabel => 'शेवट';

  @override
  String get trimActiveTitle => 'कटिंग मोड सुरू';

  @override
  String get fullVideoDesc => 'कट न करता संपूर्ण व्हिडिओ प्रक्रिया करा.';

  @override
  String get audioModeTitle => 'ऑडिओ ट्रॅक मोड';

  @override
  String get audioOriginalLabel => 'मूळ';

  @override
  String get audioOriginalDesc => 'ऑडिओ गुणवत्तेचे कोणतेही नुकसान नाही.';

  @override
  String get audioAac256Label => 'उच्च गुणवत्ता (256k)';

  @override
  String get audioAac256Desc => 'AAC 256kbps';

  @override
  String get audioAac128Label => 'संतुलित (128k)';

  @override
  String get audioAac128Desc => 'AAC 128kbps (वेब मानक)';

  @override
  String get audioAac64Label => 'कमी आकार (64k)';

  @override
  String get audioAac64Desc => 'आवाजासाठी AAC 64kbps';

  @override
  String get audioMuteLabel => 'ऑडिओ म्यूट करा';

  @override
  String get audioMuteDesc => 'ऑडिओ ट्रॅक पूर्णपणे हटवा.';

  @override
  String get audioNormTitle => 'आवाज पातळी समान करणे';

  @override
  String get audioNormOffLabel => 'बंद';

  @override
  String get audioNormOffDesc => 'मूळ आवाज.';

  @override
  String get audioNormSpeechLabel => 'मानवी आवाज';

  @override
  String get audioNormSpeechDesc => 'स्पष्ट संवादासाठी EBU R128.';

  @override
  String get audioNormDynamicLabel => 'सिनेमा डायनॅमिक';

  @override
  String get audioNormDynamicDesc => 'हळू आणि मोठ्या आवाजांना संतुलित करते.';

  @override
  String get audioNormBoostLabel => 'हलका बूस्ट';

  @override
  String get audioNormBoostDesc => '+3dB आवाज वाढवा.';

  @override
  String get audioChanTitle => 'ऑडिओ चॅनेल्स';

  @override
  String get audioChanOriginalLabel => 'मूळ';

  @override
  String get audioChanOriginalDesc => 'मूळ चॅनेल जतन करा.';

  @override
  String get audioChanStereoLabel => 'स्टिरिओ (2.0)';

  @override
  String get audioChanStereoDesc => 'मानक 2-चॅनेल स्टिरिओ.';

  @override
  String get audioChanMonoLabel => 'मोनो (1.0)';

  @override
  String get audioChanMonoDesc => '1-चॅनेल - ऑडिओ आकारात 50% बचत.';

  @override
  String get removeNoiseLabel => 'नॉईज हटवा';

  @override
  String get enableAudioDenoiseTitle => 'माईकचा नॉईज हटवा';

  @override
  String get enableAudioDenoiseDesc => 'बॅकग्राउंड नॉईज हटवण्यासाठी फिल्टर.';

  @override
  String get outputDirectoryTitle => 'आउटपुट फोल्डर';

  @override
  String get defaultOutputDirectory => 'डिफॉल्ट (मूळ फाईलच्या शेजारी)';

  @override
  String get selectOutputFolderTitle => 'फोल्डर निवडा';

  @override
  String get clearOutputFolder => 'डिफॉल्ट स्थान वापरा';

  @override
  String get changeBtn => 'बदला';

  @override
  String get outputLocationTitle => 'आउटपुट वर्तन';

  @override
  String get outputLocationUnifiedLabel => 'एकच फोल्डर';

  @override
  String get outputLocationUnifiedDesc =>
      'सर्व कॉम्प्रेस केलेले व्हिडिओ एकाच फोल्डरमध्ये.';

  @override
  String get outputLocationSameLabel => 'मूळ फाईलच्या शेजारी';

  @override
  String get outputLocationSameDesc =>
      'प्रत्येक व्हिडिओ त्याच्या मूळ फाईलच्या शेजारी.';

  @override
  String get fileManagementTitle => 'फाईल व्यवस्थापन';

  @override
  String get keepOriginalsLabel => 'मूळ फाईल्स ठेवा';

  @override
  String get keepOriginalsDesc => 'मूळ फाईल्स जशा आहेत तशा राहू द्या.';

  @override
  String get toRecycleBinLabel => 'रिसायकल बिनमध्ये पाठवा';

  @override
  String get toRecycleBinDesc =>
      'कॉम्प्रेस केल्यानंतर मूळ फाईल्स रिसायकल बिनमध्ये पाठवा.';

  @override
  String get outputFormatTitle => 'कंटेनर स्वरूप';

  @override
  String get formatOriginalLabel => 'मूळ';

  @override
  String get formatOriginalDesc => 'मूळ स्वरूप जतन करा.';

  @override
  String get formatMp4Label => 'MP4';

  @override
  String get formatMp4Desc => 'कमाल सुसंगतता.';

  @override
  String get formatMkvLabel => 'MKV';

  @override
  String get formatMkvDesc => 'मल्टी-ट्रॅक सपोर्ट.';

  @override
  String get formatMovLabel => 'MOV';

  @override
  String get formatMovDesc => 'Apple QuickTime स्वरूप.';

  @override
  String get scanningFilesMsg => 'फाईल्स स्कॅन करत आहे...';

  @override
  String get addFilesBtn => 'फाईल्स जोडा';

  @override
  String get addFolderBtn => 'फोल्डर जोडा';

  @override
  String get dragDropMoreMsg => 'किंवा अधिक व्हिडिओ येथे ड्रॅग आणि ड्रॉप करा';

  @override
  String get openOutputFolderTooltip => 'आउटपुट फोल्डर उघडा';

  @override
  String get statusQueued => 'रांगेत';

  @override
  String get statusAnalyzing => 'विश्लेषण करत आहे';

  @override
  String get statusCompressing => 'कॉम्प्रेस करत आहे';

  @override
  String get statusDone => 'पूर्ण झाले';

  @override
  String get statusFailed => 'अपयशी';

  @override
  String get statusCancelled => 'रद्द केले';

  @override
  String get savedPrefix => 'जतन केले';

  @override
  String get largerSuffix => 'मोठे';

  @override
  String get largerSizeWarning => 'आउटपुट आकार मूळ आकारापेक्षा मोठा असू शकतो.';

  @override
  String get clearCompletedBtn => 'पूर्ण झालेले साफ करा';

  @override
  String get clearAllBtn => 'सर्व साफ करा';

  @override
  String get stopAllBtn => 'सर्व थांबवा';

  @override
  String get startCompressionBtn => 'कॉम्प्रेशन सुरू करा';

  @override
  String get allDoneLabel => 'सर्व पूर्ण झाले!';

  @override
  String get openFolderBtn => 'फोल्डर उघडा';

  @override
  String get totalEtaLabel => 'उरलेला वेळ';

  @override
  String get totalSavedLabel => 'एकूण बचत';

  @override
  String get videoSingle => 'व्हिडिओ';

  @override
  String get videosPlural => 'व्हिडिओ';

  @override
  String get releaseToAddVideosMsg => 'व्हिडिओ जोडण्यासाठी सोडा';

  @override
  String get dragDropHereMsg =>
      'फाईल्स किंवा फोल्डर्स येथे ड्रॅग आणि ड्रॉप करा';

  @override
  String get supportedFormatsMsg => 'MP4, MKV, MOV, AVI, WMV समर्थित';

  @override
  String get selectFilesBtn => 'फाईल्स निवडा';

  @override
  String get selectFolderBtn => 'फोल्डर निवडा';

  @override
  String get releaseToShrinkTitle => 'कॉम्प्रेस करण्यासाठी सोडा';

  @override
  String get filesWillBeAddedDesc => 'तुमच्या फाईल्स रांगेत जोडल्या जातील.';

  @override
  String get disabledLabel => 'अक्षम';

  @override
  String get compressionInProgressTitle => 'कॉम्प्रेशन सुरू आहे';

  @override
  String get confirmCloseDesc => 'तुम्हाला नक्की Shrinkeo बंद करायचे आहे का?';

  @override
  String get keepCompressingBtn => 'कॉम्प्रेशन सुरू ठेवा';

  @override
  String get closeAppBtn => 'अ‍ॅप बंद करा';

  @override
  String get lockedSettingsWarning => 'कॉम्प्रेशन दरम्यान लॉक केले आहे';

  @override
  String get updateRequiredTitle => 'अपडेट आवश्यक आहे';

  @override
  String get updateRequiredDescNewVersion => 'नवीन आवृत्ती उपलब्ध आहे.';

  @override
  String get updateRequiredDescOldVersion => 'तुमची आवृत्ती आता समर्थित नाही.';

  @override
  String get updateNowBtn => 'आत्ताच अपडेट करा';

  @override
  String get laterBtn => 'नंतर';

  @override
  String get updateAvailableTitle => 'अपडेट उपलब्ध आहे';

  @override
  String get whatsNewTitle => 'नवीन काय आहे:';

  @override
  String get exitAppBtn => 'बाहेर पडा';

  @override
  String get retryBtn => 'पुन्हा प्रयत्न करा';

  @override
  String get downloadFromWebsiteBtn => 'वेबसाइटवरून डाउनलोड करा';

  @override
  String get skipUpdateConfirmTitle => 'अपडेट वगळायचे का?';

  @override
  String get skipUpdateConfirmDesc =>
      'या अपडेटमध्ये महत्त्वाच्या सुधारणा आहेत.';

  @override
  String get skipUpdateCancelBtn => 'रद्द करा';

  @override
  String get skipUpdateConfirmBtn => 'अपडेट वगळा';

  @override
  String get maintenanceTitle => 'देखभाल';

  @override
  String get maintenanceDescDefault => 'Shrinkeo सध्या देखभालीखाली आहे.';

  @override
  String versionAvailableMsg(String version) {
    return 'आवृत्ती $version उपलब्ध आहे.';
  }

  @override
  String get hwEncoderNotSupportedTitle => 'हार्डवेअर प्रवेग समर्थित नाही';

  @override
  String get failedCreateFolderError => 'फोल्डर तयार करण्यात अपयश';

  @override
  String get failedProbeDurationError => 'कालावधी ओळखण्यात अपयश';

  @override
  String get ffmpegNotFoundGlobalError => 'FFmpeg सापडले नाही.';

  @override
  String get ffmpegMissingError =>
      'FFmpeg किंवा FFprobe गहाळ किंवा खराब झाले आहे.';

  @override
  String hwFallbackNotificationBody(String encoderLabel) {
    return '$encoderLabel अपयशी ठरले. CPU वर स्विच केले.';
  }

  @override
  String get failedDownloadUpdateMsg =>
      'अपडेट डाउनलोड करण्यात अपयश आले. पुन्हा प्रयत्न करा.';

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
  String get tabImageSuite => 'प्रतिमा सूट';

  @override
  String get compressionModeTitle => 'कॉम्प्रेशन मोड';

  @override
  String get smartAutoLabel => 'स्मार्ट ऑटो';

  @override
  String get smartAutoDesc =>
      '100% मूळ दृश्य स्पष्टतेसह फाइल आकार ~60-80% ने स्वयंचलितपणे कमी करते. दररोज फोटो ऑप्टिमायझेशनसाठी योग्य.';

  @override
  String get maxSavingsLabel => 'कमाल बचत';

  @override
  String get maxSavingsDesc =>
      'आक्रमक कॉम्प्रेशन 85-90% फाइल आकारापर्यंत बचत करते. जलद संदेशन, वेब अपलोड आणि ईमेल संलग्नकांसाठी सर्वोत्तम.';

  @override
  String get ultraFidelityLabel => 'अल्ट्रा फिडेलिटी';

  @override
  String get ultraFidelityDesc =>
      'कमीतकमी कॉम्प्रेशनसह कच्च्या व्हिज्युअल निष्ठा राखते. फोटोग्राफी संग्रहण आणि उच्च-रिझोल्यूशन प्रिंट कार्यासाठी आदर्श.';

  @override
  String get targetImageFormatTitle => 'लक्ष्य प्रतिमा स्वरूप';

  @override
  String get dimensionResizingTitle => 'परिमाण आकार बदलणे';

  @override
  String get exifCameraPrivacyTitle => 'EXIF / कॅमेरा गोपनीयता';

  @override
  String get stripGpsCameraInfoLabel => 'स्ट्रिप जीपीएस आणि कॅमेरा माहिती';

  @override
  String get intentCompressOnly => 'फक्त कॉम्प्रेस करा';

  @override
  String get intentCompressOnlyTooltip =>
      'फाइल आकार कमी करण्यावर पूर्णपणे लक्ष केंद्रित करा (गुणवत्ता % किंवा लक्ष्य KB/MB)';

  @override
  String get intentEditConvertOnly => 'फक्त संपादित / रूपांतरित करा';

  @override
  String get intentEditConvertOnlyTooltip =>
      'व्हिज्युअल गुणवत्ता कमी न करता आकार बदला, फिरवा, ट्रिम करा किंवा रूपांतरित करा';

  @override
  String get intentCompressAndEdit => 'कॉम्प्रेस आणि संपादित करा';

  @override
  String get intentCompressAndEditTooltip =>
      'पूर्ण नियंत्रण: फाइल आकार एकत्र संपादित करा, आकार बदला, फिरवा आणि संकुचित करा';
}
