// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Urdu (`ur`).
class AppLocalizationsUr extends AppLocalizations {
  AppLocalizationsUr([String locale = 'ur']) : super(locale);

  @override
  String get appName => 'Shrinkeo';

  @override
  String get totalSpaceSaved => 'کل محفوظ شدہ جگہ';

  @override
  String get savedSpacePrefix => 'بچت:';

  @override
  String get supportButtonText => 'پراجیکٹ کا تعاون کریں';

  @override
  String get lightThemeTooltip => 'لائٹ تھیم';

  @override
  String get darkThemeTooltip => 'ڈارک تھیم';

  @override
  String get settingsTooltip => 'ترتیبات';

  @override
  String get minimizeTooltip => 'چھوٹا کریں';

  @override
  String get closeTooltip => 'بند کریں';

  @override
  String get restoreTooltip => 'بحال کریں';

  @override
  String get maximizeTooltip => 'بڑا کریں';

  @override
  String get tabCompressionQuality => 'کمپریشن اور کوالٹی';

  @override
  String get tabVideoEditingTools => 'ویڈیو ایڈیٹنگ اور ٹولز';

  @override
  String get tabAudioSettings => 'آڈیو ترتیبات';

  @override
  String get tabEngineOutput => 'انجن اور آؤٹ پٹ';

  @override
  String get compressionSettingsTitle => 'کمپریشن کی ترتیبات';

  @override
  String get resetToDefaults => 'ڈیفالٹ پر ری سیٹ کریں';

  @override
  String get resetDefaultTooltip => 'ابتدائی قدروں پر ری سیٹ کریں';

  @override
  String get modeTargetSizeTitle => 'کمپریشن موڈ';

  @override
  String get modeCrfLabel => 'کوالٹی (CRF)';

  @override
  String get modeTargetSizeLabel => 'ٹارگٹ سائز (MB)';

  @override
  String get crfQualityTitle => 'CRF کوالٹی فیکٹر';

  @override
  String get crfLossless => 'بے نقصان';

  @override
  String get crfHighQuality => 'اعلی معیار';

  @override
  String get crfBalanced => 'متوازن';

  @override
  String get crfHighCompression => 'ہائی کمپریشن';

  @override
  String get crfLowQuality => 'کم معیار';

  @override
  String get crfUltraCompressed => 'الٹرا کمپریسڈ';

  @override
  String get targetSizeLabel => 'ٹارگٹ فائل سائز (MB)';

  @override
  String get targetSizeDesc =>
      'سائز کی حد کے اندر فٹ ہونے کے لیے بٹ ریٹ کا حساب لگاتا ہے۔';

  @override
  String get encodingSpeedTitle => 'انکوڈنگ کی رفتار';

  @override
  String get presetUltrafastLabel => 'انتہائی تیز';

  @override
  String get presetUltrafastDesc =>
      'سب سے تیز رفتار، لیکن سائز میں سب سے کم کمی۔';

  @override
  String get presetSuperfastLabel => 'سپر فاسٹ';

  @override
  String get presetSuperfastDesc => 'بہت تیز انکوڈنگ۔';

  @override
  String get presetVeryfastLabel => 'بہت تیز';

  @override
  String get presetVeryfastDesc => 'اوسط سے زیادہ تیز۔';

  @override
  String get presetFasterLabel => 'تیز تر';

  @override
  String get presetFasterDesc => 'اچھی رفتار اور بہترین کمپریشن۔';

  @override
  String get presetFastLabel => 'تیز';

  @override
  String get presetFastDesc => 'رفتار اور سائز کی بچت کا بہترین توازن۔';

  @override
  String get presetMediumLabel => 'درمیانہ';

  @override
  String get presetMediumDesc => 'ڈیفالٹ توازن۔';

  @override
  String get presetSlowLabel => 'سست';

  @override
  String get presetSlowDesc => 'سست لیکن کافی چھوٹی فائلیں بناتا ہے۔';

  @override
  String get presetVeryslowLabel => 'بہت سست';

  @override
  String get presetVeryslowDesc => 'زیادہ سے زیادہ سائز کی کمی۔';

  @override
  String get videoCodecTitle => 'ویڈیو کوڈیک';

  @override
  String get codecH264Label => 'H.264';

  @override
  String get codecH264Desc => 'زیادہ سے زیادہ مطابقت۔';

