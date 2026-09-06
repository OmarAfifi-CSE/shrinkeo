// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Persian (`fa`).
class AppLocalizationsFa extends AppLocalizations {
  AppLocalizationsFa([String locale = 'fa']) : super(locale);

  @override
  String get appName => 'Shrinkeo';

  @override
  String get totalSpaceSaved => 'مجموع فضای ذخیره‌شده';

  @override
  String get savedSpacePrefix => 'صرفه‌جویی:';

  @override
  String get supportButtonText => 'حمایت از پروژه';

  @override
  String get lightThemeTooltip => 'تم روشن';

  @override
  String get darkThemeTooltip => 'تم تاریک';

  @override
  String get settingsTooltip => 'تنظیمات';

  @override
  String get minimizeTooltip => 'کمینه‌سازی';

  @override
  String get closeTooltip => 'بستن';

  @override
  String get restoreTooltip => 'بازیابی';

  @override
  String get maximizeTooltip => 'بیشینه‌سازی';

  @override
  String get tabCompressionQuality => 'فشرده‌سازی و کیفیت';

  @override
  String get tabVideoEditingTools => 'ویرایش ویدیو و ابزارها';

  @override
  String get tabAudioSettings => 'تنظیمات صدا';

  @override
  String get tabEngineOutput => 'موتور و خروجی';

  @override
  String get compressionSettingsTitle => 'تنظیمات فشرده‌سازی';

  @override
  String get resetToDefaults => 'بازنشانی به پیش‌فرض';

  @override
  String get resetDefaultTooltip => 'بازگردانی مقادیر اولیه';

  @override
  String get modeTargetSizeTitle => 'حالت هدف فشرده‌سازی';

  @override
  String get modeCrfLabel => 'کیفیت (CRF)';

  @override
  String get modeTargetSizeLabel => 'حجم هدف (MB)';

  @override
  String get crfQualityTitle => 'ضریب کیفیت CRF';

  @override
  String get crfLossless => 'بدون ضرر';

  @override
  String get crfHighQuality => 'کیفیت بالا';

  @override
  String get crfBalanced => 'متعادل';

  @override
  String get crfHighCompression => 'فشرده سازی بالا';

  @override
  String get crfLowQuality => 'کیفیت پایین';

  @override
  String get crfUltraCompressed => 'فوق فشرده';

  @override
  String get targetSizeLabel => 'حجم فایل هدف (مگابایت)';

  @override
  String get targetSizeDesc => 'محاسبه نرخ بیت برای ماندن در محدوده حجم.';

  @override
  String get encodingSpeedTitle => 'سرعت رمزگذاری';

  @override
  String get presetUltrafastLabel => 'فوق‌العاده سریع';

  @override
  String get presetUltrafastDesc => 'بیشترین سرعت اما کمترین کاهش حجم.';

  @override
  String get presetSuperfastLabel => 'بسیار سریع';

  @override
  String get presetSuperfastDesc => 'رمزگذاری بسیار سریع.';

  @override
  String get presetVeryfastLabel => 'خیلی سریع';

  @override
  String get presetVeryfastDesc => 'سریع‌تر از حد معمول.';

  @override
  String get presetFasterLabel => 'سریع‌تر';

  @override
  String get presetFasterDesc => 'سرعت و فشرده‌سازی مناسب.';

  @override
  String get presetFastLabel => 'سریع';

  @override
  String get presetFastDesc => 'بهترین تعادل بین سرعت و حجم.';

  @override
  String get presetMediumLabel => 'متوسط';

  @override
  String get presetMediumDesc => 'تعادل پیش‌فرض.';

  @override
  String get presetSlowLabel => 'آهسته';

  @override
  String get presetSlowDesc => 'آهسته‌تر اما فایل‌های بسیار کوچک‌تر.';

  @override
  String get presetVeryslowLabel => 'بسیار آهسته';

  @override
  String get presetVeryslowDesc => 'بیشترین کاهش حجم.';

  @override
  String get videoCodecTitle => 'کدک ویدیو';

