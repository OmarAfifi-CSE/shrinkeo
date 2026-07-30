// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Danish (`da`).
class AppLocalizationsDa extends AppLocalizations {
  AppLocalizationsDa([String locale = 'da']) : super(locale);

  @override
  String get appName => 'Shrinkeo';

  @override
  String get totalSpaceSaved => 'Samlet sparet plads';

  @override
  String get savedSpacePrefix => 'Sparet:';

  @override
  String get supportButtonText => 'Støt projektet';

  @override
  String get lightThemeTooltip => 'Lyst tema';

  @override
  String get darkThemeTooltip => 'Mørkt tema';

  @override
  String get settingsTooltip => 'Indstillinger';

  @override
  String get minimizeTooltip => 'Minimer';

  @override
  String get closeTooltip => 'Luk';

  @override
  String get restoreTooltip => 'Gendan';

  @override
  String get maximizeTooltip => 'Maksimer';

  @override
  String get tabCompressionQuality => 'Komprimering & Kvalitet';

  @override
  String get tabVideoEditingTools => 'Redigering & Værktøjer';

  @override
  String get tabAudioSettings => 'Lydindstillinger';

  @override
  String get tabEngineOutput => 'Motor & Mappe';

  @override
  String get compressionSettingsTitle => 'Komprimeringsindstillinger';

  @override
  String get resetToDefaults => 'Nulstil til standard';

  @override
  String get resetDefaultTooltip => 'Nulstil til oprindelige værdier';

  @override
  String get modeTargetSizeTitle => 'Komprimeringsstil';

  @override
  String get modeCrfLabel => 'Kvalitet (CRF)';

  @override
  String get modeTargetSizeLabel => 'Målstørrelse (MB)';

  @override
  String get crfQualityTitle => 'CRF Kvalitetsfaktor';

  @override
  String get crfLossless => 'Tabsfri';

  @override
  String get crfHighQuality => 'Høj kvalitet';

  @override
  String get crfBalanced => 'Balanceret';

  @override
  String get crfHighCompression => 'Høj kompression';

  @override
  String get crfLowQuality => 'Lav kvalitet';

  @override
  String get crfUltraCompressed => 'Ultra komprimeret';

  @override
  String get targetSizeLabel => 'Målfilstørrelse (MB)';

  @override
  String get targetSizeDesc =>
      'Beregner bitrate for at holde sig inden for grænsen.';

  @override
  String get encodingSpeedTitle => 'Kodningshastighed';

  @override
  String get presetUltrafastLabel => 'Ultrahurtig';

  @override
  String get presetUltrafastDesc =>
      'Maksimal hastighed, men mindste besparelse.';

  @override
  String get presetSuperfastLabel => 'Superhurtig';

  @override
  String get presetSuperfastDesc => 'Meget hurtig kodning.';

  @override
  String get presetVeryfastLabel => 'Meget hurtig';

  @override
  String get presetVeryfastDesc => 'Hurtigere end gennemsnittet.';

  @override
  String get presetFasterLabel => 'Hurtigere';

  @override
  String get presetFasterDesc => 'God hastighed og høj komprimering.';

  @override
  String get presetFastLabel => 'Hurtig';

  @override
  String get presetFastDesc => 'Bedste balance mellem hastighed og størrelse.';

  @override
  String get presetMediumLabel => 'Medium';

  @override
  String get presetMediumDesc => 'Standard balance.';

  @override
  String get presetSlowLabel => 'Langsom';

  @override
  String get presetSlowDesc => 'Langsommere, men markant mindre filer.';

  @override
  String get presetVeryslowLabel => 'Meget langsom';

  @override
  String get presetVeryslowDesc => 'Maksimal besparelse.';

  @override
  String get videoCodecTitle => 'Video Codec';

  @override
  String get codecH264Label => 'H.264';

  @override
  String get codecH264Desc => 'Maksimal kompatibilitet.';

  @override
  String get codecH265Label => 'H.265 / HEVC';

  @override
  String get codecH265Desc => 'Bedre komprimeringsatferd.';

  @override
  String get codecAv1Label => 'AV1';

  @override
  String get codecAv1Desc => 'Næste generations codec (30% mindre end H.265).';

  @override
  String get hardwareEncoderTitle => 'Hardware-acceleration (GPU)';

  @override
  String get hwSoftwareLabel => 'Software (CPU)';

  @override
  String get hwSoftwareDesc => 'Langsomst, men bedst kompatibilitet.';

  @override
  String get hwNvidiaLabel => 'Nvidia (NVENC)';

  @override
  String get hwNvidiaDesc => 'Meget hurtig kodning for Nvidia GPU.';

