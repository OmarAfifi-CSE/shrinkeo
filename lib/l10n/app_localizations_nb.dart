// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Norwegian Bokmål (`nb`).
class AppLocalizationsNb extends AppLocalizations {
  AppLocalizationsNb([String locale = 'nb']) : super(locale);

  @override
  String get appName => 'Shrinkeo';

  @override
  String get totalSpaceSaved => 'Totalt spart plass';

  @override
  String get savedSpacePrefix => 'Spart:';

  @override
  String get supportButtonText => 'Støtt prosjektet';

  @override
  String get lightThemeTooltip => 'Lyst tema';

  @override
  String get darkThemeTooltip => 'Mørkt tema';

  @override
  String get settingsTooltip => 'Innstillinger';

  @override
  String get minimizeTooltip => 'Minimer';

  @override
  String get closeTooltip => 'Lukk';

  @override
  String get restoreTooltip => 'Gjenopprett';

  @override
  String get maximizeTooltip => 'Maksimer';

  @override
  String get tabCompressionQuality => 'Komprimering & Kvalitet';

  @override
  String get tabVideoEditingTools => 'Redigering & Verktøy';

  @override
  String get tabAudioSettings => 'Lydinnstillinger';

  @override
  String get tabEngineOutput => 'Motor & Mappe';

  @override
  String get compressionSettingsTitle => 'Komprimeringsinnstillinger';

  @override
  String get resetToDefaults => 'Tilbakestill til standard';

  @override
  String get resetDefaultTooltip => 'Tilbakestill til opprinnelige verdier';

  @override
  String get modeTargetSizeTitle => 'Komprimeringsmodus';

  @override
  String get modeCrfLabel => 'Kvalitet (CRF)';

  @override
  String get modeTargetSizeLabel => 'Målstørrelse (MB)';

  @override
  String get crfQualityTitle => 'CRF Kvalitetsfaktor';

  @override
  String get crfLossless => 'Tapsfri';

  @override
  String get crfHighQuality => 'Høy kvalitet';

  @override
  String get crfBalanced => 'Balansert';

  @override
  String get crfHighCompression => 'Høy kompresjon';

  @override
  String get crfLowQuality => 'Lav kvalitet';

  @override
  String get crfUltraCompressed => 'Ultrakomprimert';

  @override
  String get targetSizeLabel => 'Målfilstørrelse (MB)';

  @override
  String get targetSizeDesc =>
      'Beregner bitrate for å holde seg innenfor grensen.';

  @override
  String get encodingSpeedTitle => 'Kodingshastighet';

  @override
  String get presetUltrafastLabel => 'Ultrahurtig';

  @override
  String get presetUltrafastDesc => 'Maksimal hastighet, men minst besparelse.';

  @override
  String get presetSuperfastLabel => 'Superhurtig';

  @override
  String get presetSuperfastDesc => 'Veldig rask koding.';

  @override
  String get presetVeryfastLabel => 'Veldig hurtig';

  @override
  String get presetVeryfastDesc => 'Raskere enn gjennomsnittet.';

  @override
  String get presetFasterLabel => 'Raskere';

  @override
  String get presetFasterDesc => 'God hastighet og høy komprimering.';

  @override
  String get presetFastLabel => 'Rask';

  @override
  String get presetFastDesc => 'Beste balanse mellom hastighet og størrelse.';

  @override
  String get presetMediumLabel => 'Medium';

  @override
  String get presetMediumDesc => 'Standard balanse.';

  @override
  String get presetSlowLabel => 'Langsom';

  @override
  String get presetSlowDesc => 'Tregere, men markant mindre filer.';

  @override
  String get presetVeryslowLabel => 'Veldig langsom';

  @override
  String get presetVeryslowDesc => 'Maksimal besparelse.';

  @override
  String get videoCodecTitle => 'Video Kodek';

  @override
  String get codecH264Label => 'H.264';

  @override
  String get codecH264Desc => 'Maksimal kompatibilitet.';

  @override
  String get codecH265Label => 'H.265 / HEVC';

  @override
  String get codecH265Desc => 'Bedre komprimeringsytelse.';

  @override
  String get codecAv1Label => 'AV1';

  @override
  String get codecAv1Desc => 'Neste generasjons kodek (30% mindre enn H.265).';

  @override
  String get hardwareEncoderTitle => 'Maskinvareakselerasjon (GPU)';

