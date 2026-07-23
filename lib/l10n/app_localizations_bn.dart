// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Bengali Bangla (`bn`).
class AppLocalizationsBn extends AppLocalizations {
  AppLocalizationsBn([String locale = 'bn']) : super(locale);

  @override
  String get appName => 'Shrinkeo';

  @override
  String get totalSpaceSaved => 'মোট সংরক্ষিত স্থান';

  @override
  String get savedSpacePrefix => 'সংরক্ষিত:';

  @override
  String get supportButtonText => 'প্রকল্পটি সমর্থন করুন';

  @override
  String get lightThemeTooltip => 'লাইট থিম';

  @override
  String get darkThemeTooltip => 'ডার্ক থিম';

  @override
  String get settingsTooltip => 'সেটিংস';

  @override
  String get minimizeTooltip => 'ক্ষুদ্রতর করুন';

  @override
  String get closeTooltip => 'বন্ধ করুন';

  @override
  String get restoreTooltip => 'পুনরুদ্ধার করুন';

  @override
  String get maximizeTooltip => 'বৃহত্তর করুন';

  @override
  String get tabCompressionQuality => 'কম্প্রেশন এবং কোয়ালিটি';

  @override
  String get tabVideoEditingTools => 'ভিডিও এডিটিং এবং টুলস';

  @override
  String get tabAudioSettings => 'অডিও সেটিংস';

  @override
  String get tabEngineOutput => 'ইঞ্জিন এবং আউটপুট';

  @override
  String get compressionSettingsTitle => 'কম্প্রেশন সেটিংস';

  @override
  String get resetToDefaults => 'ডিফল্ট অবস্থায় ফেরান';

  @override
  String get resetDefaultTooltip => 'প্রাথমিক মানে পুনর্নির্ধারণ করুন';

  @override
  String get modeTargetSizeTitle => 'কম্প্রেশন মোড';

  @override
  String get modeCrfLabel => 'কোয়ালিটি (CRF)';

  @override
  String get modeTargetSizeLabel => 'টার্গেট সাইজ (MB)';

  @override
  String get crfQualityTitle => 'CRF কোয়ালিটি ফ্যাক্টর';

  @override
  String get targetSizeLabel => 'টার্গেট ফাইল সাইজ (MB)';

  @override
  String get targetSizeDesc => 'সাইজ সীমার মধ্যে ফিট করতে বিটরেট গণনা করে।';

  @override
  String get encodingSpeedTitle => 'এনকোডিং স্পিড';

  @override
  String get presetUltrafastLabel => 'আল্ট্রাফাস্ট';

  @override
  String get presetUltrafastDesc => 'সর্বোচ্চ গতি, তবে সর্বনিম্ন সাইজ হ্রাস।';

  @override
  String get presetSuperfastLabel => 'সুপারফাস্ট';

  @override
  String get presetSuperfastDesc => 'খুব দ্রুত এনকোডিং।';

  @override
  String get presetVeryfastLabel => 'ভেরি ফাস্ট';

  @override
  String get presetVeryfastDesc => 'গড়ের চেয়ে দ্রুত।';

  @override
  String get presetFasterLabel => 'ফাস্টার';

  @override
  String get presetFasterDesc => 'ভালো গতি এবং চমৎকার কম্প্রেশন।';

  @override
  String get presetFastLabel => 'দ্রুত';

  @override
  String get presetFastDesc => 'গতি এবং সাইজের সেরা ভারসাম্য।';

  @override
  String get presetMediumLabel => 'মিডিয়াম';

  @override
  String get presetMediumDesc => 'ডিফল্ট ভারসাম্য।';

  @override
  String get presetSlowLabel => 'স্লো';

  @override
  String get presetSlowDesc => 'ধীরগতি কিন্তু লক্ষণীয় ছোট ফাইল তৈরি করে।';

  @override
  String get presetVeryslowLabel => 'ভেরি স্লো';

  @override
  String get presetVeryslowDesc => 'সর্বোচ্চ সাইজ কমানো।';

  @override
  String get videoCodecTitle => 'ভিডিও কোডেক';

  @override
  String get codecH264Label => 'H.264';

  @override
  String get codecH264Desc => 'সর্বোচ্চ সামঞ্জস্যতা।';

