// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Serbian (`sr`).
class AppLocalizationsSr extends AppLocalizations {
  AppLocalizationsSr([String locale = 'sr']) : super(locale);

  @override
  String get appName => 'Shrinkeo';

  @override
  String get totalSpaceSaved => 'Укупно уштеђен простор';

  @override
  String get savedSpacePrefix => 'Уштеђено:';

  @override
  String get supportButtonText => 'Подржи пројекат';

  @override
  String get lightThemeTooltip => 'Светла тема';

  @override
  String get darkThemeTooltip => 'Тамна тема';

  @override
  String get settingsTooltip => 'Подешавања';

  @override
  String get minimizeTooltip => 'Минимизирај';

  @override
  String get closeTooltip => 'Затвори';

  @override
  String get restoreTooltip => 'Врати';

  @override
  String get maximizeTooltip => 'Максимизирај';

  @override
  String get tabCompressionQuality => 'Компресија и Квалитет';

  @override
  String get tabVideoEditingTools => 'Уређивање Видеа и Алати';

  @override
  String get tabAudioSettings => 'Подешавања Звука';

  @override
  String get tabEngineOutput => 'Мотор и Излазна Фасцикла';

  @override
  String get compressionSettingsTitle => 'Подешавања Компресије';

  @override
  String get resetToDefaults => 'Врати на подразумевано';

  @override
  String get resetDefaultTooltip => 'Врати на почетне вредности';

  @override
  String get modeTargetSizeTitle => 'Режим Циља Компресије';

  @override
  String get modeCrfLabel => 'Квалитет (CRF)';

  @override
  String get modeTargetSizeLabel => 'Циљна Величина (MB)';

  @override
  String get crfQualityTitle => 'CRF Фактор Квалитета';

  @override
  String get targetSizeLabel => 'Циљна Величина Датотеке (MB)';

  @override
  String get targetSizeDesc =>
      'Израчунава битрејт да би се уклопио у ограничање.';

  @override
  String get encodingSpeedTitle => 'Брзина Кодирања';

  @override
  String get presetUltrafastLabel => 'Ултрабрзо';

  @override
  String get presetUltrafastDesc =>
      'Максимална брзина, али најмање смањење величине.';

  @override
  String get presetSuperfastLabel => 'Супербрзо';

  @override
  String get presetSuperfastDesc => 'Веома брзо кодирање.';

  @override
  String get presetVeryfastLabel => 'Веома брзо';

  @override
  String get presetVeryfastDesc => 'Брже од просека.';

  @override
  String get presetFasterLabel => 'Брже';

  @override
  String get presetFasterDesc => 'Добра брзина и одлична компресија.';

  @override
  String get presetFastLabel => 'Брзо';

  @override
  String get presetFastDesc => 'Најбољи баланс брзине и величине.';

  @override
  String get presetMediumLabel => 'Средње';

  @override
  String get presetMediumDesc => 'Подразумевани баланс.';

  @override
  String get presetSlowLabel => 'Споро';

  @override
  String get presetSlowDesc => 'Спорије, али значајно мање датотеке.';

  @override
  String get presetVeryslowLabel => 'Веома споро';

  @override
  String get presetVeryslowDesc => 'Максимално смањење величине.';

  @override
  String get videoCodecTitle => 'Видео Кодек';

  @override
  String get codecH264Label => 'H.264';

  @override
  String get codecH264Desc =>
      'Максимална компатибилност са старијим уређајима.';

  @override
  String get codecH265Label => 'H.265 / HEVC';

  @override
  String get codecH265Desc => 'Боља ефикасност компресије.';

  @override
  String get codecAv1Label => 'AV1';

  @override
  String get codecAv1Desc => 'Кодек следеће генерације (30% мањи од H.265).';

  @override
  String get hardwareEncoderTitle => 'Хардверско Убрзање (GPU)';

  @override
  String get hwSoftwareLabel => 'Софтверски (CPU)';

  @override
  String get hwSoftwareDesc => 'Најспорији, али највећа компатибилност.';

  @override
  String get hwNvidiaLabel => 'Nvidia (NVENC)';

  @override
  String get hwNvidiaDesc => 'Изузетно брзо кодирање за Nvidia GPU.';

