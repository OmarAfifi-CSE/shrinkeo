// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Swedish (`sv`).
class AppLocalizationsSv extends AppLocalizations {
  AppLocalizationsSv([String locale = 'sv']) : super(locale);

  @override
  String get appName => 'Shrinkeo';

  @override
  String get totalSpaceSaved => 'Totalt sparat utrymme';

  @override
  String get savedSpacePrefix => 'Sparat:';

  @override
  String get supportButtonText => 'Stöd projektet';

  @override
  String get lightThemeTooltip => 'Ljust tema';

  @override
  String get darkThemeTooltip => 'Mörkt tema';

  @override
  String get settingsTooltip => 'Inställningar';

  @override
  String get minimizeTooltip => 'Minimera';

  @override
  String get closeTooltip => 'Stäng';

  @override
  String get restoreTooltip => 'Återställ';

  @override
  String get maximizeTooltip => 'Maximera';

  @override
  String get tabCompressionQuality => 'Komprimering & Kvalitet';

  @override
  String get tabVideoEditingTools => 'Redigering & Verktyg';

  @override
  String get tabAudioSettings => 'Ljudinställningar';

  @override
  String get tabEngineOutput => 'Motor & Mapp';

  @override
  String get compressionSettingsTitle => 'Komprimeringsinställningar';

  @override
  String get resetToDefaults => 'Återställ standard';

  @override
  String get resetDefaultTooltip => 'Återställ till ursprungliga värden';

  @override
  String get modeTargetSizeTitle => 'Komprimeringsläge';

  @override
  String get modeCrfLabel => 'Kvalitet (CRF)';

  @override
  String get modeTargetSizeLabel => 'Målstorlek (MB)';

  @override
  String get crfQualityTitle => 'CRF Kvalitetsfaktor';

  @override
  String get crfLossless => 'Förlustfri';

  @override
  String get crfHighQuality => 'Hög kvalitet';

  @override
  String get crfBalanced => 'Balanserad';

  @override
  String get crfHighCompression => 'Hög kompression';

  @override
  String get crfLowQuality => 'Låg kvalitet';

  @override
  String get crfUltraCompressed => 'Ultrakomprimerad';

  @override
  String get targetSizeLabel => 'Målfilstorlek (MB)';

  @override
  String get targetSizeDesc =>
      'Beräknar bithastighet för att rymmas inom gränsen.';

  @override
  String get encodingSpeedTitle => 'Kodningshastighet';

  @override
  String get presetUltrafastLabel => 'Ultra snabb';

  @override
  String get presetUltrafastDesc =>
      'Maximal hastighet, men minst storleksminskning.';

  @override
  String get presetSuperfastLabel => 'Super snabb';

  @override
  String get presetSuperfastDesc => 'Mycket snabb kodning.';

  @override
  String get presetVeryfastLabel => 'Mycket snabb';

  @override
  String get presetVeryfastDesc => 'Snabbare än genomsnittet.';

  @override
  String get presetFasterLabel => 'Snabbare';

  @override
  String get presetFasterDesc => 'Bra hastighet och hög komprimering.';

  @override
  String get presetFastLabel => 'Snabb';

  @override
  String get presetFastDesc => 'Bästa balansen mellan hastighet och storlek.';

  @override
  String get presetMediumLabel => 'Medium';

  @override
  String get presetMediumDesc => 'Standardbalans.';

  @override
  String get presetSlowLabel => 'Långsam';

  @override
  String get presetSlowDesc => 'Långsammare, men avsevärd storleksminskning.';

  @override
  String get presetVeryslowLabel => 'Mycket långsam';

  @override
  String get presetVeryslowDesc => 'Maximal storleksminskning.';

  @override
  String get videoCodecTitle => 'Videokodek';

  @override
  String get codecH264Label => 'H.264';

  @override
  String get codecH264Desc => 'Maximal kompatibilitet.';

  @override
  String get codecH265Label => 'H.265 / HEVC';

  @override
  String get codecH265Desc => 'Bättre komprimeringseffektivitet.';

  @override
  String get codecAv1Label => 'AV1';

  @override
  String get codecAv1Desc => 'Nästa generations kodek (30% mindre än H.265).';

  @override
  String get hardwareEncoderTitle => 'Hårdvaruaccelerering (GPU)';

  @override
  String get hwSoftwareLabel => 'Mjukvara (CPU)';

  @override
  String get hwSoftwareDesc => 'Långsammast, men bäst kompatibilitet.';

  @override
  String get hwNvidiaLabel => 'Nvidia (NVENC)';

  @override
  String get hwNvidiaDesc => 'Snabb kodning för Nvidia GPU.';

