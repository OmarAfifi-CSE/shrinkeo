// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Czech (`cs`).
class AppLocalizationsCs extends AppLocalizations {
  AppLocalizationsCs([String locale = 'cs']) : super(locale);

  @override
  String get appName => 'Shrinkeo';

  @override
  String get totalSpaceSaved => 'Celkově ušetřené místo';

  @override
  String get savedSpacePrefix => 'Ušetřeno:';

  @override
  String get supportButtonText => 'Podpořit projekt';

  @override
  String get lightThemeTooltip => 'Světlý motiv';

  @override
  String get darkThemeTooltip => 'Tmavý motiv';

  @override
  String get settingsTooltip => 'Nastavení';

  @override
  String get minimizeTooltip => 'Minimalizovat';

  @override
  String get closeTooltip => 'Zavřít';

  @override
  String get restoreTooltip => 'Obnovit';

  @override
  String get maximizeTooltip => 'Maximalizovat';

  @override
  String get tabCompressionQuality => 'Komprese a Kvalita';

  @override
  String get tabVideoEditingTools => 'Úprava Videa a Nástroje';

  @override
  String get tabAudioSettings => 'Nastavení Zvuku';

  @override
  String get tabEngineOutput => 'Motor a Výstup';

  @override
  String get compressionSettingsTitle => 'Nastavení Komprese';

  @override
  String get resetToDefaults => 'Obnovit výchozí';

  @override
  String get resetDefaultTooltip => 'Obnovit původní hodnoty';

  @override
  String get modeTargetSizeTitle => 'Režim Cíle Komprese';

  @override
  String get modeCrfLabel => 'Kvalita (CRF)';

  @override
  String get modeTargetSizeLabel => 'Cílová Velikost (MB)';

  @override
  String get crfQualityTitle => 'Faktor Kvality CRF';

  @override
  String get crfLossless => 'Bezztrátový';

  @override
  String get crfHighQuality => 'Vysoká kvalita';

  @override
  String get crfBalanced => 'Vyrovnaný';

  @override
  String get crfHighCompression => 'Vysoká komprese';

  @override
  String get crfLowQuality => 'Nízká kvalita';

  @override
  String get crfUltraCompressed => 'Ultra Compressed';

  @override
  String get targetSizeLabel => 'Cílová Velikost Souboru (MB)';

  @override
  String get targetSizeDesc =>
      'Vypočítá datový tok pro dodržení limitu velikosti.';

  @override
  String get encodingSpeedTitle => 'Rychlost Kódování';

  @override
  String get presetUltrafastLabel => 'Ultra rychlý';

  @override
  String get presetUltrafastDesc =>
      'Maximální rychlost, ale nejmenší úspora místa.';

  @override
  String get presetSuperfastLabel => 'Super rychlý';

  @override
  String get presetSuperfastDesc => 'Velmi rychlé kódování.';

  @override
  String get presetVeryfastLabel => 'Velmi rychlý';

  @override
  String get presetVeryfastDesc => 'Rychlejší než průměr.';

  @override
  String get presetFasterLabel => 'Rychlejší';

  @override
  String get presetFasterDesc => 'Dobrá rychlost a vysoká komprese.';

  @override
  String get presetFastLabel => 'Rychlý';

  @override
  String get presetFastDesc => 'Skvělý poměr rychlosti a velikosti.';

  @override
  String get presetMediumLabel => 'Střední';

  @override
  String get presetMediumDesc => 'Výchozí vyvážení.';

  @override
  String get presetSlowLabel => 'Pomalý';

  @override
  String get presetSlowDesc => 'Pomalé, ale výrazně menší soubory.';

  @override
  String get presetVeryslowLabel => 'Velmi pomalý';

  @override
  String get presetVeryslowDesc => 'Maximální zmenšení velikosti.';

  @override
  String get videoCodecTitle => 'Video Kodek';

  @override
  String get codecH264Label => 'H.264';

  @override
  String get codecH264Desc => 'Maximální kompatibilita se staršími zařízeními.';

  @override
  String get codecH265Label => 'H.265 / HEVC';