  @override
  String get hwAmdLabel => 'AMD (AMF)';

  @override
  String get hwAmdDesc => 'Изузетно брзо кодирање за AMD GPU.';

  @override
  String get hwIntelLabel => 'Intel (QSV)';

  @override
  String get hwIntelDesc => 'Изузетно брзо кодирање за Intel GPU.';

  @override
  String get resolutionTitle => 'Максимална Резолуција';

  @override
  String get resOriginalLabel => 'Оригинална';

  @override
  String get resOriginalDesc => 'Задржи оригиналну резолуцију.';

  @override
  String get res4kLabel => '4K';

  @override
  String get res4kDesc => 'Смањи до макс 4K.';

  @override
  String get res2kLabel => '2K';

  @override
  String get res2kDesc => 'Смањи до макс 2K.';

  @override
  String get res1080pLabel => '1080p';

  @override
  String get res1080pDesc => 'Смањи до макс 1080p Full HD.';

  @override
  String get res720pLabel => '720p';

  @override
  String get res720pDesc => 'Смањи до макс 720p HD.';

  @override
  String get res480pLabel => '480p';

  @override
  String get res480pDesc => 'Смањи на 480p.';

  @override
  String get res360pLabel => '360p';

  @override
  String get res360pDesc => 'Максимална компресија.';

  @override
  String get frameRateTitle => 'Брзина Слика (FPS)';

  @override
  String get fpsOriginalLabel => 'Оригинална';

  @override
  String get fpsOriginalDesc => 'Исти FPS као извор.';

  @override
  String get fps60Label => '60 fps';

  @override
  String get fps60Desc => 'Течно за игре или спорт.';

  @override
  String get fps30Label => '30 fps';

  @override
  String get fps30Desc => 'Стандард за већину видеа.';

  @override
  String get fps24Label => '24 fps';

  @override
  String get fps24Desc => 'Филмски стил.';

  @override
  String get enableVideoDenoiseTitle => 'Чишћење Шума Видеа';

  @override
  String get enableVideoDenoiseDesc => '3D филтер за смањење шума.';

  @override
  String get exportFormatTitle => 'Формат Извоза';

  @override
  String get exportVideoLabel => 'Стандардни Видео';

  @override
  String get exportVideoDesc => 'Извези као MP4/MKV/MOV';

  @override
  String get exportGifLabel => 'Анимирани GIF';

  @override
  String get exportGifDesc => 'Направи висококвалитетни GIF';

  @override
  String get exportMp3Label => 'Извуци MP3';

  @override
  String get exportMp3Desc => 'Извуци аудио као MP3 320kbps';

  @override
  String get exportAacLabel => 'Извуци AAC';

  @override
  String get exportAacDesc => 'Извуци аудио као AAC';

  @override
  String get exportWavLabel => 'Извуци WAV';

  @override
  String get exportWavDesc => 'Извуци некомеприсовани WAV аудио';

  @override
  String get privacyScrubbingTitle => 'Приватност и GPS';

  @override
  String get keepMetadataLabel => 'Задржи Податке';

  @override
  String get stripGpsExifLabel => 'Уклони GPS/EXIF';

  @override
  String get stripGpsExifInfoTitle => 'Очисти Метаподатке';

  @override
  String get stripGpsExifInfoDesc =>
      'Уклања информације о камери и GPS локацију.';

  @override
  String get keepMetadataInfoDesc => 'Задржава све оригиналне метаподатке.';

  @override
  String get autoCropBlackBarsTitle => 'Аутоматско Сечење Црних Трака';

  @override
  String get autoCropLabel => 'Ауто Сечење';

  @override
  String get autoCropActiveTitle => 'Ауто Сечење Активно';

  @override
  String get autoCropActiveDesc => 'Аутоматски уклања црне траке.';

  @override
  String get autoCropDisabledDesc => 'Задржава оригиналне ивице.';

  @override
  String get playbackSpeedTitle => 'Брзина Репродукције';

  @override
  String get speedOriginalLabel => '1.0x';

  @override
  String get speedOriginalDesc => 'Нормална брзина';

  @override
  String get speedSlow05Label => '0.5x Споро';

  @override
  String get speedSlow05Desc => 'Репродукуј на половини брзине';