  @override
  String get codecH265Label => 'H.265 / HEVC';

  @override
  String get codecH265Desc => 'উন্নত কম্প্রেশন দক্ষতা।';

  @override
  String get codecAv1Label => 'AV1';

  @override
  String get codecAv1Desc => 'নতুন প্রজন্মের কোডেক (H.265 থেকে 30% ছোট)।';

  @override
  String get hardwareEncoderTitle => 'হার্ডওয়্যার অ্যাক্সিলারেশন (GPU)';

  @override
  String get hwSoftwareLabel => 'সফটওয়্যার (CPU)';

  @override
  String get hwSoftwareDesc => 'সবচেয়ে ধীর কিন্তু সর্বোচ্চ সামঞ্জস্যতা।';

  @override
  String get hwNvidiaLabel => 'Nvidia (NVENC)';

  @override
  String get hwNvidiaDesc => 'Nvidia GPU-র জন্য অত্যন্ত দ্রুত এনকোডিং।';

  @override
  String get hwAmdLabel => 'AMD (AMF)';

  @override
  String get hwAmdDesc => 'AMD GPU-র জন্য অত্যন্ত দ্রুত এনকোডিং।';

  @override
  String get hwIntelLabel => 'Intel (QSV)';

  @override
  String get hwIntelDesc => 'Intel GPU-র জন্য অত্যন্ত দ্রুত এনকোডিং।';

  @override
  String get resolutionTitle => 'সর্বোচ্চ রেজোলিউশন';

  @override
  String get resOriginalLabel => 'মূল';

  @override
  String get resOriginalDesc => 'মূল রেজোলিউশন বজায় রাখুন।';

  @override
  String get res4kLabel => '4K';

  @override
  String get res4kDesc => 'সর্বোচ্চ 4K পর্যন্ত কমান।';

  @override
  String get res2kLabel => '2K';

  @override
  String get res2kDesc => 'সর্বোচ্চ 2K পর্যন্ত কমান।';

  @override
  String get res1080pLabel => '1080p';

  @override
  String get res1080pDesc => 'সর্বোচ্চ 1080p Full HD পর্যন্ত কমান।';

  @override
  String get res720pLabel => '720p';

  @override
  String get res720pDesc => 'সর্বোচ্চ 720p HD পর্যন্ত কমান।';

  @override
  String get res480pLabel => '480p';

  @override
  String get res480pDesc => '480p পর্যন্ত কমান।';

  @override
  String get res360pLabel => '360p';

  @override
  String get res360pDesc => 'সর্বোচ্চ কম্প্রেশন।';

  @override
  String get frameRateTitle => 'ফ্রেমেট (FPS)';

  @override
  String get fpsOriginalLabel => 'মূল';

  @override
  String get fpsOriginalDesc => 'উৎস ভিডিওর সমান FPS।';

  @override
  String get fps60Label => '60 fps';

  @override
  String get fps60Desc => 'গেমিং বা স্পোর্টসের জন্য স্মুথ।';

  @override
  String get fps30Label => '30 fps';

  @override
  String get fps30Desc => 'বেশিরভাগ ভিডিওর জন্য মানসম্মত।';

  @override
  String get fps24Label => '24 fps';

  @override
  String get fps24Desc => 'সিনেমেটিক লুক।';

  @override
  String get enableVideoDenoiseTitle => 'ভিডিও নয়েজ পরিষ্কার';

  @override
  String get enableVideoDenoiseDesc => 'নয়েজ দূর করতে 3D ফিল্টার।';

  @override
  String get exportFormatTitle => 'এক্সপোর্ট ফরম্যাট';

  @override
  String get exportVideoLabel => 'স্ট্যান্ডার্ড ভিডিও';

  @override
  String get exportVideoDesc => 'MP4/MKV/MOV হিসেবে এক্সপোর্ট করুন';

  @override
  String get exportGifLabel => 'অ্যানিমেটেড GIF';

  @override
  String get exportGifDesc => 'উচ্চ মানের অ্যানিমেটেড GIF তৈরি করুন';

  @override
  String get exportMp3Label => 'MP3 এক্সট্র্যাক্ট';

  @override
  String get exportMp3Desc => 'অডিও 320kbps MP3 হিসেবে বের করুন';

  @override
  String get exportAacLabel => 'AAC এক্সট্র্যাক্ট';

