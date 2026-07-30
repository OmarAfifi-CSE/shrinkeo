// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hungarian (`hu`).
class AppLocalizationsHu extends AppLocalizations {
  AppLocalizationsHu([String locale = 'hu']) : super(locale);

  @override
  String get appName => 'Shrinkeo';

  @override
  String get totalSpaceSaved => 'Összesen megtakarított hely';

  @override
  String get savedSpacePrefix => 'Megtakarítva:';

  @override
  String get supportButtonText => 'Projekt támogatása';

  @override
  String get lightThemeTooltip => 'Világos téma';

  @override
  String get darkThemeTooltip => 'Sötét téma';

  @override
  String get settingsTooltip => 'Beállítások';

  @override
  String get minimizeTooltip => 'Kicsinyítés';

  @override
  String get closeTooltip => 'Bezárás';

  @override
  String get restoreTooltip => 'Visszaállítás';

  @override
  String get maximizeTooltip => 'Teljes méret';

  @override
  String get tabCompressionQuality => 'Tömörítés és Minőség';

  @override
  String get tabVideoEditingTools => 'Videószerkesztés és Eszközök';

  @override
  String get tabAudioSettings => 'Hangbeállítások';

  @override
  String get tabEngineOutput => 'Motor és kimenet';

  @override
  String get compressionSettingsTitle => 'Tömörítési Beállítások';

  @override
  String get resetToDefaults => 'Alapértelmezések';

  @override
  String get resetDefaultTooltip => 'Visszaállítás az eredeti értékekre';

  @override
  String get modeTargetSizeTitle => 'Tömörítési Mód';

  @override
  String get modeCrfLabel => 'Minőség (CRF)';

  @override
  String get modeTargetSizeLabel => 'Célméret (MB)';

  @override
  String get crfQualityTitle => 'CRF Minőségi Tényező';

  @override
  String get crfLossless => 'Veszteségmentes';

  @override
  String get crfHighQuality => 'Kiváló minőség';

  @override
  String get crfBalanced => 'Kiegyensúlyozott';

  @override
  String get crfHighCompression => 'Magas tömörítés';

  @override
  String get crfLowQuality => 'Alacsony minőség';

  @override
  String get crfUltraCompressed => 'Ultra tömörített';

  @override
  String get targetSizeLabel => 'Cél Fájlméret (MB)';

  @override
  String get targetSizeDesc =>
      'Kiszámítja a bitrátát a méretkorlát betartásához.';

  @override
  String get encodingSpeedTitle => 'Kódolási Sebesség';

  @override
  String get presetUltrafastLabel => 'Ultramagas';

  @override
  String get presetUltrafastDesc =>
      'Maximális sebesség, de a legkisebb méretcsökkenés.';

  @override
  String get presetSuperfastLabel => 'Szupergyors';

  @override
  String get presetSuperfastDesc => 'Nagyon gyors kódolás.';

  @override
  String get presetVeryfastLabel => 'Nagyon gyors';

  @override
  String get presetVeryfastDesc => 'Gyorsabb az átlagnál.';

  @override
  String get presetFasterLabel => 'Gyorsabb';

  @override
  String get presetFasterDesc => 'Jó sebesség és kiváló tömörítés.';

  @override
  String get presetFastLabel => 'Gyors';

  @override
  String get presetFastDesc =>
      'A legjobb egyensúly a sebesség és a méret között.';

  @override
  String get presetMediumLabel => 'Közepes';

  @override
  String get presetMediumDesc => 'Alapértelmezett egyensúly.';

  @override
  String get presetSlowLabel => 'Lassú';

  @override
  String get presetSlowDesc => 'Lassabb, de jelentősen kisebb fájlok.';

  @override
  String get presetVeryslowLabel => 'Nagyon lassú';

  @override
  String get presetVeryslowDesc => 'Maximális méretcsökkentés.';

  @override
  String get videoCodecTitle => 'Video Kodek';

  @override
  String get codecH264Label => 'H.264';

  @override
  String get codecH264Desc => 'Maximális kompatibilitás a régebbi eszközökkel.';

  @override
  String get codecH265Label => 'H.265 / HEVC';