  @override
  String get codecH264Label => 'H.264';

  @override
  String get codecH264Desc => 'بیشترین سازگاری با دستگاه‌های قدیمی.';

  @override
  String get codecH265Label => 'H.265 / HEVC';

  @override
  String get codecH265Desc => 'بازدهی فشرده‌سازی بهتر.';

  @override
  String get codecAv1Label => 'AV1';

  @override
  String get codecAv1Desc => 'کدک نسل جدید (۳۰٪ کوچک‌تر از H.265).';

  @override
  String get hardwareEncoderTitle => 'شتاب‌دهنده سخت‌افزاری (GPU)';

  @override
  String get hwSoftwareLabel => 'نرم‌افزاری (CPU)';

  @override
  String get hwSoftwareDesc => 'کندترین اما بالاترین سازگاری.';

  @override
  String get hwNvidiaLabel => 'Nvidia (NVENC)';

  @override
  String get hwNvidiaDesc => 'رمزگذاری فوق‌العاده سریع برای کارت Nvidia.';

  @override
  String get hwAmdLabel => 'AMD (AMF)';

  @override
  String get hwAmdDesc => 'رمزگذاری فوق‌العاده سریع برای کارت AMD.';

  @override
  String get hwIntelLabel => 'Intel (QSV)';

  @override
  String get hwIntelDesc => 'رمزگذاری فوق‌العاده سریع برای کارت Intel.';

  @override
  String get resolutionTitle => 'حداکثر رزولوشن';

  @override
  String get resOriginalLabel => 'اصلی';

  @override
  String get resOriginalDesc => 'حفظ رزولوشن اصلی ویدیو.';

  @override
  String get res4kLabel => '4K';

  @override
  String get res4kDesc => 'کاهش حداکثر تا 4K.';

  @override
  String get res2kLabel => '2K';

  @override
  String get res2kDesc => 'کاهش حداکثر تا 2K.';

  @override
  String get res1080pLabel => '1080p';

  @override
  String get res1080pDesc => 'کاهش حداکثر تا 1080p Full HD.';

  @override
  String get res720pLabel => '720p';

  @override
  String get res720pDesc => 'کاهش حداکثر تا 720p HD.';

  @override
  String get res480pLabel => '480p';

  @override
  String get res480pDesc => 'کاهش تا 480p کیفیت DVD.';

  @override
  String get res360pLabel => '360p';

  @override
  String get res360pDesc => 'فشرده‌سازی حداکثری.';

  @override
  String get frameRateTitle => 'نرخ فریم (FPS)';

  @override
  String get fpsOriginalLabel => 'اصلی';

  @override
  String get fpsOriginalDesc => 'همان نرخ فریم ویدیو اصلی.';

  @override
  String get fps60Label => '۶۰ فریم/ثانیه';

  @override
  String get fps60Desc => 'بسیار روان برای بازی یا ورزش.';

  @override
  String get fps30Label => '۳۰ فریم/ثانیه';

  @override
  String get fps30Desc => 'استاندارد برای اکثر ویدیوها.';

  @override
  String get fps24Label => '۲۴ فریم/ثانیه';

  @override
  String get fps24Desc => 'حالت سینمایی.';

  @override
  String get enableVideoDenoiseTitle => 'پاکسازی نویز ویدیو';

  @override
  String get enableVideoDenoiseDesc =>
      'فیلتر سه‌بعدی برای کاهش نویز و افزایش فشرده‌سازی.';

  @override
  String get exportFormatTitle => 'فرمت خروجی';

  @override
  String get exportVideoLabel => 'ویدیو استاندارد';

  @override
  String get exportVideoDesc => 'خروجی به صورت MP4/MKV/MOV';

  @override
  String get exportGifLabel => 'تصویر متحرک GIF';

  @override
  String get exportGifDesc => 'ساخت انیمیشن GIF باکیفیت';

  @override
  String get exportMp3Label => 'استخراج MP3';

  @override
  String get exportMp3Desc => 'استخراج صدا به صورت 320kbps MP3';

