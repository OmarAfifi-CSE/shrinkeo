// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Slovak (`sk`).
class AppLocalizationsSk extends AppLocalizations {
  AppLocalizationsSk([String locale = 'sk']) : super(locale);

  @override
  String get appName => 'Shrinkeo';

  @override
  String get totalSpaceSaved => 'Celkový ušetrený priestor';

  @override
  String get savedSpacePrefix => 'Ušetrené:';

  @override
  String get supportButtonText => 'Kúp mi kávu';

  @override
  String get lightThemeTooltip => 'Svetlý motív';

  @override
  String get darkThemeTooltip => 'Tmavý motív';

  @override
  String get settingsTooltip => 'Nastavenia';

  @override
  String get minimizeTooltip => 'Minimalizovať';

  @override
  String get closeTooltip => 'Zatvoriť';

  @override
  String get restoreTooltip => 'Obnoviť';

  @override
  String get maximizeTooltip => 'Maximalizovať';

  @override
  String get tabCompressionQuality => 'Kompresia a Kvalita';

  @override
  String get tabVideoEditingTools => 'Úprava Videa a Nástroje';

  @override
  String get tabAudioSettings => 'Nastavenia Zvuku';

  @override
  String get tabEngineOutput => 'Motor a Výstupná Zložka';

  @override
  String get compressionSettingsTitle => 'Nastavenia Kompresie';

  @override
  String get resetToDefaults => 'Obnoviť predvolené';

  @override
  String get resetDefaultTooltip => 'Vrátiť na pôvodné hodnoty';

  @override
  String get modeTargetSizeTitle => 'Režim Cieľa Kompresie';

  @override
  String get modeCrfLabel => 'Kvalita (CRF)';

  @override
  String get modeTargetSizeLabel => 'Cieľová Veľkosť (MB)';

  @override
  String get crfQualityTitle => 'Faktor Kvality CRF';

  @override
  String get targetSizeLabel => 'Cieľová Veľkosť Súboru (MB)';

  @override
  String get targetSizeDesc => 'Vypočíta dátový tok, aby sa zmestil do limitu.';

  @override
  String get encodingSpeedTitle => 'Rýchlosť Kódovania';

  @override
  String get presetUltrafastLabel => 'Ultrarýchly';

  @override
  String get presetUltrafastDesc =>
      'Maximálna rýchlosť, ale najmenšie zmenšenie veľkosti.';

  @override
  String get presetSuperfastLabel => 'Super rýchly';

  @override
  String get presetSuperfastDesc => 'Veľmi rýchle kódovanie.';

  @override
  String get presetVeryfastLabel => 'Veľmi rýchly';

  @override
  String get presetVeryfastDesc => 'Rýchlejší ako priemer.';

  @override
  String get presetFasterLabel => 'Rýchlejší';

  @override
  String get presetFasterDesc => 'Dobrá rýchlosť a vysoká kompresia.';

  @override
  String get presetFastLabel => 'Rýchly (Odporúčané)';

  @override
  String get presetFastDesc => 'Najlepšia rovnováha rýchlosti a veľkosti.';

  @override
  String get presetMediumLabel => 'Stredný';

  @override
  String get presetMediumDesc => 'Predvolená rovnováha.';

  @override
  String get presetSlowLabel => 'Pomalý';

  @override
  String get presetSlowDesc => 'Pomalší, ale výrazne menšie súbory.';

  @override
  String get presetVeryslowLabel => 'Veľmi pomalý';

  @override
  String get presetVeryslowDesc => 'Maximálne zmenšenie veľkosti.';

  @override
  String get videoCodecTitle => 'Video Kodek';

  @override
  String get codecH264Label => 'H.264';

  @override
  String get codecH264Desc =>
      'Maximálna kompatibilita so staršími zariadeniami.';

  @override
  String get codecH265Label => 'H.265 / HEVC';

  @override
  String get codecH265Desc => 'Lepšia efektivita kompresie.';

  @override
  String get codecAv1Label => 'AV1';

  @override
  String get codecAv1Desc => 'Kodek novej generácie (o 30% menší ako H.265).';

  @override
  String get hardwareEncoderTitle => 'Hardvérová Akcelerácia (GPU)';

  @override
  String get hwSoftwareLabel => 'Softvérový (CPU)';

  @override
  String get hwSoftwareDesc => 'Najpomalší, ale najvyššia kompatibilita.';

  @override
  String get hwNvidiaLabel => 'Nvidia (NVENC)';