  @override
  String get codecH265Desc => 'Lepší efektivita komprese.';

  @override
  String get codecAv1Label => 'AV1';

  @override
  String get codecAv1Desc => 'Kodek nové generace (o 30 % menší než H.265).';

  @override
  String get hardwareEncoderTitle => 'Hardwarová Akcelerace (GPU)';

  @override
  String get hwSoftwareLabel => 'Softwarový (CPU)';

  @override
  String get hwSoftwareDesc => 'Nejpomalejší, ale nejvyšší kompatibilita.';

  @override
  String get hwNvidiaLabel => 'Nvidia (NVENC)';

  @override
  String get hwNvidiaDesc => 'Velmi rychlé kódování pro karty Nvidia.';

  @override
  String get hwAmdLabel => 'AMD (AMF)';

  @override
  String get hwAmdDesc => 'Velmi rychlé kódování pro karty AMD.';

  @override
  String get hwIntelLabel => 'Intel (QSV)';

  @override
  String get hwIntelDesc => 'Velmi rychlé kódování pro karty Intel.';

  @override
  String get resolutionTitle => 'Maximální Rozlišení';

  @override
  String get resOriginalLabel => 'Původní';

  @override
  String get resOriginalDesc => 'Zachovat původní rozlišení.';

  @override
  String get res4kLabel => '4K';

  @override
  String get res4kDesc => 'Zmenšit maximálně na 4K.';

  @override
  String get res2kLabel => '2K';

  @override
  String get res2kDesc => 'Zmenšit maximálně na 2K.';

  @override
  String get res1080pLabel => '1080p';

  @override
  String get res1080pDesc => 'Zmenšit maximálně na 1080p Full HD.';

  @override
  String get res720pLabel => '720p';

  @override
  String get res720pDesc => 'Zmenšit maximálně na 720p HD.';

  @override
  String get res480pLabel => '480p';

  @override
  String get res480pDesc => 'Zmenšit na 480p.';

  @override
  String get res360pLabel => '360p';

  @override
  String get res360pDesc => 'Maximální komprese.';

  @override
  String get frameRateTitle => 'Snímková Frekvence (FPS)';

  @override
  String get fpsOriginalLabel => 'Původní';

  @override
  String get fpsOriginalDesc => 'Stejná snímková frekvence jako zdroj.';

  @override
  String get fps60Label => '60 fps';

  @override
  String get fps60Desc => 'Plynulé pro hry nebo sport.';

  @override
  String get fps30Label => '30 fps';

  @override
  String get fps30Desc => 'Standard pro většinu videí.';

  @override
  String get fps24Label => '24 fps';

  @override
  String get fps24Desc => 'Filmový styl.';

  @override
  String get enableVideoDenoiseTitle => 'Odstranění Šumu Videa';

  @override
  String get enableVideoDenoiseDesc =>
      '3D filtr pro odstranění šumu a zvýšení komprese.';

  @override
  String get exportFormatTitle => 'Format Exportu';

  @override
  String get exportVideoLabel => 'Standardní Video';

  @override
  String get exportVideoDesc => 'Exportovat do MP4/MKV/MOV';

  @override
  String get exportGifLabel => 'Animovaný GIF';

  @override
  String get exportGifDesc => 'Vytvořit kvalitní animaci GIF';

  @override
  String get exportMp3Label => 'Extrahovat MP3';

  @override
  String get exportMp3Desc => 'Extrahovat zvuk do MP3 320kbps';

  @override
  String get exportAacLabel => 'Extrahovat AAC';

  @override
  String get exportAacDesc => 'Extrahovat zvuk do AAC';

  @override
  String get exportWavLabel => 'Extrahovat WAV';

  @override
  String get exportWavDesc => 'Extrahovat nekomprimovaný zvuk WAV';

  @override
  String get privacyScrubbingTitle => 'Soukromí a GPS';

  @override
  String get keepMetadataLabel => 'Ponechat Data';

  @override
  String get stripGpsExifLabel => 'Odstranit GPS/EXIF';

  @override
  String get stripGpsExifInfoTitle => 'Vyčistit Metadata';