  @override
  String get codecH265Label => 'H.265 / HEVC';

  @override
  String get codecH265Desc => 'بہتر کمپریشن کارکردگی۔';

  @override
  String get codecAv1Label => 'AV1';

  @override
  String get codecAv1Desc => 'اگلی نسل کا کوڈیک (H.265 سے 30% چھوٹا)۔';

  @override
  String get hardwareEncoderTitle => 'ہارڈ ویئر ایکسلریشن (GPU)';

  @override
  String get hwSoftwareLabel => 'سافٹ ویئر (CPU)';

  @override
  String get hwSoftwareDesc => 'سب سے سست لیکن بہترین مطابقت۔';

  @override
  String get hwNvidiaLabel => 'Nvidia (NVENC)';

  @override
  String get hwNvidiaDesc => 'Nvidia GPU کے لیے انتہائی تیز انکوڈنگ۔';

  @override
  String get hwAmdLabel => 'AMD (AMF)';

  @override
  String get hwAmdDesc => 'AMD GPU کے لیے انتہائی تیز انکوڈنگ۔';

  @override
  String get hwIntelLabel => 'Intel (QSV)';

  @override
  String get hwIntelDesc => 'Intel GPU کے لیے انتہائی تیز انکوڈنگ۔';

  @override
  String get resolutionTitle => 'زیادہ سے زیادہ ریزولیوشن';

  @override
  String get resOriginalLabel => 'اصل';

  @override
  String get resOriginalDesc => 'اصل ریزولیوشن برقرار رکھیں۔';

  @override
  String get res4kLabel => '4K';

  @override
  String get res4kDesc => 'زیادہ سے زیادہ 4K تک کم کریں۔';

  @override
  String get res2kLabel => '2K';

  @override
  String get res2kDesc => 'زیادہ سے زیادہ 2K تک کم کریں۔';

  @override
  String get res1080pLabel => '1080p';

  @override
  String get res1080pDesc => 'زیادہ سے زیادہ 1080p Full HD تک کم کریں۔';

  @override
  String get res720pLabel => '720p';

  @override
  String get res720pDesc => 'زیادہ سے زیادہ 720p HD تک کم کریں۔';

  @override
  String get res480pLabel => '480p';

  @override
  String get res480pDesc => '480p پر کم کریں۔';

  @override
  String get res360pLabel => '360p';

  @override
  String get res360pDesc => 'زیادہ سے زیادہ کمپریشن۔';

  @override
  String get frameRateTitle => 'فریم ریٹ (FPS)';

  @override
  String get fpsOriginalLabel => 'اصل';

  @override
  String get fpsOriginalDesc => 'سورس ویڈیو کے مساوی FPS۔';

  @override
  String get fps60Label => '60 fps';

  @override
  String get fps60Desc => 'گیمنگ یا کھیلوں کے لیے ہموار۔';

  @override
  String get fps30Label => '30 fps';

  @override
  String get fps30Desc => 'زیادہ تر ویڈیوز کے لیے معیار۔';

  @override
  String get fps24Label => '24 fps';

  @override
  String get fps24Desc => 'سنیما کا انداز۔';

  @override
  String get enableVideoDenoiseTitle => 'ویڈیو شور کی صفائی';

  @override
  String get enableVideoDenoiseDesc => 'شور کو ہٹانے کے لیے 3D فلٹر۔';

  @override
  String get exportFormatTitle => 'برآمد کی شکل';

  @override
  String get exportVideoLabel => 'معیاری ویڈیو';

  @override
  String get exportVideoDesc => 'MP4/MKV/MOV کے طور پر نکالیں';

  @override
  String get exportGifLabel => 'متحرک GIF';

  @override
  String get exportGifDesc => 'اعلی معیار کی متحرک GIF بنائیں';

  @override
  String get exportMp3Label => 'MP3 حاصل کریں';

  @override
  String get exportMp3Desc => 'آڈیو کو 320kbps MP3 کے طور پر نکالیں';

  @override
  String get exportAacLabel => 'AAC حاصل کریں';

  @override
  String get exportAacDesc => 'آڈیو کو AAC کے طور پر نکالیں';

  @override
  String get exportWavLabel => 'WAV حاصل کریں';

  @override
  String get exportWavDesc => 'غیر کمپریس شدہ WAV آڈیو نکالیں';