  @override
  String get hwNvidiaDesc => 'Veľmi rýchle kódovanie pre Nvidia GPU.';

  @override
  String get hwAmdLabel => 'AMD (AMF)';

  @override
  String get hwAmdDesc => 'Veľmi rýchle kódovanie pre AMD GPU.';

  @override
  String get hwIntelLabel => 'Intel (QSV)';

  @override
  String get hwIntelDesc => 'Veľmi rýchle kódovanie pre Intel GPU.';

  @override
  String get resolutionTitle => 'Maximálne Rozlíšenie';

  @override
  String get resOriginalLabel => 'Pôvodné';

  @override
  String get resOriginalDesc => 'Zachovať pôvodné rozlíšenie.';

  @override
  String get res4kLabel => '4K';

  @override
  String get res4kDesc => 'Zmenšiť maximálne na 4K.';

  @override
  String get res2kLabel => '2K';

  @override
  String get res2kDesc => 'Zmenšiť maximálne na 2K.';

  @override
  String get res1080pLabel => '1080p';

  @override
  String get res1080pDesc => 'Zmenšiť maximálne na 1080p Full HD.';

  @override
  String get res720pLabel => '720p';

  @override
  String get res720pDesc => 'Zmenšiť maximálne na 720p HD.';

  @override
  String get res480pLabel => '480p';

  @override
  String get res480pDesc => 'Zmenšiť na 480p.';

  @override
  String get res360pLabel => '360p';

  @override
  String get res360pDesc => 'Maximálna kompresia.';

  @override
  String get frameRateTitle => 'Snímková Frekvencia (FPS)';

  @override
  String get fpsOriginalLabel => 'Pôvodná';

  @override
  String get fpsOriginalDesc => 'Rovnaké FPS ako zdroj.';

  @override
  String get fps60Label => '60 fps';

  @override
  String get fps60Desc => 'Plynulé pre hry alebo šport.';

  @override
  String get fps30Label => '30 fps';

  @override
  String get fps30Desc => 'Štandard pre väčšinu videí.';

  @override
  String get fps24Label => '24 fps';

  @override
  String get fps24Desc => 'Filmový štýl.';

  @override
  String get enableVideoDenoiseTitle => 'Čistenie Šumu Videa';

  @override
  String get enableVideoDenoiseDesc => '3D filter na redukciu zrna a šumu.';

  @override
  String get exportFormatTitle => 'Format Exportu';

  @override
  String get exportVideoLabel => 'Štandardné Video';

  @override
  String get exportVideoDesc => 'Exportovať ako MP4/MKV/MOV';

  @override
  String get exportGifLabel => 'Animovaný GIF';

  @override
  String get exportGifDesc => 'Vytvoriť kvalitný animovaný GIF';

  @override
  String get exportMp3Label => 'Extrahovať MP3';

  @override
  String get exportMp3Desc => 'Extrahovať zvuk ako MP3 320kbps';

  @override
  String get exportAacLabel => 'Extrahovať AAC';

  @override
  String get exportAacDesc => 'Extrahovať zvuk ako AAC';

  @override
  String get exportWavLabel => 'Extrahovať WAV';

  @override
  String get exportWavDesc => 'Extrahovať nekomprimovaný zvuk WAV';

  @override
  String get privacyScrubbingTitle => 'Súkromie a GPS';

  @override
  String get keepMetadataLabel => 'Ponechať Údaje';

  @override
  String get stripGpsExifLabel => 'Odstrániť GPS/EXIF';

  @override
  String get stripGpsExifInfoTitle => 'Vyčistiť Metadáta';

  @override
  String get stripGpsExifInfoDesc =>
      'Odstráni informácie o fotoaparáte a GPS polohu.';

  @override
  String get keepMetadataInfoDesc => 'Zachová všetky pôvodné metadáta.';

  @override
  String get autoCropBlackBarsTitle => 'Automatické Orezanie Čiernych Pruhov';

  @override
  String get autoCropLabel => 'Auto Orezanie';

  @override
  String get autoCropActiveTitle => 'Auto Orezanie Aktívne';

  @override
  String get autoCropActiveDesc => 'Automaticky odstraňuje čierne pruhy.';

  @override
  String get autoCropDisabledDesc => 'Zachováva pôvodné okraje.';

  @override
  String get playbackSpeedTitle => 'Rýchlosť Prehrávania';

  @override
  String get speedOriginalLabel => '1.0x';

  @override
  String get speedOriginalDesc => 'Normálna rýchlosť';

