// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get appName => 'Shrinkeo';

  @override
  String get totalSpaceSaved => 'कुल बचाई गई स्पेस';

  @override
  String get savedSpacePrefix => 'बचत:';

  @override
  String get supportButtonText => 'परियोजना का समर्थन करें';

  @override
  String get lightThemeTooltip => 'लाइट थीम';

  @override
  String get darkThemeTooltip => 'डार्क थीम';

  @override
  String get settingsTooltip => 'सेटिंग्स';

  @override
  String get minimizeTooltip => 'छोटा करें';

  @override
  String get closeTooltip => 'बंद करें';

  @override
  String get restoreTooltip => 'पुनर्स्थापित करें';

  @override
  String get maximizeTooltip => 'बड़ा करें';

  @override
  String get tabCompressionQuality => 'कंप्रेशन और क्वालिटी';

  @override
  String get tabVideoEditingTools => 'वीडियो एडिटिंग और टूल्स';

  @override
  String get tabAudioSettings => 'ऑडियो सेटिंग्स';

  @override
  String get tabEngineOutput => 'इंजन और आउटपुट';

  @override
  String get compressionSettingsTitle => 'कंप्रेशन सेटिंग्स';

  @override
  String get resetToDefaults => 'डिफ़ॉल्ट पर रीसेट करें';

  @override
  String get resetDefaultTooltip => 'शुरुआती मानों पर रीसेट करें';

  @override
  String get modeTargetSizeTitle => 'कंप्रेशन मोड';

  @override
  String get modeCrfLabel => 'क्वालिटी (CRF)';

  @override
  String get modeTargetSizeLabel => 'टारगेट साइज़ (MB)';

  @override
  String get crfQualityTitle => 'CRF क्वालिटी फैक्टर';

  @override
  String get crfLossless => 'दोषरहित';

  @override
  String get crfHighQuality => 'उच्च गुणवत्ता';

  @override
  String get crfBalanced => 'संतुलित';

  @override
  String get crfHighCompression => 'उच्च संपीड़न';

  @override
  String get crfLowQuality => 'खराब क्वालिटी';

  @override
  String get crfUltraCompressed => 'अल्ट्रा संपीड़ित';

  @override
  String get targetSizeLabel => 'टारगेट फाइल साइज़ (MB)';

  @override
  String get targetSizeDesc =>
      'लिमिट साइज़ के भीतर फिट होने के लिए बिटरेट की गणना करता है।';

  @override
  String get encodingSpeedTitle => 'एंकोडिंग स्पीड';

  @override
  String get presetUltrafastLabel => 'अति तेज़ (Ultrafast)';

  @override
  String get presetUltrafastDesc => 'सबसे तेज़ गति, सबसे कम साइज़ कटौती।';

  @override
  String get presetSuperfastLabel => 'सुपर तेज़ (Superfast)';

  @override
  String get presetSuperfastDesc => 'बहुत तेज़ एंकोडिंग।';

  @override
  String get presetVeryfastLabel => 'बहुत तेज़ (Very Fast)';

  @override
  String get presetVeryfastDesc => 'औसत से अधिक तेज़।';

  @override
  String get presetFasterLabel => 'तेज़ (Faster)';

  @override
  String get presetFasterDesc => 'अच्छी गति और बढ़िया कंप्रेशन।';

  @override
  String get presetFastLabel => 'तेज़';

  @override
  String get presetFastDesc => 'स्पीड और साइज़ कटौती का सबसे बेहतरीन संतुलन।';

  @override
  String get presetMediumLabel => 'मध्यम (Medium)';

  @override
  String get presetMediumDesc => 'डिफ़ॉल्ट संतुलन।';

  @override
  String get presetSlowLabel => 'धीमा (Slow)';

  @override
  String get presetSlowDesc => 'धीमा लेकिन बहुत छोटी फाइलें बनाता है।';

  @override
  String get presetVeryslowLabel => 'बहुत धीमा (Very Slow)';

  @override
  String get presetVeryslowDesc => 'अधिकतम साइज़ कटौती।';

  @override
  String get videoCodecTitle => 'वीडियो कोडेक';

  @override
  String get codecH264Label => 'H.264';

  @override
  String get codecH264Desc => 'अधिकतम संगतता (Compatibility)।';

  @override
  String get codecH265Label => 'H.265 / HEVC';

  @override
  String get codecH265Desc => 'बेहतर कंप्रेशन दक्षता।';

  @override
  String get codecAv1Label => 'AV1';

  @override
  String get codecAv1Desc => 'अगली पीढ़ी का कोडेक (H.265 से 30% छोटा)।';

  @override
  String get hardwareEncoderTitle => 'हार्डवेयर त्वरण (GPU)';

  @override
  String get hwSoftwareLabel => 'सॉफ्टवेयर (CPU)';

  @override
  String get hwSoftwareDesc => 'धीमा लेकिन अधिकतम संगतता।';

  @override
  String get hwNvidiaLabel => 'Nvidia (NVENC)';

  @override
  String get hwNvidiaDesc => 'Nvidia GPU के लिए अत्यंत तेज़ एंकोडिंग।';

  @override
  String get hwAmdLabel => 'AMD (AMF)';

  @override
  String get hwAmdDesc => 'AMD GPU के लिए अत्यंत तेज़ एंकोडिंग।';

  @override
  String get hwIntelLabel => 'Intel (QSV)';

  @override
  String get hwIntelDesc => 'Intel GPU के लिए अत्यंत तेज़ एंकोडिंग।';

  @override
  String get resolutionTitle => 'अधिकतम रेज़ोल्यूशन';

  @override
  String get resOriginalLabel => 'मूल (Original)';

  @override
  String get resOriginalDesc => 'मूल रेज़ोल्यूशन बनाए रखें।';

  @override
  String get res4kLabel => '4K';

  @override
  String get res4kDesc => 'अधिकतम 4K तक घटाएं।';

  @override
  String get res2kLabel => '2K';

  @override
  String get res2kDesc => 'अधिकतम 2K तक घटाएं।';

  @override
  String get res1080pLabel => '1080p';

  @override
  String get res1080pDesc => 'अधिकतम 1080p Full HD तक घटाएं।';

  @override
  String get res720pLabel => '720p';

  @override
  String get res720pDesc => 'अधिकतम 720p HD तक घटाएं।';

  @override
  String get res480pLabel => '480p';

  @override
  String get res480pDesc => '480p DVD क्वालिटी तक घटाएं।';

  @override
  String get res360pLabel => '360p';

  @override
  String get res360pDesc => 'अधिकतम कंप्रेशन।';

  @override
  String get frameRateTitle => 'फ्रेम रेट (FPS)';

  @override
  String get fpsOriginalLabel => 'मूल (Original)';

  @override
  String get fpsOriginalDesc => 'सोर्स वीडियो के समान FPS।';

  @override
  String get fps60Label => '60 fps';

  @override
  String get fps60Desc => 'गेमिंग या स्पोर्ट्स के लिए स्मूथ।';

  @override
  String get fps30Label => '30 fps';

  @override
  String get fps30Desc => 'ज्यादातर वीडियो के लिए मानक।';

  @override
  String get fps24Label => '24 fps';

  @override
  String get fps24Desc => 'सिनेमैटिक लुक।';

  @override
  String get enableVideoDenoiseTitle => 'वीडियो नॉइज़ सफाई';

  @override
  String get enableVideoDenoiseDesc =>
      'नॉइज़ हटाने और कंप्रेशन बढ़ाने के लिए 3D फ़िल्टर।';

  @override
  String get exportFormatTitle => 'एक्सपोर्ट फ़ॉर्मेट';

  @override
  String get exportVideoLabel => 'मानक वीडियो';

  @override
  String get exportVideoDesc => 'MP4/MKV/MOV के रूप में एक्सपोर्ट करें';

  @override
  String get exportGifLabel => 'एनिमेटेड GIF';

  @override
  String get exportGifDesc => 'उच्च गुणवत्ता वाली एनिमेटेड GIF बनाएं';

  @override
  String get exportMp3Label => 'MP3 निकालें';

  @override
  String get exportMp3Desc => 'ऑडियो को 320kbps MP3 के रूप में निकालें';

  @override
  String get exportAacLabel => 'AAC निकालें';

  @override
  String get exportAacDesc => 'ऑडियो को AAC के रूप में निकालें';

  @override
  String get exportWavLabel => 'WAV निकालें';

  @override
  String get exportWavDesc =>
      'बिना कंप्रेस किया हुआ स्टूडियो WAV ऑडियो निकालें';

  @override
  String get privacyScrubbingTitle => 'गोपनीयता और GPS';

  @override
  String get keepMetadataLabel => 'डेटा रखें';

  @override
  String get stripGpsExifLabel => 'GPS/EXIF हटाएं';

  @override
  String get stripGpsExifInfoTitle => 'मेटाडेटा साफ़ करें';

  @override
  String get stripGpsExifInfoDesc => 'कैमरा जानकारी और GPS स्थान हटाएं।';

  @override
  String get keepMetadataInfoDesc => 'सभी मूल मेटाडेटा सुरक्षित रखें।';

  @override
  String get autoCropBlackBarsTitle => 'काली पट्टियाँ स्वतः काटें';

  @override
  String get autoCropLabel => 'स्वतः क्रॉप';

  @override
  String get autoCropActiveTitle => 'स्वतः क्रॉप सक्रिय';

  @override
  String get autoCropActiveDesc => 'काली पट्टियों को स्वचालित रूप से हटाता है।';

  @override
  String get autoCropDisabledDesc => 'मूल बॉर्डर बनाए रखता है।';

  @override
  String get playbackSpeedTitle => 'प्लेबैक गति';

  @override
  String get speedOriginalLabel => '1.0x';

  @override
  String get speedOriginalDesc => 'सामान्य गति';

  @override
  String get speedSlow05Label => '0.5x धीमा';

  @override
  String get speedSlow05Desc => 'आधी गति से चलाएं';

  @override
  String get speedFast15Label => '1.5x';

  @override
  String get speedFast15Desc => '1.5 गुना गति';

  @override
  String get speedFast20Label => '2.0x तेज़';

  @override
  String get speedFast20Desc => 'दुगुनी गति';

  @override
  String get speedTimelapse40Label => '4.0x टाइमलैप्स';

  @override
  String get speedTimelapse40Desc => '4 गुना अति-तेज़ टाइमलैप्स गति';

  @override
  String get canvasAspectRatioTitle => 'अस्पेक्ट रेशियो';

  @override
  String get aspectOriginalLabel => 'मूल';

  @override
  String get aspectOriginalDesc => 'मूल आकार बनाए रखें';

  @override
  String get aspectShortsLabel => '9:16 शॉट्स';

  @override
  String get aspectShortsDesc => 'TikTok और Reels के लिए';

  @override
  String get aspectSquareLabel => '1:1 चौकोर';

  @override
  String get aspectSquareDesc => 'Instagram पोस्ट के लिए';

  @override
  String get aspectPortraitLabel => '4:5 पोर्ट्रेट';

  @override
  String get aspectPortraitDesc => 'Instagram वर्टिकल के लिए';

  @override
  String get aspectWidescreenLabel => '16:9 वाइड';

  @override
  String get aspectWidescreenDesc => 'YouTube और टीवी के लिए';

  @override
  String get aspectClassicLabel => '4:3 क्लासिक';

  @override
  String get aspectClassicDesc => 'क्लासिक स्क्रीन के लिए';

  @override
  String get aspectCinemaLabel => '21:9 सिनेमा';

  @override
  String get aspectCinemaDesc => 'अल्ट्रावाइड मॉनिटर के लिए';

  @override
  String get aspectCustomLabel => 'कस्टम अनुपात';

  @override
  String get aspectCustomDesc => 'अपनी पसंद का अनुपात';

  @override
  String get customRatioTooltip => 'उदा: 16:10, 2:1';

  @override
  String get rotationFlipTitle => 'रोटेशन और फ्लिप';

  @override
  String get rotOriginalLabel => 'मूल (0°)';

  @override
  String get rotOriginalDesc => 'मूल दिशा बनाए रखें';

  @override
  String get rot90Label => '90° दाएं';

  @override
  String get rot90Desc => 'घड़ी की दिशा में 90 डिग्री घुमाएं';

  @override
  String get rot180Label => '180° उल्टा';

  @override
  String get rot180Desc => 'ऊपर से नीचे घुमाएं';

  @override
  String get rot270Label => '270° बाएं';

  @override
  String get rot270Desc => 'घड़ी की विपरीत दिशा में 90 डिग्री घुमाएं';

  @override
  String get rotFlipHLabel => 'क्षैतिज पलटें';

  @override
  String get rotFlipHDesc => 'हॉरिज़ॉन्टल मिरर करें';

  @override
  String get rotFlipVLabel => 'लंबवत पलटें';

  @override
  String get rotFlipVDesc => 'वर्टिकल मिरर करें';

  @override
  String get rotCustomLabel => 'कस्टम कोण';

  @override
  String get rotCustomDesc => 'निर्दिष्ट कोण पर घुमाएं';

  @override
  String get customRotationTooltip => 'कोण (डिग्री में) उदा: 45';

  @override
  String get trimVideoTitle => 'वीडियो ट्रिम करें';

  @override
  String get fullVideoLabel => 'पूरा वीडियो';

  @override
  String get cutClipLabel => 'क्लिप काटें';

  @override
  String get trimStartLabel => 'शुरू';

  @override
  String get trimEndLabel => 'अंत';

  @override
  String get trimActiveTitle => 'कटिंग मोड चालू';

  @override
  String get fullVideoDesc => 'बिना काटे पूरा वीडियो प्रोसेस करें।';

  @override
  String get audioModeTitle => 'ऑडियो ट्रैक मोड';

  @override
  String get audioOriginalLabel => 'मूल';

  @override
  String get audioOriginalDesc => 'कोई क्वालिटी नुकसान नहीं।';

  @override
  String get audioAac256Label => 'उच्च गुणवत्ता (256k)';

  @override
  String get audioAac256Desc => 'AAC 256kbps';

  @override
  String get audioAac128Label => 'संतुलित (128k)';

  @override
  String get audioAac128Desc => 'AAC 128kbps (वेब मानक)';

  @override
  String get audioAac64Label => 'कम साइज़ (64k)';

  @override
  String get audioAac64Desc => 'AAC 64kbps (आवाज के लिए)';

  @override
  String get audioMuteLabel => 'म्यूट करें';

  @override
  String get audioMuteDesc => 'ऑडियो ट्रैक पूरी तरह से हटाएं।';

  @override
  String get audioNormTitle => 'आवाज़ का स्तर समान करें (Normalization)';

  @override
  String get audioNormOffLabel => 'बंद';

  @override
  String get audioNormOffDesc => 'मूल आवाज़ का स्तर रखें।';

  @override
  String get audioNormSpeechLabel => 'मानव आवाज़';

  @override
  String get audioNormSpeechDesc => 'स्पष्ट बातचीत के लिए EBU R128।';

  @override
  String get audioNormDynamicLabel => 'सिनेमा डायनामिक';

  @override
  String get audioNormDynamicDesc => 'धीमी और तेज़ आवाज़ों को संतुलित करता है।';

  @override
  String get audioNormBoostLabel => 'हल्की वृद्धि';

  @override
  String get audioNormBoostDesc => '+3dB आवाज़ बढ़ाएं।';

  @override
  String get audioChanTitle => 'ऑडियो चैनल्स';

  @override
  String get audioChanOriginalLabel => 'मूल';

  @override
  String get audioChanOriginalDesc => 'मूल चैनल्स बनाए रखें।';

  @override
  String get audioChanStereoLabel => 'स्टीरियो (2.0)';

  @override
  String get audioChanStereoDesc => 'मानक 2-चैनल स्टीरियो।';

  @override
  String get audioChanMonoLabel => 'मोनो (1.0)';

  @override
  String get audioChanMonoDesc => '1-चैनल में बदलें - 50% ऑडियो साइज़ बचत।';

  @override
  String get removeNoiseLabel => 'नॉइज़ हटाएं';

  @override
  String get enableAudioDenoiseTitle => 'माइक और पंखे का शोर हटाएं';

  @override
  String get enableAudioDenoiseDesc => 'बैकग्राउंड शोर हटाने के लिए फ़िल्टर।';

  @override
  String get outputDirectoryTitle => 'आउटपुट फ़ोल्डर';

  @override
  String get defaultOutputDirectory => 'डिफ़ॉल्ट (मूल फ़ाइल के पास)';

  @override
  String get selectOutputFolderTitle => 'फ़ोल्डर चुनें';

  @override
  String get clearOutputFolder => 'डिफ़ॉल्ट स्थान का उपयोग करें';

  @override
  String get changeBtn => 'बदलें';

  @override
  String get outputLocationTitle => 'आउटपुट व्यवहार';

  @override
  String get outputLocationUnifiedLabel => 'एक ही फ़ोल्डर';

  @override
  String get outputLocationUnifiedDesc => 'सभी कंप्रेस वीडियो एक फ़ोल्डर में।';

  @override
  String get outputLocationSameLabel => 'मूल फ़ाइल के पास';

  @override
  String get outputLocationSameDesc =>
      'प्रत्येक वीडियो अपनी मूल फ़ाइल के बगल में।';

  @override
  String get fileManagementTitle => 'फ़ाइल प्रबंधन';

  @override
  String get keepOriginalsLabel => 'मूल फ़ाइलें रखें';

  @override
  String get keepOriginalsDesc => 'मूल वीडियो फ़ाइलों को सुरक्षित रखें।';

  @override
  String get toRecycleBinLabel => 'रीसायकल बिन में भेजें';

  @override
  String get toRecycleBinDesc =>
      'कंप्रेशन के बाद मूल फ़ाइलों को रीसायकल बिन में भेजें।';

  @override
  String get outputFormatTitle => 'कंटेनर फ़ॉर्मेट';

  @override
  String get formatOriginalLabel => 'मूल';

  @override
  String get formatOriginalDesc => 'मूल फ़ॉर्मेट बनाए रखें।';

  @override
  String get formatMp4Label => 'MP4';

  @override
  String get formatMp4Desc => 'अधिकतम संगतता।';

  @override
  String get formatMkvLabel => 'MKV';

  @override
  String get formatMkvDesc => 'मल्टी-ट्रैक सपोर्ट।';

  @override
  String get formatMovLabel => 'MOV';

  @override
  String get formatMovDesc => 'Apple QuickTime फ़ॉर्मेट।';

  @override
  String get scanningFilesMsg => 'फ़ाइलों को स्कैन किया जा रहा है...';

  @override
  String get addFilesBtn => 'फ़ाइलें जोड़ें';

  @override
  String get addFolderBtn => 'फ़ोल्डर जोड़ें';

  @override
  String get dragDropMoreMsg => 'या और वीडियो यहाँ खींचकर छोड़ें';

  @override
  String get openOutputFolderTooltip => 'आउटपुट फ़ोल्डर खोलें';

  @override
  String get statusQueued => 'कतार में';

  @override
  String get statusAnalyzing => 'विश्लेषण';

  @override
  String get statusCompressing => 'कंप्रेस हो रहा है';

  @override
  String get statusDone => 'पूरा हुआ';

  @override
  String get statusFailed => 'विफल';

  @override
  String get statusCancelled => 'रद्द किया गया';

  @override
  String get savedPrefix => 'बचत';

  @override
  String get largerSuffix => 'बड़ा';

  @override
  String get largerSizeWarning => 'आउटपुट साइज़ मूल से बड़ा हो सकता है।';

  @override
  String get clearCompletedBtn => 'पूर्ण हटाएं';

  @override
  String get clearAllBtn => 'सभी साफ़ करें';

  @override
  String get stopAllBtn => 'सभी रोकें';

  @override
  String get startCompressionBtn => 'कंप्रेशन शुरू करें';

  @override
  String get allDoneLabel => 'सब काम हो गया!';

  @override
  String get openFolderBtn => 'फ़ोल्डर खोलें';

  @override
  String get totalEtaLabel => 'बचा हुआ समय';

  @override
  String get totalSavedLabel => 'कुल बचत';

  @override
  String get videoSingle => 'वीडियो';

  @override
  String get videosPlural => 'वीडियो';

  @override
  String get releaseToAddVideosMsg => 'वीडियो जोड़ने के लिए छोड़ें';

  @override
  String get dragDropHereMsg => 'फ़ाइलें या फ़ोल्डर यहाँ खींचकर छोड़ें';

  @override
  String get supportedFormatsMsg => 'MP4, MKV, MOV, AVI, WMV समर्थित';

  @override
  String get selectFilesBtn => 'फ़ाइलें चुनें';

  @override
  String get selectFolderBtn => 'फ़ोल्डर चुनें';

  @override
  String get releaseToShrinkTitle => 'कंप्रेस करने के लिए छोड़ें';

  @override
  String get filesWillBeAddedDesc => 'आपकी फ़ाइलें कतार में जोड़ दी जाएंगी।';

  @override
  String get disabledLabel => 'अक्षम (Disabled)';

  @override
  String get compressionInProgressTitle => 'कंप्रेशन जारी है';

  @override
  String get confirmCloseDesc => 'क्या आप सचमुच Shrinkeo बंद करना चाहते हैं?';

  @override
  String get keepCompressingBtn => 'कंप्रेशन जारी रखें';

  @override
  String get closeAppBtn => 'ऐप बंद करें';

  @override
  String get lockedSettingsWarning => 'कंप्रेशन के दौरान लॉक है';

  @override
  String get updateRequiredTitle => 'अपडेट आवश्यक है';

  @override
  String get updateRequiredDescNewVersion => 'एक नया अपडेट उपलब्ध है।';

  @override
  String get updateRequiredDescOldVersion => 'आपका संस्करण अब समर्थित नहीं है।';

  @override
  String get updateNowBtn => 'अभी अपडेट करें';

  @override
  String get laterBtn => 'बाद में';

  @override
  String get updateAvailableTitle => 'अपडेट उपलब्ध';

  @override
  String get whatsNewTitle => 'क्या नया है:';

  @override
  String get exitAppBtn => 'बाहर निकलें';

  @override
  String get retryBtn => 'पुनः प्रयास करें';

  @override
  String get downloadFromWebsiteBtn => 'वेबसाइट से डाउनलोड करें';

  @override
  String get skipUpdateConfirmTitle => 'अपडेट छोड़ें?';

  @override
  String get skipUpdateConfirmDesc =>
      'इस अपडेट में महत्वपूर्ण सुधार शामिल हैं।';

  @override
  String get skipUpdateCancelBtn => 'रद्द करें';

  @override
  String get skipUpdateConfirmBtn => 'अपडेट छोड़ें';

  @override
  String get maintenanceTitle => 'रखरखाव';

  @override
  String get maintenanceDescDefault => 'Shrinkeo अभी रखरखाव में है।';

  @override
  String versionAvailableMsg(String version) {
    return 'संस्करण $version उपलब्ध है।';
  }

  @override
  String get hwEncoderNotSupportedTitle => 'हार्डवेयर त्वरण समर्थित नहीं है';

  @override
  String get failedCreateFolderError => 'फ़ोल्डर बनाने में विफल';

  @override
  String get failedProbeDurationError => 'अवधि का पता लगाने में विफल';

  @override
  String get ffmpegNotFoundGlobalError => 'FFmpeg नहीं मिला।';

  @override
  String get ffmpegMissingError => 'FFmpeg या FFprobe गायब या क्षतिग्रस्त है।';

  @override
  String hwFallbackNotificationBody(String encoderLabel) {
    return '$encoderLabel विफल रहा। CPU पर स्विच किया गया।';
  }

  @override
  String get failedDownloadUpdateMsg =>
      'अपडेट डाउनलोड करने में विफल। कृपया पुनः प्रयास करें。';

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
  String get tabImageSuite => 'इमेज सुइट';

  @override
  String get compressionModeTitle => 'कंप्रेशन मोड';

  @override
  String get smartAutoLabel => 'स्मार्ट ऑटो';

  @override
  String get smartAutoDesc =>
      '100% स्पष्टता के साथ फ़ाइल आकार को स्वचालित रूप से ~60-80% कम करता है।';

  @override
  String get maxSavingsLabel => 'अधिकतम बचत';

  @override
  String get maxSavingsDesc =>
      'आक्रामक कंप्रेशन से 85-90% तक फ़ाइल आकार बचता है। फ़ास्ट मैसेजिंग के लिए सर्वश्रेष्ठ।';

  @override
  String get ultraFidelityLabel => 'अल्ट्रा क्वालिटी';

  @override
  String get ultraFidelityDesc =>
      'न्यूनतम कंप्रेशन के साथ मूल गुणवत्ता बनाए रखता है। फोटोग्राफी आर्काइव के लिए आदर्श।';

  @override
  String get targetImageFormatTitle => 'टारगेट इमेज फॉर्मेट';

  @override
  String get dimensionResizingTitle => 'आकार बदलें';

  @override
  String get exifCameraPrivacyTitle => 'EXIF / कैमरा गोपनीयता';

  @override
  String get stripGpsCameraInfoLabel => 'GPS और कैमरा जानकारी हटाएं';

  @override
  String get intentCompressOnly => 'केवल संपीड़ित करें';

  @override
  String get intentCompressOnlyTooltip =>
      'फ़ाइल का आकार (गुणवत्ता % या लक्ष्य KB/MB) कम करने पर पूर्णतः ध्यान दें';

  @override
  String get intentEditConvertOnly => 'केवल संपादित/रूपांतरित करें';

  @override
  String get intentEditConvertOnlyTooltip =>
      'दृश्य गुणवत्ता को कम किए बिना प्रारूप का आकार बदलें, घुमाएँ, ट्रिम करें या परिवर्तित करें';

  @override
  String get intentCompressAndEdit => 'संपीड़ित करें और संपादित करें';

  @override
  String get intentCompressAndEditTooltip =>
      'पूर्ण नियंत्रण: फ़ाइल आकार को एक साथ संपादित करें, आकार बदलें, घुमाएँ और संपीड़ित करें';
}