  @override
  String get exportAacLabel => 'استخراج AAC';

  @override
  String get exportAacDesc => 'استخراج صدا به صورت AAC باکیفیت';

  @override
  String get exportWavLabel => 'استخراج WAV';

  @override
  String get exportWavDesc => 'استخراج صدا خام WAV بدون فشرده‌سازی';

  @override
  String get privacyScrubbingTitle => 'حریم خصوصی و GPS';

  @override
  String get keepMetadataLabel => 'حفظ داده‌ها';

  @override
  String get stripGpsExifLabel => 'حذف GPS/EXIF';

  @override
  String get stripGpsExifInfoTitle => 'پاکسازی متادیتا';

  @override
  String get stripGpsExifInfoDesc => 'حذف اطلاعات دوربین و موقعیت مکانی GPS.';

  @override
  String get keepMetadataInfoDesc => 'حفظ تمام متادیتای اصلی.';

  @override
  String get autoCropBlackBarsTitle => 'برش خودکار حاشیه‌های سیاه';

  @override
  String get autoCropLabel => 'برش خودکار';

  @override
  String get autoCropActiveTitle => 'برش خودکار فعال';

  @override
  String get autoCropActiveDesc => 'حذف خودکار کادرهای سیاه ویدیو.';

  @override
  String get autoCropDisabledDesc => 'حفظ ابعاد و حاشیه اصلی.';

  @override
  String get playbackSpeedTitle => 'سرعت پخش';

  @override
  String get speedOriginalLabel => '1.0x';

  @override
  String get speedOriginalDesc => 'سرعت پخش معمولی';

  @override
  String get speedSlow05Label => '0.5x آهسته';

  @override
  String get speedSlow05Desc => 'پخش با نصف سرعت';

  @override
  String get speedFast15Label => '1.5x';

  @override
  String get speedFast15Desc => '۱.۵ برابر سریع‌تر';

  @override
  String get speedFast20Label => '2.0x سریع';

  @override
  String get speedFast20Desc => 'سرعت دو برابر';

  @override
  String get speedTimelapse40Label => '4.0x تایم‌لپس';

  @override
  String get speedTimelapse40Desc => 'سرعت ۴ برابر برای ساخت ویدیو سریع';

  @override
  String get canvasAspectRatioTitle => 'نسبت تصویر';

  @override
  String get aspectOriginalLabel => 'اصلی';

  @override
  String get aspectOriginalDesc => 'حفظ نسبت ابعاد اصلی';

  @override
  String get aspectShortsLabel => '9:16 عمودی';

  @override
  String get aspectShortsDesc => 'مناسب برای تیک‌تاک و ریلز';

  @override
  String get aspectSquareLabel => '1:1 مربع';

  @override
  String get aspectSquareDesc => 'مناسب پست اینستاگرام';

  @override
  String get aspectPortraitLabel => '4:5 پرتره';

  @override
  String get aspectPortraitDesc => 'مناسب پست عمودی اینستاگرام';

  @override
  String get aspectWidescreenLabel => '16:9 عریض';

  @override
  String get aspectWidescreenDesc => 'مناسب یوتیوب و تلویزیون';

  @override
  String get aspectClassicLabel => '4:3 کلاسیک';

  @override
  String get aspectClassicDesc => 'مناسب نمایشگرهای قدیمی';

  @override
  String get aspectCinemaLabel => '21:9 سینمایی';

  @override
  String get aspectCinemaDesc => 'مناسب مانیتورهای فوق‌عریض';

  @override
  String get aspectCustomLabel => 'نسبت دلخواه';

  @override
  String get aspectCustomDesc => 'نسبت ابعاد سفارشی';

  @override
  String get customRatioTooltip => 'مثال: 16:10 یا 2:1';

  @override
  String get rotationFlipTitle => 'چرخش و وارونگی';

  @override
  String get rotOriginalLabel => 'اصلی (0°)';

  @override
  String get rotOriginalDesc => 'حفظ جهت اصلی';

  @override
  String get rot90Label => '۹۰° به راست';