  @override
  String get privacyScrubbingTitle => 'رازداری اور GPS';

  @override
  String get keepMetadataLabel => 'ڈیٹا رکھیں';

  @override
  String get stripGpsExifLabel => 'GPS/EXIF مٹائیں';

  @override
  String get stripGpsExifInfoTitle => 'میٹا ڈیٹا صاف کریں';

  @override
  String get stripGpsExifInfoDesc => 'کیمرے کی معلومات اور GPS مقام مٹائیں۔';

  @override
  String get keepMetadataInfoDesc => 'تمام اصل میٹا ڈیٹا محفوظ رکھیں۔';

  @override
  String get autoCropBlackBarsTitle => 'سیاہ پٹیاں خود کار طریقے سے کاٹیں';

  @override
  String get autoCropLabel => 'خودکار کراپ';

  @override
  String get autoCropActiveTitle => 'خودکار کراپ فعال';

  @override
  String get autoCropActiveDesc => 'سیاہ پٹیوں کو خود بخود ختم کرتا ہے۔';

  @override
  String get autoCropDisabledDesc => 'اصل بارڈر برقرار رکھتا ہے۔';

  @override
  String get playbackSpeedTitle => 'پلے بیک کی رفتار';

  @override
  String get speedOriginalLabel => '1.0x';

  @override
  String get speedOriginalDesc => 'عام رفتار';

  @override
  String get speedSlow05Label => '0.5x سست';

  @override
  String get speedSlow05Desc => 'آدھی رفتار پر چلائیں';

  @override
  String get speedFast15Label => '1.5x';

  @override
  String get speedFast15Desc => '1.5 گنا تیز';

  @override
  String get speedFast20Label => '2.0x تیز';

  @override
  String get speedFast20Desc => 'دوگنی رفتار';

  @override
  String get speedTimelapse40Label => '4.0x ٹائم لیپس';

  @override
  String get speedTimelapse40Desc => '4 گنا تیز ٹائم لیپس رفتار';

  @override
  String get canvasAspectRatioTitle => 'تناسب ابعاد';

  @override
  String get aspectOriginalLabel => 'اصل';

  @override
  String get aspectOriginalDesc => 'اصل تناسب برقرار رکھیں';

  @override
  String get aspectShortsLabel => '9:16 شارٹس';

  @override
  String get aspectShortsDesc => 'TikTok اور Reels کے لیے';

  @override
  String get aspectSquareLabel => '1:1 مربع';

  @override
  String get aspectSquareDesc => 'Instagram پوسٹ کے لیے';

  @override
  String get aspectPortraitLabel => '4:5 پورٹریٹ';

  @override
  String get aspectPortraitDesc => 'Instagram عمودی کے لیے';

  @override
  String get aspectWidescreenLabel => '16:9 عریض';

  @override
  String get aspectWidescreenDesc => 'YouTube اور ٹی وی کے لیے';

  @override
  String get aspectClassicLabel => '4:3 کلاسک';

  @override
  String get aspectClassicDesc => 'کلاسک سکرین کے لیے';

  @override
  String get aspectCinemaLabel => '21:9 سنیما';

  @override
  String get aspectCinemaDesc => 'الٹرا وائیڈ مانیٹر کے لیے';

  @override
  String get aspectCustomLabel => 'کسٹم تناسب';

  @override
  String get aspectCustomDesc => 'اپنی مرضی کا تناسب';

  @override
  String get customRatioTooltip => 'مثال: 16:10, 2:1';

  @override
  String get rotationFlipTitle => 'روٹیشن اور فلپ';

  @override
  String get rotOriginalLabel => 'اصل (0°)';

  @override
  String get rotOriginalDesc => 'اصل سمت برقرار رکھیں';

  @override
  String get rot90Label => '90° دائیں';

  @override
  String get rot90Desc => 'گھڑی کی سمت میں 90 ڈگری گھمائیں';

  @override
  String get rot180Label => '180° الٹا';

  @override
  String get rot180Desc => 'اوپر سے نیچے گھمائیں';

  @override
  String get rot270Label => '270° بائیں';

  @override
  String get rot270Desc => 'گھڑی کی مخالف سمت میں 90 ڈگری گھمائیں';

  @override
  String get rotFlipHLabel => 'افقی فلپ';