  @override
  String get speedSlow05Label => '0.5x Pomalé';

  @override
  String get speedSlow05Desc => 'Prehrávať polovičnou rýchlosťou';

  @override
  String get speedFast15Label => '1.5x';

  @override
  String get speedFast15Desc => '1.5-krát rýchlejšie';

  @override
  String get speedFast20Label => '2.0x Rýchle';

  @override
  String get speedFast20Desc => 'Dvojnásobná rýchlosť';

  @override
  String get speedTimelapse40Label => '4.0x Časozber';

  @override
  String get speedTimelapse40Desc => 'Rýchlosť 4x pre časozber';

  @override
  String get canvasAspectRatioTitle => 'Pomer Strán';

  @override
  String get aspectOriginalLabel => 'Pôvodný';

  @override
  String get aspectOriginalDesc => 'Zachovať pôvodný pomer';

  @override
  String get aspectShortsLabel => '9:16 Shorts';

  @override
  String get aspectShortsDesc => 'Pre TikTok a Reels';

  @override
  String get aspectSquareLabel => '1:1 Štvorec';

  @override
  String get aspectSquareDesc => 'Pre príspevky na Instagrame';

  @override
  String get aspectPortraitLabel => '4:5 Portrét';

  @override
  String get aspectPortraitDesc => 'Pre vertikálny Instagram';

  @override
  String get aspectWidescreenLabel => '16:9 Širokouhlý';

  @override
  String get aspectWidescreenDesc => 'Pre YouTube a TV';

  @override
  String get aspectClassicLabel => '4:3 Klasický';

  @override
  String get aspectClassicDesc => 'Pre klasické obrazovky';

  @override
  String get aspectCinemaLabel => '21:9 Kino';

  @override
  String get aspectCinemaDesc => 'Pre ultrawide monitory';

  @override
  String get aspectCustomLabel => 'Vlastný Pomer';

  @override
  String get aspectCustomDesc => 'Vlastný pomer strán';

  @override
  String get customRatioTooltip => 'Napr: 16:10, 2:1';

  @override
  String get rotationFlipTitle => 'Otočenie a Zrkadlenie';

  @override
  String get rotOriginalLabel => 'Pôvodné (0°)';

  @override
  String get rotOriginalDesc => 'Zachovať orientáciu';

  @override
  String get rot90Label => '90° Vpravo';

  @override
  String get rot90Desc => 'Otočiť o 90 stupňov v smere hodinových ručičiek';

  @override
  String get rot180Label => '180° Hore Nohama';

  @override
  String get rot180Desc => 'Otočiť hore nohami';

  @override
  String get rot270Label => '270° Vľavo';

  @override
  String get rot270Desc =>
      'Otočiť o 90 stupňov proti smeru hodinových ručičiek';

  @override
  String get rotFlipHLabel => 'Zrkadliť Horiz.';

  @override
  String get rotFlipHDesc => 'Zrkadliť horizontálne';

  @override
  String get rotFlipVLabel => 'Zrkadliť Vert.';

  @override
  String get rotFlipVDesc => 'Zrkadliť vertikálne';

  @override
  String get rotCustomLabel => 'Vlastný Uhol';

  @override
  String get rotCustomDesc => 'Otočiť o špecifický uhol';

  @override
  String get customRotationTooltip => 'Uhol v stupňoch napr. 45';

  @override
  String get trimVideoTitle => 'Ostrihať Video';

  @override
  String get fullVideoLabel => 'Celé Video';

  @override
  String get cutClipLabel => 'Vystrihnúť Klip';

  @override
  String get trimStartLabel => 'Začiatok';

  @override
  String get trimEndLabel => 'Koniec';

  @override
  String get trimActiveTitle => 'Strihanie Aktívne';

  @override
  String get fullVideoDesc => 'Spracovať celé video bez strihania.';

  @override
  String get audioModeTitle => 'Režim Zvukovej Stopy';

  @override
  String get audioOriginalLabel => 'Pôvodný';

  @override
  String get audioOriginalDesc => 'Bez straty kvality zvuku.';

  @override
  String get audioAac256Label => 'Vysoká Kvalita';

  @override
  String get audioAac256Desc => 'AAC 256kbps';

  @override
  String get audioAac128Label => 'Vyvážený';

  @override
  String get audioAac128Desc => 'AAC 128kbps (Webový štandard)';

  @override
  String get audioAac64Label => 'Nízka Kvalita';

  @override
  String get audioAac64Desc => 'AAC 64kbps pre reč';