  @override
  String get hwSoftwareLabel => 'Programvare (CPU)';

  @override
  String get hwSoftwareDesc => 'Tregest, men best kompatibilitet.';

  @override
  String get hwNvidiaLabel => 'Nvidia (NVENC)';

  @override
  String get hwNvidiaDesc => 'Veldig rask koding for Nvidia GPU.';

  @override
  String get hwAmdLabel => 'AMD (AMF)';

  @override
  String get hwAmdDesc => 'Veldig rask koding for AMD GPU.';

  @override
  String get hwIntelLabel => 'Intel (QSV)';

  @override
  String get hwIntelDesc => 'Veldig rask koding for Intel GPU.';

  @override
  String get resolutionTitle => 'Maksimal Oppløsning';

  @override
  String get resOriginalLabel => 'Original';

  @override
  String get resOriginalDesc => 'Behold original oppløsning.';

  @override
  String get res4kLabel => '4K';

  @override
  String get res4kDesc => 'Reduser til maks 4K.';

  @override
  String get res2kLabel => '2K';

  @override
  String get res2kDesc => 'Reduser til maks 2K.';

  @override
  String get res1080pLabel => '1080p';

  @override
  String get res1080pDesc => 'Reduser til maks 1080p Full HD.';

  @override
  String get res720pLabel => '720p';

  @override
  String get res720pDesc => 'Reduser til maks 720p HD.';

  @override
  String get res480pLabel => '480p';

  @override
  String get res480pDesc => 'Reduser til 480p.';

  @override
  String get res360pLabel => '360p';

  @override
  String get res360pDesc => 'Maksimal komprimering.';

  @override
  String get frameRateTitle => 'Bildefrekvens (FPS)';

  @override
  String get fpsOriginalLabel => 'Original';

  @override
  String get fpsOriginalDesc => 'Samme FPS som kilde.';

  @override
  String get fps60Label => '60 fps';

  @override
  String get fps60Desc => 'Jevnt for spill eller sport.';

  @override
  String get fps30Label => '30 fps';

  @override
  String get fps30Desc => 'Standard for de fleste videoer.';

  @override
  String get fps24Label => '24 fps';

  @override
  String get fps24Desc => 'Kino-stil.';

  @override
  String get enableVideoDenoiseTitle => 'Fjern Støy i Video';

  @override
  String get enableVideoDenoiseDesc => '3D-filter for å redusere støy.';

  @override
  String get exportFormatTitle => 'Eksportformat';

  @override
  String get exportVideoLabel => 'Standard Video';

  @override
  String get exportVideoDesc => 'Eksporter til MP4/MKV/MOV';

  @override
  String get exportGifLabel => 'Animert GIF';

  @override
  String get exportGifDesc => 'Lag animert GIF i høy kvalitet';

  @override
  String get exportMp3Label => 'Hent MP3';

  @override
  String get exportMp3Desc => 'Hent lyd som MP3 320kbps';

  @override
  String get exportAacLabel => 'Hent AAC';

  @override
  String get exportAacDesc => 'Hent lyd som AAC';

  @override
  String get exportWavLabel => 'Hent WAV';

  @override
  String get exportWavDesc => 'Hent ukomprimert WAV-lyd';

  @override
  String get privacyScrubbingTitle => 'Personvern & GPS';

  @override
  String get keepMetadataLabel => 'Behold Data';

  @override
  String get stripGpsExifLabel => 'Slett GPS/EXIF';

  @override
  String get stripGpsExifInfoTitle => 'Rens Metadata';

  @override
  String get stripGpsExifInfoDesc => 'Fjerner kamerainfo og GPS-posisjon.';

  @override
  String get keepMetadataInfoDesc => 'Beholder all original metadata.';

  @override
  String get autoCropBlackBarsTitle => 'Beskjær Svarte Kanter Automatisk';

  @override
  String get autoCropLabel => 'Auto Beskjæring';

  @override
  String get autoCropActiveTitle => 'Auto Beskjæring Aktiv';

  @override
  String get autoCropActiveDesc => 'Fjerner automatisk svarte kanter.';

  @override
  String get autoCropDisabledDesc => 'Beholder originale kanter.';

  @override
  String get playbackSpeedTitle => 'Avspillingshastighet';

  @override
  String get speedOriginalLabel => '1.0x';

