// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Bulgarian (`bg`).
class AppLocalizationsBg extends AppLocalizations {
  AppLocalizationsBg([String locale = 'bg']) : super(locale);

  @override
  String get appName => 'Shrinkeo';

  @override
  String get totalSpaceSaved => 'Общо спестено място';

  @override
  String get savedSpacePrefix => 'Спестени:';

  @override
  String get supportButtonText => 'Купи ми кафе';

  @override
  String get lightThemeTooltip => 'Светла тема';

  @override
  String get darkThemeTooltip => 'Тъмна тема';

  @override
  String get settingsTooltip => 'Настройки';

  @override
  String get minimizeTooltip => 'Минимизирай';

  @override
  String get closeTooltip => 'Затвори';

  @override
  String get restoreTooltip => 'Възстанови';

  @override
  String get maximizeTooltip => 'Максимизирай';

  @override
  String get tabCompressionQuality => 'Компресия и Качество';

  @override
  String get tabVideoEditingTools => 'Видео Редактиране и Инструменти';

  @override
  String get tabAudioSettings => 'Аудио Настройки';

  @override
  String get tabEngineOutput => 'Двигател и Изходна Папка';

  @override
  String get compressionSettingsTitle => 'Настройки за Компресия';

  @override
  String get resetToDefaults => 'Възстанови подразбиранията';

  @override
  String get resetDefaultTooltip => 'Върни към първоначалните стойности';

  @override
  String get modeTargetSizeTitle => 'Режим на Целта';

  @override
  String get modeCrfLabel => 'Качество (CRF)';

  @override
  String get modeTargetSizeLabel => 'Целеви Размер (MB)';

  @override
  String get crfQualityTitle => 'CRF Коефициент на Качество';

  @override
  String get targetSizeLabel => 'Целеви Размер на Файла (MB)';

  @override
  String get targetSizeDesc => 'Изчислява битрейта, за да се вмести в лимита.';

  @override
  String get encodingSpeedTitle => 'Скорост на Кодиране';

  @override
  String get presetUltrafastLabel => 'Ултрабърз';

  @override
  String get presetUltrafastDesc =>
      'Максимална скорость, но най-малко намаление.';

  @override
  String get presetSuperfastLabel => 'Супербърз';

  @override
  String get presetSuperfastDesc => 'Много бързо кодиране.';

  @override
  String get presetVeryfastLabel => 'Много бърз';

  @override
  String get presetVeryfastDesc => 'По-бърз от средното.';

  @override
  String get presetFasterLabel => 'По-бърз';

  @override
  String get presetFasterDesc => 'Добра скорост и висока компресия.';

  @override
  String get presetFastLabel => 'Бърз (Препоръчително)';

  @override
  String get presetFastDesc => 'Най-добър баланс между скорост и размер.';

  @override
  String get presetMediumLabel => 'Среден';

  @override
  String get presetMediumDesc => 'Баланс по подразбиране.';

  @override
  String get presetSlowLabel => 'Бавен';

  @override
  String get presetSlowDesc => 'По-бавен, но значително по-малки файлове.';

  @override
  String get presetVeryslowLabel => 'Много бавен';

  @override
  String get presetVeryslowDesc => 'Максимално намаляване на размера.';

  @override
  String get videoCodecTitle => 'Видео Кодек';

  @override
  String get codecH264Label => 'H.264';

  @override
  String get codecH264Desc => 'Максимална съвместимост със стари устройства.';

  @override
  String get codecH265Label => 'H.265 / HEVC';

  @override
  String get codecH265Desc => 'По-добра ефективност на компресия.';

  @override
  String get codecAv1Label => 'AV1';

  @override
  String get codecAv1Desc => 'Кодек от ново поколение (30% по-малък от H.265).';

  @override
  String get hardwareEncoderTitle => 'Хардуерно Ускорение (GPU)';

  @override
  String get hwSoftwareLabel => 'Софтуерен (CPU)';

  @override
  String get hwSoftwareDesc => 'Най-бавен, но най-висока съвместимост.';

  @override
  String get hwNvidiaLabel => 'Nvidia (NVENC)';

  @override
  String get hwNvidiaDesc => 'Изключително бързо кодиране за Nvidia GPU.';