  @override
  String get stripGpsExifInfoDesc =>
      'Odstraní informace o fotoaparátu a GPS polohu.';

  @override
  String get keepMetadataInfoDesc => 'Ponechá všechna původní metadata.';

  @override
  String get autoCropBlackBarsTitle => 'Automatické Oříznutí Černých Pruhů';

  @override
  String get autoCropLabel => 'Auto Oříznutí';

  @override
  String get autoCropActiveTitle => 'Auto Oříznutí Aktivní';

  @override
  String get autoCropActiveDesc => 'Automaticky odstraní černé pruhy.';

  @override
  String get autoCropDisabledDesc => 'Zachová původní okraje.';

  @override
  String get playbackSpeedTitle => 'Rychlost Přehrávání';

  @override
  String get speedOriginalLabel => '1.0x';

  @override
  String get speedOriginalDesc => 'Normální rychlost';

  @override
  String get speedSlow05Label => '0.5x Zpomaleně';

  @override
  String get speedSlow05Desc => 'Přehrávání poloviční rychlostí';

  @override
  String get speedFast15Label => '1.5x';

  @override
  String get speedFast15Desc => 'Zrychlení 1.5x';

  @override
  String get speedFast20Label => '2.0x Rychle';

  @override
  String get speedFast20Desc => 'Dvojnásobná rychlost';

  @override
  String get speedTimelapse40Label => '4.0x Časosběr';

  @override
  String get speedTimelapse40Desc => '4x rychlost pro časosběr';

  @override
  String get canvasAspectRatioTitle => 'Pomer Stran';

  @override
  String get aspectOriginalLabel => 'Původní';

  @override
  String get aspectOriginalDesc => 'Zachovat původní poměr';

  @override
  String get aspectShortsLabel => '9:16 Shorts';

  @override
  String get aspectShortsDesc => 'Pro TikTok a Reels';

  @override
  String get aspectSquareLabel => '1:1 Čtverec';

  @override
  String get aspectSquareDesc => 'Pro příspěvky na Instagramu';

  @override
  String get aspectPortraitLabel => '4:5 Portrét';

  @override
  String get aspectPortraitDesc => 'Pro vertikální Instagram';

  @override
  String get aspectWidescreenLabel => '16:9 Širokoúhlý';

  @override
  String get aspectWidescreenDesc => 'Pro YouTube a TV';

  @override
  String get aspectClassicLabel => '4:3 Klasický';

  @override
  String get aspectClassicDesc => 'Pro klasické obrazovky';

  @override
  String get aspectCinemaLabel => '21:9 Kinto';

  @override
  String get aspectCinemaDesc => 'Pro ultrawide monitory';

  @override
  String get aspectCustomLabel => 'Vlastní Poměr';

  @override
  String get aspectCustomDesc => 'Vlastní poměr stran';

  @override
  String get customRatioTooltip => 'Např: 16:10, 2:1';

  @override
  String get rotationFlipTitle => 'Otočení a Zrcadlení';

  @override
  String get rotOriginalLabel => 'Původní (0°)';

  @override
  String get rotOriginalDesc => 'Zachovat orientaci';

  @override
  String get rot90Label => '90° Doprava';

  @override
  String get rot90Desc => 'Otočit o 90 stupňů doprava';

  @override
  String get rot180Label => '180° Otočit';

  @override
  String get rot180Desc => 'Otočit vzhůru nohama';

  @override
  String get rot270Label => '270° Doleva';

  @override
  String get rot270Desc => 'Otočit o 90 stupňů doleva';

  @override
  String get rotFlipHLabel => 'Zrcadlit Horiz.';

  @override
  String get rotFlipHDesc => 'Zrcadlit horizontálně';

  @override
  String get rotFlipVLabel => 'Zrcadlit Vert.';

  @override
  String get rotFlipVDesc => 'Zrcadlit vertikálně';

  @override
  String get rotCustomLabel => 'Vlastní Úhel';

  @override
  String get rotCustomDesc => 'Otočit o určený úhel';

  @override
  String get customRotationTooltip => 'Úhel ve stupních např. 45';

  @override
  String get trimVideoTitle => 'Oříznout Video';