  @override
  String get hwAmdLabel => 'AMD (AMF)';

  @override
  String get hwAmdDesc => 'Meget hurtig kodning for AMD GPU.';

  @override
  String get hwIntelLabel => 'Intel (QSV)';

  @override
  String get hwIntelDesc => 'Meget hurtig kodning for Intel GPU.';

  @override
  String get resolutionTitle => 'Maksimal Opløsning';

  @override
  String get resOriginalLabel => 'Original';

  @override
  String get resOriginalDesc => 'Behold original opløsning.';

  @override
  String get res4kLabel => '4K';

  @override
  String get res4kDesc => 'Reducer til max 4K.';

  @override
  String get res2kLabel => '2K';

  @override
  String get res2kDesc => 'Reducer til max 2K.';

  @override
  String get res1080pLabel => '1080p';

  @override
  String get res1080pDesc => 'Reducer til max 1080p Full HD.';

  @override
  String get res720pLabel => '720p';

  @override
  String get res720pDesc => 'Reducer til max 720p HD.';

  @override
  String get res480pLabel => '480p';

  @override
  String get res480pDesc => 'Reducer til 480p.';

  @override
  String get res360pLabel => '360p';

  @override
  String get res360pDesc => 'Maksimal komprimering.';

  @override
  String get frameRateTitle => 'Billedhastighed (FPS)';

  @override
  String get fpsOriginalLabel => 'Original';

  @override
  String get fpsOriginalDesc => 'Samme FPS som kilde.';

  @override
  String get fps60Label => '60 fps';

  @override
  String get fps60Desc => 'Glidende til spil eller sport.';

  @override
  String get fps30Label => '30 fps';

  @override
  String get fps30Desc => 'Standard for de fleste videoer.';

  @override
  String get fps24Label => '24 fps';

  @override
  String get fps24Desc => 'Biografstil.';

  @override
  String get enableVideoDenoiseTitle => 'Fjern Støj i Video';

  @override
  String get enableVideoDenoiseDesc => '3D-filter til at reducere støj.';

  @override
  String get exportFormatTitle => 'Eksportformat';

  @override
  String get exportVideoLabel => 'Standard Video';

  @override
  String get exportVideoDesc => 'Eksporter til MP4/MKV/MOV';

  @override
  String get exportGifLabel => 'Animeret GIF';

  @override
  String get exportGifDesc => 'Opret animeret GIF i høj kvalitet';

  @override
  String get exportMp3Label => 'Udtræk MP3';

  @override
  String get exportMp3Desc => 'Udtræk lyd som MP3 320kbps';

  @override
  String get exportAacLabel => 'Udtræk AAC';

  @override
  String get exportAacDesc => 'Udtræk lyd som AAC';

  @override
  String get exportWavLabel => 'Udtræk WAV';

  @override
  String get exportWavDesc => 'Udtræk ukomprimeret WAV-lyd';

  @override
  String get privacyScrubbingTitle => 'Privatliv & GPS';

  @override
  String get keepMetadataLabel => 'Behold Data';

  @override
  String get stripGpsExifLabel => 'Slet GPS/EXIF';

  @override
  String get stripGpsExifInfoTitle => 'Rens Metadata';

  @override
  String get stripGpsExifInfoDesc => 'Fjerner kamerainfo og GPS-placering.';

  @override
  String get keepMetadataInfoDesc => 'Beholder al original metadata.';

  @override
  String get autoCropBlackBarsTitle => 'Beskær Sorte Bjælker Automatisk';

  @override
  String get autoCropLabel => 'Auto Beskæring';

  @override
  String get autoCropActiveTitle => 'Auto Beskæring Aktiv';

  @override
  String get autoCropActiveDesc => 'Fjerner automatisk sorte bjælker.';

  @override
  String get autoCropDisabledDesc => 'Beholder originale kanter.';

  @override
  String get playbackSpeedTitle => 'Afspilningshastighed';

  @override
  String get speedOriginalLabel => '1.0x';

  @override
  String get speedOriginalDesc => 'Normal hastighed';

  @override
  String get speedSlow05Label => '0.5x Langsom';

  @override
  String get speedSlow05Desc => 'Afspil med halv hastighed';

  @override
  String get speedFast15Label => '1.5x';

  @override
  String get speedFast15Desc => '1.5 gange hurtigere';

  @override
  String get speedFast20Label => '2.0x Hurtig';

  @override
  String get speedFast20Desc => 'Dobbelt hastighed';

  @override
  String get speedTimelapse40Label => '4.0x Timelapse';

  @override
  String get speedTimelapse40Desc => '4x hastighed for timelapse';