  @override
  String get exportAacDesc => 'অডিও AAC হিসেবে বের করুন';

  @override
  String get exportWavLabel => 'WAV এক্সট্র্যাক্ট';

  @override
  String get exportWavDesc => 'আনকমপ্রেসড WAV অডিও বের করুন';

  @override
  String get privacyScrubbingTitle => 'প্রাইভেসি এবং GPS';

  @override
  String get keepMetadataLabel => 'মেটাডেটা রাখুন';

  @override
  String get stripGpsExifLabel => 'GPS/EXIF মুছুন';

  @override
  String get stripGpsExifInfoTitle => 'মেটাডেটা মুছুন';

  @override
  String get stripGpsExifInfoDesc => 'ক্যামেরা তথ্য এবং GPS অবস্থান মুছুন।';

  @override
  String get keepMetadataInfoDesc => 'সমস্ত মূল মেটাডেটা অক্ষুণ্ণ রাখুন।';

  @override
  String get autoCropBlackBarsTitle => 'কালো বর্ডার স্বয়ংক্রিয় ক্রপ';

  @override
  String get autoCropLabel => 'অটো ক্রপ';

  @override
  String get autoCropActiveTitle => 'অটো ক্রপ সক্রিয়';

  @override
  String get autoCropActiveDesc => 'কালো বর্ডার স্বয়ংক্রিয়ভাবে সরায়।';

  @override
  String get autoCropDisabledDesc => 'মূল বর্ডার বজায় রাখে।';

  @override
  String get playbackSpeedTitle => 'প্লেব্যাক স্পিড';

  @override
  String get speedOriginalLabel => '1.0x';

  @override
  String get speedOriginalDesc => 'স্বাভাবিক গতি';

  @override
  String get speedSlow05Label => '0.5x স্লো';

  @override
  String get speedSlow05Desc => 'অর্ধেক গতিতে চালান';

  @override
  String get speedFast15Label => '1.5x';

  @override
  String get speedFast15Desc => '1.5 গুণ দ্রুত';

  @override
  String get speedFast20Label => '2.0x ফাস্ট';

  @override
  String get speedFast20Desc => 'দ্বিগুণ গতি';

  @override
  String get speedTimelapse40Label => '4.0x টাইমক্ল্যাপ্স';

  @override
  String get speedTimelapse40Desc => '4 গুণ দ্রুত টাইমক্ল্যাপ্স';

  @override
  String get canvasAspectRatioTitle => 'অ্যাসপেক্ট রেশিও';

  @override
  String get aspectOriginalLabel => 'মূল';

  @override
  String get aspectOriginalDesc => 'মূল অনুপাত বজায় রাখুন';

  @override
  String get aspectShortsLabel => '9:16 শর্টস';

  @override
  String get aspectShortsDesc => 'TikTok এবং Reels এর জন্য';

  @override
  String get aspectSquareLabel => '1:1 স্কয়ার';

  @override
  String get aspectSquareDesc => 'Instagram পোস্টের জন্য';

  @override
  String get aspectPortraitLabel => '4:5 পোর্ট্রেট';

  @override
  String get aspectPortraitDesc => 'Instagram ভার্টিক্যালের জন্য';

  @override
  String get aspectWidescreenLabel => '16:9 ওয়াইড';

  @override
  String get aspectWidescreenDesc => 'YouTube এবং টিভির জন্য';

  @override
  String get aspectClassicLabel => '4:3 ক্লাসিক';

  @override
  String get aspectClassicDesc => 'ক্লাসিক স্ক্রিনের জন্য';

  @override
  String get aspectCinemaLabel => '21:9 সিনেমা';

  @override
  String get aspectCinemaDesc => 'আল্ট্রাওয়াইড মনিটরের জন্য';

  @override
  String get aspectCustomLabel => 'কাস্টম অনুপাত';

  @override
  String get aspectCustomDesc => 'পছন্দের অনুপাত সেট করুন';

  @override
  String get customRatioTooltip => 'যেমন: 16:10, 2:1';

  @override
  String get rotationFlipTitle => 'রোটেশন এবং ফ্লিপ';

  @override
  String get rotOriginalLabel => 'মূল (0°)';

  @override
  String get rotOriginalDesc => 'মূল দিক বজায় রাখুন';