  @override
  String get rotFlipHDesc => 'مرر فلپ دائیں بائیں';

  @override
  String get rotFlipVLabel => 'عمودی فلپ';

  @override
  String get rotFlipVDesc => 'مرر فلپ اوپر نیچے';

  @override
  String get rotCustomLabel => 'کسٹم زاویہ';

  @override
  String get rotCustomDesc => 'مخصوص زاویے پر گھمائیں';

  @override
  String get customRotationTooltip => 'ڈگری میں زاویہ جیسے 45';

  @override
  String get trimVideoTitle => 'ویڈیو ٹرم کریں';

  @override
  String get fullVideoLabel => 'مکمل ویڈیو';

  @override
  String get cutClipLabel => 'کلپ کاٹیں';

  @override
  String get trimStartLabel => 'شروع';

  @override
  String get trimEndLabel => 'آخری';

  @override
  String get trimActiveTitle => 'کٹنگ موڈ فعال';

  @override
  String get fullVideoDesc => 'بغیر کاٹے مکمل ویڈیو پروسیس کریں۔';

  @override
  String get audioModeTitle => 'آڈیو ٹریک موڈ';

  @override
  String get audioOriginalLabel => 'اصل';

  @override
  String get audioOriginalDesc => 'کوالٹی کا نقصان نہیں۔';

  @override
  String get audioAac256Label => 'اعلی کوالٹی (256k)';

  @override
  String get audioAac256Desc => 'AAC 256kbps';

  @override
  String get audioAac128Label => 'متوازن (128k)';

  @override
  String get audioAac128Desc => 'AAC 128kbps (ویب معیار)';

  @override
  String get audioAac64Label => 'کم سائز (64k)';

  @override
  String get audioAac64Desc => 'AAC 64kbps آواز کے لیے';

  @override
  String get audioMuteLabel => 'خاموش کریں';

  @override
  String get audioMuteDesc => 'آڈیو ٹریک مکمل طور پر ہٹائیں۔';

  @override
  String get audioNormTitle => 'آواز کی سطح برابر کرنا';

  @override
  String get audioNormOffLabel => 'بند';

  @override
  String get audioNormOffDesc => 'اصل آواز رکھیں سست یا تیز۔';

  @override
  String get audioNormSpeechLabel => 'انسانی آواز';

  @override
  String get audioNormSpeechDesc => 'EBU R128 صاف بات چیت کے لیے۔';

  @override
  String get audioNormDynamicLabel => 'سنیما ڈائنامک';

  @override
  String get audioNormDynamicDesc => 'سست اور تیز آوازوں کو متوازن کرتا ہے۔';

  @override
  String get audioNormBoostLabel => 'ہلکا اضافہ';

  @override
  String get audioNormBoostDesc => '+3dB آواز بڑھائیں۔';

  @override
  String get audioChanTitle => 'آڈیو چینلز';

  @override
  String get audioChanOriginalLabel => 'اصل';

  @override
  String get audioChanOriginalDesc => 'اصل چینل برقرار رکھیں۔';

  @override
  String get audioChanStereoLabel => 'سٹیریو (2.0)';

  @override
  String get audioChanStereoDesc => 'معیاری 2-چینل سٹیریو۔';

  @override
  String get audioChanMonoLabel => 'مونو (1.0)';

  @override
  String get audioChanMonoDesc => '1-چینل میں تبدیل - 50% سائز کی بچت۔';

  @override
  String get removeNoiseLabel => 'شور ہٹائیں';

  @override
  String get enableAudioDenoiseTitle => 'مائیک اور پنکھے کا شور ہٹائیں';

  @override
  String get enableAudioDenoiseDesc => 'پس منظر کا شور ختم کرنے کا فلٹر۔';

  @override
  String get outputDirectoryTitle => 'آؤٹ پٹ فولڈر';

  @override
  String get defaultOutputDirectory => 'ڈیفالٹ (اصل فائل کے پاس)';

  @override
  String get selectOutputFolderTitle => 'فولڈر منتخب کریں';

  @override
  String get clearOutputFolder => 'ڈیفالٹ مقام استعمال کریں';

  @override
  String get changeBtn => 'تبدیل کریں';

  @override
  String get outputLocationTitle => 'آؤٹ پٹ کا رویہ';

  @override
  String get outputLocationUnifiedLabel => 'ایک فولڈر';