  @override
  String get codecH265Desc => 'Jobb tömörítési hatékonyság.';

  @override
  String get codecAv1Label => 'AV1';

  @override
  String get codecAv1Desc =>
      'Új generációs kodek (30%-kal kisebb, mint a H.265).';

  @override
  String get hardwareEncoderTitle => 'Hardveres Gyorsítás (GPU)';

  @override
  String get hwSoftwareLabel => 'Szoftveres (CPU)';

  @override
  String get hwSoftwareDesc => 'A leglassabb, de a legjobb kompatibilitás.';

  @override
  String get hwNvidiaLabel => 'Nvidia (NVENC)';

  @override
  String get hwNvidiaDesc => 'Nagyon gyors kódolás Nvidia GPU-khoz.';

  @override
  String get hwAmdLabel => 'AMD (AMF)';

  @override
  String get hwAmdDesc => 'Nagyon gyors kódolás AMD GPU-khoz.';

  @override
  String get hwIntelLabel => 'Intel (QSV)';

  @override
  String get hwIntelDesc => 'Nagyon gyors kódolás Intel GPU-khoz.';

  @override
  String get resolutionTitle => 'Maximális Felbontás';

  @override
  String get resOriginalLabel => 'Eredeti';

  @override
  String get resOriginalDesc => 'Az eredeti felbontás megtartása.';

  @override
  String get res4kLabel => '4K';

  @override
  String get res4kDesc => 'Csökkentés legfeljebb 4K-ra.';

  @override
  String get res2kLabel => '2K';

  @override
  String get res2kDesc => 'Csökkentés legfeljebb 2K-ra.';

  @override
  String get res1080pLabel => '1080p';

  @override
  String get res1080pDesc => 'Csökkentés legfeljebb 1080p Full HD-ra.';

  @override
  String get res720pLabel => '720p';

  @override
  String get res720pDesc => 'Csökkentés legfeljebb 720p HD-ra.';

  @override
  String get res480pLabel => '480p';

  @override
  String get res480pDesc => 'Csökkentés 480p-re.';

  @override
  String get res360pLabel => '360p';

  @override
  String get res360pDesc => 'Maximális tömörítés.';

  @override
  String get frameRateTitle => 'Képkockasebesség (FPS)';

  @override
  String get fpsOriginalLabel => 'Eredeti';

  @override
  String get fpsOriginalDesc => 'Ugyanaz az FPS, mint a forrásnál.';

  @override
  String get fps60Label => '60 fps';

  @override
  String get fps60Desc => 'Sima mozgás játékokhoz vagy sporthoz.';

  @override
  String get fps30Label => '30 fps';

  @override
  String get fps30Desc => 'Standard a legtöbb videóhoz.';

  @override
  String get fps24Label => '24 fps';

  @override
  String get fps24Desc => 'Mozi stílus.';

  @override
  String get enableVideoDenoiseTitle => 'Videózaj Eltávolítása';

  @override
  String get enableVideoDenoiseDesc => '3D szűrő a zaj csökkentésére.';

  @override
  String get exportFormatTitle => 'Exportálási Formátum';

  @override
  String get exportVideoLabel => 'Standard Videó';

  @override
  String get exportVideoDesc => 'Exportálás MP4/MKV/MOV fájlba';

  @override
  String get exportGifLabel => 'Animált GIF';

  @override
  String get exportGifDesc => 'Kiváló minőségű animált GIF létrehozása';

  @override
  String get exportMp3Label => 'MP3 Kinyerése';

  @override
  String get exportMp3Desc => 'Hang kinyerése MP3 320kbps fájlba';

  @override
  String get exportAacLabel => 'AAC Kinyerése';

  @override
  String get exportAacDesc => 'Hang kinyerése AAC fájlba';

  @override
  String get exportWavLabel => 'WAV Kinyerése';

  @override
  String get exportWavDesc => 'Tömörítetlen WAV hang kinyerése';

  @override
  String get privacyScrubbingTitle => 'Adatvédelem és GPS';

  @override
  String get keepMetadataLabel => 'Adatok Megtartása';

  @override
  String get stripGpsExifLabel => 'GPS/EXIF Törlése';