  @override
  String get rot90Desc => 'چرخش ۹۰ درجه در جهت عقربه‌های ساعت';

  @override
  String get rot180Label => '۱۸۰° وارونه';

  @override
  String get rot180Desc => 'چرخش کاملاً وارونه';

  @override
  String get rot270Label => '۲۷۰° به چپ';

  @override
  String get rot270Desc => 'چرخش ۹۰ درجه خلاف عقربه‌های ساعت';

  @override
  String get rotFlipHLabel => 'وارونگی افقی';

  @override
  String get rotFlipHDesc => 'آینه‌ای کردن افقی';

  @override
  String get rotFlipVLabel => 'وارونگی عمودی';

  @override
  String get rotFlipVDesc => 'آینه‌ای کردن عمودی';

  @override
  String get rotCustomLabel => 'زاویه دلخواه';

  @override
  String get rotCustomDesc => 'چرخش با زاویه مشخص';

  @override
  String get customRotationTooltip => 'زاویه به درجه مانند 45';

  @override
  String get trimVideoTitle => 'برش ویدیو';

  @override
  String get fullVideoLabel => 'ویدیو کامل';

  @override
  String get cutClipLabel => 'برش مقطع';

  @override
  String get trimStartLabel => 'شروع';

  @override
  String get trimEndLabel => 'پایان';

  @override
  String get trimActiveTitle => 'برش فعال است';

  @override
  String get fullVideoDesc => 'پردازش کل ویدیو بدون برش.';

  @override
  String get audioModeTitle => 'حالت ترک صدا';

  @override
  String get audioOriginalLabel => 'اصلی';

  @override
  String get audioOriginalDesc => 'بدون افت کیفیت صدا.';

  @override
  String get audioAac256Label => 'کیفیت بالا';

  @override
  String get audioAac256Desc => 'AAC 256kbps';

  @override
  String get audioAac128Label => 'متعادل';

  @override
  String get audioAac128Desc => 'AAC 128kbps (استاندارد وب)';

  @override
  String get audioAac64Label => 'حجم کم';

  @override
  String get audioAac64Desc => 'AAC 64kbps برای صدا';

  @override
  String get audioMuteLabel => 'بی‌صدا';

  @override
  String get audioMuteDesc => 'حذف کامل صدا.';

  @override
  String get audioNormTitle => 'همسان‌سازی صدا';

  @override
  String get audioNormOffLabel => 'خاموش';

  @override
  String get audioNormOffDesc => 'صدای اصلی بدون تغییر.';

  @override
  String get audioNormSpeechLabel => 'صدای انسان';

  @override
  String get audioNormSpeechDesc => 'استاندارد EBU R128 برای وضوح مکالمه.';

  @override
  String get audioNormDynamicLabel => 'سینمای پویا';

  @override
  String get audioNormDynamicDesc => 'تعدیل صدای کم و زیاد.';

  @override
  String get audioNormBoostLabel => 'افزایش ملایم';

  @override
  String get audioNormBoostDesc => '+3dB افزایش حجم صدا.';

  @override
  String get audioChanTitle => 'کانال‌های صدا';

  @override
  String get audioChanOriginalLabel => 'اصلی';

  @override
  String get audioChanOriginalDesc => 'حفظ کانال‌های اولیه.';

  @override
  String get audioChanStereoLabel => 'استریو (2.0)';

  @override
  String get audioChanStereoDesc => 'سازگاری استریو ۲ کاناله.';

  @override
  String get audioChanMonoLabel => 'مونو (1.0)';

  @override
  String get audioChanMonoDesc => 'تک کاناله - ۵۰٪ صرفه‌جویی در حجم صدا.';

  @override
  String get removeNoiseLabel => 'حذف نویز';

  @override
  String get enableAudioDenoiseTitle => 'حذف نویز میکروفون و فن';

  @override
  String get enableAudioDenoiseDesc => 'فیلتر حذف صدای زمینه.';

  @override
  String get outputDirectoryTitle => 'پوشه خروجی';