  @override
  String get speedFast15Label => '1.5x';

  @override
  String get speedFast15Desc => '1.5 пута брже';

  @override
  String get speedFast20Label => '2.0x Брзо';

  @override
  String get speedFast20Desc => 'Двострука брзина';

  @override
  String get speedTimelapse40Label => '4.0x Тајмлапс';

  @override
  String get speedTimelapse40Desc => '4x брзина за тајмлапс';

  @override
  String get canvasAspectRatioTitle => 'Однос Страница';

  @override
  String get aspectOriginalLabel => 'Оригинални';

  @override
  String get aspectOriginalDesc => 'Задржи оригинални однос';

  @override
  String get aspectShortsLabel => '9:16 Shorts';

  @override
  String get aspectShortsDesc => 'За TikTok и Reels';

  @override
  String get aspectSquareLabel => '1:1 Квадрат';

  @override
  String get aspectSquareDesc => 'За Инстаграм објаве';

  @override
  String get aspectPortraitLabel => '4:5 Портрет';

  @override
  String get aspectPortraitDesc => 'За вертикални Инстаграм';

  @override
  String get aspectWidescreenLabel => '16:9 Широки';

  @override
  String get aspectWidescreenDesc => 'За YouTube и ТВ';

  @override
  String get aspectClassicLabel => '4:3 Класични';

  @override
  String get aspectClassicDesc => 'За класичне екране';

  @override
  String get aspectCinemaLabel => '21:9 Биоскоп';

  @override
  String get aspectCinemaDesc => 'За ултрашироке мониторе';

  @override
  String get aspectCustomLabel => 'Прилагођени Однос';

  @override
  String get aspectCustomDesc => 'Жељени однос страница';

  @override
  String get customRatioTooltip => 'Нпр: 16:10, 2:1';

  @override
  String get rotationFlipTitle => 'Ротација и Огледало';

  @override
  String get rotOriginalLabel => 'Оригинално (0°)';

  @override
  String get rotOriginalDesc => 'Задржи оријентацију';

  @override
  String get rot90Label => '90° Десно';

  @override
  String get rot90Desc => 'Ротирај 90 степени у смеру казаљке';

  @override
  String get rot180Label => '180° Окренуто';

  @override
  String get rot180Desc => 'Ротирај наглавачке';

  @override
  String get rot270Label => '270° Лево';

  @override
  String get rot270Desc => 'Ротирај 90 степени супротно казаљци';

  @override
  String get rotFlipHLabel => 'Огледало Хориз.';

  @override
  String get rotFlipHDesc => 'Окрени хоризонтално';

  @override
  String get rotFlipVLabel => 'Огледало Верт.';

  @override
  String get rotFlipVDesc => 'Окрени вертикално';

  @override
  String get rotCustomLabel => 'Прилагођени Угао';

  @override
  String get rotCustomDesc => 'Ротирај под одређеним углом';

  @override
  String get customRotationTooltip => 'Угао у степенима нпр. 45';

  @override
  String get trimVideoTitle => 'Сечење Видеа';

  @override
  String get fullVideoLabel => 'Цео Видео';

  @override
  String get cutClipLabel => 'Исеци Исечак';

  @override
  String get trimStartLabel => 'Почетак';

  @override
  String get trimEndLabel => 'Крај';

  @override
  String get trimActiveTitle => 'Сечење је Активно';

  @override
  String get fullVideoDesc => 'Обради цео видео без сечења.';

  @override
  String get audioModeTitle => 'Режим Аудио Траке';

  @override
  String get audioOriginalLabel => 'Оригинални';

  @override
  String get audioOriginalDesc => 'Без губитка квалитета звука.';

  @override
  String get audioAac256Label => 'Висок Квалитет (256k)';

  @override
  String get audioAac256Desc => 'AAC 256kbps';

  @override
  String get audioAac128Label => 'Избалансирано (128k)';

  @override
  String get audioAac128Desc => 'AAC 128kbps (Веб стандард)';

  @override
  String get audioAac64Label => 'Мала Величина (64k)';

  @override
  String get audioAac64Desc => 'AAC 64kbps за говор';

  @override
  String get audioMuteLabel => 'Искључи Звук';