  @override
  String get hwAmdLabel => 'AMD (AMF)';

  @override
  String get hwAmdDesc => 'Изключително бързо кодиране за AMD GPU.';

  @override
  String get hwIntelLabel => 'Intel (QSV)';

  @override
  String get hwIntelDesc => 'Изключително бързо кодиране за Intel GPU.';

  @override
  String get resolutionTitle => 'Максимална Резолюция';

  @override
  String get resOriginalLabel => 'Оригинална';

  @override
  String get resOriginalDesc => 'Запази оригиналната резолюция.';

  @override
  String get res4kLabel => '4K';

  @override
  String get res4kDesc => 'Намали до макс 4K.';

  @override
  String get res2kLabel => '2K';

  @override
  String get res2kDesc => 'Намали до макс 2K.';

  @override
  String get res1080pLabel => '1080p';

  @override
  String get res1080pDesc => 'Намали до макс 1080p Full HD.';

  @override
  String get res720pLabel => '720p';

  @override
  String get res720pDesc => 'Намали до макс 720p HD.';

  @override
  String get res480pLabel => '480p';

  @override
  String get res480pDesc => 'Намали до 480p.';

  @override
  String get res360pLabel => '360p';

  @override
  String get res360pDesc => 'Максимална компресия.';

  @override
  String get frameRateTitle => 'Честота на Кадрите (FPS)';

  @override
  String get fpsOriginalLabel => 'Оригинална';

  @override
  String get fpsOriginalDesc => 'Същият FPS като източника.';

  @override
  String get fps60Label => '60 fps';

  @override
  String get fps60Desc => 'Плавно за игри или спорт.';

  @override
  String get fps30Label => '30 fps';

  @override
  String get fps30Desc => 'Стандарт за повечето видеа.';

  @override
  String get fps24Label => '24 fps';

  @override
  String get fps24Desc => 'Кинематографичен стил.';

  @override
  String get enableVideoDenoiseTitle => 'Изчистване на Видео Шум';

  @override
  String get enableVideoDenoiseDesc => '3D филтър за намаляване на шума.';

  @override
  String get exportFormatTitle => 'Формат за Експорт';

  @override
  String get exportVideoLabel => 'Стандартно Видео';

  @override
  String get exportVideoDesc => 'Експортирай като MP4/MKV/MOV';

  @override
  String get exportGifLabel => 'Анимиран GIF';

  @override
  String get exportGifDesc => 'Създай висококачествен анимиран GIF';

  @override
  String get exportMp3Label => 'Извличане на MP3';

  @override
  String get exportMp3Desc => 'Извлечи аудио като MP3 320kbps';

  @override
  String get exportAacLabel => 'Извличане на AAC';

  @override
  String get exportAacDesc => 'Извлечи аудио като AAC';

  @override
  String get exportWavLabel => 'Извличане на WAV';

  @override
  String get exportWavDesc => 'Извлечи некомпресирано WAV аудио';

  @override
  String get privacyScrubbingTitle => 'Поверителност и GPS';

  @override
  String get keepMetadataLabel => 'Запази Данните';

  @override
  String get stripGpsExifLabel => 'Премахни GPS/EXIF';

  @override
  String get stripGpsExifInfoTitle => 'Изчисти Метаданните';

  @override
  String get stripGpsExifInfoDesc =>
      'Премахва информация за камерата и GPS позиция.';

  @override
  String get keepMetadataInfoDesc => 'Запазва всички оригинални метаданни.';

  @override
  String get autoCropBlackBarsTitle => 'Автоматично Изрязване на Черни Ленти';

  @override
  String get autoCropLabel => 'Авто Изрязване';

  @override
  String get autoCropActiveTitle => 'Авто Изрязване Включено';

  @override
  String get autoCropActiveDesc => 'Автоматично премахва черните ленти.';

  @override
  String get autoCropDisabledDesc => 'Запазва оригиналните рамки.';

  @override
  String get playbackSpeedTitle => 'Скорост на Възпроизвеждане';

  @override
  String get speedOriginalLabel => '1.0x';

  @override
  String get speedOriginalDesc => 'Нормална скорост';

  @override
  String get speedSlow05Label => '0.5x Бавно';