  @override
  String get fullVideoLabel => 'Celé Video';

  @override
  String get cutClipLabel => 'Oříznout Klip';

  @override
  String get trimStartLabel => 'Začátek';

  @override
  String get trimEndLabel => 'Konec';

  @override
  String get trimActiveTitle => 'Ořezávání Aktivní';

  @override
  String get fullVideoDesc => 'Zpracovat celé video bez ořezávání.';

  @override
  String get audioModeTitle => 'Režim Zvukové Stopy';

  @override
  String get audioOriginalLabel => 'Původní';

  @override
  String get audioOriginalDesc => 'Bez ztráty kvality zvuku.';

  @override
  String get audioAac256Label => 'Vysoká Kvalita';

  @override
  String get audioAac256Desc => 'AAC 256kbps';

  @override
  String get audioAac128Label => 'Vyvážený';

  @override
  String get audioAac128Desc => 'AAC 128kbps (Webový standard)';

  @override
  String get audioAac64Label => 'Nízká Kvalita';

  @override
  String get audioAac64Desc => 'AAC 64kbps pro řeč';

  @override
  String get audioMuteLabel => 'Ztlumit Zvuk';

  @override
  String get audioMuteDesc => 'Zcela odstranit zvukovou stopu.';

  @override
  String get audioNormTitle => 'Normalizace Hlasitosti';

  @override
  String get audioNormOffLabel => 'Vypnuto';

  @override
  String get audioNormOffDesc => 'Původní dynamika.';

  @override
  String get audioNormSpeechLabel => 'Lidská Řeč';

  @override
  String get audioNormSpeechDesc => 'Standard EBU R128 pro čisté dialogy.';

  @override
  String get audioNormDynamicLabel => 'Kino Dynamika';

  @override
  String get audioNormDynamicDesc => 'Vyrovnává tiché a hlasité zvuky.';

  @override
  String get audioNormBoostLabel => 'Jemné Zesílení';

  @override
  String get audioNormBoostDesc => '+3dB zesílení hlasitosti.';

  @override
  String get audioChanTitle => 'Zvukové Kanály';

  @override
  String get audioChanOriginalLabel => 'Původní';

  @override
  String get audioChanOriginalDesc => 'Zachovat zdrojové kanály.';

  @override
  String get audioChanStereoLabel => 'Stereo (2.0)';

  @override
  String get audioChanStereoDesc => 'Kompatibilita stereo 2 kanály.';

  @override
  String get audioChanMonoLabel => 'Mono (1.0)';

  @override
  String get audioChanMonoDesc => 'Jednokanálové - 50% úspora velikosti zvuku.';

  @override
  String get removeNoiseLabel => 'Odstranit Šum';

  @override
  String get enableAudioDenoiseTitle => 'Odstranit Šum Mikrofonu';

  @override
  String get enableAudioDenoiseDesc => 'Filtr pro odstranění šumu na pozadí.';

  @override
  String get outputDirectoryTitle => 'Výstupní Složka';

  @override
  String get defaultOutputDirectory => 'Výchozí (Vedle původního souboru)';

  @override
  String get selectOutputFolderTitle => 'Vybrat Složku';

  @override
  String get clearOutputFolder => 'Použít výchozí umístění';

  @override
  String get changeBtn => 'Změnit';

  @override
  String get outputLocationTitle => 'Chování Výstupu';

  @override
  String get outputLocationUnifiedLabel => 'Jedna Složka';

  @override
  String get outputLocationUnifiedDesc =>
      'Všechna komprimovaná videa v jedné složce.';

  @override
  String get outputLocationSameLabel => 'Vedle Původního';

  @override
  String get outputLocationSameDesc =>
      'Každé video vedle svého zdrojového souboru.';

  @override
  String get fileManagementTitle => 'Správa Souborů';

  @override
  String get keepOriginalsLabel => 'Ponechat Původní';

  @override
  String get keepOriginalsDesc => 'Ponechat původní soubory beze změn.';

  @override
  String get toRecycleBinLabel => 'Do Koše';

