// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Ukrainian (`uk`).
class AppLocalizationsUk extends AppLocalizations {
  AppLocalizationsUk([String locale = 'uk']) : super(locale);

  @override
  String get appName => 'Shrinkeo';

  @override
  String get totalSpaceSaved => 'Всього збережено місця';

  @override
  String get savedSpacePrefix => 'Збережено:';

  @override
  String get supportButtonText => 'Підтримати проєкт';

  @override
  String get lightThemeTooltip => 'Світла тема';

  @override
  String get darkThemeTooltip => 'Темна тема';

  @override
  String get settingsTooltip => 'Налаштування';

  @override
  String get minimizeTooltip => 'Згорнути';

  @override
  String get closeTooltip => 'Закрити';

  @override
  String get restoreTooltip => 'Відновити';

  @override
  String get maximizeTooltip => 'Розгорнути';

  @override
  String get tabCompressionQuality => 'Стиснення та Якість';

  @override
  String get tabVideoEditingTools => 'Редагування та Інструменти';

  @override
  String get tabAudioSettings => 'Налаштування Звуку';

  @override
  String get tabEngineOutput => 'Двигун та Шлях';

  @override
  String get compressionSettingsTitle => 'Налаштування Стиснення';

  @override
  String get resetToDefaults => 'Скинути за замовчуванням';

  @override
  String get resetDefaultTooltip => 'Повернути початкові значення';

  @override
  String get modeTargetSizeTitle => 'Режим Стиснення';

  @override
  String get modeCrfLabel => 'Якість (CRF)';

  @override
  String get modeTargetSizeLabel => 'Цільовий Розмір (МБ)';

  @override
  String get crfQualityTitle => 'Коефіцієнт Якості CRF';

  @override
  String get crfLossless => 'Без втрат';

  @override
  String get crfHighQuality => 'Висока якість';

  @override
  String get crfBalanced => 'Збалансований';

  @override
  String get crfHighCompression => 'Високий рівень стиснення';

  @override
  String get crfLowQuality => 'Низька якість';

  @override
  String get crfUltraCompressed => 'Ultra Compressed';

  @override
  String get targetSizeLabel => 'Цільовий Розмір Файлу (МБ)';

  @override
  String get targetSizeDesc =>
      'Розраховує бітрейт для дотримання ліміту розміру.';

  @override
  String get encodingSpeedTitle => 'Швидкість Кодування';

  @override
  String get presetUltrafastLabel => 'Надшвидкий';

  @override
  String get presetUltrafastDesc =>
      'Максимальна швидкість, але найменше стиснення.';

  @override
  String get presetSuperfastLabel => 'Супершвидкий';

  @override
  String get presetSuperfastDesc => 'Дуже швидке кодування.';

  @override
  String get presetVeryfastLabel => 'Дуже швидкий';

  @override
  String get presetVeryfastDesc => 'Швидше за середнє.';

  @override
  String get presetFasterLabel => 'Швидше';

  @override
  String get presetFasterDesc => 'Хороша швидкість та стиснення.';

  @override
  String get presetFastLabel => 'Швидкий';

  @override
  String get presetFastDesc => 'Відмінний баланс швидкості та розміру.';

  @override
  String get presetMediumLabel => 'Середній';

  @override
  String get presetMediumDesc => 'Стандартний баланс.';

  @override
  String get presetSlowLabel => 'Повільний';

  @override
  String get presetSlowDesc => 'Повільніше, але значно менші файли.';

  @override
  String get presetVeryslowLabel => 'Дуже повільний';

  @override
  String get presetVeryslowDesc => 'Максимальне зменшення розміру.';

  @override
  String get videoCodecTitle => 'Відеокодек';

  @override
  String get codecH264Label => 'H.264';

  @override
  String get codecH264Desc => 'Максимальна сумісність.';

  @override
  String get codecH265Label => 'H.265 / HEVC';

  @override
  String get codecH265Desc => 'Краща ефективність стиснення.';

  @override
  String get codecAv1Label => 'AV1';

  @override
  String get codecAv1Desc => 'Кодек нового покоління (на 30% менше H.265).';

  @override
  String get hardwareEncoderTitle => 'Апаратне Прискорення (GPU)';

  @override
  String get hwSoftwareLabel => 'Програмний (CPU)';

  @override
  String get hwSoftwareDesc => 'Найповільніший, але найкраща сумісність.';

  @override
  String get hwNvidiaLabel => 'Nvidia (NVENC)';