  @override
  String get speedSlow05Desc => 'Възпроизвеждай на половин скорост';

  @override
  String get speedFast15Label => '1.5x';

  @override
  String get speedFast15Desc => '1.5 пъти по-бързо';

  @override
  String get speedFast20Label => '2.0x Бързо';

  @override
  String get speedFast20Desc => 'Двойна скорост';

  @override
  String get speedTimelapse40Label => '4.0x Таймлапс';

  @override
  String get speedTimelapse40Desc => '4x скорост за таймлапс';

  @override
  String get canvasAspectRatioTitle => 'Съотношение на Страните';

  @override
  String get aspectOriginalLabel => 'Оригинално';

  @override
  String get aspectOriginalDesc => 'Запази оригиналното съотношение';

  @override
  String get aspectShortsLabel => '9:16 Shorts';

  @override
  String get aspectShortsDesc => 'За TikTok и Reels';

  @override
  String get aspectSquareLabel => '1:1 Квадрат';

  @override
  String get aspectSquareDesc => 'За публикации в Instagram';

  @override
  String get aspectPortraitLabel => '4:5 Портрет';

  @override
  String get aspectPortraitDesc => 'За вертикален Instagram';

  @override
  String get aspectWidescreenLabel => '16:9 Широкоекранен';

  @override
  String get aspectWidescreenDesc => 'За YouTube и TV';

  @override
  String get aspectClassicLabel => '4:3 Класически';

  @override
  String get aspectClassicDesc => 'За класически екрани';

  @override
  String get aspectCinemaLabel => '21:9 Кино';

  @override
  String get aspectCinemaDesc => 'За ултрашироки монитори';

  @override
  String get aspectCustomLabel => 'Персонализирано';

  @override
  String get aspectCustomDesc => 'Желано съотношение';

  @override
  String get customRatioTooltip => 'Напр: 16:10, 2:1';

  @override
  String get rotationFlipTitle => 'Завъртане и Огледало';

  @override
  String get rotOriginalLabel => 'Оригинално (0°)';

  @override
  String get rotOriginalDesc => 'Запази ориентацията';

  @override
  String get rot90Label => '90° Надясно';

  @override
  String get rot90Desc => 'Завърти на 90 градуса по часовниковата стрелка';

  @override
  String get rot180Label => '180° Обърнато';

  @override
  String get rot180Desc => 'Завърти обратно';

  @override
  String get rot270Label => '270° Наляво';

  @override
  String get rot270Desc => 'Завърти на 90 градуса обратно на часовника';

  @override
  String get rotFlipHLabel => 'Огледало Хориз.';

  @override
  String get rotFlipHDesc => 'Обърни хоризонтално';

  @override
  String get rotFlipVLabel => 'Огледало Верт.';

  @override
  String get rotFlipVDesc => 'Обърни вертикално';

  @override
  String get rotCustomLabel => 'Персонализиран Ъгъл';

  @override
  String get rotCustomDesc => 'Завърти на определен ъгъл';

  @override
  String get customRotationTooltip => 'Ъгъл в градуси напр. 45';

  @override
  String get trimVideoTitle => 'Изрязване на Видео';

  @override
  String get fullVideoLabel => 'Цялото Видео';

  @override
  String get cutClipLabel => 'Изрежи Клип';

  @override
  String get trimStartLabel => 'Начало';

  @override
  String get trimEndLabel => 'Край';

  @override
  String get trimActiveTitle => 'Изрязването е Включено';

  @override
  String get fullVideoDesc => 'Обработи цялото видео без изрязване.';

  @override
  String get audioModeTitle => 'Режим на Аудио Пистата';

  @override
  String get audioOriginalLabel => 'Оригинален';

  @override
  String get audioOriginalDesc => 'Без загуба на качеството на звука.';

  @override
  String get audioAac256Label => 'Високо Качество (256k)';

  @override
  String get audioAac256Desc => 'AAC 256kbps';

  @override
  String get audioAac128Label => 'Балансирано (128k)';

  @override
  String get audioAac128Desc => 'AAC 128kbps (Уеб стандарт)';

  @override
  String get audioAac64Label => 'Нисък Размер (64k)';

  @override
  String get audioAac64Desc => 'AAC 64kbps за реч';