  @override
  String get canvasAspectRatioTitle => 'Størrelsesforhold';

  @override
  String get aspectOriginalLabel => 'Original';

  @override
  String get aspectOriginalDesc => 'Behold originalt forhold';

  @override
  String get aspectShortsLabel => '9:16 Shorts';

  @override
  String get aspectShortsDesc => 'Til TikTok og Reels';

  @override
  String get aspectSquareLabel => '1:1 Firkant';

  @override
  String get aspectSquareDesc => 'Til Instagram-opslag';

  @override
  String get aspectPortraitLabel => '4:5 Portræt';

  @override
  String get aspectPortraitDesc => 'Til vertikal Instagram';

  @override
  String get aspectWidescreenLabel => '16:9 Bredformat';

  @override
  String get aspectWidescreenDesc => 'Til YouTube og TV';

  @override
  String get aspectClassicLabel => '4:3 Klassisk';

  @override
  String get aspectClassicDesc => 'Til klassiske skærme';

  @override
  String get aspectCinemaLabel => '21:9 Biograf';

  @override
  String get aspectCinemaDesc => 'Til ultrawide skærme';

  @override
  String get aspectCustomLabel => 'Tilpasset';

  @override
  String get aspectCustomDesc => 'Tilpasset størrelsesforhold';

  @override
  String get customRatioTooltip => 'F.eks: 16:10, 2:1';

  @override
  String get rotationFlipTitle => 'Rotation & Spejling';

  @override
  String get rotOriginalLabel => 'Original (0°)';

  @override
  String get rotOriginalDesc => 'Behold retning';

  @override
  String get rot90Label => '90° Højre';

  @override
  String get rot90Desc => 'Roter 90 grader med uret';

  @override
  String get rot180Label => '180° På Hovedet';

  @override
  String get rot180Desc => 'Roter på hovedet';

  @override
  String get rot270Label => '270° Venstre';

  @override
  String get rot270Desc => 'Roter 90 grader mod uret';

  @override
  String get rotFlipHLabel => 'Spejl Horisontalt';

  @override
  String get rotFlipHDesc => 'Spejl horisontalt';

  @override
  String get rotFlipVLabel => 'Spejl Vertikalt';

  @override
  String get rotFlipVDesc => 'Spejl vertikalt';

  @override
  String get rotCustomLabel => 'Tilpasset Vinkel';

  @override
  String get rotCustomDesc => 'Roter med specifik vinkel';

  @override
  String get customRotationTooltip => 'Vinkel i grader f.eks. 45';

  @override
  String get trimVideoTitle => 'Klip Video';

  @override
  String get fullVideoLabel => 'Hele Videoen';

  @override
  String get cutClipLabel => 'Klip Klippet';

  @override
  String get trimStartLabel => 'Start';

  @override
  String get trimEndLabel => 'Slut';

  @override
  String get trimActiveTitle => 'Klipning Aktiv';

  @override
  String get fullVideoDesc => 'Behandl hele videoen uden at klippe.';

  @override
  String get audioModeTitle => 'Lydspor Tilstand';

  @override
  String get audioOriginalLabel => 'Original';

  @override
  String get audioOriginalDesc => 'Intet tab af lydkvalitet.';

  @override
  String get audioAac256Label => 'Høj Kvalitet';

  @override
  String get audioAac256Desc => 'AAC 256kbps';

  @override
  String get audioAac128Label => 'Balanceret';

  @override
  String get audioAac128Desc => 'AAC 128kbps (Webstandard)';

  @override
  String get audioAac64Label => 'Lav Kvalitet';

  @override
  String get audioAac64Desc => 'AAC 64kbps til tale';

  @override
  String get audioMuteLabel => 'Sluk Lyd';

  @override
  String get audioMuteDesc => 'Fjern lydsporet helt.';

  @override
  String get audioNormTitle => 'Lydstyrkenormalisering';

  @override
  String get audioNormOffLabel => 'Slukket';

  @override
  String get audioNormOffDesc => 'Original dynamik.';

  @override
  String get audioNormSpeechLabel => 'Mennesketale';

  @override
  String get audioNormSpeechDesc => 'EBU R128 for klar tale.';

  @override
  String get audioNormDynamicLabel => 'Bio Dynamisk';

  @override
  String get audioNormDynamicDesc => 'Udligner svage og høje lyde.';

  @override
  String get audioNormBoostLabel => 'Let Forstærkning';

  @override
  String get audioNormBoostDesc => '+3dB lydforstærkning.';

  @override
  String get audioChanTitle => 'Lydkanaler';

  @override
  String get audioChanOriginalLabel => 'Originale';