  @override
  String get stripGpsExifInfoTitle => 'Metaadatok Törlése';

  @override
  String get stripGpsExifInfoDesc =>
      'Eltávolítja a kamera információkat és a GPS helyadatokat.';

  @override
  String get keepMetadataInfoDesc => 'Megtartja az összes eredeti metaadatot.';

  @override
  String get autoCropBlackBarsTitle => 'Fekete Sávok Automatikus Vágása';

  @override
  String get autoCropLabel => 'Auto Vágás';

  @override
  String get autoCropActiveTitle => 'Auto Vágás Aktív';

  @override
  String get autoCropActiveDesc =>
      'Automatikusan eltávolítja a fekete sávokat.';

  @override
  String get autoCropDisabledDesc => 'Megtartja az eredeti kereteket.';

  @override
  String get playbackSpeedTitle => 'Lejátszási Sebesség';

  @override
  String get speedOriginalLabel => '1.0x';

  @override
  String get speedOriginalDesc => 'Normál sebesség';

  @override
  String get speedSlow05Label => '0.5x Lassú';

  @override
  String get speedSlow05Desc => 'Lejátszás félsebességgel';

  @override
  String get speedFast15Label => '1.5x';

  @override
  String get speedFast15Desc => '1.5-ször gyorsabb';

  @override
  String get speedFast20Label => '2.0x Gyors';

  @override
  String get speedFast20Desc => 'Dupla sebesség';

  @override
  String get speedTimelapse40Label => '4.0x Timelapse';

  @override
  String get speedTimelapse40Desc => '4x sebesség timelapse-hez';

  @override
  String get canvasAspectRatioTitle => 'Méretarány';

  @override
  String get aspectOriginalLabel => 'Eredeti';

  @override
  String get aspectOriginalDesc => 'Eredeti arányok megtartása';

  @override
  String get aspectShortsLabel => '9:16 Shorts';

  @override
  String get aspectShortsDesc => 'TikTok és Reels videókhoz';

  @override
  String get aspectSquareLabel => '1:1 Négyzet';

  @override
  String get aspectSquareDesc => 'Instagram bejegyzésekhez';

  @override
  String get aspectPortraitLabel => '4:5 Portré';

  @override
  String get aspectPortraitDesc => 'Függőleges Instagram videókhoz';

  @override
  String get aspectWidescreenLabel => '16:9 Szélesvászon';

  @override
  String get aspectWidescreenDesc => 'YouTube és TV képernyőkhöz';

  @override
  String get aspectClassicLabel => '4:3 Klasszikus';

  @override
  String get aspectClassicDesc => 'Klasszikus képernyőkhöz';

  @override
  String get aspectCinemaLabel => '21:9 Mozi';

  @override
  String get aspectCinemaDesc => 'Ultraszéles monitorokhoz';

  @override
  String get aspectCustomLabel => 'Egyéni Arány';

  @override
  String get aspectCustomDesc => 'Egyéni méretarány megadása';

  @override
  String get customRatioTooltip => 'Pl: 16:10, 2:1';

  @override
  String get rotationFlipTitle => 'Forgatás és Tükrözés';

  @override
  String get rotOriginalLabel => 'Eredeti (0°)';

  @override
  String get rotOriginalDesc => 'Irány megtartása';

  @override
  String get rot90Label => '90° Jobbra';

  @override
  String get rot90Desc =>
      'Forgatás 90 fokkal az óramutató járásával megegyezően';

  @override
  String get rot180Label => '180° Fejjel lefelé';

  @override
  String get rot180Desc => 'Fejjel lefelé forgatás';

  @override
  String get rot270Label => '270° Balra';

  @override
  String get rot270Desc =>
      'Forgatás 90 fokkal az óramutató járásával ellentétesen';

  @override
  String get rotFlipHLabel => 'Vízszintes Tükrözés';

  @override
  String get rotFlipHDesc => 'Tükrözés vízszintesen';

  @override
  String get rotFlipVLabel => 'Függőleges Tükrözés';

  @override
  String get rotFlipVDesc => 'Tükrözés függőlegesen';

  @override
  String get rotCustomLabel => 'Egyéni Szög';