  @override
  String get audioMuteLabel => 'Заглуши Аудиото';

  @override
  String get audioMuteDesc => 'Премахни напълно аудио пистата.';

  @override
  String get audioNormTitle => 'Изравняване на Силата на Звука';

  @override
  String get audioNormOffLabel => 'Изключено';

  @override
  String get audioNormOffDesc => 'Оригинална динамика.';

  @override
  String get audioNormSpeechLabel => 'Човешка Реч';

  @override
  String get audioNormSpeechDesc => 'EBU R128 за ясен диалог.';

  @override
  String get audioNormDynamicLabel => 'Кино Динамика';

  @override
  String get audioNormDynamicDesc => 'Изравнява тихи и силни звуци.';

  @override
  String get audioNormBoostLabel => 'Леко Усилване';

  @override
  String get audioNormBoostDesc => '+3dB усилване на звука.';

  @override
  String get audioChanTitle => 'Аудио Канали';

  @override
  String get audioChanOriginalLabel => 'Оригинални';

  @override
  String get audioChanOriginalDesc => 'Запази изходните канали.';

  @override
  String get audioChanStereoLabel => 'Стерео (2.0)';

  @override
  String get audioChanStereoDesc => 'Стандартно 2-канално стерео.';

  @override
  String get audioChanMonoLabel => 'Моно (1.0)';

  @override
  String get audioChanMonoDesc => 'Един канал - 50% спестяване на размер.';

  @override
  String get removeNoiseLabel => 'Премахни Шума';

  @override
  String get enableAudioDenoiseTitle => 'Премахни Шум от Микрофон';

  @override
  String get enableAudioDenoiseDesc => 'Филтър срещу фонов шум.';

  @override
  String get outputDirectoryTitle => 'Изходна Папка';

  @override
  String get defaultOutputDirectory => 'По подразбиране (До оригиналния файл)';

  @override
  String get selectOutputFolderTitle => 'Избери Папка';

  @override
  String get clearOutputFolder => 'Използвай местоположение по подразбиране';

  @override
  String get changeBtn => 'Промени';

  @override
  String get outputLocationTitle => 'Поведение на Изхода';

  @override
  String get outputLocationUnifiedLabel => 'Една Папка';

  @override
  String get outputLocationUnifiedDesc =>
      'Всички компресирани видеа в една папка.';

  @override
  String get outputLocationSameLabel => 'До Оригинала';

  @override
  String get outputLocationSameDesc => 'Всяко видео до своя изходен файл.';

  @override
  String get fileManagementTitle => 'Управление на Файлове';

  @override
  String get keepOriginalsLabel => 'Запази Оригиналите';

  @override
  String get keepOriginalsDesc => 'Остави оригиналните файлове незасегнати.';

  @override
  String get toRecycleBinLabel => 'В Кошчето';

  @override
  String get toRecycleBinDesc =>
      'Премести оригиналите в кошчето след компресия.';

  @override
  String get outputFormatTitle => 'Контейнерен Формат';

  @override
  String get formatOriginalLabel => 'Оригинален';

  @override
  String get formatOriginalDesc => 'Запази оригиналния формат.';

  @override
  String get formatMp4Label => 'MP4';

  @override
  String get formatMp4Desc => 'Максимална съвместимост.';

  @override
  String get formatMkvLabel => 'MKV';

  @override
  String get formatMkvDesc => 'Поддръжка на множество писти.';

  @override
  String get formatMovLabel => 'MOV';

  @override
  String get formatMovDesc => 'Apple QuickTime формат.';

  @override
  String get scanningFilesMsg => 'Сканиране на файлове...';

  @override
  String get addFilesBtn => 'Добави Файлове';

  @override
  String get addFolderBtn => 'Добави Папка';

  @override
  String get dragDropMoreMsg => 'Или плъзнете и пуснете още видеа тук';

  @override
  String get openOutputFolderTooltip => 'Отвори Изходната Папка';

  @override
  String get statusQueued => 'В опашка';

  @override
  String get statusAnalyzing => 'Анализиране';

  @override
  String get statusCompressing => 'Компресиране';

  @override
  String get statusDone => 'Готово';