  @override
  String get hwAmdLabel => 'AMD (AMF)';

  @override
  String get hwAmdDesc => 'Snabb kodning för AMD GPU.';

  @override
  String get hwIntelLabel => 'Intel (QSV)';

  @override
  String get hwIntelDesc => 'Snabb kodning för Intel GPU.';

  @override
  String get resolutionTitle => 'Maximal Upplösning';

  @override
  String get resOriginalLabel => 'Original';

  @override
  String get resOriginalDesc => 'Behåll originalupplösning.';

  @override
  String get res4kLabel => '4K';

  @override
  String get res4kDesc => 'Minska till max 4K.';

  @override
  String get res2kLabel => '2K';

  @override
  String get res2kDesc => 'Minska till max 2K.';

  @override
  String get res1080pLabel => '1080p';

  @override
  String get res1080pDesc => 'Minska till max 1080p Full HD.';

  @override
  String get res720pLabel => '720p';

  @override
  String get res720pDesc => 'Minska till max 720p HD.';

  @override
  String get res480pLabel => '480p';

  @override
  String get res480pDesc => 'Minska till 480p.';

  @override
  String get res360pLabel => '360p';

  @override
  String get res360pDesc => 'Maximal komprimering.';

  @override
  String get frameRateTitle => 'Bildhastighet (FPS)';

  @override
  String get fpsOriginalLabel => 'Original';

  @override
  String get fpsOriginalDesc => 'Samma FPS som källan.';

  @override
  String get fps60Label => '60 fps';

  @override
  String get fps60Desc => 'Jämnt för spel eller sport.';

  @override
  String get fps30Label => '30 fps';

  @override
  String get fps30Desc => 'Standard för de flesta videor.';

  @override
  String get fps24Label => '24 fps';

  @override
  String get fps24Desc => 'Biografstil.';

  @override
  String get enableVideoDenoiseTitle => 'Ta bort Brus i Video';

  @override
  String get enableVideoDenoiseDesc => '3D-filter för att minska brus.';

  @override
  String get exportFormatTitle => 'Exportformat';

  @override
  String get exportVideoLabel => 'Standardvideo';

  @override
  String get exportVideoDesc => 'Exportera till MP4/MKV/MOV';

  @override
  String get exportGifLabel => 'Animerad GIF';

  @override
  String get exportGifDesc => 'Skapa högkvalitativ animerad GIF';

  @override
  String get exportMp3Label => 'Extrahera MP3';

  @override
  String get exportMp3Desc => 'Extrahera ljud till MP3 320kbps';

  @override
  String get exportAacLabel => 'Extrahera AAC';

  @override
  String get exportAacDesc => 'Extrahera ljud till AAC';

  @override
  String get exportWavLabel => 'Extrahera WAV';

  @override
  String get exportWavDesc => 'Extrahera okomprimerat WAV-ljud';

  @override
  String get privacyScrubbingTitle => 'Integritet & GPS';

  @override
  String get keepMetadataLabel => 'Behåll Data';

  @override
  String get stripGpsExifLabel => 'Ta bort GPS/EXIF';

  @override
  String get stripGpsExifInfoTitle => 'Rensa Metadata';

  @override
  String get stripGpsExifInfoDesc => 'Tar bort kamerainfo och GPS-position.';

  @override
  String get keepMetadataInfoDesc => 'Behåller all originaldata.';

  @override
  String get autoCropBlackBarsTitle => 'Beskär Svarta Kanter Automatiskt';

  @override
  String get autoCropLabel => 'Auto Beskär';

  @override
  String get autoCropActiveTitle => 'Auto Beskärning Aktiv';

  @override
  String get autoCropActiveDesc => 'Tar automatiskt bort svarta kanter.';

  @override
  String get autoCropDisabledDesc => 'Behåller originalkanter.';

  @override
  String get playbackSpeedTitle => 'Uppspelningshastighet';

  @override
  String get speedOriginalLabel => '1.0x';

  @override
  String get speedOriginalDesc => 'Normal hastighet';

  @override
  String get speedSlow05Label => '0.5x Långsam';

  @override
  String get speedSlow05Desc => 'Spela upp med halv hastighet';

  @override
  String get speedFast15Label => '1.5x';

  @override
  String get speedFast15Desc => '1.5 gånger snabbare';

  @override
  String get speedFast20Label => '2.0x Snabb';

  @override
  String get speedFast20Desc => 'Dubbel hastighet';

  @override
  String get speedTimelapse40Label => '4.0x Timelapse';

  @override
  String get speedTimelapse40Desc => '4x hastighet för timelapse';