  @override
  String get rotCustomDesc => 'Forgatás megadott szöggel';

  @override
  String get customRotationTooltip => 'Szög fokban pl. 45';

  @override
  String get trimVideoTitle => 'Videó Vágása';

  @override
  String get fullVideoLabel => 'Teljes Videó';

  @override
  String get cutClipLabel => 'Klip Vágása';

  @override
  String get trimStartLabel => 'Kezdés';

  @override
  String get trimEndLabel => 'Vége';

  @override
  String get trimActiveTitle => 'Vágás Aktív';

  @override
  String get fullVideoDesc => 'A teljes videó feldolgozása vágás nélkül.';

  @override
  String get audioModeTitle => 'Hangsáv Mód';

  @override
  String get audioOriginalLabel => 'Eredeti';

  @override
  String get audioOriginalDesc => 'Nincs hangminőség-romlás.';

  @override
  String get audioAac256Label => 'Kiváló Minőség';

  @override
  String get audioAac256Desc => 'AAC 256kbps';

  @override
  String get audioAac128Label => 'Kiegyensúlyozott';

  @override
  String get audioAac128Desc => 'AAC 128kbps (Webes szabvány)';

  @override
  String get audioAac64Label => 'Alacsony Minőség';

  @override
  String get audioAac64Desc => 'AAC 64kbps beszédhez';

  @override
  String get audioMuteLabel => 'Hang Némítása';

  @override
  String get audioMuteDesc => 'A hangsáv teljes eltávolítása.';

  @override
  String get audioNormTitle => 'Hangerő Normalizálás';

  @override
  String get audioNormOffLabel => 'Kikapcsolva';

  @override
  String get audioNormOffDesc => 'Eredeti dinamika.';

  @override
  String get audioNormSpeechLabel => 'Emberi Beszéd';

  @override
  String get audioNormSpeechDesc => 'EBU R128 szabvány a tiszta párbeszédért.';

  @override
  String get audioNormDynamicLabel => 'Mozi Dinamika';

  @override
  String get audioNormDynamicDesc => 'Kiegyenlíti a halk és hangos részeket.';

  @override
  String get audioNormBoostLabel => 'Enyhe Kiemelés';

  @override
  String get audioNormBoostDesc => '+3dB hangerő növelés.';

  @override
  String get audioChanTitle => 'Hangcsatornák';

  @override
  String get audioChanOriginalLabel => 'Eredeti';

  @override
  String get audioChanOriginalDesc => 'Forrás csatornák megtartása.';

  @override
  String get audioChanStereoLabel => 'Stereo (2.0)';

  @override
  String get audioChanStereoDesc => '2 csatornás sztereó kompatibilitás.';

  @override
  String get audioChanMonoLabel => 'Mono (1.0)';

  @override
  String get audioChanMonoDesc => 'Egy csatorna - 50% méretmegtakarítás.';

  @override
  String get removeNoiseLabel => 'Zaj Eltávolítása';

  @override
  String get enableAudioDenoiseTitle => 'Mikrofonzaj Eltávolítása';

  @override
  String get enableAudioDenoiseDesc => 'Szűrő a háttérzajok kiszűrésére.';

  @override
  String get outputDirectoryTitle => 'Kimeneti Mappa';

  @override
  String get defaultOutputDirectory =>
      'Alapértelmezett (Az eredeti fájl mellett)';

  @override
  String get selectOutputFolderTitle => 'Mappa Kiválasztása';

  @override
  String get clearOutputFolder => 'Alapértelmezett hely használata';

  @override
  String get changeBtn => 'Módosítás';

  @override
  String get outputLocationTitle => 'Kimeneti Viselkedés';

  @override
  String get outputLocationUnifiedLabel => 'Egyetlen Mappa';

  @override
  String get outputLocationUnifiedDesc =>
      'Minden tömörített videó egy mappába kerül.';

  @override
  String get outputLocationSameLabel => 'Az Eredeti Mellett';

  @override
  String get outputLocationSameDesc => 'Minden videó a forrásfájl mellé kerül.';

  @override
  String get fileManagementTitle => 'Fájlkezelés';