  @override
  String get audioMuteLabel => 'Stlmiť Zvuk';

  @override
  String get audioMuteDesc => 'Úplne odstrániť zvukovú stopu.';

  @override
  String get audioNormTitle => 'Normalizácia Hlasitosti';

  @override
  String get audioNormOffLabel => 'Vypnutá';

  @override
  String get audioNormOffDesc => 'Pôvodná dynamika.';

  @override
  String get audioNormSpeechLabel => 'Ľudská Reč';

  @override
  String get audioNormSpeechDesc => 'EBU R128 pre čistý dialóg.';

  @override
  String get audioNormDynamicLabel => 'Kino Dynamika';

  @override
  String get audioNormDynamicDesc => 'Vyrovnáva tiché a hlasné zvuky.';

  @override
  String get audioNormBoostLabel => 'Mierne Zosilnenie';

  @override
  String get audioNormBoostDesc => '+3dB zosilnenie hlasitosti.';

  @override
  String get audioChanTitle => 'Zvukové Kanály';

  @override
  String get audioChanOriginalLabel => 'Pôvodné';

  @override
  String get audioChanOriginalDesc => 'Zachovať zdrojové kanály.';

  @override
  String get audioChanStereoLabel => 'Stereo (2.0)';

  @override
  String get audioChanStereoDesc => 'Compatibilita 2-kanálové stereo.';

  @override
  String get audioChanMonoLabel => 'Mono (1.0)';

  @override
  String get audioChanMonoDesc => 'Jediný kanál - 50% úspora veľkosti zvuku.';

  @override
  String get removeNoiseLabel => 'Odstrániť Šum';

  @override
  String get enableAudioDenoiseTitle => 'Odstrániť Šum Mikrofónu';

  @override
  String get enableAudioDenoiseDesc => 'Filter na odstránenie šumu pozadia.';

  @override
  String get outputDirectoryTitle => 'Výstupná Zložka';

  @override
  String get defaultOutputDirectory => 'Predvolená (Vedľa pôvodného súboru)';

  @override
  String get selectOutputFolderTitle => 'Vybrať Zložku';

  @override
  String get clearOutputFolder => 'Použiť predvolené umiestnenie';

  @override
  String get changeBtn => 'Zmeniť';

  @override
  String get outputLocationTitle => 'Správanie Výstupu';

  @override
  String get outputLocationUnifiedLabel => 'Jedna Zložka';

  @override
  String get outputLocationUnifiedDesc =>
      'Všetky komprimované videá v jednej zložke.';

  @override
  String get outputLocationSameLabel => 'Vedľa Pôvodného';

  @override
  String get outputLocationSameDesc =>
      'Každé video vedľa svojho zdrojového súboru.';

  @override
  String get fileManagementTitle => 'Správa Súborov';

  @override
  String get keepOriginalsLabel => 'Ponechať Pôvodné';

  @override
  String get keepOriginalsDesc => 'Ponechať pôvodné súbory nedotknuté.';

  @override
  String get toRecycleBinLabel => 'Do Koša';

  @override
  String get toRecycleBinDesc =>
      'Presunúť pôvodné súbory do koša po kompresii.';

  @override
  String get outputFormatTitle => 'Formát Kontajnera';

  @override
  String get formatOriginalLabel => 'Pôvodný';

  @override
  String get formatOriginalDesc => 'Zachovať pôvodný formát.';

  @override
  String get formatMp4Label => 'MP4';

  @override
  String get formatMp4Desc => 'Maximálna kompatibilita.';

  @override
  String get formatMkvLabel => 'MKV';

  @override
  String get formatMkvDesc => 'Podpora viacerých stôp.';

  @override
  String get formatMovLabel => 'MOV';

  @override
  String get formatMovDesc => 'Formát Apple QuickTime.';

  @override
  String get scanningFilesMsg => 'Skenovanie súborov...';

  @override
  String get addFilesBtn => 'Pridať Súbory';

  @override
  String get addFolderBtn => 'Pridať Zložku';

  @override
  String get dragDropMoreMsg => 'Alebo presuňte sem ďalšie videá';

  @override
  String get openOutputFolderTooltip => 'Otvoriť Výstupnú Zložku';

  @override
  String get statusQueued => 'V poradí';

  @override
  String get statusAnalyzing => 'Analýza';

  @override
  String get statusCompressing => 'Kompresia';

  @override
  String get statusDone => 'Hotovo';

  @override
  String get statusFailed => 'Zlyhalo';