  @override
  String get rot90Label => '90° ডানে';

  @override
  String get rot90Desc => 'ঘড়ির কাঁটার দিকে ৯০ ডিগ্রি ঘোরান';

  @override
  String get rot180Label => '180° উল্টো';

  @override
  String get rot180Desc => 'উপর থেকে নিচে ঘোরান';

  @override
  String get rot270Label => '270° বামে';

  @override
  String get rot270Desc => 'ঘড়ির কাঁটার বিপরীতে ৯০ ডিগ্রি ঘোরান';

  @override
  String get rotFlipHLabel => 'অনুভূমিক ফ্লিপ';

  @override
  String get rotFlipHDesc => 'মিরর ফিলিপ ডানে-বামে';

  @override
  String get rotFlipVLabel => 'উল্লম্ব ফ্লিপ';

  @override
  String get rotFlipVDesc => 'মিরর ফিলিপ উপরে-নিচে';

  @override
  String get rotCustomLabel => 'কাস্টম কোণ';

  @override
  String get rotCustomDesc => 'নির্দিষ্ট কোণে ঘোরান';

  @override
  String get customRotationTooltip => 'ডিগ্রিতে কোণ যেমন: 45';

  @override
  String get trimVideoTitle => 'ভিডিও ট্রিম করুন';

  @override
  String get fullVideoLabel => 'সম্পূর্ণ ভিডিও';

  @override
  String get cutClipLabel => 'ক্লিপ কাটুন';

  @override
  String get trimStartLabel => 'শুরু';

  @override
  String get trimEndLabel => 'শেষ';

  @override
  String get trimActiveTitle => 'কাটিং মোড চালু';

  @override
  String get fullVideoDesc => 'সম্পূর্ণ ভিডিও প্রসেস করুন।';

  @override
  String get audioModeTitle => 'অডিও ট্র্যাক মোড';

  @override
  String get audioOriginalLabel => 'মূল';

  @override
  String get audioOriginalDesc => 'কোয়ালিটি কমবে না।';

  @override
  String get audioAac256Label => 'উচ্চ কোয়ালিটি (256k)';

  @override
  String get audioAac256Desc => 'AAC 256kbps';

  @override
  String get audioAac128Label => 'ভারসাম্যপূর্ণ (128k)';

  @override
  String get audioAac128Desc => 'AAC 128kbps (ওয়েব মানক)';

  @override
  String get audioAac64Label => 'কম সাইজ (64k)';

  @override
  String get audioAac64Desc => 'AAC 64kbps ভয়েসের জন্য';

  @override
  String get audioMuteLabel => 'মিউট করুন';

  @override
  String get audioMuteDesc => 'অডিও ট্র্যাক সম্পূর্ণ সরিয়ে দিন।';

  @override
  String get audioNormTitle => 'সাউন্ড লেভেল ঠিক করা';

  @override
  String get audioNormOffLabel => 'বন্ধ';

  @override
  String get audioNormOffDesc => 'মূল সাউন্ড বজায় রাখুন।';

  @override
  String get audioNormSpeechLabel => 'মানুষের ভয়েস';

  @override
  String get audioNormSpeechDesc => 'EBU R128 পরিষ্কার কথার জন্য।';

  @override
  String get audioNormDynamicLabel => 'সিনেমা ডায়নামিক';

  @override
  String get audioNormDynamicDesc => 'হালকা ও জোরে শব্দ সমান করে।';

  @override
  String get audioNormBoostLabel => 'হালকা বুস্ট';

  @override
  String get audioNormBoostDesc => '+3dB সাউন্ড বাড়ান।';

  @override
  String get audioChanTitle => 'অডিও চ্যানেল';

  @override
  String get audioChanOriginalLabel => 'মূল';

  @override
  String get audioChanOriginalDesc => 'মূল চ্যানেল অক্ষুণ্ণ রাখুন।';

  @override
  String get audioChanStereoLabel => 'স্টিরিও (2.0)';

  @override
  String get audioChanStereoDesc => 'মানসম্মত ২-চ্যানেল স্টিরিও।';

  @override
  String get audioChanMonoLabel => 'মনো (1.0)';

  @override
  String get audioChanMonoDesc => '১-চ্যানেলে পরিবর্তন - ৫০% অডিও সাইজ সঞ্চয়।';