  @override
  String get speedOriginalDesc => 'Normal hastighet';

  @override
  String get speedSlow05Label => '0.5x Sakte';

  @override
  String get speedSlow05Desc => 'Spill av med halv hastighet';

  @override
  String get speedFast15Label => '1.5x';

  @override
  String get speedFast15Desc => '1.5 ganger raskere';

  @override
  String get speedFast20Label => '2.0x Rask';

  @override
  String get speedFast20Desc => 'Dobbel hastighet';

  @override
  String get speedTimelapse40Label => '4.0x Timelapse';

  @override
  String get speedTimelapse40Desc => '4x hastighet for timelapse';

  @override
  String get canvasAspectRatioTitle => 'Størrelsesforhold';

  @override
  String get aspectOriginalLabel => 'Original';

  @override
  String get aspectOriginalDesc => 'Behold originalt forhold';

  @override
  String get aspectShortsLabel => '9:16 Shorts';

  @override
  String get aspectShortsDesc => 'For TikTok og Reels';

  @override
  String get aspectSquareLabel => '1:1 Firkant';

  @override
  String get aspectSquareDesc => 'For Instagram-innlegg';

  @override
  String get aspectPortraitLabel => '4:5 Portrett';

  @override
  String get aspectPortraitDesc => 'For vertikal Instagram';

  @override
  String get aspectWidescreenLabel => '16:9 Bredformat';

  @override
  String get aspectWidescreenDesc => 'For YouTube og TV';

  @override
  String get aspectClassicLabel => '4:3 Klassisk';

  @override
  String get aspectClassicDesc => 'For klassiske skjermer';

  @override
  String get aspectCinemaLabel => '21:9 Kino';

  @override
  String get aspectCinemaDesc => 'For ultrawide-skjermer';

  @override
  String get aspectCustomLabel => 'Tilpasset';

  @override
  String get aspectCustomDesc => 'Tilpasset størrelsesforhold';

  @override
  String get customRatioTooltip => 'F.eks: 16:10, 2:1';

  @override
  String get rotationFlipTitle => 'Rotasjon & Speiling';

  @override
  String get rotOriginalLabel => 'Original (0°)';

  @override
  String get rotOriginalDesc => 'Behold retning';

  @override
  String get rot90Label => '90° Høyre';

  @override
  String get rot90Desc => 'Roter 90 grader med klokken';

  @override
  String get rot180Label => '180° På Hodet';

  @override
  String get rot180Desc => 'Roter på hodet';

  @override
  String get rot270Label => '270° Venstre';

  @override
  String get rot270Desc => 'Roter 90 grader mot klokken';

  @override
  String get rotFlipHLabel => 'Speil Horisontalt';

  @override
  String get rotFlipHDesc => 'Speil horisontalt';

  @override
  String get rotFlipVLabel => 'Speil Vertikalt';

  @override
  String get rotFlipVDesc => 'Speil vertikalt';

  @override
  String get rotCustomLabel => 'Tilpasset Vinkel';

  @override
  String get rotCustomDesc => 'Roter med spesifikk vinkel';

  @override
  String get customRotationTooltip => 'Vinkel i grader f.eks. 45';

  @override
  String get trimVideoTitle => 'Klipp Video';

  @override
  String get fullVideoLabel => 'Hele Videoen';

  @override
  String get cutClipLabel => 'Klipp Klippet';

  @override
  String get trimStartLabel => 'Start';

  @override
  String get trimEndLabel => 'Slutt';

  @override
  String get trimActiveTitle => 'Klipping Aktiv';

  @override
  String get fullVideoDesc => 'Behandle hele videoen uten å klippe.';

  @override
  String get audioModeTitle => 'Lydspor Modus';

  @override
  String get audioOriginalLabel => 'Original';

  @override
  String get audioOriginalDesc => 'Ingen tap av lydkvalitet.';

  @override
  String get audioAac256Label => 'Høy Kvalitet';

  @override
  String get audioAac256Desc => 'AAC 256kbps';

  @override
  String get audioAac128Label => 'Balansert';

  @override
  String get audioAac128Desc => 'AAC 128kbps (Webstandard)';

  @override
  String get audioAac64Label => 'Lav Kvalitet';

  @override
  String get audioAac64Desc => 'AAC 64kbps for tale';

  @override
  String get audioMuteLabel => 'Demp Lyd';