  @override
  String get defaultOutputDirectory => 'پیش‌فرض (کنار فایل اصلی)';

  @override
  String get selectOutputFolderTitle => 'انتخاب پوشه';

  @override
  String get clearOutputFolder => 'استفاده از مسیر پیش‌فرض';

  @override
  String get changeBtn => 'تغییر';

  @override
  String get outputLocationTitle => 'رفتار ذخیره‌سازی';

  @override
  String get outputLocationUnifiedLabel => 'پوشه یکسان';

  @override
  String get outputLocationUnifiedDesc => 'تمام ویدیوهای فشرده در یک پوشه.';

  @override
  String get outputLocationSameLabel => 'کنار فایل اصلی';

  @override
  String get outputLocationSameDesc => 'هر ویدیو کنار فایل منبع خود.';

  @override
  String get fileManagementTitle => 'مدیریت فایل‌ها';

  @override
  String get keepOriginalsLabel => 'حفظ فایل اصلی';

  @override
  String get keepOriginalsDesc => 'دست نخوردن فایل‌های اصلی.';

  @override
  String get toRecycleBinLabel => 'انتقال به سطل زباله';

  @override
  String get toRecycleBinDesc =>
      'انتقال فایل اصلی به زباله‌دان پس از فشرده‌سازی.';

  @override
  String get outputFormatTitle => 'فرمت کانتینر';

  @override
  String get formatOriginalLabel => 'اصلی';

  @override
  String get formatOriginalDesc => 'حفظ فرمت اولیه.';

  @override
  String get formatMp4Label => 'MP4';

  @override
  String get formatMp4Desc => 'بیشترین سازگاری.';

  @override
  String get formatMkvLabel => 'MKV';

  @override
  String get formatMkvDesc => 'پشتیبانی از چند ترک.';

  @override
  String get formatMovLabel => 'MOV';

  @override
  String get formatMovDesc => 'فرمت Apple QuickTime.';

  @override
  String get scanningFilesMsg => 'درحال اسکن فایل‌ها...';

  @override
  String get addFilesBtn => 'افزودن فایل';

  @override
  String get addFolderBtn => 'افزودن پوشه';

  @override
  String get dragDropMoreMsg => 'یا فایل‌های بیشتری را هرجا بکشید و رها کنید';

  @override
  String get openOutputFolderTooltip => 'باز کردن پوشه خروجی';

  @override
  String get statusQueued => 'در صف';

  @override
  String get statusAnalyzing => 'درحال تحلیل';

  @override
  String get statusCompressing => 'درحال فشرده‌سازی';

  @override
  String get statusDone => 'تکمیل شد';

  @override
  String get statusFailed => 'ناموفق';

  @override
  String get statusCancelled => 'لغو شد';

  @override
  String get savedPrefix => 'صرفه‌جویی';

  @override
  String get largerSuffix => 'بزرگ‌تر';

  @override
  String get largerSizeWarning => 'حجم خروجی ممکن است بیشتر از فایل اصلی باشد.';

  @override
  String get clearCompletedBtn => 'پاکسازی تکمیل‌شده‌ها';

  @override
  String get clearAllBtn => 'پاکسازی همه';

  @override
  String get stopAllBtn => 'توقف همه';

  @override
  String get startCompressionBtn => 'شروع فشرده‌سازی';

  @override
  String get allDoneLabel => 'همه انجام شد!';

  @override
  String get openFolderBtn => 'باز کردن پوشه';

  @override
  String get totalEtaLabel => 'زمان باقی‌مانده';

  @override
  String get totalSavedLabel => 'مجموع صرفه‌جویی';

  @override
  String get videoSingle => 'ویدیو';

  @override
  String get videosPlural => 'ویدیو';

  @override
  String get fileSingle => 'فایل';

  @override
  String get filesPlural => 'فایل';

  @override
  String get releaseToAddVideosMsg => 'برای افزودن فایل‌ها رها کنید';

  @override
  String get dragDropHereMsg => 'ویدیوها یا تصاویر را اینجا رها کنید';