  @override
  String get removeNoiseLabel => 'নয়েজ সরান';

  @override
  String get enableAudioDenoiseTitle => 'মাইক নয়েজ সরান';

  @override
  String get enableAudioDenoiseDesc => 'ব্যাকগ্রাউন্ড নয়েজ দূর করতে ফিল্টার।';

  @override
  String get outputDirectoryTitle => 'আউটপুট ফোল্ডার';

  @override
  String get defaultOutputDirectory => 'ডিফল্ট (মূল ফাইলের পাশে)';

  @override
  String get selectOutputFolderTitle => 'ফোল্ডার বাছুন';

  @override
  String get clearOutputFolder => 'ডিফল্ট স্থান ব্যবহার করুন';

  @override
  String get changeBtn => 'পরিবর্তন';

  @override
  String get outputLocationTitle => 'আউটপুট আচরণ';

  @override
  String get outputLocationUnifiedLabel => 'একটি ফোল্ডার';

  @override
  String get outputLocationUnifiedDesc => 'সব ভিডিও এক ফোল্ডারে।';

  @override
  String get outputLocationSameLabel => 'মূল ফাইলের পাশে';

  @override
  String get outputLocationSameDesc => 'প্রতিটি ভিডিও তার নিজস্ব ফাইলের পাশে।';

  @override
  String get fileManagementTitle => 'ফাইল ব্যবস্থাপনা';

  @override
  String get keepOriginalsLabel => 'মূল ফাইল রাখুন';

  @override
  String get keepOriginalsDesc => 'মূল ফাইল নিরাপদ রাখুন।';

  @override
  String get toRecycleBinLabel => 'রিসাইকেল বিনে পাঠান';

  @override
  String get toRecycleBinDesc => 'কম্প্রেশন শেষে মূল ফাইল রিসাইকেল বিনে পাঠান।';

  @override
  String get outputFormatTitle => 'কন্টেইনার ফরম্যাট';

  @override
  String get formatOriginalLabel => 'মূল';

  @override
  String get formatOriginalDesc => 'মূল ফরম্যাট বজায় রাখুন।';

  @override
  String get formatMp4Label => 'MP4';

  @override
  String get formatMp4Desc => 'সর্বোচ্চ সামঞ্জস্যতা।';

  @override
  String get formatMkvLabel => 'MKV';

  @override
  String get formatMkvDesc => 'মাল্টি-ট্র্যাক সাপোর্ট।';

  @override
  String get formatMovLabel => 'MOV';

  @override
  String get formatMovDesc => 'Apple QuickTime ফরম্যাট।';

  @override
  String get scanningFilesMsg => 'ফাইল স্ক্যান হচ্ছে...';

  @override
  String get addFilesBtn => 'ফাইল যোগ করুন';

  @override
  String get addFolderBtn => 'ফোল্ডার যোগ করুন';

  @override
  String get dragDropMoreMsg => 'অথবা আরও ভিডিও এখানে টেনে আনুন';

  @override
  String get openOutputFolderTooltip => 'আউটপুট ফোল্ডার খুলুন';

  @override
  String get statusQueued => 'অপেক্ষমান';

  @override
  String get statusAnalyzing => 'বিশ্লেষণ';

  @override
  String get statusCompressing => 'কমপ্রেস হচ্ছে';

  @override
  String get statusDone => 'সম্পন্ন';

  @override
  String get statusFailed => 'ব্যর্থ';

  @override
  String get statusCancelled => 'বাতিল';

  @override
  String get savedPrefix => 'সঞ্চয়';

  @override
  String get largerSuffix => 'বড়';

  @override
  String get largerSizeWarning => 'আউটপুট সাইজ মূল সাইজের চেয়ে বড় হতে পারে।';

  @override
  String get clearCompletedBtn => 'সম্পন্ন সাফ করুন';

  @override
  String get clearAllBtn => 'সব সাফ করুন';

  @override
  String get stopAllBtn => 'সব থামান';

  @override
  String get startCompressionBtn => 'কম্প্রেশন শুরু করুন';

  @override
  String get allDoneLabel => 'সব সম্পন্ন!';

  @override
  String get openFolderBtn => 'ফোল্ডার খুলুন';

  @override
  String get totalEtaLabel => 'বাকি সময়';