  @override
  String get toRecycleBinDesc =>
      'Přesunout původní soubory do koše po kompresi.';

  @override
  String get outputFormatTitle => 'Format Kontejneru';

  @override
  String get formatOriginalLabel => 'Původní';

  @override
  String get formatOriginalDesc => 'Zachovat původní formát.';

  @override
  String get formatMp4Label => 'MP4';

  @override
  String get formatMp4Desc => 'Maximální kompatibilita.';

  @override
  String get formatMkvLabel => 'MKV';

  @override
  String get formatMkvDesc => 'Podpora více stop.';

  @override
  String get formatMovLabel => 'MOV';

  @override
  String get formatMovDesc => 'Format Apple QuickTime.';

  @override
  String get scanningFilesMsg => 'Skenování souborů...';

  @override
  String get addFilesBtn => 'Přidat Soubory';

  @override
  String get addFolderBtn => 'Přidat Složku';

  @override
  String get dragDropMoreMsg => 'Nebo sem přetáhněte další videa';

  @override
  String get openOutputFolderTooltip => 'Otevřít Výstupní Složku';

  @override
  String get statusQueued => 'V frontě';

  @override
  String get statusAnalyzing => 'Analýza';

  @override
  String get statusCompressing => 'Komprese';

  @override
  String get statusDone => 'Hotovo';

  @override
  String get statusFailed => 'Chyba';

  @override
  String get statusCancelled => 'Zrušeno';

  @override
  String get savedPrefix => 'Ušetřeno';

  @override
  String get largerSuffix => 'Větší';

  @override
  String get largerSizeWarning =>
      'Výstupní velikost může být větší než původní.';

  @override
  String get clearCompletedBtn => 'Vyčistit Dokončené';

  @override
  String get clearAllBtn => 'Vyčistit Vše';

  @override
  String get stopAllBtn => 'Zastavit Vše';

  @override
  String get startCompressionBtn => 'Spustit Kompresi';

  @override
  String get allDoneLabel => 'Vše Hotovo!';

  @override
  String get openFolderBtn => 'Otevřít Složku';

  @override
  String get totalEtaLabel => 'Zbývající Čas';

  @override
  String get totalSavedLabel => 'Celkově Ušetřeno';

  @override
  String get videoSingle => 'video';

  @override
  String get videosPlural => 'videa';

  @override
  String get releaseToAddVideosMsg => 'Pusťte pro přidání videí';

  @override
  String get dragDropHereMsg => 'Sem přetáhněte soubory nebo složky';

  @override
  String get supportedFormatsMsg => 'Podporuje MP4, MKV, MOV, AVI, WMV';

  @override
  String get selectFilesBtn => 'Vybrat Soubory';

  @override
  String get selectFolderBtn => 'Vybrat Složku';

  @override
  String get releaseToShrinkTitle => 'Pusťte pro kompresi';

  @override
  String get filesWillBeAddedDesc => 'Vaše soubory budou přidány do fronty.';

  @override
  String get disabledLabel => 'Vypnuto';

  @override
  String get compressionInProgressTitle => 'Probíhá Komprese';

  @override
  String get confirmCloseDesc => 'Opravdu chcete zavřít Shrinkeo?';

  @override
  String get keepCompressingBtn => 'Pokračovat v Kompresi';

  @override
  String get closeAppBtn => 'Zavřít Aplikaci';

  @override
  String get lockedSettingsWarning => 'Uzamčeno během komprese';

  @override
  String get updateRequiredTitle => 'Vyžadována Aktualizace';

  @override
  String get updateRequiredDescNewVersion => 'Je k dispozici nová verze.';

  @override
  String get updateRequiredDescOldVersion => 'Vaše verze již není podporována.';

  @override
  String get updateNowBtn => 'Aktualizovat Nyní';

  @override
  String get laterBtn => 'Později';

  @override
  String get updateAvailableTitle => 'Dostupná Aktualizace';

  @override
  String get whatsNewTitle => 'Co je nového:';

  @override
  String get exitAppBtn => 'Ukončit';

  @override
  String get retryBtn => 'Zkusit znovu';