  @override
  String get audioMuteDesc => 'Fjern lydsporet helt.';

  @override
  String get audioNormTitle => 'Lydstyrkenormalisering';

  @override
  String get audioNormOffLabel => 'Av';

  @override
  String get audioNormOffDesc => 'Original dynamikk.';

  @override
  String get audioNormSpeechLabel => 'Mennesketale';

  @override
  String get audioNormSpeechDesc => 'EBU R128 for klar tale.';

  @override
  String get audioNormDynamicLabel => 'Kino Dynamisk';

  @override
  String get audioNormDynamicDesc => 'Utjevner svake og høye lyder.';

  @override
  String get audioNormBoostLabel => 'Liten Forstørrelse';

  @override
  String get audioNormBoostDesc => '+3dB lydforsterkning.';

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
  String get audioChanMonoDesc => 'Enkeltkanal - 50% lydbesparelse.';

  @override
  String get removeNoiseLabel => 'Fjern Støy';

  @override
  String get enableAudioDenoiseTitle => 'Fjern Mikrofonstøy';

  @override
  String get enableAudioDenoiseDesc => 'Filter mot bakgrunnsstøy.';

  @override
  String get outputDirectoryTitle => 'Output Mappe';

  @override
  String get defaultOutputDirectory => 'Standard (Ved siden av originalen)';

  @override
  String get selectOutputFolderTitle => 'Velg Mappe';

  @override
  String get clearOutputFolder => 'Bruk standardplassering';

  @override
  String get changeBtn => 'Endre';

  @override
  String get outputLocationTitle => 'Output Oppførsel';

  @override
  String get outputLocationUnifiedLabel => 'Én Enkelt Mappe';

  @override
  String get outputLocationUnifiedDesc =>
      'Alle komprimerte videoer i én mappe.';

  @override
  String get outputLocationSameLabel => 'Ved siden av Original';

  @override
  String get outputLocationSameDesc => 'Hver video ved siden av sin kildefil.';

  @override
  String get fileManagementTitle => 'Filhåndtering';

  @override
  String get keepOriginalsLabel => 'Behold Originaler';

  @override
  String get keepOriginalsDesc => 'La originale filer være urørte.';

  @override
  String get toRecycleBinLabel => 'Til Papirkurv';

  @override
  String get toRecycleBinDesc =>
      'Flytt originaler til papirkurven etter komprimering.';

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
  String get formatMkvDesc => 'Støtte for flere spor.';

  @override
  String get formatMovLabel => 'MOV';

  @override
  String get formatMovDesc => 'Apple QuickTime-format.';

  @override
  String get scanningFilesMsg => 'Skanner filer...';

  @override
  String get addFilesBtn => 'Legg til Filer';

  @override
  String get addFolderBtn => 'Legg til Mappe';

  @override
  String get dragDropMoreMsg => 'Eller dra & slipp flere videoer her';

  @override
  String get openOutputFolderTooltip => 'Åpne Output Mappe';

  @override
  String get statusQueued => 'I kø';

  @override
  String get statusAnalyzing => 'Analyserer';

  @override
  String get statusCompressing => 'Komprimerer';

  @override
  String get statusDone => 'Ferdig';

  @override
  String get statusFailed => 'Mislyktes';

  @override
  String get statusCancelled => 'Avbrutt';

  @override
  String get savedPrefix => 'Spart';

  @override
  String get largerSuffix => 'Større';

  @override
  String get largerSizeWarning => 'Størrelsen kan bli større enn originalen.';

  @override
  String get clearCompletedBtn => 'Rjenn Faste';

  @override
  String get clearAllBtn => 'Rydd Alle';

  @override
  String get stopAllBtn => 'Stopp Alle';

  @override
  String get startCompressionBtn => 'Start Komprimering';

  @override
  String get allDoneLabel => 'Alt Ferdig!';

  @override
  String get openFolderBtn => 'Åpne Mappe';

  @override
  String get totalEtaLabel => 'Gjenstående Tid';

  @override
  String get totalSavedLabel => 'Totalt Spart';

  @override
  String get videoSingle => 'video';

  @override
  String get videosPlural => 'videoer';

  @override
  String get releaseToAddVideosMsg => 'Slipp for å legge til videoer';

  @override
  String get dragDropHereMsg => 'Dra & slipp filer eller mapper her';