  @override
  String get totalSavedLabel => 'মোট সঞ্চয়';

  @override
  String get videoSingle => 'ভিডিও';

  @override
  String get videosPlural => 'ভিডিও';

  @override
  String get releaseToAddVideosMsg => 'ভিডিও যোগ করতে ছেড়ে দিন';

  @override
  String get dragDropHereMsg => 'ফাইল বা ফোল্ডার এখানে টেনে এনে ছাড়ুন';

  @override
  String get supportedFormatsMsg => 'MP4, MKV, MOV, AVI, WMV সমর্থিত';

  @override
  String get selectFilesBtn => 'ফাইল নির্বাচন করুন';

  @override
  String get selectFolderBtn => 'ফোল্ডার নির্বাচন করুন';

  @override
  String get releaseToShrinkTitle => 'কমপ্রেস করতে ছেড়ে দিন';

  @override
  String get filesWillBeAddedDesc => 'আপনার ফাইল লাইনে যোগ করা হবে।';

  @override
  String get disabledLabel => 'নিষ্ক্রিয়';

  @override
  String get compressionInProgressTitle => 'কম্প্রেশন চলছে';

  @override
  String get confirmCloseDesc => 'আপনি কি সত্যিই Shrinkeo বন্ধ করতে চান?';

  @override
  String get keepCompressingBtn => 'কম্প্রেশন চালিয়ে যান';

  @override
  String get closeAppBtn => 'অ্যাপ বন্ধ করুন';

  @override
  String get lockedSettingsWarning => 'কম্প্রেশনের সময় লক থাকে';

  @override
  String get updateRequiredTitle => 'আপডেট প্রয়োজন';

  @override
  String get updateRequiredDescNewVersion => 'নতুন সংস্করণ উপলব্ধ।';

  @override
  String get updateRequiredDescOldVersion => 'আপনার সংস্করণ সমর্থিত নয়।';

  @override
  String get updateNowBtn => 'এখনই আপডেট করুন';

  @override
  String get laterBtn => 'পরে';

  @override
  String get updateAvailableTitle => 'আপডেট উপলব্ধ';

  @override
  String get whatsNewTitle => 'নতুন কী:';

  @override
  String get exitAppBtn => 'প্রস্থান';

  @override
  String get retryBtn => 'পুনরায় চেষ্টা করুন';

  @override
  String get downloadFromWebsiteBtn => 'ওয়েবসাইট থেকে ডাউনলোড করুন';

  @override
  String get skipUpdateConfirmTitle => 'আপডেট এড়িয়ে যাবেন?';

  @override
  String get skipUpdateConfirmDesc => 'এই আপডেটে গুরুত্বপূর্ণ সংশোধন রয়েছে।';

  @override
  String get skipUpdateCancelBtn => 'বাতিল';

  @override
  String get skipUpdateConfirmBtn => 'আপডেট এড়িয়ে যান';

  @override
  String get maintenanceTitle => 'রক্ষণাবেক্ষণ';

  @override
  String get maintenanceDescDefault => 'Shrinkeo এখন রক্ষণাবেক্ষণে আছে।';

  @override
  String versionAvailableMsg(String version) {
    return 'সংস্করণ $version উপলব্ধ।';
  }

  @override
  String get hwEncoderNotSupportedTitle =>
      'হার্ডওয়্যার অ্যাক্সিলারেশন সমর্থিত নয়';

  @override
  String get failedCreateFolderError => 'ফোল্ডার তৈরিতে ব্যর্থ';

  @override
  String get failedProbeDurationError => 'সময়কাল চিহ্নিতকরণে ব্যর্থ';

  @override
  String get ffmpegNotFoundGlobalError => 'FFmpeg পাওয়া যায়নি।';

  @override
  String get ffmpegMissingError => 'FFmpeg ক্ষতিগ্রস্ত বা অনুপস্থিত।';

  @override
  String hwFallbackNotificationBody(String encoderLabel) {
    return '$encoderLabel ব্যর্থ হয়েছে। CPU-তে পরিবর্তন করা হয়েছে।';
  }

  @override
  String get failedDownloadUpdateMsg =>
      'আপডেট ডাউনলোড ব্যর্থ হয়েছে। আবার চেষ্টা করুন।';

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
}