  @override
  String get downloadFromWebsiteBtn => 'Stáhnout z Webu';

  @override
  String get skipUpdateConfirmTitle => 'Preskočit aktualizaci?';

  @override
  String get skipUpdateConfirmDesc =>
      'Tato aktualizace obsahuje důležité opravy.';

  @override
  String get skipUpdateCancelBtn => 'Zrušit';

  @override
  String get skipUpdateConfirmBtn => 'Přeskočit aktualizaci';

  @override
  String get maintenanceTitle => 'Údržba';

  @override
  String get maintenanceDescDefault => 'Shrinkeo právě prochází údržbou.';

  @override
  String versionAvailableMsg(String version) {
    return 'Verze $version je k dispozici.';
  }

  @override
  String get hwEncoderNotSupportedTitle => 'Akcelerace není podporována';

  @override
  String get failedCreateFolderError => 'Vytvoření složky selhalo';

  @override
  String get failedProbeDurationError => 'Zjištění délky selhalo';

  @override
  String get ffmpegNotFoundGlobalError => 'FFmpeg nebyl nalezen.';

  @override
  String get ffmpegMissingError =>
      'FFmpeg nebo FFprobe chybí nebo je poškozen.';

  @override
  String hwFallbackNotificationBody(String encoderLabel) {
    return '$encoderLabel selhal. Přepnuto na CPU.';
  }

  @override
  String get failedDownloadUpdateMsg =>
      'Stažení aktualizace selhalo. Zkuste to znovu.';

  @override
  String customRatioActiveTitle(Object ratio) {
    return 'Vlastní poměr ($ratio)';
  }

  @override
  String customRatioActiveDesc(Object ratio) {
    return 'Plátno s okraji pro vlastní poměr $ratio.';
  }

  @override
  String customAngleActiveTitle(Object angle) {
    return 'Vlastní úhel ($angle°)';
  }

  @override
  String customAngleActiveDesc(Object angle) {
    return 'Otočí video o vlastní úhel $angle°.';
  }

  @override
  String trimActiveDesc(Object end, Object start) {
    return 'Ořízne videoklip mezi $start a $end.';
  }

  @override
  String targetSizeLimitLabel(Object size) {
    return 'Limit $size MB';
  }

  @override
  String get customMbSizeTooltip => 'Zadejte vlastní velikost v MB';

  @override
  String get trimTimeTooltip =>
      'Zadejte čas např. 5 (5s), 1:30 (1m30s), nebo 00:01:30';

  @override
  String get tabImageSuite => 'Sada Obrázků';

  @override
  String get compressionModeTitle => 'Režim Komprese';

  @override
  String get smartAutoLabel => 'Chytré Auto';

  @override
  String get smartAutoDesc =>
      'Automaticky zmenší velikost o ~60-80 % při zachování 100% čistoty. Ideální pro běžné fotky.';

  @override
  String get maxSavingsLabel => 'Max. Úspora';

  @override
  String get maxSavingsDesc =>
      'Silná komprese ušetří až 85-90 % velikosti. Skvělé pro zprávy a přílohy.';

  @override
  String get ultraFidelityLabel => 'Ultra Kvalita';

  @override
  String get ultraFidelityDesc =>
      'Zachová původní kvalitu s minimální kompresí. Ideální pro archivy a tisk.';

  @override
  String get targetImageFormatTitle => 'Cílový Formát Obrázku';

  @override
  String get dimensionResizingTitle => 'Změna Rozměrů';

  @override
  String get exifCameraPrivacyTitle => 'Soukromí EXIF / Fotoaparátu';

  @override
  String get stripGpsCameraInfoLabel => 'Odstranit GPS a Info o Fotoaparátu';

  @override
  String get intentCompressOnly => 'Pouze komprimovat';

  @override
  String get intentCompressOnlyTooltip =>
      'Zaměřte se čistě na zmenšení velikosti souboru (% kvality nebo cílový KB/MB)';

  @override
  String get intentEditConvertOnly => 'Pouze upravit / převést';

  @override
  String get intentEditConvertOnlyTooltip =>
      'Změňte velikost, otočte, ořízněte nebo převeďte formát bez snížení vizuální kvality';