  @override
  String get supportedFormatsMsg =>
      'پشتیبانی از MP4, MKV, MOV, AVI, WMV, WebM • PNG, JPG, WebP, AVIF و بیشتر';

  @override
  String get selectFilesBtn => 'انتخاب فایل';

  @override
  String get selectFolderBtn => 'انتخاب پوشه';

  @override
  String get releaseToShrinkTitle => 'برای فشرده‌سازی رها کنید';

  @override
  String get filesWillBeAddedDesc => 'فایل‌های شما به صف اضافه خواهند شد.';

  @override
  String get disabledLabel => 'غیرفعال';

  @override
  String get compressionInProgressTitle => 'فشرده‌سازی درحال انجام است';

  @override
  String get confirmCloseDesc => 'آیا از بستن Shrinkeo مطمئن هستید؟';

  @override
  String get keepCompressingBtn => 'ادامه فشرده‌سازی';

  @override
  String get closeAppBtn => 'بستن برنامه';

  @override
  String get lockedSettingsWarning => 'در زمان فشرده‌سازی قفل است';

  @override
  String get updateRequiredTitle => 'به‌روزرسانی الزامی';

  @override
  String get updateRequiredDescNewVersion => 'نسخه جدیدی منتشر شده است.';

  @override
  String get updateRequiredDescOldVersion => 'نسخه شما دیگر پشتیبانی نمی‌شود.';

  @override
  String get updateNowBtn => 'به‌روزرسانی الان';

  @override
  String get laterBtn => 'بعداً';

  @override
  String get updateAvailableTitle => 'به‌روزرسانی موجود است';

  @override
  String get whatsNewTitle => 'تغییرات جدید:';

  @override
  String get exitAppBtn => 'خروج';

  @override
  String get retryBtn => 'تلاش مجدد';

  @override
  String get downloadFromWebsiteBtn => 'دانلود از وب‌سایت';

  @override
  String get skipUpdateConfirmTitle => 'رد کردن آپدیت؟';

  @override
  String get skipUpdateConfirmDesc => 'این به‌روزرسانی شامل اصلاحات مهمی است.';

  @override
  String get skipUpdateCancelBtn => 'لغو';

  @override
  String get skipUpdateConfirmBtn => 'رد کردن آپدیت';

  @override
  String get maintenanceTitle => 'تعمیر و نگهداری';

  @override
  String get maintenanceDescDefault => 'برنامه درحال به‌روزرسانی است.';

  @override
  String versionAvailableMsg(String version) {
    return 'نسخه $version در دسترس است.';
  }

  @override
  String get hwEncoderNotSupportedTitle => 'شتاب‌دهنده پشتیبانی نمی‌شود';

  @override
  String get failedCreateFolderError => 'ایجاد پوشه ناموفق بود';

  @override
  String get failedProbeDurationError => 'محاسبه زمان ناموفق بود';

  @override
  String get ffmpegNotFoundGlobalError => 'برنامه FFmpeg یافت نشد.';

  @override
  String get ffmpegMissingError => 'فایل‌های FFmpeg مفقود یا خراب است.';

  @override
  String hwFallbackNotificationBody(String encoderLabel) {
    return '$encoderLabel ناموفق بود. به CPU تغییر یافت.';
  }

  @override
  String get failedDownloadUpdateMsg =>
      'دانلود آپدیت ناموفق بود. مجددا سعی کنید.';

  @override
  String customRatioActiveTitle(Object ratio) {
    return 'نسبت سفارشی ($ratio)';
  }

  @override
  String customRatioActiveDesc(Object ratio) {
    return 'بوم حاشیه‌دار برای نسبت سفارشی $ratio.';
  }

  @override
  String customAngleActiveTitle(Object angle) {
    return 'زاویه سفارشی ($angle°)';
  }

  @override
  String customAngleActiveDesc(Object angle) {
    return 'ویدیو را با زاویه سفارشی $angle° می‌چرخاند.';
  }