  @override
  String get hwNvidiaDesc => 'Швидке кодування для GPU Nvidia.';

  @override
  String get hwAmdLabel => 'AMD (AMF)';

  @override
  String get hwAmdDesc => 'Швидке кодування для GPU AMD.';

  @override
  String get hwIntelLabel => 'Intel (QSV)';

  @override
  String get hwIntelDesc => 'Швидке кодування для GPU Intel.';

  @override
  String get resolutionTitle => 'Максимальна Роздільна здатність';

  @override
  String get resOriginalLabel => 'Оригінальна';

  @override
  String get resOriginalDesc => 'Зберегти оригінальну роздільну здатність.';

  @override
  String get res4kLabel => '4K';

  @override
  String get res4kDesc => 'Зменшити максимум до 4K.';

  @override
  String get res2kLabel => '2K';

  @override
  String get res2kDesc => 'Зменшити максимум до 2K.';

  @override
  String get res1080pLabel => '1080p';

  @override
  String get res1080pDesc => 'Зменшити максимум до 1080p Full HD.';

  @override
  String get res720pLabel => '720p';

  @override
  String get res720pDesc => 'Зменшити максимум до 720p HD.';

  @override
  String get res480pLabel => '480p';

  @override
  String get res480pDesc => 'Зменшити до 480p.';

  @override
  String get res360pLabel => '360p';

  @override
  String get res360pDesc => 'Максимальне стиснення.';

  @override
  String get frameRateTitle => 'Частота Кадрів (FPS)';

  @override
  String get fpsOriginalLabel => 'Оригінальна';

  @override
  String get fpsOriginalDesc => 'Та сама частота кадрів.';

  @override
  String get fps60Label => '60 fps';

  @override
  String get fps60Desc => 'Плавність для ігор чи спорту.';

  @override
  String get fps30Label => '30 fps';

  @override
  String get fps30Desc => 'Стандарт для більшості відео.';

  @override
  String get fps24Label => '24 fps';

  @override
  String get fps24Desc => 'Кінематографічний вигляд.';

  @override
  String get enableVideoDenoiseTitle => 'Очищення Шуму Відео';

  @override
  String get enableVideoDenoiseDesc => '3D-фільтр для усунення зернистості.';

  @override
  String get exportFormatTitle => 'Формат Експорту';

  @override
  String get exportVideoLabel => 'Стандартне Відео';

  @override
  String get exportVideoDesc => 'Експорт у MP4/MKV/MOV';

  @override
  String get exportGifLabel => 'Анімований GIF';

  @override
  String get exportGifDesc => 'Створити якісний GIF';

  @override
  String get exportMp3Label => 'Витягнути MP3';

  @override
  String get exportMp3Desc => 'Витягнути аудіо в MP3 320kbps';

  @override
  String get exportAacLabel => 'Витягнути AAC';

  @override
  String get exportAacDesc => 'Витягнути аудіо в AAC';

  @override
  String get exportWavLabel => 'Витягнути WAV';

  @override
  String get exportWavDesc => 'Витягнути нестиснене аудіо WAV';

  @override
  String get privacyScrubbingTitle => 'Конфіденційність та GPS';

  @override
  String get keepMetadataLabel => 'Зберегти Метадані';

  @override
  String get stripGpsExifLabel => 'Видалити GPS/EXIF';

  @override
  String get stripGpsExifInfoTitle => 'Очистити Метадані';

  @override
  String get stripGpsExifInfoDesc =>
      'Видаляє дані про камеру та GPS геопозицію.';

  @override
  String get keepMetadataInfoDesc => 'Зберігає всі оригінальні метадані.';

  @override
  String get autoCropBlackBarsTitle => 'Автообрізка Чорних Смуг';

  @override
  String get autoCropLabel => 'Автообрізка';

  @override
  String get autoCropActiveTitle => 'Автообрізка Активна';

  @override
  String get autoCropActiveDesc => 'Автоматично видаляє чорні смуги.';

  @override
  String get autoCropDisabledDesc => 'Зберігає початкові рамки.';

  @override
  String get playbackSpeedTitle => 'Швидкість Відтворення';

  @override
  String get speedOriginalLabel => '1.0x';

  @override
  String get speedOriginalDesc => 'Звичайна швидкість';

  @override
  String get speedSlow05Label => '0.5x Повільно';

  @override
  String get speedSlow05Desc => 'Уповільнення у 2 рази';

  @override
  String get speedFast15Label => '1.5x';

  @override
  String get speedFast15Desc => 'Прискорення 1.5x';

