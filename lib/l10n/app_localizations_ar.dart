// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appName => 'Shrinkeo';

  @override
  String get totalSpaceSaved => 'إجمالي المساحة المحفوظة كلياً';

  @override
  String get savedSpacePrefix => 'تم توفير:';

  @override
  String get supportButtonText => 'ادعم البرنامج';

  @override
  String get lightThemeTooltip => 'الوضع الفاتح';

  @override
  String get darkThemeTooltip => 'الوضع الداكن';

  @override
  String get settingsTooltip => 'الإعدادات';

  @override
  String get minimizeTooltip => 'تصغير';

  @override
  String get closeTooltip => 'إغلاق';

  @override
  String get restoreTooltip => 'استعادة';

  @override
  String get maximizeTooltip => 'تكبير';

  @override
  String get tabCompressionQuality => 'الضغط والجودة';

  @override
  String get tabVideoEditingTools => 'تعديل الفيديوهات والأدوات';

  @override
  String get tabAudioSettings => 'إعدادات الصوت';

  @override
  String get tabEngineOutput => 'المحرك ومجلد الحفظ';

  @override
  String get compressionSettingsTitle => 'إعدادات الضغط';

  @override
  String get resetToDefaults => 'إعادة للإفتراضي';

  @override
  String get resetDefaultTooltip => 'إعادة للقيم الإفتراضية';

  @override
  String get modeTargetSizeTitle => 'نمط استهداف الضغط';

  @override
  String get modeCrfLabel => 'الجودة (CRF)';

  @override
  String get modeTargetSizeLabel => 'حجم محدد (ميجابايت)';

  @override
  String get crfQualityTitle => 'جودة ‎CRF (معامل المعدل الثابت)';

  @override
  String get crfLossless => 'ضياع';

  @override
  String get crfHighQuality => 'جودة عالية';

  @override
  String get crfBalanced => 'متوازن';

  @override
  String get crfHighCompression => 'ضغط عالي';

  @override
  String get crfLowQuality => 'جودة منخفضة';

  @override
  String get crfUltraCompressed => 'مضغوط للغاية';

  @override
  String get targetSizeLabel => 'الحجم المستهدف للملف (ميجابايت)';

  @override
  String get targetSizeDesc =>
      'يحسب معدل البت للالتزام بالحجم المستهدف (الأدنى: ‎1 MB). الحدود المنخفضة جداً للفيديوهات الطويلة ستقلل الجودة البصرية.';

  @override
  String get encodingSpeedTitle => 'سرعة الترميز';

  @override
  String get presetUltrafastLabel => 'فائق السرعة';

  @override
  String get presetUltrafastDesc =>
      'أقصى سرعة ممكنة، ولكنه يحقق أقل نسبة تقليل للحجم.';

  @override
  String get presetSuperfastLabel => 'سريع جداً ممتاز';

  @override
  String get presetSuperfastDesc => 'ترميز سريع جداً مع كفاءة ضغط أقل.';

  @override
  String get presetVeryfastLabel => 'سريع جداً';

  @override
  String get presetVeryfastDesc =>
      'أسرع من المتوسط ويقدم تقليلاً معتدلاً للحجم.';

  @override
  String get presetFasterLabel => 'أسرع';

  @override
  String get presetFasterDesc => 'تحسين خفيف للسرعة مع ضغط ممتاز عموماً.';

  @override
  String get presetFastLabel => 'سريع';

  @override
  String get presetFastDesc =>
      'توازن ممتاز بين السرعة وتوفير المساحة. موصى به.';

  @override
  String get presetMediumLabel => 'متوسط';

  @override
  String get presetMediumDesc =>
      'التوازن الافتراضي بين سرعة الترميز ونسبة الضغط.';

  @override
  String get presetSlowLabel => 'بطيء';

  @override
  String get presetSlowDesc =>
      'عملية أبطأ ولكن تنتج ملفات أصغر حجماً بشكل ملحوظ.';

  @override
  String get presetVeryslowLabel => 'بطيء جداً';

  @override
  String get presetVeryslowDesc =>
      'يستغرق أطول وقت ولكنه يضمن أقصى توفير للمساحة.';

  @override
  String get videoCodecTitle => 'ترميز الفيديو (‎Codec)';

  @override
  String get codecH264Label => 'H.264';

  @override
  String get codecH264Desc =>
      'أعلى توافقية مع الأجهزة والمتصفحات القديمة والحديثة.';

  @override
  String get codecH265Label => 'H.265 / HEVC';

  @override
  String get codecH265Desc => 'كفاءة ضغط أفضل وتوفير أكبر للمساحة.';

  @override
  String get codecAv1Label => 'AV1';

  @override
  String get codecAv1Desc =>
      'جيل جديد من الترميز: أقصى كفاءة ضغط (أصغر بنسبة ‎30% من ‎H.265).';

  @override
  String get hardwareEncoderTitle => 'المسرّع المادي (‎GPU)';

  @override
  String get hwSoftwareLabel => 'المعالج (‎CPU)';

  @override
  String get hwSoftwareDesc => 'الأبطأ، لكنه أعلى توافقية وأصغر حجم ملف.';

  @override
  String get hwNvidiaLabel => 'إنفيديا (‎NVENC)';

  @override
  String get hwNvidiaDesc => 'ضغط فائق السرعة لكروت كروت إنفيديا.';

  @override
  String get hwAmdLabel => 'إيه إم دي (‎AMF)';

  @override
  String get hwAmdDesc => 'ضغط فائق السرعة لكروت ‎AMD.';

  @override
  String get hwIntelLabel => 'إنتل (‎QSV)';

  @override
  String get hwIntelDesc => 'ضغط فائق السرعة لكروت إنتل المدمجة والمنفصلة.';

  @override
  String get resolutionTitle => 'أقصى دقة (‎Resolution)';

  @override
  String get resOriginalLabel => 'الأصلية';

  @override
  String get resOriginalDesc => 'الحفاظ على دقة الفيديو الأصلية دون تغيير.';

  @override
  String get res4kLabel => '4K';

  @override
  String get res4kDesc => 'تخفيض الدقة لـ ‎4K كأقصى حد (جودة فائقة).';

  @override
  String get res2kLabel => '2K';

  @override
  String get res2kDesc => 'تخفيض الدقة لـ ‎2K كأقصى حد (جودة عالية).';

  @override
  String get res1080pLabel => '1080p';

  @override
  String get res1080pDesc => 'تخفيض الدقة لـ ‎1080p (الدقة القياسية العالية).';

  @override
  String get res720pLabel => '720p';

  @override
  String get res720pDesc =>
      'تخفيض الدقة لـ ‎720p (مناسبة للشاشات الصغيرة والهواتف).';

  @override
  String get res480pLabel => '480p';

  @override
  String get res480pDesc => 'تخفيض الدقة لـ ‎480p (جودة ‎DVD، حجم صغير جداً).';

  @override
  String get res360pLabel => '360p';

  @override
  String get res360pDesc => 'تخفيض الدقة لـ ‎360p (ضغط شديد للغاية).';

  @override
  String get frameRateTitle => 'معدل الإطارات (‎FPS)';

  @override
  String get fpsOriginalLabel => 'الأصلي';

  @override
  String get fpsOriginalDesc => 'الحفاظ على عدد الإطارات الأصلي في الثانية.';

  @override
  String get fps60Label => '‎60 إطار/ث';

  @override
  String get fps60Desc => 'نعومة فائقة، مثالي للألعاب والرياضة.';

  @override
  String get fps30Label => '‎30 إطار/ث';

  @override
  String get fps30Desc => 'نعومة قياسية وتوازن رائع لأغلب الفيديوهات.';

  @override
  String get fps24Label => '‎24 إطار/ث';

  @override
  String get fps24Desc => 'طابع سينمائي وتوفير إضافي في المساحة.';

  @override
  String get enableVideoDenoiseTitle => 'تنقية تشويش الفيديو والحبيبات';

  @override
  String get enableVideoDenoiseDesc =>
      'تطبيق فلتر ثلاثي الأبعاد لإزالة التحبب الرقمي وتحسين الضغط بنسبة ‎15-25%.';

  @override
  String get exportFormatTitle => 'صيغة التصدير';

  @override
  String get exportVideoLabel => 'فيديو قياسي';

  @override
  String get exportVideoDesc => 'تصدير كملف فيديو بصيغ ‎MP4/MKV/MOV';

  @override
  String get exportGifLabel => 'صورة متحركة ‎GIF';

  @override
  String get exportGifDesc => 'تحويل الفيديو إلى صورة متحركة عالية الجودة';

  @override
  String get exportMp3Label => 'استخراج ‎MP3';

  @override
  String get exportMp3Desc => 'استخراج الصوت فقط بصيغة ‎MP3 جودة ‎320kbps';

  @override
  String get exportAacLabel => 'استخراج ‎AAC';

  @override
  String get exportAacDesc => 'استخراج الصوت بصيغة ‎AAC عالية الجودة';

  @override
  String get exportWavLabel => 'استخراج ‎WAV';

  @override
  String get exportWavDesc => 'استخراج الصوت خام بدون أي ضغط ‎WAV';

  @override
  String get privacyScrubbingTitle => 'الخصوصية وإزالة بيانات المكان';

  @override
  String get keepMetadataLabel => 'إبقاء البيانات';

  @override
  String get stripGpsExifLabel => 'إزالة ‎GPS/EXIF';

  @override
  String get stripGpsExifInfoTitle => 'تطهير الموقع والبيانات';

  @override
  String get stripGpsExifInfoDesc =>
      'حذف معلومات الكاميرا، موقع الـ ‎GPS، والتواريخ من الفيديو.';

  @override
  String get keepMetadataInfoDesc => 'الحفاظ على بيانات الفيديو الأصلية كاملة.';

  @override
  String get autoCropBlackBarsTitle => 'قص الحواف السوداء تلقائياً';

  @override
  String get autoCropLabel => 'قص تلقائي';

  @override
  String get autoCropActiveTitle => 'القص التلقائي مفعل';

  @override
  String get autoCropActiveDesc =>
      'إزالة الحواف والإطارات السوداء من أطراف الفيديو.';

  @override
  String get autoCropDisabledDesc => 'الحفاظ على أبعاد وإطار الفيديو كما هو.';

  @override
  String get playbackSpeedTitle => 'سرعة التشغيل';

  @override
  String get speedOriginalLabel => '1.0x';

  @override
  String get speedOriginalDesc => 'سرعة الفيديو الطبيعية الأصلية';

  @override
  String get speedSlow05Label => '‎0.5x بطيء';

  @override
  String get speedSlow05Desc => 'تقليل السرعة للنصف (العرض البطيء)';

  @override
  String get speedFast15Label => '1.5x';

  @override
  String get speedFast15Desc => 'تسريع خفيف للفيديو بنسبة ‎1.5x';

  @override
  String get speedFast20Label => '‎2.0x سريع';

  @override
  String get speedFast20Desc => 'مضاعفة سرعة التشغيل مرتين';

  @override
  String get speedTimelapse40Label => '‎4.0x تايم لابس';

  @override
  String get speedTimelapse40Desc => 'تسريع فائق ‎4x لعمل المقاطع السريعة';

  @override
  String get canvasAspectRatioTitle => 'نسبة أبعاد الشاشة';

  @override
  String get aspectOriginalLabel => 'الأصلية';

  @override
  String get aspectOriginalDesc => 'الحفاظ على أبعاد الفيديو الأصلية';

  @override
  String get aspectShortsLabel => '9:16 (Shorts)';

  @override
  String get aspectShortsDesc => 'أبعاد طولية مناسبة لتيك توك وريلز وشورتس';

  @override
  String get aspectSquareLabel => '1:1 (مربع)';

  @override
  String get aspectSquareDesc => 'أبعاد مربعة مخصصة لمنشورات إنستغرام';

  @override
  String get aspectPortraitLabel => '4:5 (عمودي)';

  @override
  String get aspectPortraitDesc => 'أبعاد عمودية مخصصة لبوستات إنستغرام';

  @override
  String get aspectWidescreenLabel => '16:9 (عريض)';

  @override
  String get aspectWidescreenDesc => 'أبعاد عريضة قياسية لليوتيوب والتلفزيون';

  @override
  String get aspectClassicLabel => '4:3 (كلاسيكي)';

  @override
  String get aspectClassicDesc => 'أبعاد كلاسيكية للشاشات القديمة';

  @override
  String get aspectCinemaLabel => '21:9 (سينمائي)';

  @override
  String get aspectCinemaDesc => 'أبعاد سينمائية عريضة جداً للشاشات الفائقة';

  @override
  String get aspectCustomLabel => 'نسبة مخصصة';

  @override
  String get aspectCustomDesc => 'تحديد نسبة أبعاد مخصصة حسب رغبتك';

  @override
  String get customRatioTooltip => 'اكتب نسبة مخصصة مثل ‎16:10 أو ‎2:1';

  @override
  String get rotationFlipTitle => 'التدوير والقلب';

  @override
  String get rotOriginalLabel => 'الأصلي (0°)';

  @override
  String get rotOriginalDesc => 'الحفاظ على اتجاه الفيديو الأصلي';

  @override
  String get rot90Label => '90° يميناً';

  @override
  String get rot90Desc => 'تدوير الفيديو ‎90 درجة باتجاه عقارب الساعة';

  @override
  String get rot180Label => '180° مقلوب';

  @override
  String get rot180Desc => 'قلب الفيديو رأساً على عقب';

  @override
  String get rot270Label => '270° يساراً';

  @override
  String get rot270Desc => 'تدوير الفيديو ‎270 درجة باتجاه عقارب الساعة';

  @override
  String get rotFlipHLabel => 'قلب أفقي';

  @override
  String get rotFlipHDesc => 'عكس اتجاه الفيديو أفقياً (مرآة)';

  @override
  String get rotFlipVLabel => 'قلب رأسي';

  @override
  String get rotFlipVDesc => 'عكس اتجاه الفيديو رأسياً';

  @override
  String get rotCustomLabel => 'زاوية مخصصة';

  @override
  String get rotCustomDesc => 'تدوير الفيديو بدرجة زاوية مخصصة';

  @override
  String get customRotationTooltip =>
      'اكتب زاوية التدوير بالدرجات مثل ‎45 أو ‎30';

  @override
  String get trimVideoTitle => 'قص الفيديو';

  @override
  String get fullVideoLabel => 'الفيديو كامل';

  @override
  String get cutClipLabel => 'قص مقطع';

  @override
  String get trimStartLabel => 'البداية';

  @override
  String get trimEndLabel => 'النهاية';

  @override
  String get trimActiveTitle => 'قص المقطع مفعل';

  @override
  String get fullVideoDesc => 'معالجة الفيديو بالكامل دون قص أي جزء.';

  @override
  String get audioModeTitle => 'نمط المسار الصوتي';

  @override
  String get audioOriginalLabel => 'الأصلي';

  @override
  String get audioOriginalDesc =>
      'الحفاظ على الصوت الأصلي دون أي فقدان للجودة.';

  @override
  String get audioAac256Label => 'جودة عالية';

  @override
  String get audioAac256Desc =>
      'ضغط الصوت لـ ‎AAC 256kbps (جودة ممتازة وحجم معتدل).';

  @override
  String get audioAac128Label => 'متوازن';

  @override
  String get audioAac128Desc =>
      'ضغط الصوت لـ ‎AAC 128kbps (جودة ممتازة وحجم صغير - معيار الويب).';

  @override
  String get audioAac64Label => 'حجم ضئيل';

  @override
  String get audioAac64Desc =>
      'ضغط الصوت لـ ‎AAC 64kbps (مناسب للشرح والبودكاست وحجم ضئيل).';

  @override
  String get audioMuteLabel => 'كتم الصوت';

  @override
  String get audioMuteDesc => 'حذف المسار الصوتي بالكامل لتوفير المساحة.';

  @override
  String get audioNormTitle => 'موازنة مستوى الصوت (‎Normalization)';

  @override
  String get audioNormOffLabel => 'إيقاف';

  @override
  String get audioNormOffDesc => 'الحفاظ على مستوى الصوت الاصلي دون تغيير.';

  @override
  String get audioNormSpeechLabel => 'صوت بشري';

  @override
  String get audioNormSpeechDesc =>
      'معيار ‎EBU R128 (‎-16 LUFS) لوضوح المحادثات والشروحات.';

  @override
  String get audioNormDynamicLabel => 'ديناميكي سينمائي';

  @override
  String get audioNormDynamicDesc =>
      'تنعيم وتعديل الأصوات الخافضة والعالية بشكل متناسق.';

  @override
  String get audioNormBoostLabel => 'تكبير خفيف';

  @override
  String get audioNormBoostDesc =>
      'رفع الصوت بمقدار ثابت ‎+3dB للفيديوهات ذات الصوت المنخفض.';

  @override
  String get audioChanTitle => 'قنوات الصوت (‎Downmix)';

  @override
  String get audioChanOriginalLabel => 'الأصلية';

  @override
  String get audioChanOriginalDesc =>
      'الحفاظ على عدد قنوات الصوت الأصلية (ستيريو، ‎5.1، الخ).';

  @override
  String get audioChanStereoLabel => 'ستيريو (‎2.0)';

  @override
  String get audioChanStereoDesc =>
      'تحويل إلى قناتين ستيريو متوافقين مع جميع الأجهزة.';

  @override
  String get audioChanMonoLabel => 'مونو (‎1.0)';

  @override
  String get audioChanMonoDesc =>
      'دمج الصوت في قناة واحدة - توفير إضافي ‎50% في حجم الصوت.';

  @override
  String get removeNoiseLabel => 'إزالة الضوضاء';

  @override
  String get enableAudioDenoiseTitle => 'تنقية ضوضاء الميكروفون والمراوح';

  @override
  String get enableAudioDenoiseDesc =>
      'تطبيق الفلترة الطيفية لإزالة زنة الميكروفون وصوت المراوح والتشويش.';

  @override
  String get outputDirectoryTitle => 'مجلد حفظ الفيديوهات';

  @override
  String get defaultOutputDirectory => 'الافتراضي (بجوار الفيديو الأصلي)';

  @override
  String get selectOutputFolderTitle => 'اختر مجلد الحفظ';

  @override
  String get clearOutputFolder => 'إلغاء المجلد المخصص (استخدام الافتراضي)';

  @override
  String get changeBtn => 'تغيير';

  @override
  String get outputLocationTitle => 'سلوك مجلد الإخراج';

  @override
  String get outputLocationUnifiedLabel => 'مجلد موحد';

  @override
  String get outputLocationUnifiedDesc =>
      'حفظ جميع الفيديوهات المضغوطة داخل مجلد واحد موحد.';

  @override
  String get outputLocationSameLabel => 'نفس المجلد الأصلي';

  @override
  String get outputLocationSameDesc =>
      'حفظ كل فيديو مضغوط في فرع بجوار الملف الأصلي.';

  @override
  String get fileManagementTitle => 'إدارة الملفات الأصلية';

  @override
  String get keepOriginalsLabel => 'الاحتفاظ بالأصل';

  @override
  String get keepOriginalsDesc =>
      'ترك الملفات الأصلية دون تغيير بعد الانتهاء من الضغط.';

  @override
  String get toRecycleBinLabel => 'إلى سلة المهملات';

  @override
  String get toRecycleBinDesc =>
      'نقل الفيديوهات الأصلية لسلة المهملات تلقائياً بعد نجاح الضغط.';

  @override
  String get outputFormatTitle => 'صيغة الحاوية (‎Container)';

  @override
  String get formatOriginalLabel => 'الأصلية';

  @override
  String get formatOriginalDesc =>
      'الحفاظ على الصيغة الأصلية (الأسرع والأقل استهلاكاً).';

  @override
  String get formatMp4Label => 'MP4';

  @override
  String get formatMp4Desc => 'التوافق الشامل مع كافة الأجهزة والمتصفحات.';

  @override
  String get formatMkvLabel => 'MKV';

  @override
  String get formatMkvDesc => 'صيغة مرنة وممتازة لدعم مسارات متعددة.';

  @override
  String get formatMovLabel => 'MOV';

  @override
  String get formatMovDesc => 'صيغة أبل كويك تايم عالية الجودة.';

  @override
  String get scanningFilesMsg => 'جاري فحص الملفات... قد يستغرق ذلك لحظات.';

  @override
  String get addFilesBtn => 'إضافة ملفات';

  @override
  String get addFolderBtn => 'إضافة مجلد';

  @override
  String get dragDropMoreMsg =>
      'أو قم بسحب وإسقاط المزيد من الملفات في أي مكان';

  @override
  String get openOutputFolderTooltip => 'فتح مجلد الحفظ';

  @override
  String get statusQueued => 'في الانتظار';

  @override
  String get statusAnalyzing => 'جاري الفحص';

  @override
  String get statusCompressing => 'جاري الضغط';

  @override
  String get statusDone => 'تم بنجاح';

  @override
  String get statusFailed => 'فشل';

  @override
  String get statusCancelled => 'تم الإلغاء';

  @override
  String get savedPrefix => 'توفير';

  @override
  String get largerSuffix => 'أكبر';

  @override
  String get largerSizeWarning =>
      'حجم الملف الناتج قد يكون أكبر من الأصلي. يُوصى بالمراجعة وإعادة الإعدادات للافتراضي.';

  @override
  String get clearCompletedBtn => 'مسح المكتمل';

  @override
  String get clearAllBtn => 'مسح الكل';

  @override
  String get stopAllBtn => 'إيقاف الكل';

  @override
  String get startCompressionBtn => 'بدء الضغط';

  @override
  String get allDoneLabel => 'تم الانتهاء!';

  @override
  String get openFolderBtn => 'فتح المجلد';

  @override
  String get totalEtaLabel => 'الوقت المتبقي';

  @override
  String get totalSavedLabel => 'إجمالي الموفر';

  @override
  String get videoSingle => 'فيديو';

  @override
  String get videosPlural => 'فيديوهات';

  @override
  String get fileSingle => 'ملف';

  @override
  String get filesPlural => 'ملفات';

  @override
  String get releaseToAddVideosMsg => 'أفلت لإضافة الملفات';

  @override
  String get dragDropHereMsg => 'قم بسحب وإسقاط الفيديوهات أو الصور هنا';

  @override
  String get supportedFormatsMsg =>
      'يدعم MP4, MKV, MOV, AVI, WMV, WebM • PNG, JPG, WebP, AVIF والمزيد';

  @override
  String get selectFilesBtn => 'اختر الملفات';

  @override
  String get selectFolderBtn => 'اختر المجلد';

  @override
  String get releaseToShrinkTitle => 'اترك للضغط فوراً';

  @override
  String get filesWillBeAddedDesc => 'سيتم إضافة ملفاتك إلى قائمة المعالجة.';

  @override
  String get disabledLabel => 'معطل';

  @override
  String get compressionInProgressTitle => 'عملية الضغط قيد التشغيل';

  @override
  String get confirmCloseDesc =>
      'هل أنت تأكد من إغلاق Shrinkeo؟\nسيؤدي هذا لإلغاء جميع عمليات الضغط الحالية وفقدان التقدم.';

  @override
  String get keepCompressingBtn => 'متابعة الضغط';

  @override
  String get closeAppBtn => 'إغلاق التطبيق';

  @override
  String get lockedSettingsWarning => 'مغلق أثناء الضغط';

  @override
  String get updateRequiredTitle => 'تحديث مطلوب';

  @override
  String get updateRequiredDescNewVersion =>
      'يتوفر إصدار جديد من Shrinkeo يحتوي على تحسينات هامة. يرجى التحديث للمتابعة.';

  @override
  String get updateRequiredDescOldVersion =>
      'إصدارك الحالي لم يعد مدعوماً. يرجى التحديث لاستكمال استخدام التطبيق.';

  @override
  String get updateNowBtn => 'التحديث الآن';

  @override
  String get laterBtn => 'لاحقاً';

  @override
  String get updateAvailableTitle => 'تحديث متوفر';

  @override
  String get whatsNewTitle => 'ما الجديد:';

  @override
  String get exitAppBtn => 'خروج من التطبيق';

  @override
  String get retryBtn => 'إعادة المحاولة';

  @override
  String get downloadFromWebsiteBtn => 'التحميل من الموقع';

  @override
  String get skipUpdateConfirmTitle => 'تخطي التحديث الهام؟';

  @override
  String get skipUpdateConfirmDesc =>
      'يحتوي هذا التحديث على إصلاحات أخطاء حاسمة. ننصح بشدة بالتحديث الآن لضمان عمل التطبيق بشكل صحيح.\n\nهل أنت متأكد من التخطي الآن؟';

  @override
  String get skipUpdateCancelBtn => 'إلغاء';

  @override
  String get skipUpdateConfirmBtn => 'أفهم ذلك، تخطي التحديث';

  @override
  String get maintenanceTitle => 'صيانة النظام';

  @override
  String get maintenanceDescDefault =>
      'Shrinkeo يخضع للصيانة حالياً. يرجى المحاولة لاحقاً.';

  @override
  String versionAvailableMsg(String version) {
    return 'الإصدار ‎$version متوفر الآن.';
  }

  @override
  String get hwEncoderNotSupportedTitle => 'المسرع المادي غير مدعوم';

  @override
  String get failedCreateFolderError => 'فشل إنشاء مجلد الإخراج';

  @override
  String get failedProbeDurationError => 'فشل فحص مدة الفيديو';

  @override
  String get ffmpegNotFoundGlobalError =>
      'لم يتم العثور على مكتبات ‎FFmpeg. يرجى التأكد من التثبيت الصحيح.';

  @override
  String get ffmpegMissingError =>
      'مكتبات ‎FFmpeg مفقودة أو تالفة.\n\nيرجى إعادة تثبيت Shrinkeo أو التثبيت يدوياً عبر:\n‎winget install Gyan.FFmpeg';

  @override
  String hwFallbackNotificationBody(String encoderLabel) {
    return 'فشل المسرع ‎$encoderLabel. تم التحول تلقائياً للضغط بواسطة المعالج (‎CPU).';
  }

  @override
  String get failedDownloadUpdateMsg =>
      'فشل تحميل التحديث. يرجى المحاولة مرة أخرى.';

  @override
  String customRatioActiveTitle(Object ratio) {
    return 'نسبة أبعاد مخصصة ($ratio)';
  }

  @override
  String customRatioActiveDesc(Object ratio) {
    return 'تغيير أبعاد الفيديو إلى نسبة مخصصة ($ratio) مع إضافة حواف.';
  }

  @override
  String customAngleActiveTitle(Object angle) {
    return 'زاوية تدوير مخصصة ($angle°)';
  }

  @override
  String customAngleActiveDesc(Object angle) {
    return 'تدوير الفيديو بزاوية مخصصة قدرها $angle°.';
  }

  @override
  String trimActiveDesc(Object end, Object start) {
    return 'قص مقطع الفيديو بدءاً من $start وحتى $end.';
  }

  @override
  String targetSizeLimitLabel(Object size) {
    return 'حد أقصى $size ميجابايت';
  }

  @override
  String get customMbSizeTooltip => 'أدخل الحجم بالميجابايت';

  @override
  String get trimTimeTooltip =>
      'أدخل التوقيت مثلاً: 5 (5 ثوانٍ)، 1:30 (دقيقة و30 ثانية)، أو 00:01:30';

  @override
  String get tabImageSuite => 'أدوات الصور';

  @override
  String get compressionModeTitle => 'نمط ضغط الصور';

  @override
  String get smartAutoLabel => 'ذكي تلقائي';

  @override
  String get smartAutoDesc =>
      'يقلل حجم الملف تلقائياً بنسبة 60-80% مع وضوح بصري تام ومبهر. مثالي للاستخدام اليومي.';

  @override
  String get maxSavingsLabel => 'أقصى توفير';

  @override
  String get maxSavingsDesc =>
      'ضغط عالي يوفر حتى 85-90% من الحجم. ممتاز للمراسلات والمرفقات السريعة.';

  @override
  String get ultraFidelityLabel => 'أعلى جودة فائقة';

  @override
  String get ultraFidelityDesc =>
      'يحافظ على دقة التفاصيل الأصلية كاملة مع ضغط خفيف جداً. ممتاز للأرشيف والطباعة.';

  @override
  String get targetImageFormatTitle => 'صيغة الصورة المستهدفة';

  @override
  String get dimensionResizingTitle => 'تعديل أبعاد الصورة';

  @override
  String get exifCameraPrivacyTitle => 'الخصوصية وبيانات الكاميرا (EXIF)';

  @override
  String get stripGpsCameraInfoLabel => 'حذف بيانات الموقع والكاميرا';

  @override
  String get imgFmtOriginalLabel => 'التنسيق الأصلي';

  @override
  String get imgFmtOriginalDesc =>
      'احتفظ بالتنسيق الأصلي (الأسرع، بدون تحويل).';

  @override
  String get imgFmtPngLabel => 'صورة PNG (.png)';

  @override
  String get imgFmtPngDesc => 'تنسيق PNG بدون فقدان مع دعم الشفافية.';

  @override
  String get imgFmtJpgLabel => 'صورة JPEG (.jpg)';

  @override
  String get imgFmtJpgDesc => 'تنسيق JPEG مضغوط قياسي للتوافق العالمي.';

  @override
  String get imgFmtWebpLabel => 'صورة WebP (.webp)';

  @override
  String get imgFmtWebpDesc =>
      'يوفر تنسيق WebP الحديث ضغطًا فائقًا وحجمًا صغيرًا.';

  @override
  String get imgFmtAvifLabel => 'صورة AVIF (.avif)';

  @override
  String get imgFmtAvifDesc =>
      'تنسيق AVIF من الجيل التالي بكفاءة ضغط عالية جدًا.';

  @override
  String get imgResOriginalLabel => 'الأبعاد الأصلية';

  @override
  String get imgResOriginalDesc => 'احتفظ بأبعاد عرض الصورة الأصلية وارتفاعها.';

  @override
  String get imgRes4kLabel => '4K ماكس (3840 بكسل)';

  @override
  String get imgRes4kDesc =>
      'قم بتقليل البعد الأقصى للصورة إلى 3840 بكسل (4K كحد أقصى).';

  @override
  String get imgRes1080pLabel => 'دقة عالية كاملة بحد أقصى (1920 بكسل)';

  @override
  String get imgRes1080pDesc =>
      'قم بتقليل البعد الأقصى للصورة إلى 1920 بكسل (Full HD كحد أقصى).';

  @override
  String get imgRes720pLabel => 'HD ماكس (1280 بكسل)';

  @override
  String get imgRes720pDesc =>
      'قم بتقليص البعد الأقصى للصورة إلى 1280 بكسل (HD كحد أقصى).';

  @override
  String get imgRes480pLabel => 'SD ماكس (854 بكسل)';

  @override
  String get imgRes480pDesc =>
      'قم بتقليص البعد الأقصى للصورة إلى 854 بكسل (SD كحد أقصى).';

  @override
  String get keepMetadataImageInfoDesc =>
      'الحفاظ على بيانات الكاميرا والـ EXIF الخاصة بالصورة الأصلية.';

  @override
  String get imageQualityModeLabel => 'مستوى الجودة';

  @override
  String get imageQualityModeDesc =>
      'يضغط بمستوى جودة ثابت — الجودة الأعلى تعني ملفات أكبر.';

  @override
  String get imageTargetSizeModeLabel => 'الحجم المستهدف';

  @override
  String get imageTargetSizeModeDesc =>
      'يبحث تلقائيًا عن أعلى جودة تناسب الحجم المحدد.';

  @override
  String get imageQualitySliderTitle => 'جودة الصورة';

  @override
  String get imageTargetSizeTitle => 'الحجم المستهدف للملف';

  @override
  String get imageTargetSizeDesc =>
      'يكرر الضغط بجودة متناقصة حتى يصبح الملف ضمن الحد المحدد. الحدود الصغيرة جدًا قد تقلل الجودة.';

  @override
  String imageTargetSizeLimitLabel(String size) {
    return 'حد $size';
  }

  @override
  String get customKbSizeTooltip => 'اكتب حجمًا مخصصًا بالكيلوبايت';

  @override
  String get imageProcessingFailedError => 'فشلت معالجة الصورة';

  @override
  String get imageProcessingErrorMsg => 'خطأ في معالجة الصورة';

  @override
  String get cleanNoiseLabel => 'تنظيف الضوضاء';

  @override
  String get outputLargerTooltip =>
      'سيكون الحجم الناتج أكبر من الملف الأصلي!\nأوقف الضغط وجرب إعادة التعيين.';

  @override
  String get estimatedSizePrefix => 'تقديري:';

  @override
  String get cancelBtnTooltip => 'إلغاء';

  @override
  String get removeBtnTooltip => 'إزالة';

  @override
  String get selectLanguageTitle => 'اختر اللغة';

  @override
  String get searchLanguageHint => 'ابحث عن لغة عن طريق الاسم أو الرمز...';

  @override
  String get noLanguagesMatchSearch => 'لا توجد لغات تطابق بحثك.';

  @override
  String get languageTooltip => 'اللغة';

  @override
  String get notifyCompressionCompleteTitle => 'اكتمال عملية الضغط';

  @override
  String get notifyOutputLargerTitle => 'الحجم الناتج أكبر من الملف الأصلي';

  @override
  String languagesCountLabel(String count) {
    return '$count لغة';
  }

  @override
  String notifyCompressionCompleteSuccess(String success) {
    return 'تم ضغط $success ملف بنجاح.';
  }

  @override
  String notifyCompressionCompleteFailed(String failed) {
    return ' (فشل $failed)';
  }

  @override
  String notifyOutputLargerDesc(String fileName) {
    return 'من المتوقع أن يكون $fileName أكبر من حجم الملف الأصلي. يُفضل إلغاء الضغط وإعادة ضبط الإعدادات.';
  }
}