  @override
  String get outputLocationUnifiedDesc => 'تمام کمپریس ویڈیوز ایک فولڈر میں۔';

  @override
  String get outputLocationSameLabel => 'اصل فائل کے پاس';

  @override
  String get outputLocationSameDesc => 'ہر ویڈیو اپنی اصل فائل کے پاس۔';

  @override
  String get fileManagementTitle => 'فائل مینجمنٹ';

  @override
  String get keepOriginalsLabel => 'اصل فائلیں رکھیں';

  @override
  String get keepOriginalsDesc => 'اصل فائلوں کو محفوظ رکھیں۔';

  @override
  String get toRecycleBinLabel => 'ری سائیکل بن میں بھیجیں';

  @override
  String get toRecycleBinDesc =>
      'کمپریشن کے بعد اصل فائلوں کو ری سائیکل بن میں بھیجیں۔';

  @override
  String get outputFormatTitle => 'کنٹینر فارمیٹ';

  @override
  String get formatOriginalLabel => 'اصل';

  @override
  String get formatOriginalDesc => 'اصل فارمیٹ برقرار رکھیں۔';

  @override
  String get formatMp4Label => 'MP4';

  @override
  String get formatMp4Desc => 'زیادہ سے زیادہ مطابقت۔';

  @override
  String get formatMkvLabel => 'MKV';

  @override
  String get formatMkvDesc => 'ملٹی ٹریک سپورٹ۔';

  @override
  String get formatMovLabel => 'MOV';

  @override
  String get formatMovDesc => 'Apple QuickTime فارمیٹ۔';

  @override
  String get scanningFilesMsg => 'فائلوں کی اسکیننگ ہو رہی ہے...';

  @override
  String get addFilesBtn => 'فائلیں شامل کریں';

  @override
  String get addFolderBtn => 'فولڈر شامل کریں';

  @override
  String get dragDropMoreMsg => 'یا مزید ویڈیوز یہاں ڈریگ اور ڈراپ کریں';

  @override
  String get openOutputFolderTooltip => 'آؤٹ پٹ فولڈر کھولیں';

  @override
  String get statusQueued => 'قطار میں';

  @override
  String get statusAnalyzing => 'تجزیہ';

  @override
  String get statusCompressing => 'کمپریس ہو رہا ہے';

  @override
  String get statusDone => 'مکمل';

  @override
  String get statusFailed => 'ناکام';

  @override
  String get statusCancelled => 'منسوخ شدہ';

  @override
  String get savedPrefix => 'بچت';

  @override
  String get largerSuffix => 'بڑا';

  @override
  String get largerSizeWarning => 'آؤٹ پٹ سائز اصل سے بڑا ہو سکتا ہے۔';

  @override
  String get clearCompletedBtn => 'مکمل صاف کریں';

  @override
  String get clearAllBtn => 'تمام صاف کریں';

  @override
  String get stopAllBtn => 'تمام روکیں';

  @override
  String get startCompressionBtn => 'کمپریشن شروع کریں';

  @override
  String get allDoneLabel => 'سب مکمل ہو گیا!';

  @override
  String get openFolderBtn => 'فولڈر کھولیں';

  @override
  String get totalEtaLabel => 'باقی وقت';

  @override
  String get totalSavedLabel => 'کل بچت';

  @override
  String get videoSingle => 'ویڈیو';

  @override
  String get videosPlural => 'ویڈیوز';

  @override
  String get releaseToAddVideosMsg => 'ویڈیوز شامل کرنے کے لیے چھوڑیں';

  @override
  String get dragDropHereMsg => 'فائلیں یا فولڈر یہاں ڈریگ اور ڈراپ کریں';

  @override
  String get supportedFormatsMsg => 'MP4, MKV, MOV, AVI, WMV سپورٹڈ';

  @override
  String get selectFilesBtn => 'فائلیں منتخب کریں';

  @override
  String get selectFolderBtn => 'فولڈر منتخب کریں';

  @override
  String get releaseToShrinkTitle => 'کمپریس کرنے کے لیے چھوڑیں';

  @override
  String get filesWillBeAddedDesc =>
      'آپ کی فائلیں قطار میں شامل کر دی جائیں گی۔';

  @override
  String get disabledLabel => 'غیر فعال';