  @override
  String get speedFast20Label => '2.0x Швидко';

  @override
  String get speedFast20Desc => 'Подвійна швидкість';

  @override
  String get speedTimelapse40Label => '4.0x Таймлапс';

  @override
  String get speedTimelapse40Desc => 'Прискорення 4x для таймлапсу';

  @override
  String get canvasAspectRatioTitle => 'Співвідношення Сторін';

  @override
  String get aspectOriginalLabel => 'Оригінальне';

  @override
  String get aspectOriginalDesc => 'Зберегти початкові пропорції';

  @override
  String get aspectShortsLabel => '9:16 Shorts';

  @override
  String get aspectShortsDesc => 'Для TikTok та Reels';

  @override
  String get aspectSquareLabel => '1:1 Квадрат';

  @override
  String get aspectSquareDesc => 'Для постів Instagram';

  @override
  String get aspectPortraitLabel => '4:5 Портрет';

  @override
  String get aspectPortraitDesc => 'Для вертикального Instagram';

  @override
  String get aspectWidescreenLabel => '16:9 Широкий';

  @override
  String get aspectWidescreenDesc => 'Для YouTube та ТБ';

  @override
  String get aspectClassicLabel => '4:3 Класичний';

  @override
  String get aspectClassicDesc => 'Для класичних екранів';

  @override
  String get aspectCinemaLabel => '21:9 Кіно';

  @override
  String get aspectCinemaDesc => 'Для ультрашироких моніторів';

  @override
  String get aspectCustomLabel => 'Своє Співвідношення';

  @override
  String get aspectCustomDesc => 'Налаштовуване співвідношення сторін';

  @override
  String get customRatioTooltip => 'Наприклад: 16:10, 2:1';

  @override
  String get rotationFlipTitle => 'Поворот та Дзеркало';

  @override
  String get rotOriginalLabel => 'Оригінальний (0°)';

  @override
  String get rotOriginalDesc => 'Зберегти орієнтацію';

  @override
  String get rot90Label => '90° Праворуч';

  @override
  String get rot90Desc => 'Повернути на 90 градусів праворуч';

  @override
  String get rot180Label => '180° Переворот';

  @override
  String get rot180Desc => 'Повернути догори дном';

  @override
  String get rot270Label => '270° Ліворуч';

  @override
  String get rot270Desc => 'Повернути на 90 градусів ліворуч';

  @override
  String get rotFlipHLabel => 'Віддзеркалити Гор.';

  @override
  String get rotFlipHDesc => 'Віддзеркалити горизонтально';

  @override
  String get rotFlipVLabel => 'Віддзеркалити Верт.';

  @override
  String get rotFlipVDesc => 'Віддзеркалити вертикально';

  @override
  String get rotCustomLabel => 'Свій Кут';

  @override
  String get rotCustomDesc => 'Повернути на довільний кут';

  @override
  String get customRotationTooltip => 'Кут у градусах напр. 45';

  @override
  String get trimVideoTitle => 'Обрізка Відео';

  @override
  String get fullVideoLabel => 'Повне Відео';

  @override
  String get cutClipLabel => 'Обрізати Фрагмент';

  @override
  String get trimStartLabel => 'Початок';

  @override
  String get trimEndLabel => 'Кінець';

  @override
  String get trimActiveTitle => 'Обрізка Активна';

  @override
  String get fullVideoDesc => 'Обробити все відео без обрізання.';

  @override
  String get audioModeTitle => 'Режим Аудіодоріжки';

  @override
  String get audioOriginalLabel => 'Оригінальний';

  @override
  String get audioOriginalDesc => 'Без втрати якості звуку.';

  @override
  String get audioAac256Label => 'Висока Якість';

  @override
  String get audioAac256Desc => 'AAC 256kbps';

  @override
  String get audioAac128Label => 'Збалансований';

  @override
  String get audioAac128Desc => 'AAC 128kbps (Веб-стандарт)';

  @override
  String get audioAac64Label => 'Низька Якість';

  @override
  String get audioAac64Desc => 'AAC 64kbps для мови';

  @override
  String get audioMuteLabel => 'Вимкнути Звук';

  @override
  String get audioMuteDesc => 'Повністю видалити аудіодоріжку.';

  @override
  String get audioNormTitle => 'Нормалізація Гучності';

  @override
  String get audioNormOffLabel => 'Вимкнено';

  @override
  String get audioNormOffDesc => 'Оригінальна динаміка.';

  @override
  String get audioNormSpeechLabel => 'Мова Людини';