  @override
  String get intentCompressAndEdit => 'Komprimovat a upravovat';

  @override
  String get intentCompressAndEditTooltip =>
      'Plná kontrola: Upravujte, změňte velikost, otáčejte A komprimujte velikost souboru společně';

  @override
  String get imgFmtOriginalLabel => 'Původní formát';

  @override
  String get imgFmtOriginalDesc =>
      'Zachovat původní formát (nejrychlejší, bez konverze).';

  @override
  String get imgFmtPngLabel => 'Obrázek PNG (.png)';

  @override
  String get imgFmtPngDesc => 'Bezztrátový formát PNG s podporou průhlednosti.';

  @override
  String get imgFmtJpgLabel => 'Obrázek JPEG (.jpg)';

  @override
  String get imgFmtJpgDesc =>
      'Standardní komprimovaný formát JPEG pro univerzální kompatibilitu.';

  @override
  String get imgFmtWebpLabel => 'Obrázek WebP (.webp)';

  @override
  String get imgFmtWebpDesc =>
      'Moderní formát WebP nabízející vynikající kompresi a malou velikost.';

  @override
  String get imgFmtAvifLabel => 'Obrázek AVIF (.avif)';

  @override
  String get imgFmtAvifDesc =>
      'Formát AVIF nové generace s mimořádně vysokou účinností komprese.';

  @override
  String get imgResOriginalLabel => 'Původní rozměry';

  @override
  String get imgResOriginalDesc =>
      'Zachovejte původní rozměry šířky a výšky obrázku.';

  @override
  String get imgRes4kLabel => '4K Max (3840 pixelů)';

  @override
  String get imgRes4kDesc =>
      'Zmenšit maximální rozměr obrázku na 3840 pixelů (max. 4K).';

  @override
  String get imgRes1080pLabel => 'Full HD Max (1920 px)';

  @override
  String get imgRes1080pDesc =>
      'Zmenšit maximální rozměr obrázku na 1920 pixelů (max. Full HD).';

  @override
  String get imgRes720pLabel => 'HD Max (1280px)';

  @override
  String get imgRes720pDesc =>
      'Zmenšit maximální rozměr obrázku na 1280 pixelů (HD max).';

  @override
  String get imgRes480pLabel => 'SD Max (854px)';

  @override
  String get imgRes480pDesc =>
      'Zmenšit maximální rozměr obrázku na 854 pixelů (SD max.).';

  @override
  String get keepMetadataImageInfoDesc =>
      'Zachovává původní EXIF ​​obrázku a metadata fotoaparátu.';

  @override
  String get cleanNoiseLabel => 'Vyčistit šum';

  @override
  String get outputLargerTooltip =>
      'Výstup bude větší než originál!\nZastavte a obnovte výchozí nastavení.';

  @override
  String get estimatedSizePrefix => 'Odhad:';

  @override
  String get cancelBtnTooltip => 'Zrušit';

  @override
  String get removeBtnTooltip => 'Odstranit';

  @override
  String get selectLanguageTitle => 'Vyberte Jazyk';

  @override
  String get searchLanguageHint => 'Hledat jazyk podle názvu nebo kódu...';

  @override
  String get noLanguagesMatchSearch =>
      'Vašemu vyhledávání neodpovídají žádné jazyky.';

  @override
  String get languageTooltip => 'Jazyk';

  @override
  String get notifyCompressionCompleteTitle => 'Shrinkeo komprese dokončena';

  @override
  String get notifyOutputLargerTitle => 'Výstup větší než originál';

  @override
  String languagesCountLabel(String count) {
    return '$count jazyků';
  }

  @override
  String notifyCompressionCompleteSuccess(String success) {
    return 'Úspěšně zkomprimováno $success videí.';
  }

  @override
  String notifyCompressionCompleteFailed(String failed) {
    return '($failed neúspěšný)';
  }

  @override
  String notifyOutputLargerDesc(String fileName) {
    return 'Očekává se, že $fileName bude větší než původní velikost souboru. Zvažte zrušení a resetování nastavení na výchozí.';
  }
}