  @override
  String get statusCancelled => 'Zrušené';

  @override
  String get savedPrefix => 'Ušetrené';

  @override
  String get largerSuffix => 'Väčší';

  @override
  String get largerSizeWarning =>
      'Výstupná veľkosť môže byť väčšia ako pôvodná.';

  @override
  String get clearCompletedBtn => 'Vymazať Dokončené';

  @override
  String get clearAllBtn => 'Vymazať Všetko';

  @override
  String get stopAllBtn => 'Zastaviť Všetko';

  @override
  String get startCompressionBtn => 'Spustiť Kompresiu';

  @override
  String get allDoneLabel => 'Všetko Hotovo!';

  @override
  String get openFolderBtn => 'Otvoriť Zložku';

  @override
  String get totalEtaLabel => 'Zostávajúci Čas';

  @override
  String get totalSavedLabel => 'Celkovo Ušetrené';

  @override
  String get videoSingle => 'video';

  @override
  String get videosPlural => 'videá';

  @override
  String get releaseToAddVideosMsg => 'Pustiť pre pridanie videí';

  @override
  String get dragDropHereMsg => 'Presuňte súbory alebo zložky sem';

  @override
  String get supportedFormatsMsg => 'Podporuje MP4, MKV, MOV, AVI, WMV';

  @override
  String get selectFilesBtn => 'Vybrať Súbory';

  @override
  String get selectFolderBtn => 'Vybrať Zložku';

  @override
  String get releaseToShrinkTitle => 'Pustiť pre okamžitú kompresiu';

  @override
  String get filesWillBeAddedDesc => 'Vaše súbory budú pridané do poradia.';

  @override
  String get disabledLabel => 'Vypnuté';

  @override
  String get compressionInProgressTitle => 'Kompresia Prebieha';

  @override
  String get confirmCloseDesc => 'Naozaj chcete zatvoriť Shrinkeo?';

  @override
  String get keepCompressingBtn => 'Pokračovať v Kompresii';

  @override
  String get closeAppBtn => 'Zatvoriť Aplikáciu';

  @override
  String get lockedSettingsWarning => 'Uzamknuté počas kompresie';

  @override
  String get updateRequiredTitle => 'Vyžaduje sa Aktualizácia';

  @override
  String get updateRequiredDescNewVersion => 'K dispozícii je nová verzia.';

  @override
  String get updateRequiredDescOldVersion =>
      'Vaša verzia už nie je podporovaná.';

  @override
  String get updateNowBtn => 'Aktualizovať Teraz';

  @override
  String get laterBtn => 'Neskôr';

  @override
  String get updateAvailableTitle => 'Aktualizácia k Dispozícii';

  @override
  String get whatsNewTitle => 'Čo je nové:';

  @override
  String get exitAppBtn => 'Ukončiť';

  @override
  String get retryBtn => 'Skúsiť znova';

  @override
  String get downloadFromWebsiteBtn => 'Stiahnuť z Webovej Stránky';

  @override
  String get skipUpdateConfirmTitle => 'Preskočiť aktualizáciu?';

  @override
  String get skipUpdateConfirmDesc =>
      'Táto aktualizácia obsahuje dôležité opravy.';

  @override
  String get skipUpdateCancelBtn => 'Zrušiť';

  @override
  String get skipUpdateConfirmBtn => 'Preskočiť aktualizáciu';

  @override
  String get maintenanceTitle => 'Údržba';

  @override
  String get maintenanceDescDefault => 'Shrinkeo je momentálne v údržbe.';

  @override
  String versionAvailableMsg(String version) {
    return 'Verzia $version je k dispozícii.';
  }

  @override
  String get hwEncoderNotSupportedTitle =>
      'Hardvérová akcelerácia nie je podporovaná';

  @override
  String get failedCreateFolderError =>
      'Nepodarilo sa vytvoriť výstupnú zložku';

  @override
  String get failedProbeDurationError => 'Nepodarilo sa zistiť trvanie';

  @override
  String get ffmpegNotFoundGlobalError => 'FFmpeg nebol nájdený.';

  @override
  String get ffmpegMissingError =>
      'FFmpeg alebo FFprobe chýba alebo je poškodený.';

  @override
  String hwFallbackNotificationBody(String encoderLabel) {
    return '$encoderLabel zlyhal. Prepnuté na CPU.';
  }

  @override
  String get failedDownloadUpdateMsg =>
      'Stiahnutie aktualizácie zlyhalo. Skúste znova.';
}