  @override
  String get supportedFormatsMsg => 'Støtter MP4, MKV, MOV, AVI, WMV';

  @override
  String get selectFilesBtn => 'Velg Filer';

  @override
  String get selectFolderBtn => 'Velg Mappe';

  @override
  String get releaseToShrinkTitle => 'Slipp for å komprimere med en gang';

  @override
  String get filesWillBeAddedDesc => 'Filene dine vil bli lagt til i køen.';

  @override
  String get disabledLabel => 'Deaktivert';

  @override
  String get compressionInProgressTitle => 'Komprimering Pågår';

  @override
  String get confirmCloseDesc => 'Er du sikker på at du vil lukke Shrinkeo?';

  @override
  String get keepCompressingBtn => 'Fortsett Komprimering';

  @override
  String get closeAppBtn => 'Lukk Appen';

  @override
  String get lockedSettingsWarning => 'Låst under komprimering';

  @override
  String get updateRequiredTitle => 'Oppdatering Nødvendig';

  @override
  String get updateRequiredDescNewVersion => 'En ny versjon er tilgjengelig.';

  @override
  String get updateRequiredDescOldVersion => 'Din versjon støttes ikke lenger.';

  @override
  String get updateNowBtn => 'Oppdater Nå';

  @override
  String get laterBtn => 'Senere';

  @override
  String get updateAvailableTitle => 'Oppdatering Tilgjengelig';

  @override
  String get whatsNewTitle => 'Hva er nytt:';

  @override
  String get exitAppBtn => 'Avslutt';

  @override
  String get retryBtn => 'Prøv igjen';

  @override
  String get downloadFromWebsiteBtn => 'Last ned fra Nettsiden';

  @override
  String get skipUpdateConfirmTitle => 'Hopp over oppdatering?';

  @override
  String get skipUpdateConfirmDesc =>
      'Denne oppdateringen inneholder viktige rettingar.';

  @override
  String get skipUpdateCancelBtn => 'Avbryt';

  @override
  String get skipUpdateConfirmBtn => 'Hopp over oppdatering';

  @override
  String get maintenanceTitle => 'Vedlikehold';

  @override
  String get maintenanceDescDefault =>
      'Shrinkeo er for tiden under vedlikehold.';

  @override
  String versionAvailableMsg(String version) {
    return 'Versjon $version er tilgjengelig.';
  }

  @override
  String get hwEncoderNotSupportedTitle =>
      'Maskinvareakselerasjon støttes ikke';

  @override
  String get failedCreateFolderError => 'Kunne ikke opprette mappe';

  @override
  String get failedProbeDurationError => 'Kunne ikke lese varighet';

  @override
  String get ffmpegNotFoundGlobalError => 'FFmpeg ble ikke funnet.';

  @override
  String get ffmpegMissingError =>
      'FFmpeg eller FFprobe mangler eller er skadet.';

  @override
  String hwFallbackNotificationBody(String encoderLabel) {
    return '$encoderLabel feilet. Byttet til CPU.';
  }

  @override
  String get failedDownloadUpdateMsg =>
      'Nedlasting av oppdatering feilet. Prøv igjen.';

  @override
  String customRatioActiveTitle(Object ratio) {
    return 'Tilpasset forhold ($ratio)';
  }

  @override
  String customRatioActiveDesc(Object ratio) {
    return 'Polstret lerret for tilpasset $ratio-forhold.';
  }

  @override
  String customAngleActiveTitle(Object angle) {
    return 'Tilpasset vinkel ($angle°)';
  }

  @override
  String customAngleActiveDesc(Object angle) {
    return 'Roterer videoen med en tilpasset vinkel på $angle°.';
  }

  @override
  String trimActiveDesc(Object end, Object start) {
    return 'Kutter videoklipp mellom $start og $end.';
  }

  @override
  String targetSizeLimitLabel(Object size) {
    return 'Grense $size MB';
  }

  @override
  String get customMbSizeTooltip => 'Skriv inn tilpasset MB-størrelse';

  @override
  String get trimTimeTooltip =>
      'Skriv inn tid f.eks. 5 (5s), 1:30 (1m30s), eller 00:01:30';

  @override
  String get tabImageSuite => 'Image Suite';

  @override
  String get compressionModeTitle => 'Komprimeringsmodus';