  @override
  String get audioMuteDesc => 'Потпуно уклони аудио траку.';

  @override
  String get audioNormTitle => 'Изједначавање Јачине Звука';

  @override
  String get audioNormOffLabel => 'Искључено';

  @override
  String get audioNormOffDesc => 'Оригинална динамика.';

  @override
  String get audioNormSpeechLabel => 'Људски Говор';

  @override
  String get audioNormSpeechDesc => 'EBU R128 за јасан дијалог.';

  @override
  String get audioNormDynamicLabel => 'Биоскоп Динамика';

  @override
  String get audioNormDynamicDesc => 'Изједначава тихе и гласне звуке.';

  @override
  String get audioNormBoostLabel => 'Благо Појачање';

  @override
  String get audioNormBoostDesc => '+3dB појачање јачине.';

  @override
  String get audioChanTitle => 'Аудио Канали';

  @override
  String get audioChanOriginalLabel => 'Оригинални';

  @override
  String get audioChanOriginalDesc => 'Задржи изворне канале.';

  @override
  String get audioChanStereoLabel => 'Стерео (2.0)';

  @override
  String get audioChanStereoDesc => 'Стандардни 2-канални стерео.';

  @override
  String get audioChanMonoLabel => 'Моно (1.0)';

  @override
  String get audioChanMonoDesc => 'Један канал - 50% уштеде величине.';

  @override
  String get removeNoiseLabel => 'Уклони Шум';

  @override
  String get enableAudioDenoiseTitle => 'Уклони Шум Микрофона';

  @override
  String get enableAudioDenoiseDesc =>
      'Филтер за пречишћавање позадинског шума.';

  @override
  String get outputDirectoryTitle => 'Излазна Фасцикла';

  @override
  String get defaultOutputDirectory =>
      'Подразумевано (Поред оригиналне датотеке)';

  @override
  String get selectOutputFolderTitle => 'Изабери Фасциклу';

  @override
  String get clearOutputFolder => 'Користи подразумевану локацију';

  @override
  String get changeBtn => 'Промени';

  @override
  String get outputLocationTitle => 'Понашање Излаза';

  @override
  String get outputLocationUnifiedLabel => 'Једна Фасцикла';

  @override
  String get outputLocationUnifiedDesc =>
      'Сви компресовани видеи у једној фасцикли.';

  @override
  String get outputLocationSameLabel => 'Поред Оригинала';

  @override
  String get outputLocationSameDesc =>
      'Сваки видео поред своје изворне датотеке.';

  @override
  String get fileManagementTitle => 'Управљање Датотекама';

  @override
  String get keepOriginalsLabel => 'Задржи Оригинале';

  @override
  String get keepOriginalsDesc => 'Остави оригиналне датотеке недирнуте.';

  @override
  String get toRecycleBinLabel => 'У Корпу за Отпатке';

  @override
  String get toRecycleBinDesc => 'Премести оригинале у корпу након компресије.';

  @override
  String get outputFormatTitle => 'Формат Контејнера';

  @override
  String get formatOriginalLabel => 'Оригинални';

  @override
  String get formatOriginalDesc => 'Задржи оригинални формат.';

  @override
  String get formatMp4Label => 'MP4';

  @override
  String get formatMp4Desc => 'Максимална компатибилност.';

  @override
  String get formatMkvLabel => 'MKV';

  @override
  String get formatMkvDesc => 'Подршка за више трака.';

  @override
  String get formatMovLabel => 'MOV';

  @override
  String get formatMovDesc => 'Apple QuickTime формат.';

  @override
  String get scanningFilesMsg => 'Скенирање датотека...';

  @override
  String get addFilesBtn => 'Додај Датотеке';

  @override
  String get addFolderBtn => 'Додај Фасциклу';

  @override
  String get dragDropMoreMsg => 'Или превуците и испустите још видеа овде';

  @override
  String get openOutputFolderTooltip => 'Отвори Излазну Фасциклу';

  @override
  String get statusQueued => 'У реду';

  @override
  String get statusAnalyzing => 'Анализирање';

  @override
  String get statusCompressing => 'Компресовање';

  @override
  String get statusDone => 'Завршено';