  @override
  String get audioChanOriginalDesc => 'Behold kildekanaler.';

  @override
  String get audioChanStereoLabel => 'Stereo (2.0)';

  @override
  String get audioChanStereoDesc => '2-kanals stereo.';

  @override
  String get audioChanMonoLabel => 'Mono (1.0)';

  @override
  String get audioChanMonoDesc => 'Enkelt kanal - 50% lydbesparelse.';

  @override
  String get removeNoiseLabel => 'Fjern Støj';

  @override
  String get enableAudioDenoiseTitle => 'Fjern Mikrofonstøj';

  @override
  String get enableAudioDenoiseDesc => 'Filter mod baggrundsstøj.';

  @override
  String get outputDirectoryTitle => 'Output Mappe';

  @override
  String get defaultOutputDirectory => 'Standard (Ved siden af originalen)';

  @override
  String get selectOutputFolderTitle => 'Vælg Mappe';

  @override
  String get clearOutputFolder => 'Brug standardplacering';

  @override
  String get changeBtn => 'Skift';

  @override
  String get outputLocationTitle => 'Output Opførsel';

  @override
  String get outputLocationUnifiedLabel => 'En Enkelt Mappe';

  @override
  String get outputLocationUnifiedDesc =>
      'Alle komprimerede videoer i én mappe.';

  @override
  String get outputLocationSameLabel => 'Ved siden af Original';

  @override
  String get outputLocationSameDesc => 'Hver video ved siden af sin kildefil.';

  @override
  String get fileManagementTitle => 'Filhåndtering';

  @override
  String get keepOriginalsLabel => 'Behold Originaler';

  @override
  String get keepOriginalsDesc => 'Lad originale filer være urørte.';

  @override
  String get toRecycleBinLabel => 'Til Papirkurv';

  @override
  String get toRecycleBinDesc =>
      'Flyt originaler til papirkurven efter komprimering.';

  @override
  String get outputFormatTitle => 'Beholderformat';

  @override
  String get formatOriginalLabel => 'Original';

  @override
  String get formatOriginalDesc => 'Behold originalformat.';

  @override
  String get formatMp4Label => 'MP4';

  @override
  String get formatMp4Desc => 'Maksimal kompatibilitet.';

  @override
  String get formatMkvLabel => 'MKV';

  @override
  String get formatMkvDesc => 'Support for flere spor.';

  @override
  String get formatMovLabel => 'MOV';

  @override
  String get formatMovDesc => 'Apple QuickTime-format.';

  @override
  String get scanningFilesMsg => 'Scanner filer...';

  @override
  String get addFilesBtn => 'Tilføj Filer';

  @override
  String get addFolderBtn => 'Tilføj Mappe';

  @override
  String get dragDropMoreMsg => 'Eller træk & slip flere videoer her';

  @override
  String get openOutputFolderTooltip => 'Åbn Output Mappe';

  @override
  String get statusQueued => 'I kø';

  @override
  String get statusAnalyzing => 'Analyserer';

  @override
  String get statusCompressing => 'Komprimerer';

  @override
  String get statusDone => 'Færdig';

  @override
  String get statusFailed => 'Fejlede';

  @override
  String get statusCancelled => 'Annulleret';

  @override
  String get savedPrefix => 'Sparet';

  @override
  String get largerSuffix => 'Større';

  @override
  String get largerSizeWarning => 'Størrelsen kan blive større end originalen.';

  @override
  String get clearCompletedBtn => 'Ryd Færdige';

  @override
  String get clearAllBtn => 'Ryd Alle';

  @override
  String get stopAllBtn => 'Stop Alle';

  @override
  String get startCompressionBtn => 'Start Komprimering';

  @override
  String get allDoneLabel => 'Alt Færdigt!';

  @override
  String get openFolderBtn => 'Åbn Mappe';

  @override
  String get totalEtaLabel => 'Resterende Tid';

  @override
  String get totalSavedLabel => 'Samlet Sparet';

  @override
  String get videoSingle => 'video';

  @override
  String get videosPlural => 'videoer';

  @override
  String get releaseToAddVideosMsg => 'Slip for at tilføje videoer';

  @override
  String get dragDropHereMsg => 'Træk & slip filer eller meppe her';

  @override
  String get supportedFormatsMsg => 'Støtter MP4, MKV, MOV, AVI, WMV';

  @override
  String get selectFilesBtn => 'Vælg Filer';

  @override
  String get selectFolderBtn => 'Vælg Mappe';

  @override
  String get releaseToShrinkTitle => 'Slip for at komprimere med det samme';

  @override
  String get filesWillBeAddedDesc => 'Dine filer vil blive tilføjet til køen.';