  @override
  String get keepOriginalsLabel => 'Eredeti Megtartása';

  @override
  String get keepOriginalsDesc => 'Az eredeti fájlok érintetlenül maradnak.';

  @override
  String get toRecycleBinLabel => 'A Lomtárba';

  @override
  String get toRecycleBinDesc =>
      'Az eredeti fájlok lomtárba áthelyezése tömörítés után.';

  @override
  String get outputFormatTitle => 'Konténer Formátum';

  @override
  String get formatOriginalLabel => 'Eredeti';

  @override
  String get formatOriginalDesc => 'Eredeti formátum megtartása.';

  @override
  String get formatMp4Label => 'MP4';

  @override
  String get formatMp4Desc => 'Maximális kompatibilitás.';

  @override
  String get formatMkvLabel => 'MKV';

  @override
  String get formatMkvDesc => 'Több sáv támogatása.';

  @override
  String get formatMovLabel => 'MOV';

  @override
  String get formatMovDesc => 'Apple QuickTime formátum.';

  @override
  String get scanningFilesMsg => 'Fájlok beolvasása...';

  @override
  String get addFilesBtn => 'Fájlok Hozzáadása';

  @override
  String get addFolderBtn => 'Mappa Hozzáadása';

  @override
  String get dragDropMoreMsg => 'Vagy húzzon ide további videókat';

  @override
  String get openOutputFolderTooltip => 'Kimeneti Mappa Megnyitása';

  @override
  String get statusQueued => 'Várakozási sorban';

  @override
  String get statusAnalyzing => 'Elemzés';

  @override
  String get statusCompressing => 'Tömörítés';

  @override
  String get statusDone => 'Kész';

  @override
  String get statusFailed => 'Hiba';

  @override
  String get statusCancelled => 'Megszakítva';

  @override
  String get savedPrefix => 'Megtakarítva';

  @override
  String get largerSuffix => 'Nagyobb';

  @override
  String get largerSizeWarning =>
      'A kimeneti méret nagyobb lehet az eredetinél.';

  @override
  String get clearCompletedBtn => 'Készek Törlése';

  @override
  String get clearAllBtn => 'Összes Törlése';

  @override
  String get stopAllBtn => 'Összes Leállítása';

  @override
  String get startCompressionBtn => 'Tömörítés Indítása';

  @override
  String get allDoneLabel => 'Minden Kész!';

  @override
  String get openFolderBtn => 'Mappa Megnyitása';

  @override
  String get totalEtaLabel => 'Hátralévő Idő';

  @override
  String get totalSavedLabel => 'Összesen Megtakarítva';

  @override
  String get videoSingle => 'videó';

  @override
  String get videosPlural => 'videó';

  @override
  String get releaseToAddVideosMsg => 'Engedje el a videók hozzáadásához';

  @override
  String get dragDropHereMsg => 'Húzza ide a fájlokat vagy mappákat';

  @override
  String get supportedFormatsMsg => 'Támogatja: MP4, MKV, MOV, AVI, WMV';

  @override
  String get selectFilesBtn => 'Fájlok Kiválasztása';

  @override
  String get selectFolderBtn => 'Mappa Kiválasztása';

  @override
  String get releaseToShrinkTitle => 'Engedje el az azonnali tömörítéshez';

  @override
  String get filesWillBeAddedDesc =>
      'A fájlok hozzáadódnak a várakozási sorhoz.';

  @override
  String get disabledLabel => 'Kikapcsolva';

  @override
  String get compressionInProgressTitle => 'Tömörítés Folyamatban';

  @override
  String get confirmCloseDesc => 'Biztosan be szeretné zárni a Shrinkeo-t?';

  @override
  String get keepCompressingBtn => 'Tömörítés Folytatása';

  @override
  String get closeAppBtn => 'Alkalmazás Bezárása';

  @override
  String get lockedSettingsWarning => 'Tömörítés alatt zárolva';

  @override
  String get updateRequiredTitle => 'Frissítés Szükséges';

  @override
  String get updateRequiredDescNewVersion => 'Új verzió érhető el.';

  @override
  String get updateRequiredDescOldVersion =>
      'Az Ön által használt verzió már nem támogatott.';

