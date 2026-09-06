// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appName => 'Shrinkeo';

  @override
  String get totalSpaceSaved => 'Всего сэкономлено места';

  @override
  String get savedSpacePrefix => 'Сэкономлено:';

  @override
  String get supportButtonText => 'Поддержать проект';

  @override
  String get lightThemeTooltip => 'Светлая тема';

  @override
  String get darkThemeTooltip => 'Темная тема';

  @override
  String get settingsTooltip => 'Настройки';

  @override
  String get minimizeTooltip => 'Свернуть';

  @override
  String get closeTooltip => 'Закрыть';

  @override
  String get restoreTooltip => 'Восстановить';

  @override
  String get maximizeTooltip => 'Развернуть';

  @override
  String get tabCompressionQuality => 'Сжатие и качество';

  @override
  String get tabVideoEditingTools => 'Редактирование и инструменты';

  @override
  String get tabAudioSettings => 'Настройки звука';

  @override
  String get tabEngineOutput => 'Движок и вывод';

  @override
  String get compressionSettingsTitle => 'Настройки сжатия';

  @override
  String get resetToDefaults => 'Сбросить настройки';

  @override
  String get resetDefaultTooltip => 'Вернуть исходные значения';

  @override
  String get modeTargetSizeTitle => 'Режим сжатия';

  @override
  String get modeCrfLabel => 'Качество (CRF)';

  @override
  String get modeTargetSizeLabel => 'Целевой размер (МБ)';

  @override
  String get crfQualityTitle => 'Качество CRF';

  @override
  String get crfLossless => 'без потерь';

  @override
  String get crfHighQuality => 'Высокое качество';

  @override
  String get crfBalanced => 'Сбалансированный';

  @override
  String get crfHighCompression => 'Высокая степень сжатия';

  @override
  String get crfLowQuality => 'Низкое качество';

  @override
  String get crfUltraCompressed => 'Ультра сжатый';

  @override
  String get targetSizeLabel => 'Целевой размер файла (МБ)';

  @override
  String get targetSizeDesc =>
      'Рассчитывает битрейт для соблюдения лимита размера.';

  @override
  String get encodingSpeedTitle => 'Скорость кодирования';

  @override
  String get presetUltrafastLabel => 'Сверхбыстрый';

  @override
  String get presetUltrafastDesc => 'Максимальная скорость, наименьшее сжатие.';

  @override
  String get presetSuperfastLabel => 'Супербыстрый';

  @override
  String get presetSuperfastDesc => 'Очень быстрое кодирование.';

  @override
  String get presetVeryfastLabel => 'Очень быстрый';

  @override
  String get presetVeryfastDesc => 'Быстрее среднего.';

  @override
  String get presetFasterLabel => 'Быстрее';

  @override
  String get presetFasterDesc => 'Хорошая скорость и сжатие.';

  @override
  String get presetFastLabel => 'Быстрый';

  @override
  String get presetFastDesc => 'Отличный баланс скорости и размера.';

  @override
  String get presetMediumLabel => 'Средний';

  @override
  String get presetMediumDesc => 'Стандартный баланс.';

  @override
  String get presetSlowLabel => 'Медленный';

  @override
  String get presetSlowDesc => 'Медленнее, но меньше размер файла.';

  @override
  String get presetVeryslowLabel => 'Очень медленный';

  @override
  String get presetVeryslowDesc => 'Максимальное сжатие файла.';

  @override
  String get videoCodecTitle => 'Видеокодек';

  @override
  String get codecH264Label => 'H.264';

  @override
  String get codecH264Desc => 'Максимальная совместимость.';

  @override
  String get codecH265Label => 'H.265 / HEVC';

  @override
  String get codecH265Desc => 'Улучшенная эффективность сжатия.';

  @override
  String get codecAv1Label => 'AV1';

  @override
  String get codecAv1Desc => 'Кодек нового поколения (на 30% меньше H.265).';

  @override
  String get hardwareEncoderTitle => 'Аппаратное ускорение (GPU)';

  @override
  String get hwSoftwareLabel => 'Программный (CPU)';

  @override
  String get hwSoftwareDesc => 'Медленнее, но лучшая совместимость.';

  @override
  String get hwNvidiaLabel => 'Nvidia (NVENC)';

  @override
  String get hwNvidiaDesc => 'Быстрое кодирование на GPU Nvidia.';

  @override
  String get hwAmdLabel => 'AMD (AMF)';

  @override
  String get hwAmdDesc => 'Быстрое кодирование на GPU AMD.';

  @override
  String get hwIntelLabel => 'Intel (QSV)';

  @override
  String get hwIntelDesc => 'Быстрое кодирование на GPU Intel.';

  @override
  String get resolutionTitle => 'Максимальное разрешение';

  @override
  String get resOriginalLabel => 'Исходное';

  @override
  String get resOriginalDesc => 'Сохранить исходное разрешение.';

  @override
  String get res4kLabel => '4K';

  @override
  String get res4kDesc => 'Уменьшить максимум до 4K.';

  @override
  String get res2kLabel => '2K';

  @override
  String get res2kDesc => 'Уменьшить максимум до 2K.';

  @override
  String get res1080pLabel => '1080p';

  @override
  String get res1080pDesc => 'Уменьшить максимум до 1080p Full HD.';

  @override
  String get res720pLabel => '720p';

  @override
  String get res720pDesc => 'Уменьшить максимум до 720p HD.';

  @override
  String get res480pLabel => '480p';

  @override
  String get res480pDesc => 'Уменьшить максимум до 480p.';

  @override
  String get res360pLabel => '360p';

  @override
  String get res360pDesc => 'Максимальное сжатие.';

  @override
  String get frameRateTitle => 'Частота кадров (FPS)';

  @override
  String get fpsOriginalLabel => 'Исходная';

  @override
  String get fpsOriginalDesc => 'Сохранить исходную частоту.';

  @override
  String get fps60Label => '60 кадров/с';

  @override
  String get fps60Desc => 'Плавность для игр или спорта.';

  @override
  String get fps30Label => '30 кадров/с';

  @override
  String get fps30Desc => 'Стандарт для большинства видео.';

  @override
  String get fps24Label => '24 кадра/с';

  @override
  String get fps24Desc => 'Кинематографичный вид.';

  @override
  String get enableVideoDenoiseTitle => 'Очистка шума видео';

  @override
  String get enableVideoDenoiseDesc => '3D-фильтр для удаления зернистости.';

  @override
  String get exportFormatTitle => 'Формат экспорта';

  @override
  String get exportVideoLabel => 'Стандартное видео';

  @override
  String get exportVideoDesc => 'Экспорт в MP4/MKV/MOV';

  @override
  String get exportGifLabel => 'Анимированный GIF';

  @override
  String get exportGifDesc => 'Создать качественный GIF';

  @override
  String get exportMp3Label => 'Извлечь MP3';

  @override
  String get exportMp3Desc => 'Извлечь аудио в MP3 320 кбит/с';

  @override
  String get exportAacLabel => 'Извлечь AAC';

  @override
  String get exportAacDesc => 'Извлечь аудио в AAC';

  @override
  String get exportWavLabel => 'Извлечь WAV';

  @override
  String get exportWavDesc => 'Извлечь несжатое аудио WAV';

  @override
  String get privacyScrubbingTitle => 'Конфиденциальность и GPS';

  @override
  String get keepMetadataLabel => 'Сохранить метаданные';

  @override
  String get stripGpsExifLabel => 'Удалить GPS/EXIF';

  @override
  String get stripGpsExifInfoTitle => 'Очистить метаданные';

  @override
  String get stripGpsExifInfoDesc =>
      'Удаляет данные о камере и координаты GPS.';

  @override
  String get keepMetadataInfoDesc => 'Сохраняет все исходные метаданные.';

  @override
  String get autoCropBlackBarsTitle => 'Автообрезка полос';

  @override
  String get autoCropLabel => 'Автообрезка';

  @override
  String get autoCropActiveTitle => 'Обрезка активна';

  @override
  String get autoCropActiveDesc => 'Автоматически удаляет черные полосы.';

  @override
  String get autoCropDisabledDesc => 'Сохраняет исходные рамки.';

  @override
  String get playbackSpeedTitle => 'Скорость воспроизведения';

  @override
  String get speedOriginalLabel => '1.0x';

  @override
  String get speedOriginalDesc => 'Обычная скорость';

  @override
  String get speedSlow05Label => '0.5x Замедление';

  @override
  String get speedSlow05Desc => 'Замедление в 2 раза';

  @override
  String get speedFast15Label => '1.5x';

  @override
  String get speedFast15Desc => 'Ускорение 1.5x';

  @override
  String get speedFast20Label => '2.0x Быстро';

  @override
  String get speedFast20Desc => 'Двойная скорость';

  @override
  String get speedTimelapse40Label => '4.0x Таймлапс';

  @override
  String get speedTimelapse40Desc => 'Ускорение 4x для таймлапса';

  @override
  String get canvasAspectRatioTitle => 'Соотношение сторон';

  @override
  String get aspectOriginalLabel => 'Исходное';

  @override
  String get aspectOriginalDesc => 'Сохранить исходные пропорции';

  @override
  String get aspectShortsLabel => '9:16 Shorts';

  @override
  String get aspectShortsDesc => 'Для TikTok и Reels';

  @override
  String get aspectSquareLabel => '1:1 Квадрат';

  @override
  String get aspectSquareDesc => 'Для постов Instagram';

  @override
  String get aspectPortraitLabel => '4:5 Портрет';

  @override
  String get aspectPortraitDesc => 'Для вертикального Instagram';

  @override
  String get aspectWidescreenLabel => '16:9 Широкий';

  @override
  String get aspectWidescreenDesc => 'Для YouTube и ТВ';

  @override
  String get aspectClassicLabel => '4:3 Классик';

  @override
  String get aspectClassicDesc => 'Для классических экранов';

  @override
  String get aspectCinemaLabel => '21:9 Кино';

  @override
  String get aspectCinemaDesc => 'Для ультрашироких мониторов';

  @override
  String get aspectCustomLabel => 'Свое соотношение';

  @override
  String get aspectCustomDesc => 'Настраиваемое соотношение сторон';

  @override
  String get customRatioTooltip => 'Например: 16:10, 2:1';

  @override
  String get rotationFlipTitle => 'Поворот и отражение';

  @override
  String get rotOriginalLabel => 'Исходный (0°)';

  @override
  String get rotOriginalDesc => 'Сохранить ориентацию';

  @override
  String get rot90Label => '90° вправо';

  @override
  String get rot90Desc => 'Повернуть на 90 градусов вправо';

  @override
  String get rot180Label => '180° Переворот';

  @override
  String get rot180Desc => 'Повернуть вверх ногами';

  @override
  String get rot270Label => '270° влево';

  @override
  String get rot270Desc => 'Повернуть на 90 градусов влево';

  @override
  String get rotFlipHLabel => 'Отразить гор.';

  @override
  String get rotFlipHDesc => 'Отразить по горизонтали';

  @override
  String get rotFlipVLabel => 'Отразить верт.';

  @override
  String get rotFlipVDesc => 'Отразить по вертикали';

  @override
  String get rotCustomLabel => 'Свой угол';

  @override
  String get rotCustomDesc => 'Повернуть на произвольный угол';

  @override
  String get customRotationTooltip => 'Угол в градусах, напр. 45';

  @override
  String get trimVideoTitle => 'Обрезка видео';

  @override
  String get fullVideoLabel => 'Полное видео';

  @override
  String get cutClipLabel => 'Обрезать фрагмент';

  @override
  String get trimStartLabel => 'Начало';

  @override
  String get trimEndLabel => 'Конец';

  @override
  String get trimActiveTitle => 'Обрезка активна';

  @override
  String get fullVideoDesc => 'Обработать полное видео без обрезки.';

  @override
  String get audioModeTitle => 'Режим аудиодорожки';

  @override
  String get audioOriginalLabel => 'Исходная';

  @override
  String get audioOriginalDesc => 'Без потери качества звука.';

  @override
  String get audioAac256Label => 'Высокое качество';

  @override
  String get audioAac256Desc => 'AAC 256 кбит/с';

  @override
  String get audioAac128Label => 'Сбалансированный';

  @override
  String get audioAac128Desc => 'AAC 128 кбит/с (Веб-стандарт)';

  @override
  String get audioAac64Label => 'Низкое качество';

  @override
  String get audioAac64Desc => 'AAC 64 кбит/с для речи';

  @override
  String get audioMuteLabel => 'Отключить звук';

  @override
  String get audioMuteDesc => 'Удалить аудиодорожку.';

  @override
  String get audioNormTitle => 'Нормализация громкости';

  @override
  String get audioNormOffLabel => 'Выкл';

  @override
  String get audioNormOffDesc => 'Исходный динамический объем.';

  @override
  String get audioNormSpeechLabel => 'Речь';

  @override
  String get audioNormSpeechDesc => 'EBU R128 для четких диалогов.';

  @override
  String get audioNormDynamicLabel => 'Кино динамика';

  @override
  String get audioNormDynamicDesc => 'Сглаживает тихие и громкие сцены.';

  @override
  String get audioNormBoostLabel => 'Легкое усиление';

  @override
  String get audioNormBoostDesc => '+3 дБ к громкости.';

  @override
  String get audioChanTitle => 'Аудиоканалы';

  @override
  String get audioChanOriginalLabel => 'Исходные';

  @override
  String get audioChanOriginalDesc => 'Сохранить исходные каналы.';

  @override
  String get audioChanStereoLabel => 'Стерео (2.0)';

  @override
  String get audioChanStereoDesc => '2-канальное стерео.';

  @override
  String get audioChanMonoLabel => 'Моно (1.0)';

  @override
  String get audioChanMonoDesc => '1 канал - 50% экономии аудио.';

  @override
  String get removeNoiseLabel => 'Удалить шум';

  @override
  String get enableAudioDenoiseTitle => 'Подавление шума микрофона';

  @override
  String get enableAudioDenoiseDesc => 'Фильтр для удаления фона.';

  @override
  String get outputDirectoryTitle => 'Папка сохранения';

  @override
  String get defaultOutputDirectory => 'По умолчанию (Рядом с исходным)';

  @override
  String get selectOutputFolderTitle => 'Выбрать папку';

  @override
  String get clearOutputFolder => 'Использовать стандартный путь';

  @override
  String get changeBtn => 'Изменить';

  @override
  String get outputLocationTitle => 'Поведение сохранения';

  @override
  String get outputLocationUnifiedLabel => 'Единая папка';

  @override
  String get outputLocationUnifiedDesc => 'Все сжатые видео в одну папку.';

  @override
  String get outputLocationSameLabel => 'Рядом с исходником';

  @override
  String get outputLocationSameDesc =>
      'Каждое видео рядом со своим исходным файлом.';

  @override
  String get fileManagementTitle => 'Управление файлами';

  @override
  String get keepOriginalsLabel => 'Сохранять оригиналы';

  @override
  String get keepOriginalsDesc => 'Оставлять исходные файлы нетронутыми.';

  @override
  String get toRecycleBinLabel => 'В корзину';

  @override
  String get toRecycleBinDesc => 'Перемещать оригиналы в корзину после сжатия.';

  @override
  String get outputFormatTitle => 'Формат контейнера';

  @override
  String get formatOriginalLabel => 'Исходный';

  @override
  String get formatOriginalDesc => 'Сохранить исходный формат.';

  @override
  String get formatMp4Label => 'MP4';

  @override
  String get formatMp4Desc => 'Максимальная совместимость.';

  @override
  String get formatMkvLabel => 'MKV';

  @override
  String get formatMkvDesc => 'Поддержка нескольких дорожек.';

  @override
  String get formatMovLabel => 'MOV';

  @override
  String get formatMovDesc => 'Формат Apple QuickTime.';

  @override
  String get scanningFilesMsg => 'Сканирование файлов...';

  @override
  String get addFilesBtn => 'Добавить файлы';

  @override
  String get addFolderBtn => 'Добавить папку';

  @override
  String get dragDropMoreMsg => 'Или перетащите ещё файлы в любое место';

  @override
  String get openOutputFolderTooltip => 'Открыть папку сохранения';

  @override
  String get statusQueued => 'В очереди';

  @override
  String get statusAnalyzing => 'Анализ';

  @override
  String get statusCompressing => 'Сжатие';

  @override
  String get statusDone => 'Готово';

  @override
  String get statusFailed => 'Ошибка';

  @override
  String get statusCancelled => 'Отменено';

  @override
  String get savedPrefix => 'Сэкономлено';

  @override
  String get largerSuffix => 'Больше';

  @override
  String get largerSizeWarning =>
      'Итоговый размер может быть больше исходного.';

  @override
  String get clearCompletedBtn => 'Очистить готовые';

  @override
  String get clearAllBtn => 'Очистить все';

  @override
  String get stopAllBtn => 'Остановить все';

  @override
  String get startCompressionBtn => 'Начать сжатие';

  @override
  String get allDoneLabel => 'Все готово!';

  @override
  String get openFolderBtn => 'Открыть папку';

  @override
  String get totalEtaLabel => 'Осталось времени';

  @override
  String get totalSavedLabel => 'Всего сэкономлено';

  @override
  String get videoSingle => 'видео';

  @override
  String get videosPlural => 'видео';

  @override
  String get fileSingle => 'файл';

  @override
  String get filesPlural => 'файлов';

  @override
  String get releaseToAddVideosMsg => 'Отпустите, чтобы добавить файлы';

  @override
  String get dragDropHereMsg => 'Перетащите видео или изображения сюда';

  @override
  String get supportedFormatsMsg =>
      'Поддерживает MP4, MKV, MOV, AVI, WMV, WebM • PNG, JPG, WebP, AVIF и другие';

  @override
  String get selectFilesBtn => 'Выбрать файлы';

  @override
  String get selectFolderBtn => 'Выбрать папку';

  @override
  String get releaseToShrinkTitle => 'Отпустите для сжатия';

  @override
  String get filesWillBeAddedDesc => 'Файлы будут добавлены в очередь.';

  @override
  String get disabledLabel => 'Отключено';

  @override
  String get compressionInProgressTitle => 'Идет сжатие';

  @override
  String get confirmCloseDesc => 'Вы уверены, что хотите закрыть Shrinkeo?';

  @override
  String get keepCompressingBtn => 'Продолжить сжатие';

  @override
  String get closeAppBtn => 'Закрыть приложение';

  @override
  String get lockedSettingsWarning => 'Заблокировано во время сжатия';

  @override
  String get updateRequiredTitle => 'Требуется обновление';

  @override
  String get updateRequiredDescNewVersion => 'Доступна новая версия.';

  @override
  String get updateRequiredDescOldVersion =>
      'Ваша версия больше не поддерживается.';

  @override
  String get updateNowBtn => 'Обновить сейчас';

  @override
  String get laterBtn => 'Позже';

  @override
  String get updateAvailableTitle => 'Доступно обновление';

  @override
  String get whatsNewTitle => 'Что нового:';

  @override
  String get exitAppBtn => 'Выйти';

  @override
  String get retryBtn => 'Повторить';

  @override
  String get downloadFromWebsiteBtn => 'Скачать с сайта';

  @override
  String get skipUpdateConfirmTitle => 'Пропустить обновление?';

  @override
  String get skipUpdateConfirmDesc =>
      'Это обновление содержит важные исправления.';

  @override
  String get skipUpdateCancelBtn => 'Отмена';

  @override
  String get skipUpdateConfirmBtn => 'Пропустить обновление';

  @override
  String get maintenanceTitle => 'Обслуживание';

  @override
  String get maintenanceDescDefault => 'Shrinkeo сейчас обслуживается.';

  @override
  String versionAvailableMsg(String version) {
    return 'Версия $version доступна.';
  }

  @override
  String get hwEncoderNotSupportedTitle => 'Ускорение не поддерживается';

  @override
  String get failedCreateFolderError => 'Не удалось создать папку';

  @override
  String get failedProbeDurationError => 'Не удалось определить длительность';

  @override
  String get ffmpegNotFoundGlobalError => 'FFmpeg не найден.';

  @override
  String get ffmpegMissingError =>
      'FFmpeg или FFprobe отсутствует или поврежден.';

  @override
  String hwFallbackNotificationBody(String encoderLabel) {
    return '$encoderLabel не сработал. Переключено на CPU.';
  }

  @override
  String get failedDownloadUpdateMsg =>
      'Не удалось скачать обновление. Попробуйте еще раз.';

  @override
  String customRatioActiveTitle(Object ratio) {
    return 'Пользовательское соотношение ($ratio)';
  }

  @override
  String customRatioActiveDesc(Object ratio) {
    return 'Кадр с полями для соотношения $ratio.';
  }

  @override
  String customAngleActiveTitle(Object angle) {
    return 'Пользовательский угол ($angle°)';
  }

  @override
  String customAngleActiveDesc(Object angle) {
    return 'Поворачивает видео на угол $angle°.';
  }

  @override
  String trimActiveDesc(Object end, Object start) {
    return 'Обрезает видео от $start до $end.';
  }

  @override
  String targetSizeLimitLabel(Object size) {
    return 'Лимит $size МБ';
  }

  @override
  String get customMbSizeTooltip => 'Введите размер в МБ';

  @override
  String get trimTimeTooltip =>
      'Введите время, напр. 5 (5с), 1:30 (1м30с) или 00:01:30';

  @override
  String get tabImageSuite => 'Инструменты Изображений';

  @override
  String get compressionModeTitle => 'Режим Сжатия';

  @override
  String get smartAutoLabel => 'Умный Авто';

  @override
  String get smartAutoDesc =>
      'Автоматически уменьшает размер на 60–80% при 100% четкости. Идеально для ежедневных фото.';

  @override
  String get maxSavingsLabel => 'Макс. Экономия';

  @override
  String get maxSavingsDesc =>
      'Агрессивное сжатие со сбережением до 85–90% размера. Для мессенджеров и почты.';

  @override
  String get ultraFidelityLabel => 'Ультра Качество';

  @override
  String get ultraFidelityDesc =>
      'Сохраняет исходное качество при минимальном сжатии. Для архивов и печати.';

  @override
  String get targetImageFormatTitle => 'Целевой Формат Изображения';

  @override
  String get dimensionResizingTitle => 'Изменение Разрешения';

  @override
  String get exifCameraPrivacyTitle => 'Конфиденциальность EXIF / Камеры';

  @override
  String get stripGpsCameraInfoLabel => 'Удалить GPS и Инфо о Камере';

  @override
  String get imgFmtOriginalLabel => 'Исходный формат';

  @override
  String get imgFmtOriginalDesc =>
      'Сохраняйте исходный формат (самый быстрый, без конвертации).';

  @override
  String get imgFmtPngLabel => 'PNG-изображение (.png)';

  @override
  String get imgFmtPngDesc =>
      'Формат PNG без потерь с поддержкой прозрачности.';

  @override
  String get imgFmtJpgLabel => 'Изображение JPEG (.jpg)';

  @override
  String get imgFmtJpgDesc =>
      'Стандартный сжатый формат JPEG для универсальной совместимости.';

  @override
  String get imgFmtWebpLabel => 'Изображение WebP (.webp)';

  @override
  String get imgFmtWebpDesc =>
      'Современный формат WebP, обеспечивающий превосходное сжатие и небольшой размер.';

  @override
  String get imgFmtAvifLabel => 'Изображение AVIF (.avif)';

  @override
  String get imgFmtAvifDesc =>
      'Формат AVIF следующего поколения со сверхвысокой эффективностью сжатия.';

  @override
  String get imgResOriginalLabel => 'Оригинальные размеры';

  @override
  String get imgResOriginalDesc =>
      'Сохраняйте исходные размеры ширины и высоты изображения.';

  @override
  String get imgRes4kLabel => '4K Макс (3840 пикселей)';

  @override
  String get imgRes4kDesc =>
      'Уменьшите максимальный размер изображения до 3840 пикселей (максимум 4K).';

  @override
  String get imgRes1080pLabel => 'Full HD Макс. (1920 пикселей)';

  @override
  String get imgRes1080pDesc =>
      'Уменьшите максимальный размер изображения до 1920 пикселей (максимум Full HD).';

  @override
  String get imgRes720pLabel => 'HD Макс. (1280 пикселей)';

  @override
  String get imgRes720pDesc =>
      'Уменьшите максимальный размер изображения до 1280 пикселей (макс. HD).';

  @override
  String get imgRes480pLabel => 'SD Макс. (854 пикселей)';

  @override
  String get imgRes480pDesc =>
      'Уменьшите максимальный размер изображения до 854 пикселей (макс. SD).';

  @override
  String get keepMetadataImageInfoDesc =>
      'Сохраняет исходные метаданные EXIF и информацию о камере.';

  @override
  String get imageQualityModeLabel => 'Уровень качества';

  @override
  String get imageQualityModeDesc =>
      'Кодирует на фиксированном уровне качества — выше качество, больше файл.';

  @override
  String get imageTargetSizeModeLabel => 'Целевой размер';

  @override
  String get imageTargetSizeModeDesc =>
      'Автоматически подбирает максимальное качество, укладывающееся в лимит размера.';

  @override
  String get imageQualitySliderTitle => 'Качество изображения';

  @override
  String get imageTargetSizeTitle => 'Целевой размер файла';

  @override
  String get imageTargetSizeDesc =>
      'Кодирует повторно со снижающимся качеством, пока файл не уложится в лимит. Слишком малые лимиты могут снизить качество.';

  @override
  String imageTargetSizeLimitLabel(String size) {
    return 'Лимит $size';
  }

  @override
  String get customKbSizeTooltip => 'Введите свой размер в КБ';

  @override
  String get imageProcessingFailedError => 'Не удалось обработать изображение';

  @override
  String get imageProcessingErrorMsg => 'Ошибка обработки изображения';

  @override
  String get cleanNoiseLabel => 'Шумоподавление';

  @override
  String get outputLargerTooltip =>
      'Размер будет больше оригинала!\nОстановите и сбросьте настройки.';

  @override
  String get estimatedSizePrefix => 'Прим:';

  @override
  String get cancelBtnTooltip => 'Отмена';

  @override
  String get removeBtnTooltip => 'Удалить';

  @override
  String get selectLanguageTitle => 'Выбор языка';

  @override
  String get searchLanguageHint => 'Поиск языка по названию или коду...';

  @override
  String get noLanguagesMatchSearch => 'Ни один язык не соответствует поиску.';

  @override
  String get languageTooltip => 'Язык';

  @override
  String get notifyCompressionCompleteTitle => 'Сжатие Shrinkeo завершено';

  @override
  String get notifyOutputLargerTitle => 'Выходной файл больше оригинала';

  @override
  String languagesCountLabel(String count) {
    return '$count языков';
  }

  @override
  String notifyCompressionCompleteSuccess(String success) {
    return 'Успешно сжато файлов: $success.';
  }

  @override
  String notifyCompressionCompleteFailed(String failed) {
    return ' ($failed с ошибкой)';
  }

  @override
  String notifyOutputLargerDesc(String fileName) {
    return 'Ожидается, что $fileName будет больше оригинала. Попробуйте отменить и сбросить настройки.';
  }

  @override
  String get imagePreparing => 'Подготовка изображения';

  @override
  String get imageEncoding => 'Сжатие изображения';

  @override
  String get imageSaving => 'Сохранение результата';

  @override
  String imageTargetProgress(String size) {
    return 'Целевой размер: $size';
  }

  @override
  String imageAttempt(int count) {
    return 'Попытка $count';
  }

  @override
  String imageBestResult(String size) {
    return 'Лучший результат: $size';
  }

  @override
  String queueCompleted(int done, int total) {
    return 'Завершено $done из $total';
  }
}