  @override
  String get canvasAspectRatioTitle => 'Bildförhållande';

  @override
  String get aspectOriginalLabel => 'Original';

  @override
  String get aspectOriginalDesc => 'Behåll originalförhållande';

  @override
  String get aspectShortsLabel => '9:16 Shorts';

  @override
  String get aspectShortsDesc => 'För TikTok och Reels';

  @override
  String get aspectSquareLabel => '1:1 Kvadrat';

  @override
  String get aspectSquareDesc => 'För Instagram-inlägg';

  @override
  String get aspectPortraitLabel => '4:5 Porträtt';

  @override
  String get aspectPortraitDesc => 'För vertikalt Instagram';

  @override
  String get aspectWidescreenLabel => '16:9 Bredbild';

  @override
  String get aspectWidescreenDesc => 'För YouTube och TV';

  @override
  String get aspectClassicLabel => '4:3 Klassisk';

  @override
  String get aspectClassicDesc => 'För klassiska skärmar';

  @override
  String get aspectCinemaLabel => '21:9 Bio';

  @override
  String get aspectCinemaDesc => 'För ultrawide-skärmar';

  @override
  String get aspectCustomLabel => 'Anpassat';

  @override
  String get aspectCustomDesc => 'Anpassat bildförhållande';

  @override
  String get customRatioTooltip => 'T.ex: 16:10, 2:1';

  @override
  String get rotationFlipTitle => 'Roteration & Spegling';

  @override
  String get rotOriginalLabel => 'Original (0°)';

  @override
  String get rotOriginalDesc => 'Behåll riktning';

  @override
  String get rot90Label => '90° Höger';

  @override
  String get rot90Desc => 'Rotera 90 grader medsols';

  @override
  String get rot180Label => '180° Upp och Ner';

  @override
  String get rot180Desc => 'Rotera upp och ner';

  @override
  String get rot270Label => '270° Vänster';

  @override
  String get rot270Desc => 'Rotera 90 grader motsols';

  @override
  String get rotFlipHLabel => 'Spegla Horis.';

  @override
  String get rotFlipHDesc => 'Spegla horisontellt';

  @override
  String get rotFlipVLabel => 'Spegla Vert.';

  @override
  String get rotFlipVDesc => 'Spegla vertikalt';

  @override
  String get rotCustomLabel => 'Anpassad Vinkel';

  @override
  String get rotCustomDesc => 'Rotera med specifik vinkel';

  @override
  String get customRotationTooltip => 'Vinkel i grader t.ex. 45';

  @override
  String get trimVideoTitle => 'Klipp Video';

  @override
  String get fullVideoLabel => 'Hela Videon';

  @override
  String get cutClipLabel => 'Klipp Klipp';

  @override
  String get trimStartLabel => 'Start';

  @override
  String get trimEndLabel => 'Slut';

  @override
  String get trimActiveTitle => 'Klippning Aktiv';

  @override
  String get fullVideoDesc => 'Behandla hela videon utan att klippa.';

  @override
  String get audioModeTitle => 'Ljudspårsläge';

  @override
  String get audioOriginalLabel => 'Original';

  @override
  String get audioOriginalDesc => 'Ingen förlust av ljudkvalitet.';

  @override
  String get audioAac256Label => 'Hög Kvalitet';

  @override
  String get audioAac256Desc => 'AAC 256kbps';

  @override
  String get audioAac128Label => 'Balanserad';

  @override
  String get audioAac128Desc => 'AAC 128kbps (Webbstandard)';

  @override
  String get audioAac64Label => 'Låg Kvalitet';

  @override
  String get audioAac64Desc => 'AAC 64kbps för tal';

  @override
  String get audioMuteLabel => 'Ljud Av';

  @override
  String get audioMuteDesc => 'Ta bort ljudspåret helt.';

  @override
  String get audioNormTitle => 'Volymnormalisering';

  @override
  String get audioNormOffLabel => 'Av';

  @override
  String get audioNormOffDesc => 'Originaldynamik.';

  @override
  String get audioNormSpeechLabel => 'Tal';

  @override
  String get audioNormSpeechDesc => 'EBU R128 för tydligt tal.';

  @override
  String get audioNormDynamicLabel => 'Bio Dynamisk';

  @override
  String get audioNormDynamicDesc => 'Utjämnar svaga och starka ljud.';

  @override
  String get audioNormBoostLabel => 'Lätt Förstärkning';

  @override
  String get audioNormBoostDesc => '+3dB volymförstärkning.';

  @override
  String get audioChanTitle => 'Ljudkanaler';

  @override
  String get audioChanOriginalLabel => 'Original';