  @override
  String get disabledLabel => 'Deaktiveret';

  @override
  String get compressionInProgressTitle => 'Komprimering i Gang';

  @override
  String get confirmCloseDesc => 'Er du sikker på, at du vil lukke Shrinkeo?';

  @override
  String get keepCompressingBtn => 'Fortsæt Komprimering';

  @override
  String get closeAppBtn => 'Luk Appen';

  @override
  String get lockedSettingsWarning => 'Låst under komprimering';

  @override
  String get updateRequiredTitle => 'Opdatering Påkrævet';

  @override
  String get updateRequiredDescNewVersion => 'En ny version er tilgængelig.';

  @override
  String get updateRequiredDescOldVersion =>
      'Din version understøttes ikke længere.';

  @override
  String get updateNowBtn => 'Opdater Nu';

  @override
  String get laterBtn => 'Senere';

  @override
  String get updateAvailableTitle => 'Opdatering Tilgængelig';

  @override
  String get whatsNewTitle => 'Hvad er nyt:';

  @override
  String get exitAppBtn => 'Afslut';

  @override
  String get retryBtn => 'Prøv igen';

  @override
  String get downloadFromWebsiteBtn => 'Download fra Hjemmesiden';

  @override
  String get skipUpdateConfirmTitle => 'Spring opdatering over?';

  @override
  String get skipUpdateConfirmDesc =>
      'Denne opdatering indeholder vigtige rettelser.';

  @override
  String get skipUpdateCancelBtn => 'Annuller';

  @override
  String get skipUpdateConfirmBtn => 'Spring opdatering over';

  @override
  String get maintenanceTitle => 'Vedligeholdelse';

  @override
  String get maintenanceDescDefault =>
      'Shrinkeo er i øjeblikket under vedligeholdelse.';

  @override
  String versionAvailableMsg(String version) {
    return 'Version $version er tilgængelig.';
  }

  @override
  String get hwEncoderNotSupportedTitle =>
      'Hardware-acceleration understøttes ikke';

  @override
  String get failedCreateFolderError => 'Kunne ikke oprette mappe';

  @override
  String get failedProbeDurationError => 'Kunne ikke læse varighed';

  @override
  String get ffmpegNotFoundGlobalError => 'FFmpeg blev ikke fundet.';

  @override
  String get ffmpegMissingError =>
      'FFmpeg eller FFprobe mangler eller er beskadiget.';

  @override
  String hwFallbackNotificationBody(String encoderLabel) {
    return '$encoderLabel fejlede. Skiftede til CPU.';
  }

  @override
  String get failedDownloadUpdateMsg =>
      'Download af opdatering fejlede. Prøv igen.';

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
  String get compressionModeTitle => 'Kompressionstilstand';

  @override
  String get smartAutoLabel => 'Smart Auto';

  @override
  String get smartAutoDesc =>
      'Reducerer automatisk filstørrelsen med ~60-80 % med 100 % uberørt visuel klarhed. Perfekt til daglig fotooptimering.';

  @override
  String get maxSavingsLabel => 'Max besparelser';

  @override
  String get maxSavingsDesc =>
      'Aggressiv komprimering sparer op til 85-90% filstørrelse. Bedst til hurtige beskeder, webuploads og vedhæftede filer i e-mail.';

  @override
  String get ultraFidelityLabel => 'Ultra Fidelity';

  @override
  String get ultraFidelityDesc =>
      'Bevarer rå visuel troskab med minimal kompression. Ideel til fotograferingsarkiver og printarbejde i høj opløsning.';

  @override
  String get targetImageFormatTitle => 'Mål billedformat';

  @override
  String get dimensionResizingTitle => 'Dimensionsændring';

  @override
  String get exifCameraPrivacyTitle => 'EXIF / Kamerabeskyttelse';

  @override
  String get stripGpsCameraInfoLabel => 'Fjern GPS- og kameraoplysninger';

  @override
  String get intentCompressOnly => 'Komprimer kun';

  @override
  String get intentCompressOnlyTooltip =>
      'Fokuser udelukkende på at reducere filstørrelsen (kvalitets % eller mål KB/MB)';

  @override
  String get intentEditConvertOnly => 'Kun rediger/konverter';

  @override
  String get intentEditConvertOnlyTooltip =>
      'Tilpas størrelse, roter, trim eller konverter format uden at reducere den visuelle kvalitet';

  @override
  String get intentCompressAndEdit => 'Komprimer og rediger';

  @override
  String get intentCompressAndEditTooltip =>
      'Fuld kontrol: Rediger, tilpas størrelse, roter OG komprimer filstørrelse sammen';
}