  @override
  String trimActiveDesc(Object end, Object start) {
    return 'کلیپ ویدیویی را بین $start و $end برش می‌دهد.';
  }

  @override
  String targetSizeLimitLabel(Object size) {
    return 'محدودیت $size مگابایت';
  }

  @override
  String get customMbSizeTooltip => 'اندازه سفارشی مگابایت را تایپ کنید';

  @override
  String get trimTimeTooltip =>
      'زمان را وارد کنید مثلاً 5 (5 ثانیه)، 1:30 (1 دقیقه و 30 ثانیه) یا 00:01:30';

  @override
  String get tabImageSuite => 'ابزار تصاویر';

  @override
  String get compressionModeTitle => 'حالت فشرده‌سازی';

  @override
  String get smartAutoLabel => 'هوشمند خودکار';

  @override
  String get smartAutoDesc =>
      'کاهش خودکار حجم فایل تا ۶۰-۸۰٪ با شفافیت تصویر کامل. عالی برای عکس‌های روزمره.';

  @override
  String get maxSavingsLabel => 'حداکثر صرفه‌جویی';

  @override
  String get maxSavingsDesc =>
      'فشرده‌سازی شدید با صرفه‌جویی تا ۸۵-۹۰٪. عالی برای پیام‌رسان‌ها و ایمیل.';

  @override
  String get ultraFidelityLabel => 'کیفیت فوق‌العاده';

  @override
  String get ultraFidelityDesc =>
      'حفظ کیفیت اصلی با حداقل فشرده‌سازی. عالی برای آرشیو و چاپ.';

  @override
  String get targetImageFormatTitle => 'فرمت تصویر مقصد';

  @override
  String get dimensionResizingTitle => 'تغییر ابعاد تصویر';

  @override
  String get exifCameraPrivacyTitle => 'حریم خصوصی دوربین (EXIF)';

  @override
  String get stripGpsCameraInfoLabel => 'حذف اطلاعات موقعیت و دوربین';

  @override
  String get imgFmtOriginalLabel => 'فرمت اصلی';

  @override
  String get imgFmtOriginalDesc =>
      'فرمت اصلی را حفظ کنید (سریعترین، بدون تبدیل).';

  @override
  String get imgFmtPngLabel => 'تصویر PNG (png.)';

  @override
  String get imgFmtPngDesc => 'فرمت PNG بدون اتلاف با پشتیبانی از شفافیت.';

  @override
  String get imgFmtJpgLabel => 'تصویر JPEG (jpg.)';

  @override
  String get imgFmtJpgDesc => 'فرمت استاندارد JPEG فشرده برای سازگاری جهانی.';

  @override
  String get imgFmtWebpLabel => 'تصویر WebP (webp.)';

  @override
  String get imgFmtWebpDesc =>
      'قالب مدرن WebP با فشرده سازی عالی و اندازه کوچک.';

  @override
  String get imgFmtAvifLabel => 'تصویر AVIF (avif.)';

  @override
  String get imgFmtAvifDesc =>
      'فرمت AVIF نسل بعدی با راندمان فشرده سازی فوق العاده بالا.';

  @override
  String get imgResOriginalLabel => 'ابعاد اصلی';

  @override
  String get imgResOriginalDesc => 'ابعاد عرض و ارتفاع تصویر اصلی را حفظ کنید.';

  @override
  String get imgRes4kLabel => '4K Max (3840px)';

  @override
  String get imgRes4kDesc =>
      'حداکثر ابعاد تصویر را به 3840 پیکسل (حداکثر 4K) کاهش دهید.';

  @override
  String get imgRes1080pLabel => 'حداکثر فول اچ دی (1920 پیکسل)';

  @override
  String get imgRes1080pDesc =>
      'حداکثر ابعاد تصویر را به 1920 پیکسل کاهش دهید (حداکثر فول اچ دی).';

  @override
  String get imgRes720pLabel => 'HD Max (1280px)';

  @override
  String get imgRes720pDesc =>
      'حداکثر ابعاد تصویر را به 1280 پیکسل (حداکثر HD) کاهش دهید.';