  @override
  String get compressionInProgressTitle => 'کمپریشن جاری ہے';

  @override
  String get confirmCloseDesc => 'کیا آپ سچ مچ Shrinkeo بند کرنا چاہتے ہیں؟';

  @override
  String get keepCompressingBtn => 'کمپریشن جاری رکھیں';

  @override
  String get closeAppBtn => 'ایپ بند کریں';

  @override
  String get lockedSettingsWarning => 'کمپریشن کے دوران مقفل ہے';

  @override
  String get updateRequiredTitle => 'اپ ڈیٹ ضروری ہے';

  @override
  String get updateRequiredDescNewVersion => 'ایک نیا اپ ڈیٹ دستیاب ہے۔';

  @override
  String get updateRequiredDescOldVersion => 'آپ کا ورژن اب سپورٹڈ نہیں ہے۔';

  @override
  String get updateNowBtn => 'ابھی اپ ڈیٹ کریں';

  @override
  String get laterBtn => 'بعد میں';

  @override
  String get updateAvailableTitle => 'اپ ڈیٹ دستیاب ہے';

  @override
  String get whatsNewTitle => 'نیا کیا ہے:';

  @override
  String get exitAppBtn => 'باہر نکلیں';

  @override
  String get retryBtn => 'دوبارہ کوشش کریں';

  @override
  String get downloadFromWebsiteBtn => 'ویب سائٹ سے ڈاؤن لوڈ کریں';

  @override
  String get skipUpdateConfirmTitle => 'اپ ڈیٹ چھوڑیں؟';

  @override
  String get skipUpdateConfirmDesc => 'اس اپ ڈیٹ میں اہم اصلاحات شامل ہیں۔';

  @override
  String get skipUpdateCancelBtn => 'منسوخ کریں';

  @override
  String get skipUpdateConfirmBtn => 'اپ ڈیٹ چھوڑیں';

  @override
  String get maintenanceTitle => 'دیکھ بھال';

  @override
  String get maintenanceDescDefault =>
      'Shrinkeo ابھی دیکھ بھال کے مرحلے میں ہے۔';

  @override
  String versionAvailableMsg(String version) {
    return 'ورژن $version دستیاب ہے۔';
  }

  @override
  String get hwEncoderNotSupportedTitle => 'ہارڈ ویئر ایکسلریشن سپورٹڈ نہیں ہے';

  @override
  String get failedCreateFolderError => 'فولڈر بنانے میں ناکامی';

  @override
  String get failedProbeDurationError => 'دورانیے کی نشاندہی میں ناکامی';

  @override
  String get ffmpegNotFoundGlobalError => 'FFmpeg نہیں ملا۔';

  @override
  String get ffmpegMissingError => 'FFmpeg یا FFprobe غائب یا خراب ہے۔';

  @override
  String hwFallbackNotificationBody(String encoderLabel) {
    return '$encoderLabel ناکام رہا۔ CPU پر سوئچ کر دیا گیا۔';
  }

  @override
  String get failedDownloadUpdateMsg =>
      'اپ ڈیٹ ڈاؤن لوڈ میں ناکامی ہوئی۔ دوبارہ کوشش کریں۔';

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
  String get tabImageSuite => 'امیج ٹولز';

  @override
  String get compressionModeTitle => 'کمپریشن موڈ';

  @override
  String get smartAutoLabel => 'اسمارٹ اٹو';

  @override
  String get smartAutoDesc =>
      '100% شفافیت کے ساتھ خودکار طور پر فائل کا سائز 60-80% کم کرتا ہے۔';

  @override
  String get maxSavingsLabel => 'زیادہ سے زیادہ بچت';

  @override
  String get maxSavingsDesc =>
      'شدید کمپریشن جو 85-90% تک سائز بچاتی ہے۔ تیز پیغامات کے لیے بہترین۔';

  @override
  String get ultraFidelityLabel => 'الٹرا کوالٹی';

  @override
  String get ultraFidelityDesc =>
      'کم سے کم کمپریشن کے ساتھ اصل معیار برقرار رکھتا ہے۔ پرنٹ اور آرکائیو کے لیے بہترین۔';

  @override
  String get targetImageFormatTitle => 'ٹارگٹ امیج فارمیٹ';

  @override
  String get dimensionResizingTitle => 'سائز تبدیل کریں';