  @override
  String get updateNowBtn => 'Frissítés Most';

  @override
  String get laterBtn => 'Később';

  @override
  String get updateAvailableTitle => 'Frissítés Érhető El';

  @override
  String get whatsNewTitle => 'Újdonságok:';

  @override
  String get exitAppBtn => 'Kilépés';

  @override
  String get retryBtn => 'Próbálja újra';

  @override
  String get downloadFromWebsiteBtn => 'Letöltés a Weboldalról';

  @override
  String get skipUpdateConfirmTitle => 'Frissítés kihagyása?';

  @override
  String get skipUpdateConfirmDesc =>
      'Ez a frissítés fontos javításokat tartalmaz.';

  @override
  String get skipUpdateCancelBtn => 'Mégse';

  @override
  String get skipUpdateConfirmBtn => 'Frissítés kihagyása';

  @override
  String get maintenanceTitle => 'Karbantartás';

  @override
  String get maintenanceDescDefault =>
      'A Shrinkeo jelenleg karbantartás alatt áll.';

  @override
  String versionAvailableMsg(String version) {
    return 'A $version verzió elérhető.';
  }

  @override
  String get hwEncoderNotSupportedTitle => 'Hardveres gyorsítás nem támogatott';

  @override
  String get failedCreateFolderError => 'Kimeneti mappa létrehozása sikertelen';

  @override
  String get failedProbeDurationError => 'Időtartam beolvasása sikertelen';

  @override
  String get ffmpegNotFoundGlobalError => 'A FFmpeg nem található.';

  @override
  String get ffmpegMissingError =>
      'A FFmpeg vagy FFprobe hiányzik vagy sérült.';

  @override
  String hwFallbackNotificationBody(String encoderLabel) {
    return 'A $encoderLabel sikertelen. Váltás CPU-ra.';
  }

  @override
  String get failedDownloadUpdateMsg =>
      'Frissítés letöltése sikertelen. Próbálja újra.';

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
  String get tabImageSuite => 'Image Suite';

  @override
  String get compressionModeTitle => 'Tömörítési mód';

  @override
  String get smartAutoLabel => 'Smart Auto';

  @override
  String get smartAutoDesc =>
      'Automatikusan csökkenti a fájlméretet ~60-80%-kal, 100%-os tiszta vizuálisan. Tökéletes a mindennapi fotóoptimalizáláshoz.';

  @override
  String get maxSavingsLabel => 'Maximális megtakarítás';

  @override
  String get maxSavingsDesc =>
      'Agresszív tömörítés akár 85-90%-os fájlméret megtakarításával. A legjobb gyors üzenetküldéshez, webes feltöltéshez és e-mail mellékletekhez.';

  @override
  String get ultraFidelityLabel => 'Ultra Fidelity';

  @override
  String get ultraFidelityDesc =>
      'Minimális tömörítéssel megőrzi a nyers vizuális hűséget. Ideális fotóarchívumokhoz és nagy felbontású nyomtatási munkákhoz.';

  @override
  String get targetImageFormatTitle => 'Cél képformátum';

  @override
  String get dimensionResizingTitle => 'Méret átméretezés';

  @override
  String get exifCameraPrivacyTitle => 'EXIF / kamera adatvédelem';

  @override
  String get stripGpsCameraInfoLabel => 'Strip GPS és kamera Info';

  @override
  String get intentCompressOnly => 'Csak tömörítés';

  @override
  String get intentCompressOnlyTooltip =>
      'Pusztán a fájlméret csökkentésére összpontosítson (% minőség vagy cél KB/MB)';

  @override
  String get intentEditConvertOnly => 'Csak szerkesztés / konvertálás';

  @override
  String get intentEditConvertOnlyTooltip =>
      'Átméretezheti, elforgathatja, vághatja le vagy konvertálhatja a formátumot a vizuális minőség romlása nélkül';

  @override
  String get intentCompressAndEdit => 'Tömörítés és szerkesztés';

  @override
  String get intentCompressAndEditTooltip =>
      'Teljes ellenőrzés: együtt szerkesztheti, átméretezheti, elforgathatja ÉS tömöríti a fájlméretet';
}