  @override
  String get audioChanOriginalDesc => 'Behåll källkanaler.';

  @override
  String get audioChanStereoLabel => 'Stereo (2.0)';

  @override
  String get audioChanStereoDesc => '2-kanals stereo.';

  @override
  String get audioChanMonoLabel => 'Mono (1.0)';

  @override
  String get audioChanMonoDesc => 'Enkel kanal - 50% ljudbesparing.';

  @override
  String get removeNoiseLabel => 'Ta bort Brus';

  @override
  String get enableAudioDenoiseTitle => 'Ta bort Mikrofonbrus';

  @override
  String get enableAudioDenoiseDesc => 'Filter för bakgrundsbrus.';

  @override
  String get outputDirectoryTitle => 'Utdatamapp';

  @override
  String get defaultOutputDirectory => 'Standard (Bredvid originalfilen)';

  @override
  String get selectOutputFolderTitle => 'Välj Mapp';

  @override
  String get clearOutputFolder => 'Använd standardplats';

  @override
  String get changeBtn => 'Ändra';

  @override
  String get outputLocationTitle => 'Utdatabeteende';

  @override
  String get outputLocationUnifiedLabel => 'En Enskild Mapp';

  @override
  String get outputLocationUnifiedDesc => 'Alla komprimerade videor i en mapp.';

  @override
  String get outputLocationSameLabel => 'Bredvid Original';

  @override
  String get outputLocationSameDesc => 'Varje video bredvid sin källfil.';

  @override
  String get fileManagementTitle => 'Filhantering';

  @override
  String get keepOriginalsLabel => 'Behåll Original';

  @override
  String get keepOriginalsDesc => 'Lämna originalfilerna orörda.';

  @override
  String get toRecycleBinLabel => 'Till Papperskorgen';

  @override
  String get toRecycleBinDesc =>
      'Flytta original till papperskorgen efter komprimering.';

  @override
  String get outputFormatTitle => 'Behållarformat';

  @override
  String get formatOriginalLabel => 'Original';

  @override
  String get formatOriginalDesc => 'Behåll originalformat.';

  @override
  String get formatMp4Label => 'MP4';

  @override
  String get formatMp4Desc => 'Maximal kompatibilitet.';

  @override
  String get formatMkvLabel => 'MKV';

  @override
  String get formatMkvDesc => 'Stöd för flera spår.';

  @override
  String get formatMovLabel => 'MOV';

  @override
  String get formatMovDesc => 'Apple QuickTime-format.';

  @override
  String get scanningFilesMsg => 'Skannar filer...';

  @override
  String get addFilesBtn => 'Lägg till Filer';

  @override
  String get addFolderBtn => 'Lägg till Mapp';

  @override
  String get dragDropMoreMsg => 'Eller dra & släpp fler videor här';

  @override
  String get openOutputFolderTooltip => 'Öppna Utdatamapp';

  @override
  String get statusQueued => 'I kö';

  @override
  String get statusAnalyzing => 'Analyserar';

  @override
  String get statusCompressing => 'Komprimerar';

  @override
  String get statusDone => 'Klar';

  @override
  String get statusFailed => 'Misslyckades';

  @override
  String get statusCancelled => 'Avbruten';

  @override
  String get savedPrefix => 'Sparat';

  @override
  String get largerSuffix => 'Större';

  @override
  String get largerSizeWarning =>
      'Utdatastorleken kan bli större än originalet.';

  @override
  String get clearCompletedBtn => 'Rensa Klara';

  @override
  String get clearAllBtn => 'Rensa Alla';

  @override
  String get stopAllBtn => 'Stoppa Alla';

  @override
  String get startCompressionBtn => 'Starta Komprimering';

  @override
  String get allDoneLabel => 'Allt Klart!';

  @override
  String get openFolderBtn => 'Öppna Mapp';

  @override
  String get totalEtaLabel => 'Återstående Tid';

  @override
  String get totalSavedLabel => 'Totalt Sparat';

  @override
  String get videoSingle => 'video';

  @override
  String get videosPlural => 'videor';

  @override
  String get releaseToAddVideosMsg => 'Släpp för att lägga till videor';

  @override
  String get dragDropHereMsg => 'Dra & släpp filer eller mappar här';

  @override
  String get supportedFormatsMsg => 'Stöder MP4, MKV, MOV, AVI, WMV';

  @override
  String get selectFilesBtn => 'Välj Filer';

  @override
  String get selectFolderBtn => 'Välj Mapp';

  @override
  String get releaseToShrinkTitle => 'Släpp för att komprimera';

  @override
  String get filesWillBeAddedDesc => 'Dina filer kommer att läggas till i kön.';