  @override
  String get audioNormSpeechDesc => 'Стандарт EBU R128 для чітких діалогів.';

  @override
  String get audioNormDynamicLabel => 'Кіно Динаміка';

  @override
  String get audioNormDynamicDesc => 'Згладжує тихі та гучні звуки.';

  @override
  String get audioNormBoostLabel => 'Легке Підсилення';

  @override
  String get audioNormBoostDesc => '+3dB підсилення гучності.';

  @override
  String get audioChanTitle => 'Аудіоканали';

  @override
  String get audioChanOriginalLabel => 'Оригінальні';

  @override
  String get audioChanOriginalDesc => 'Зберегти джерельні канали.';

  @override
  String get audioChanStereoLabel => 'Стерео (2.0)';

  @override
  String get audioChanStereoDesc => '2-канальне стерео.';

  @override
  String get audioChanMonoLabel => 'Моно (1.0)';

  @override
  String get audioChanMonoDesc => '1 канал - 50% економії розміру аудіо.';

  @override
  String get removeNoiseLabel => 'Видалити Шум';

  @override
  String get enableAudioDenoiseTitle => 'Приглушення Шуму Мікрофона';

  @override
  String get enableAudioDenoiseDesc => 'Фільтр для видалення фону.';

  @override
  String get outputDirectoryTitle => 'Папка Збереження';

  @override
  String get defaultOutputDirectory => 'За замовчуванням (Поруч з оригіналом)';

  @override
  String get selectOutputFolderTitle => 'Обрати Папку';

  @override
  String get clearOutputFolder => 'Використовувати стандартний шлях';

  @override
  String get changeBtn => 'Змінити';

  @override
  String get outputLocationTitle => 'Поведінка Збереження';

  @override
  String get outputLocationUnifiedLabel => 'Єдина Папка';

  @override
  String get outputLocationUnifiedDesc => 'Усі стиснені відео в одну папку.';

  @override
  String get outputLocationSameLabel => 'Поруч з Джерелом';

  @override
  String get outputLocationSameDesc =>
      'Кожне відео поруч зі своїм початковим файлом.';

  @override
  String get fileManagementTitle => 'Управління Файлами';

  @override
  String get keepOriginalsLabel => 'Зберігати Оригінали';

  @override
  String get keepOriginalsDesc => 'Залишати початкові файли недоторканими.';

  @override
  String get toRecycleBinLabel => 'У Смітник';

  @override
  String get toRecycleBinDesc =>
      'Переміщати оригінали в смітник після стиснення.';

  @override
  String get outputFormatTitle => 'Формат Контейнера';

  @override
  String get formatOriginalLabel => 'Оригінальний';

  @override
  String get formatOriginalDesc => 'Зберегти початковий формат.';

  @override
  String get formatMp4Label => 'MP4';

  @override
  String get formatMp4Desc => 'Максимальна сумісність.';

  @override
  String get formatMkvLabel => 'MKV';

  @override
  String get formatMkvDesc => 'Підтримка декількох доріжок.';

  @override
  String get formatMovLabel => 'MOV';

  @override
  String get formatMovDesc => 'Формат Apple QuickTime.';

  @override
  String get scanningFilesMsg => 'Сканування файлів...';

  @override
  String get addFilesBtn => 'Додати Файли';

  @override
  String get addFolderBtn => 'Додати Папку';

  @override
  String get dragDropMoreMsg => 'Або перетягніть більше відео сюди';

  @override
  String get openOutputFolderTooltip => 'Відкрити Папку Збереження';

  @override
  String get statusQueued => 'У черзі';

  @override
  String get statusAnalyzing => 'Аналіз';

  @override
  String get statusCompressing => 'Стиснення';

  @override
  String get statusDone => 'Готово';

  @override
  String get statusFailed => 'Помилка';

  @override
  String get statusCancelled => 'Скасовано';

  @override
  String get savedPrefix => 'Збережено';

  @override
  String get largerSuffix => 'Більше';

  @override
  String get largerSizeWarning =>
      'Підсумковий розмір може бути більшим за оригінал.';

  @override
  String get clearCompletedBtn => 'Очистити Готові';

  @override
  String get clearAllBtn => 'Очистити Все';

  @override
  String get stopAllBtn => 'Зупинити Все';

  @override
  String get startCompressionBtn => 'Почати Стиснення';

  @override
  String get allDoneLabel => 'Все Готово!';

  @override
  String get openFolderBtn => 'Відкрити Папку';