  @override
  String get smartAutoLabel => 'Smart Auto';

  @override
  String get smartAutoDesc =>
      'Reduserer filstørrelsen automatisk med ~60-80 % med 100 % uberørt visuell klarhet. Perfekt for daglig fotooptimalisering.';

  @override
  String get maxSavingsLabel => 'Maks besparelser';

  @override
  String get maxSavingsDesc =>
      'Aggressiv komprimering sparer opptil 85-90 % filstørrelse. Best for raske meldinger, nettopplastinger og e-postvedlegg.';

  @override
  String get ultraFidelityLabel => 'Ultra Fidelity';

  @override
  String get ultraFidelityDesc =>
      'Bevarer rå visuell troskap med minimal komprimering. Ideell for fotoarkiver og utskriftsarbeid med høy oppløsning.';

  @override
  String get targetImageFormatTitle => 'Målbildeformat';

  @override
  String get dimensionResizingTitle => 'Endre størrelse på dimensjon';

  @override
  String get exifCameraPrivacyTitle => 'EXIF / Kamerapersonvern';

  @override
  String get stripGpsCameraInfoLabel => 'Strip GPS og kamerainformasjon';

  @override
  String get intentCompressOnly => 'Komprimer bare';

  @override
  String get intentCompressOnlyTooltip =>
      'Fokuser utelukkende på å redusere filstørrelsen (kvalitets % eller mål KB/MB)';

  @override
  String get intentEditConvertOnly => 'Rediger / Konverter bare';

  @override
  String get intentEditConvertOnlyTooltip =>
      'Endre størrelse, roter, trim eller konverter format uten å redusere visuell kvalitet';

  @override
  String get intentCompressAndEdit => 'Komprimer og rediger';

  @override
  String get intentCompressAndEditTooltip =>
      'Full kontroll: Rediger, endre størrelse, roter OG komprimer filstørrelse sammen';

  @override
  String get imgFmtOriginalLabel => 'Originalformat';

  @override
  String get imgFmtOriginalDesc =>
      'Behold originalformatet (Raskest, ingen konvertering).';

  @override
  String get imgFmtPngLabel => 'PNG-bilde (.png)';

  @override
  String get imgFmtPngDesc => 'Tapsfritt PNG-format med støtte for åpenhet.';

  @override
  String get imgFmtJpgLabel => 'JPEG-bilde (.jpg)';

  @override
  String get imgFmtJpgDesc =>
      'Standard komprimert JPEG-format for universell kompatibilitet.';

  @override
  String get imgFmtWebpLabel => 'WebP-bilde (.webp)';

  @override
  String get imgFmtWebpDesc =>
      'Moderne WebP-format som tilbyr overlegen komprimering og liten størrelse.';

  @override
  String get imgFmtAvifLabel => 'AVIF-bilde (.avif)';

  @override
  String get imgFmtAvifDesc =>
      'Neste generasjons AVIF-format med ultrahøy komprimeringseffektivitet.';

  @override
  String get imgResOriginalLabel => 'Originale dimensjoner';

  @override
  String get imgResOriginalDesc =>
      'Behold originalbildets bredde og høydedimensjoner.';

  @override
  String get imgRes4kLabel => '4K Max (3840 piksler)';

  @override
  String get imgRes4kDesc =>
      'Nedskaler bildets maksimale dimensjon til 3840 piksler (maks. 4K).';

  @override
  String get imgRes1080pLabel => 'Full HD Max (1920 piksler)';

  @override
  String get imgRes1080pDesc =>
      'Skaler ned maks. bildedimensjon til 1920 piksler (maks. Full HD).';

  @override
  String get imgRes720pLabel => 'HD Max (1280 piksler)';

  @override
  String get imgRes720pDesc =>
      'Nedskaler bildets maksimale dimensjon til 1280 piksler (HD maks).';

  @override
  String get imgRes480pLabel => 'SD Max (854px)';

  @override
  String get imgRes480pDesc =>
      'Nedskaler bildets maksimale dimensjon til 854 piksler (SD max).';

  @override
  String get keepMetadataImageInfoDesc =>
      'Bevarer originalbildet EXIF ​​og kamerametadata.';

  @override
  String get cleanNoiseLabel => 'Fjern støy';

  @override
  String get outputLargerTooltip =>
      'Output will be larger than original!\nStop and try Reset to Defaults.';

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