  @override
  String get disabledLabel => 'Inaktiverad';

  @override
  String get compressionInProgressTitle => 'Komprimering Pågår';

  @override
  String get confirmCloseDesc => 'Är du säker på att du vill stänga Shrinkeo?';

  @override
  String get keepCompressingBtn => 'Fortsätt Komprimera';

  @override
  String get closeAppBtn => 'Stäng Appen';

  @override
  String get lockedSettingsWarning => 'Låst under komprimering';

  @override
  String get updateRequiredTitle => 'Uppdatering Krävs';

  @override
  String get updateRequiredDescNewVersion => 'En ny version finns tillgänglig.';

  @override
  String get updateRequiredDescOldVersion => 'Din version stöds inte längre.';

  @override
  String get updateNowBtn => 'Uppdatera Nu';

  @override
  String get laterBtn => 'Senare';

  @override
  String get updateAvailableTitle => 'Uppdatering Tillgänglig';

  @override
  String get whatsNewTitle => 'Vad är nytt:';

  @override
  String get exitAppBtn => 'Avsluta';

  @override
  String get retryBtn => 'Försök igen';

  @override
  String get downloadFromWebsiteBtn => 'Ladda ner från webbplatsen';

  @override
  String get skipUpdateConfirmTitle => 'Hoppa över uppdateringen?';

  @override
  String get skipUpdateConfirmDesc =>
      'Denna uppdatering innehåller viktiga korrigeringar.';

  @override
  String get skipUpdateCancelBtn => 'Avbryt';

  @override
  String get skipUpdateConfirmBtn => 'Hoppa över uppdateringen';

  @override
  String get maintenanceTitle => 'Underhåll';

  @override
  String get maintenanceDescDefault =>
      'Shrinkeo genomgår för närvarande underhåll.';

  @override
  String versionAvailableMsg(String version) {
    return 'Version $version finns tillgänglig.';
  }

  @override
  String get hwEncoderNotSupportedTitle => 'Hårdvaruaccelerering stöds inte';

  @override
  String get failedCreateFolderError => 'Kunde inte skapa utdatamapp';

  @override
  String get failedProbeDurationError => 'Kunde inte läsa av längd';

  @override
  String get ffmpegNotFoundGlobalError => 'FFmpeg hittades inte.';

  @override
  String get ffmpegMissingError =>
      'FFmpeg eller FFprobe saknas eller är skadad.';

  @override
  String hwFallbackNotificationBody(String encoderLabel) {
    return '$encoderLabel misslyckades. Växlade till CPU.';
  }

  @override
  String get failedDownloadUpdateMsg =>
      'Laddning av uppdatering misslyckades. Försök igen.';

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
  String get tabImageSuite => 'Bildverktyg';

  @override
  String get compressionModeTitle => 'Komprimeringsläge';

  @override
  String get smartAutoLabel => 'Smart Auto';

  @override
  String get smartAutoDesc =>
      'Minskar automatisk filstorleken med ~60-80% med perfekt skärpa. Perfekt för vardagsfoton.';

  @override
  String get maxSavingsLabel => 'Max Sparande';

  @override
  String get maxSavingsDesc =>
      'Stark komprimering sparar upp till 85-90% av storleken. Perfekt för snabbmeddelanden och e-post.';

  @override
  String get ultraFidelityLabel => 'Ultra Kvalitet';

  @override
  String get ultraFidelityDesc =>
      'Bevarar originalkvaliteten med minimal komprimering. Idealisk för arkivering och utskrift.';

  @override
  String get targetImageFormatTitle => 'Mål-Bildformat';

  @override
  String get dimensionResizingTitle => 'Storleksändring';

  @override
  String get exifCameraPrivacyTitle => 'EXIF- / Kameraintegritet';

  @override
  String get stripGpsCameraInfoLabel => 'Ta bort GPS- & Kamerainfo';

  @override
  String get intentCompressOnly => 'Komprimera endast';

  @override
  String get intentCompressOnlyTooltip =>
      'Fokusera enbart på att minska filstorleken (Kvalitet % eller Mål KB/MB)';

  @override
  String get intentEditConvertOnly => 'Endast redigera/konvertera';

  @override
  String get intentEditConvertOnlyTooltip =>
      'Ändra storlek, rotera, trimma eller konvertera format utan att minska den visuella kvaliteten';

  @override
  String get intentCompressAndEdit => 'Komprimera och redigera';

  @override
  String get intentCompressAndEditTooltip =>
      'Full kontroll: Redigera, ändra storlek, rotera OCH komprimera filstorleken tillsammans';
}