  @override
  String get totalEtaLabel => 'Залишилось Часу';

  @override
  String get totalSavedLabel => 'Всього Збережено';

  @override
  String get videoSingle => 'відео';

  @override
  String get videosPlural => 'відео';

  @override
  String get releaseToAddVideosMsg => 'Відпустіть для додавання';

  @override
  String get dragDropHereMsg => 'Перетягніть файли або папки сюди';

  @override
  String get supportedFormatsMsg => 'Підтримує MP4, MKV, MOV, AVI, WMV';

  @override
  String get selectFilesBtn => 'Обрати Файли';

  @override
  String get selectFolderBtn => 'Обрати Папку';

  @override
  String get releaseToShrinkTitle => 'Відпустіть для стиснення';

  @override
  String get filesWillBeAddedDesc => 'Ваші файли будуть додані до черги.';

  @override
  String get disabledLabel => 'Вимкнено';

  @override
  String get compressionInProgressTitle => 'Триває Стиснення Відео';

  @override
  String get confirmCloseDesc => 'Ви впевнені, що хочете закрити Shrinkeo?';

  @override
  String get keepCompressingBtn => 'Продовжити Стиснення';

  @override
  String get closeAppBtn => 'Закрити Програму';

  @override
  String get lockedSettingsWarning => 'Заблоковано під час стиснення';

  @override
  String get updateRequiredTitle => 'Необхідне Оновлення';

  @override
  String get updateRequiredDescNewVersion => 'Доступна нова версія програми.';

  @override
  String get updateRequiredDescOldVersion =>
      'Ваша версія більше не підтримується.';

  @override
  String get updateNowBtn => 'Оновити Зараз';

  @override
  String get laterBtn => 'Пізніше';

  @override
  String get updateAvailableTitle => 'Доступне Оновлення';

  @override
  String get whatsNewTitle => 'Що нового:';

  @override
  String get exitAppBtn => 'Вийти';

  @override
  String get retryBtn => 'Повторити';

  @override
  String get downloadFromWebsiteBtn => 'Завантажити з Сайту';

  @override
  String get skipUpdateConfirmTitle => 'Пропустити оновлення?';

  @override
  String get skipUpdateConfirmDesc =>
      'Це оновлення містить важливі виправлення.';

  @override
  String get skipUpdateCancelBtn => 'Скасувати';

  @override
  String get skipUpdateConfirmBtn => 'Пропустити оновлення';

  @override
  String get maintenanceTitle => 'Обслуговування';

  @override
  String get maintenanceDescDefault => 'Shrinkeo зараз на обслуговуванні.';

  @override
  String versionAvailableMsg(String version) {
    return 'Версія $version доступна.';
  }

  @override
  String get hwEncoderNotSupportedTitle => 'Прискорення не підтримується';

  @override
  String get failedCreateFolderError => 'Не вдалося створити папку';

  @override
  String get failedProbeDurationError => 'Не вдалося визначити тривалість';

  @override
  String get ffmpegNotFoundGlobalError => 'FFmpeg не знайдено.';

  @override
  String get ffmpegMissingError =>
      'FFmpeg або FFprobe відсутній або пошкоджений.';

  @override
  String hwFallbackNotificationBody(String encoderLabel) {
    return '$encoderLabel не спрацював. Переключено на CPU.';
  }

  @override
  String get failedDownloadUpdateMsg =>
      'Не вдалося завантажити оновлення. Спробуйте знову.';

  @override
  String customRatioActiveTitle(Object ratio) {
    return 'Користувацьке співвідношення ($ratio)';
  }

  @override
  String customRatioActiveDesc(Object ratio) {
    return 'Полотно з полями для співвідношення $ratio.';
  }

  @override
  String customAngleActiveTitle(Object angle) {
    return 'Кут користувача ($angle°)';
  }

  @override
  String customAngleActiveDesc(Object angle) {
    return 'Повертає відео на користувацький кут $angle°.';
  }

  @override
  String trimActiveDesc(Object end, Object start) {
    return 'Обрезає відеокліп між $start і $end.';
  }

  @override
  String targetSizeLimitLabel(Object size) {
    return 'Ліміт $size МБ';
  }

  @override
  String get customMbSizeTooltip => 'Введіть розмір у МБ';

  @override
  String get trimTimeTooltip =>
      'Введіть час, напр. 5 (5с), 1:30 (1хв30с) або 00:01:30';

  @override
  String get tabImageSuite => 'Image Suite';