  @override
  String get statusFailed => 'Неуспешно';

  @override
  String get statusCancelled => 'Отказано';

  @override
  String get savedPrefix => 'Спестени';

  @override
  String get largerSuffix => 'По-голям';

  @override
  String get largerSizeWarning =>
      'Изходният размер може да е по-голям от оригинала.';

  @override
  String get clearCompletedBtn => 'Изчисти Завършените';

  @override
  String get clearAllBtn => 'Изчисти Всички';

  @override
  String get stopAllBtn => 'Спри Всички';

  @override
  String get startCompressionBtn => 'Стартирай Компресия';

  @override
  String get allDoneLabel => 'Всичко е Готово!';

  @override
  String get openFolderBtn => 'Отвори Папката';

  @override
  String get totalEtaLabel => 'Оставащо Време';

  @override
  String get totalSavedLabel => 'Общо Спестени';

  @override
  String get videoSingle => 'видео';

  @override
  String get videosPlural => 'видеа';

  @override
  String get releaseToAddVideosMsg => 'Пуснете, за да добавите видеата';

  @override
  String get dragDropHereMsg => 'Плъзнете и пуснете файлове или папки тук';

  @override
  String get supportedFormatsMsg => 'Поддържа MP4, MKV, MOV, AVI, WMV';

  @override
  String get selectFilesBtn => 'Избери Файлове';

  @override
  String get selectFolderBtn => 'Избери Папка';

  @override
  String get releaseToShrinkTitle => 'Пуснете за незабавна компресия';

  @override
  String get filesWillBeAddedDesc =>
      'Вашите файлове ще бъдат добавени към опашката.';

  @override
  String get disabledLabel => 'Изключено';

  @override
  String get compressionInProgressTitle => 'Компресирането е в Ход';

  @override
  String get confirmCloseDesc =>
      'Сигурни ли сте, че искате да затворите Shrinkeo?';

  @override
  String get keepCompressingBtn => 'Продължи Компресирането';

  @override
  String get closeAppBtn => 'Затвори Приложението';

  @override
  String get lockedSettingsWarning => 'Заключено по време на компресия';

  @override
  String get updateRequiredTitle => 'Изисква се Обновяване';

  @override
  String get updateRequiredDescNewVersion => 'Има налична нова версия.';

  @override
  String get updateRequiredDescOldVersion =>
      'Вашата версия вече не се поддържа.';

  @override
  String get updateNowBtn => 'Обнови Сега';

  @override
  String get laterBtn => 'По-късно';

  @override
  String get updateAvailableTitle => 'Налично Обновяване';

  @override
  String get whatsNewTitle => 'Какво ново:';

  @override
  String get exitAppBtn => 'Изход';

  @override
  String get retryBtn => 'Опитайте отново';

  @override
  String get downloadFromWebsiteBtn => 'Изтегли от Уебсайта';

  @override
  String get skipUpdateConfirmTitle => 'Пропускане на обновяването?';

  @override
  String get skipUpdateConfirmDesc => 'Това обновление съдържа важни поправки.';

  @override
  String get skipUpdateCancelBtn => 'Отказ';

  @override
  String get skipUpdateConfirmBtn => 'Пропусни обновяването';

  @override
  String get maintenanceTitle => 'Поддръжка';

  @override
  String get maintenanceDescDefault => 'Shrinkeo в момента е в профилактика.';

  @override
  String versionAvailableMsg(String version) {
    return 'Версия $version е налична.';
  }

  @override
  String get hwEncoderNotSupportedTitle =>
      'Хардуерното ускорение не се поддържа';

  @override
  String get failedCreateFolderError =>
      'Грешка при създаване на изходната папка';

  @override
  String get failedProbeDurationError => 'Грешка при четене на времетраенето';

  @override
  String get ffmpegNotFoundGlobalError => 'FFmpeg не беше намерен.';

  @override
  String get ffmpegMissingError => 'FFmpeg или FFprobe липсва или е повреден.';

  @override
  String hwFallbackNotificationBody(String encoderLabel) {
    return '$encoderLabel се провали. Превключено на CPU.';
  }

  @override
  String get failedDownloadUpdateMsg =>
      'Изтеглянето на обновлението се провали. Опитайте отново.';
}