  @override
  String get exifCameraPrivacyTitle => 'EXIF / کیمرہ پرائیویسی';

  @override
  String get stripGpsCameraInfoLabel => 'GPS اور کیمرہ معلومات ہٹائیں';

  @override
  String get intentCompressOnly => 'صرف کمپریس کریں۔';

  @override
  String get intentCompressOnlyTooltip =>
      'مکمل طور پر فائل کا سائز کم کرنے پر توجہ مرکوز کریں (معیار % یا ہدف KB/MB)';

  @override
  String get intentEditConvertOnly => 'صرف ترمیم / تبدیل کریں۔';

  @override
  String get intentEditConvertOnlyTooltip =>
      'بصری معیار کو کم کیے بغیر فارمیٹ کا سائز تبدیل کریں، گھمائیں، تراشیں یا تبدیل کریں۔';

  @override
  String get intentCompressAndEdit => 'کمپریس اور ترمیم کریں۔';

  @override
  String get intentCompressAndEditTooltip =>
      'مکمل کنٹرول: ایک ساتھ فائل کے سائز میں ترمیم کریں، سائز تبدیل کریں، گھمائیں اور کمپریس کریں۔';

  @override
  String get imgFmtOriginalLabel => 'اصل شکل';

  @override
  String get imgFmtOriginalDesc =>
      'اصل شکل رکھیں (تیز ترین، کوئی تبدیلی نہیں)۔';

  @override
  String get imgFmtPngLabel => 'PNG تصویر (.png)';

  @override
  String get imgFmtPngDesc =>
      'شفافیت کی حمایت کے ساتھ نقصان کے بغیر PNG فارمیٹ۔';

  @override
  String get imgFmtJpgLabel => 'JPEG تصویر (.jpg)';

  @override
  String get imgFmtJpgDesc =>
      'عالمگیر مطابقت کے لیے معیاری کمپریسڈ JPEG فارمیٹ۔';

  @override
  String get imgFmtWebpLabel => 'WebP تصویر (.webp)';

  @override
  String get imgFmtWebpDesc =>
      'جدید WebP فارمیٹ اعلی کمپریشن اور چھوٹے سائز کی پیشکش کرتا ہے۔';

  @override
  String get imgFmtAvifLabel => 'AVIF تصویر (.avif)';

  @override
  String get imgFmtAvifDesc =>
      'الٹرا ہائی کمپریشن کارکردگی کے ساتھ اگلی نسل کا AVIF فارمیٹ۔';

  @override
  String get imgResOriginalLabel => 'اصل ابعاد';

  @override
  String get imgResOriginalDesc =>
      'اصل تصویر کی چوڑائی اور اونچائی کے طول و عرض رکھیں۔';

  @override
  String get imgRes4kLabel => '4K Max (3840px)';

  @override
  String get imgRes4kDesc =>
      'تصویر کی زیادہ سے زیادہ جہت کو 3840px (4K زیادہ سے زیادہ) تک پیمانہ کریں۔';

  @override
  String get imgRes1080pLabel => 'Full HD Max (1920px)';

  @override
  String get imgRes1080pDesc =>
      'تصویر کی زیادہ سے زیادہ جہت کو 1920px (Full HD max) تک پیمانہ کریں۔';

  @override
  String get imgRes720pLabel => 'HD Max (1280px)';

  @override
  String get imgRes720pDesc =>
      'تصویر کی زیادہ سے زیادہ جہت کو 1280px (HD max) تک کم کریں۔';

  @override
  String get imgRes480pLabel => 'SD Max (854px)';

  @override
  String get imgRes480pDesc =>
      'تصویر کی زیادہ سے زیادہ جہت کو 854px (SD max) تک کم کریں۔';

  @override
  String get keepMetadataImageInfoDesc =>
      'اصل تصویر EXIF ​​​​اور کیمرہ میٹا ڈیٹا کو محفوظ کرتا ہے۔';

  @override
  String get cleanNoiseLabel => 'Clean Noise';

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
    return 'Successfully compressed $success videos.';
  }

  @override
  String notifyCompressionCompleteFailed(String failed) {
    return ' ($failed failed)';
  }

  @override
  String notifyOutputLargerDesc(String fileName) {
    return '$fileName is expected to be larger than the original file size. Consider cancelling and resetting settings to default.';
  }
}