  @override
  String get imgRes480pLabel => 'حداکثر SD (854 پیکسل)';

  @override
  String get imgRes480pDesc =>
      'حداکثر ابعاد تصویر را به 854 پیکسل (حداکثر SD) کاهش دهید.';

  @override
  String get keepMetadataImageInfoDesc =>
      'EXIF تصویر اصلی و ابرداده دوربین را حفظ می کند.';

  @override
  String get imageQualityModeLabel => 'سطح کیفیت';

  @override
  String get imageQualityModeDesc =>
      'با سطح کیفیت ثابت کدگذاری می‌کند — کیفیت بالاتر یعنی فایل‌های بزرگ‌تر.';

  @override
  String get imageTargetSizeModeLabel => 'حجم هدف';

  @override
  String get imageTargetSizeModeDesc =>
      'به‌طور خودکار بالاترین کیفیتی را پیدا می‌کند که در محدوده حجم جا شود.';

  @override
  String get imageQualitySliderTitle => 'کیفیت تصویر';

  @override
  String get imageTargetSizeTitle => 'حجم هدف فایل';

  @override
  String get imageTargetSizeDesc =>
      'با کیفیت کاهشی مکرر کدگذاری می‌کند تا فایل در محدوده جا شود. محدوده‌های خیلی کوچک ممکن است کیفیت را کاهش دهند.';

  @override
  String imageTargetSizeLimitLabel(String size) {
    return 'حد $size';
  }

  @override
  String get customKbSizeTooltip => 'حجم دلخواه به کیلوبایت بنویسید';

  @override
  String get imageProcessingFailedError => 'پردازش تصویر ناموفق بود';

  @override
  String get imageProcessingErrorMsg => 'خطا در پردازش تصویر';

  @override
  String get cleanNoiseLabel => 'پاکسازی نویز';

  @override
  String get outputLargerTooltip =>
      'حجم خروجی بزرگتر از فایل اصلی خواهد بود!\nمتوقف کنید و تنظیمات را بازنشانی کنید.';

  @override
  String get estimatedSizePrefix => 'برآورد:';

  @override
  String get cancelBtnTooltip => 'لغو کنید';

  @override
  String get removeBtnTooltip => 'حذف کنید';

  @override
  String get selectLanguageTitle => 'زبان را انتخاب کنید';

  @override
  String get searchLanguageHint => 'جستجوی زبان بر اساس نام یا کد...';

  @override
  String get noLanguagesMatchSearch => 'هیچ زبانی با جستجوی شما مطابقت ندارد.';

  @override
  String get languageTooltip => 'زبان';

  @override
  String get notifyCompressionCompleteTitle => 'فشرده سازی Shrinkeo Complete';

  @override
  String get notifyOutputLargerTitle => 'خروجی بزرگتر از اصلی';

  @override
  String languagesCountLabel(String count) {
    return '$count زبان';
  }

  @override
  String notifyCompressionCompleteSuccess(String success) {
    return '$success فایل با موفقیت فشرده شد.';
  }

  @override
  String notifyCompressionCompleteFailed(String failed) {
    return '($failed ناموفق)';
  }

  @override
  String notifyOutputLargerDesc(String fileName) {
    return 'انتظار می رود $fileName بزرگتر از اندازه فایل اصلی باشد. لغو و بازنشانی تنظیمات به حالت پیش فرض را در نظر بگیرید.';
  }

  @override
  String get imagePreparing => 'در حال آماده‌سازی تصویر';

  @override
  String get imageEncoding => 'در حال فشرده‌سازی تصویر';

  @override
  String get imageSaving => 'در حال ذخیره نتیجه';

  @override
  String imageTargetProgress(String size) {
    return 'هدف: $size';
  }

  @override
  String imageAttempt(int count) {
    return 'تلاش $count';
  }

  @override
  String imageBestResult(String size) {
    return 'بهترین نتیجه: $size';
  }

  @override
  String queueCompleted(int done, int total) {
    return '$done از $total تکمیل شد';
  }
}