  @override
  String get compressionModeTitle => 'Режим стиснення';

  @override
  String get smartAutoLabel => 'Smart Auto';

  @override
  String get smartAutoDesc =>
      'Автоматично зменшує розмір файлу на ~60-80% із 100% первозданною чіткістю зображення. Ідеально підходить для щоденної оптимізації фотографій.';

  @override
  String get maxSavingsLabel => 'Максимальна економія';

  @override
  String get maxSavingsDesc =>
      'Агресивне стиснення зберігає до 85-90% розміру файлу. Найкраще підходить для швидкого обміну повідомленнями, завантаження в Інтернет і вкладення електронних листів.';

  @override
  String get ultraFidelityLabel => 'Ultra Fidelity';

  @override
  String get ultraFidelityDesc =>
      'Зберігає необроблену візуальну точність із мінімальним стисненням. Ідеально підходить для фотоархівів і друку високої роздільної здатності.';

  @override
  String get targetImageFormatTitle => 'Цільовий формат зображення';

  @override
  String get dimensionResizingTitle => 'Зміна розміру';

  @override
  String get exifCameraPrivacyTitle => 'EXIF / Конфіденційність камери';

  @override
  String get stripGpsCameraInfoLabel => 'Видалення інформації про GPS і камеру';

  @override
  String get intentCompressOnly => 'Лише стиснення';

  @override
  String get intentCompressOnlyTooltip =>
      'Зосередьтеся лише на зменшенні розміру файлу (% якості або цільове значення КБ/МБ)';

  @override
  String get intentEditConvertOnly => 'Лише редагування/перетворення';

  @override
  String get intentEditConvertOnlyTooltip =>
      'Змінюйте розмір, обертайте, обрізайте або конвертуйте формат без зниження візуальної якості';

  @override
  String get intentCompressAndEdit => 'Стискати та редагувати';

  @override
  String get intentCompressAndEditTooltip =>
      'Повний контроль: редагуйте, змінюйте розмір, повертайте ТА стискайте розмір файлу разом';

  @override
  String get imgFmtOriginalLabel => 'Оригінальний формат';

  @override
  String get imgFmtOriginalDesc =>
      'Зберігати оригінальний формат (найшвидший, без конвертації).';

  @override
  String get imgFmtPngLabel => 'Зображення PNG (.png)';

  @override
  String get imgFmtPngDesc => 'Формат PNG без втрат із підтримкою прозорості.';

  @override
  String get imgFmtJpgLabel => 'Зображення JPEG (.jpg)';

  @override
  String get imgFmtJpgDesc =>
      'Стандартний стислий формат JPEG для універсальної сумісності.';

  @override
  String get imgFmtWebpLabel => 'Зображення WebP (.webp)';

  @override
  String get imgFmtWebpDesc =>
      'Сучасний формат WebP із чудовим стисненням і малим розміром.';

  @override
  String get imgFmtAvifLabel => 'Зображення AVIF (.avif)';

  @override
  String get imgFmtAvifDesc =>
      'Формат AVIF наступного покоління з надвисокою ефективністю стиснення.';

  @override
  String get imgResOriginalLabel => 'Оригінальні розміри';

  @override
  String get imgResOriginalDesc =>
      'Зберігайте оригінальні розміри ширини та висоти зображення.';

  @override
  String get imgRes4kLabel => '4K Max (3840 пікселів)';

  @override
  String get imgRes4kDesc =>
      'Зменште максимальний розмір зображення до 3840 пікселів (макс. 4 КБ).';

  @override
  String get imgRes1080pLabel => 'Full HD Max (1920 пікселів)';

  @override
  String get imgRes1080pDesc =>
      'Зменште максимальний розмір зображення до 1920 пікселів (макс. Full HD).';

  @override
  String get imgRes720pLabel => 'HD Max (1280 пікселів)';

  @override
  String get imgRes720pDesc =>
      'Зменште максимальний розмір зображення до 1280 пікселів (макс. HD).';

  @override
  String get imgRes480pLabel => 'SD Max (854 пікселів)';

  @override
  String get imgRes480pDesc =>
      'Зменште максимальний розмір зображення до 854 пікселів (макс. SD).';

  @override
  String get keepMetadataImageInfoDesc =>
      'Зберігає EXIF ​​оригінального зображення та метадані камери.';

  @override
  String get cleanNoiseLabel => 'Очистити шум';

  @override
  String get outputLargerTooltip =>
      'Розмір буде більшим за оригінал!\nЗупиніть і скиньте налаштування.';

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