  @override
  String get statusFailed => 'Неуспешно';

  @override
  String get statusCancelled => 'Отказано';

  @override
  String get savedPrefix => 'Уштеђено';

  @override
  String get largerSuffix => 'Веће';

  @override
  String get largerSizeWarning =>
      'Излазна величина може бити већа од оригинала.';

  @override
  String get clearCompletedBtn => 'Очисти Завршене';

  @override
  String get clearAllBtn => 'Очисти Све';

  @override
  String get stopAllBtn => 'Заустави Све';

  @override
  String get startCompressionBtn => 'Покрени Компресију';

  @override
  String get allDoneLabel => 'Све је Завршено!';

  @override
  String get openFolderBtn => 'Отвори Фасциклу';

  @override
  String get totalEtaLabel => 'Преостало Време';

  @override
  String get totalSavedLabel => 'Укупно Уштеђено';

  @override
  String get videoSingle => 'видео';

  @override
  String get videosPlural => 'видеа';

  @override
  String get releaseToAddVideosMsg => 'Испустите да додате видее';

  @override
  String get dragDropHereMsg =>
      'Превуците и испустите датотеке или фасцикле овде';

  @override
  String get supportedFormatsMsg => 'Подржава MP4, MKV, MOV, AVI, WMV';

  @override
  String get selectFilesBtn => 'Изабери Датотеке';

  @override
  String get selectFolderBtn => 'Изабери Фасциклу';

  @override
  String get releaseToShrinkTitle => 'Испустите за моменталну компресију';

  @override
  String get filesWillBeAddedDesc => 'Ваше датотеке ће бити додате у ред.';

  @override
  String get disabledLabel => 'Онемогућено';

  @override
  String get compressionInProgressTitle => 'Компресовање је у Току';

  @override
  String get confirmCloseDesc =>
      'Да ли сте сигурни да желите да затворите Shrinkeo?';

  @override
  String get keepCompressingBtn => 'Настави Компресовање';

  @override
  String get closeAppBtn => 'Затвори Апликацију';

  @override
  String get lockedSettingsWarning => 'Закључано током компресије';

  @override
  String get updateRequiredTitle => 'Захтева се Ажурирање';

  @override
  String get updateRequiredDescNewVersion => 'Доступна је нова верзија.';

  @override
  String get updateRequiredDescOldVersion => 'Ваша верзија више није подржана.';

  @override
  String get updateNowBtn => 'Ажурирај Сада';

  @override
  String get laterBtn => 'Касније';

  @override
  String get updateAvailableTitle => 'Доступно Ажурирање';

  @override
  String get whatsNewTitle => 'Шта је ново:';

  @override
  String get exitAppBtn => 'Излаз';

  @override
  String get retryBtn => 'Покушај поново';

  @override
  String get downloadFromWebsiteBtn => 'Преузми са Веб сајта';

  @override
  String get skipUpdateConfirmTitle => 'Прескочити ажурирање?';

  @override
  String get skipUpdateConfirmDesc => 'Ово ажурирање садржи важне исправке.';

  @override
  String get skipUpdateCancelBtn => 'Откажи';

  @override
  String get skipUpdateConfirmBtn => 'Прескочи ажурирање';

  @override
  String get maintenanceTitle => 'Одржавање';

  @override
  String get maintenanceDescDefault => 'Shrinkeo је тренутно на одржавању.';

  @override
  String versionAvailableMsg(String version) {
    return 'Верзија $version је доступна.';
  }

  @override
  String get hwEncoderNotSupportedTitle => 'Хардверско убрзање није подржано';

  @override
  String get failedCreateFolderError => 'Грешка при креирању излазне фасцикле';

  @override
  String get failedProbeDurationError => 'Грешка при очитавању трајања';

  @override
  String get ffmpegNotFoundGlobalError => 'FFmpeg није пронађен.';

  @override
  String get ffmpegMissingError =>
      'FFmpeg или FFprobe недостаје или је оштећен.';

  @override
  String hwFallbackNotificationBody(String encoderLabel) {
    return '$encoderLabel није успео. Пребачено на CPU.';
  }

  @override
  String get failedDownloadUpdateMsg =>
      'Преузимање ажурирања није успело. Покушајте поново.';

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
