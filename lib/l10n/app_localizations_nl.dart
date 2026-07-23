// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Dutch Flemish (`nl`).
class AppLocalizationsNl extends AppLocalizations {
  AppLocalizationsNl([String locale = 'nl']) : super(locale);

  @override
  String get appName => 'Shrinkeo';

  @override
  String get totalSpaceSaved => 'Totaal bespaarde ruimte';

  @override
  String get savedSpacePrefix => 'Bespaard:';

  @override
  String get supportButtonText => 'Steun het project';

  @override
  String get lightThemeTooltip => 'Licht Thema';

  @override
  String get darkThemeTooltip => 'Donker Thema';

  @override
  String get settingsTooltip => 'Instellingen';

  @override
  String get minimizeTooltip => 'Minimaliseren';

  @override
  String get closeTooltip => 'Sluiten';

  @override
  String get restoreTooltip => 'Herstellen';

  @override
  String get maximizeTooltip => 'Maximering';

  @override
  String get tabCompressionQuality => 'Compressie & Kwaliteit';

  @override
  String get tabVideoEditingTools => 'Videobewerking & Tools';

  @override
  String get tabAudioSettings => 'Audio-instellingen';

  @override
  String get tabEngineOutput => 'Engine & Output';

  @override
  String get compressionSettingsTitle => 'Compressie-instellingen';

  @override
  String get resetToDefaults => 'Standaard herstellen';

  @override
  String get resetDefaultTooltip => 'Beginwaarden herstellen';

  @override
  String get modeTargetSizeTitle => 'Compressiemodus';

  @override
  String get modeCrfLabel => 'Kwaliteit (CRF)';

  @override
  String get modeTargetSizeLabel => 'Doelgrootte (MB)';

  @override
  String get crfQualityTitle => 'CRF Kwaliteitsfactor';

  @override
  String get targetSizeLabel => 'Doelbestandsgrootte (MB)';

  @override
  String get targetSizeDesc => 'Berekent bitrate om binnen grootte te blijven.';

  @override
  String get encodingSpeedTitle => 'Coderingssnelheid';

  @override
  String get presetUltrafastLabel => 'Ultrasnel';

  @override
  String get presetUltrafastDesc =>
      'Maximale snelheid, maar minste compressie.';

  @override
  String get presetSuperfastLabel => 'Super Snel';

  @override
  String get presetSuperfastDesc => 'Zeer snelle codering.';

  @override
  String get presetVeryfastLabel => 'Zeer Snel';

  @override
  String get presetVeryfastDesc => 'Sneller dan gemiddeld.';

  @override
  String get presetFasterLabel => 'Sneller';

  @override
  String get presetFasterDesc => 'Goede snelheid en compressie.';

  @override
  String get presetFastLabel => 'Snel';

  @override
  String get presetFastDesc => 'Beste balans tussen snelheid en grootte.';

  @override
  String get presetMediumLabel => 'Gemiddeld';

  @override
  String get presetMediumDesc => 'Standaard balans.';

  @override
  String get presetSlowLabel => 'Langzaam';

  @override
  String get presetSlowDesc =>
      'Langzamer, maar aanzienlijk kleinere bestanden.';

  @override
  String get presetVeryslowLabel => 'Zeer Langzaam';

  @override
  String get presetVeryslowDesc => 'Maximale bestandsverkleining.';

  @override
  String get videoCodecTitle => 'Video Codec';

  @override
  String get codecH264Label => 'H.264';

  @override
  String get codecH264Desc => 'Maximale compatibiliteit.';

  @override
  String get codecH265Label => 'H.265 / HEVC';

  @override
  String get codecH265Desc => 'Beter compressierendement.';

  @override
  String get codecAv1Label => 'AV1';

  @override
  String get codecAv1Desc =>
      'Volgende generatie codec (30% kleiner dan H.265).';

  @override
  String get hardwareEncoderTitle => 'Hardwareversnelling (GPU)';

  @override
  String get hwSoftwareLabel => 'Software (CPU)';

  @override
  String get hwSoftwareDesc => 'Tragste, maar beste compatibiliteit.';

  @override
  String get hwNvidiaLabel => 'Nvidia (NVENC)';

  @override
  String get hwNvidiaDesc => 'Zeer snelle codering voor Nvidia GPU\'s.';

  @override
  String get hwAmdLabel => 'AMD (AMF)';

  @override
  String get hwAmdDesc => 'Zeer snelle codering voor AMD GPU\'s.';

  @override
  String get hwIntelLabel => 'Intel (QSV)';

  @override
  String get hwIntelDesc => 'Zeer snelle codering voor Intel GPU\'s.';

  @override
  String get resolutionTitle => 'Maximale Resolutie';

  @override
  String get resOriginalLabel => 'Origineel';

  @override
  String get resOriginalDesc => 'Behoud originele resolutie.';

  @override
  String get res4kLabel => '4K';

  @override
  String get res4kDesc => 'Schaal af naar max 4K.';

  @override
  String get res2kLabel => '2K';

  @override
  String get res2kDesc => 'Schaal af naar max 2K.';

  @override
  String get res1080pLabel => '1080p';

  @override
  String get res1080pDesc => 'Schaal af naar max 1080p Full HD.';

  @override
  String get res720pLabel => '720p';

  @override
  String get res720pDesc => 'Schaal af naar max 720p HD.';

  @override
  String get res480pLabel => '480p';

  @override
  String get res480pDesc => 'Schaal af naar 480p.';

  @override
  String get res360pLabel => '360p';

  @override
  String get res360pDesc => 'Maximale compressie.';

  @override
  String get frameRateTitle => 'Framesnelheid (FPS)';

  @override
  String get fpsOriginalLabel => 'Origineel';

  @override
  String get fpsOriginalDesc => 'Zelfde FPS als bron.';

  @override
  String get fps60Label => '60 fps';

  @override
  String get fps60Desc => 'Vloeiend voor games of sport.';

  @override
  String get fps30Label => '30 fps';

  @override
  String get fps30Desc => 'Standaard voor meeste video\'s.';

  @override
  String get fps24Label => '24 fps';

  @override
  String get fps24Desc => 'Cinematische uitstraling.';

  @override
  String get enableVideoDenoiseTitle => 'Videoruis Verwijderen';

  @override
  String get enableVideoDenoiseDesc => '3D-filter om ruis te verminderen.';

  @override
  String get exportFormatTitle => 'Exportformaat';

  @override
  String get exportVideoLabel => 'Standaard Video';

  @override
  String get exportVideoDesc => 'Exporteer naar MP4/MKV/MOV';

  @override
  String get exportGifLabel => 'Geanimeerde GIF';

  @override
  String get exportGifDesc => 'Maak hoge kwaliteit geanimeerde GIF';

  @override
  String get exportMp3Label => 'MP3 Uitpakken';

  @override
  String get exportMp3Desc => 'Exporteer audio als MP3 320kbps';

  @override
  String get exportAacLabel => 'AAC Uitpakken';

  @override
  String get exportAacDesc => 'Exporteer audio als AAC';

  @override
  String get exportWavLabel => 'WAV Uitpakken';

  @override
  String get exportWavDesc => 'Exporteer ongecomprimeerde WAV-audio';

  @override
  String get privacyScrubbingTitle => 'Privacy & GPS';

  @override
  String get keepMetadataLabel => 'Metadata Behouden';

  @override
  String get stripGpsExifLabel => 'GPS/EXIF Wis';

  @override
  String get stripGpsExifInfoTitle => 'Metadata Wissen';

  @override
  String get stripGpsExifInfoDesc => 'Verwijdert camera-info en GPS-locatie.';

  @override
  String get keepMetadataInfoDesc => 'Bewaart alle originele metadata.';

  @override
  String get autoCropBlackBarsTitle => 'Zwarte Balken Automatisch Bijsnijden';

  @override
  String get autoCropLabel => 'Auto Bijsnijden';

  @override
  String get autoCropActiveTitle => 'Auto Bijsnijden Actief';

  @override
  String get autoCropActiveDesc => 'Verwijdert automatisch zwarte randen.';

  @override
  String get autoCropDisabledDesc => 'Behoudt originele randen.';

  @override
  String get playbackSpeedTitle => 'Afspeelsnelheid';

  @override
  String get speedOriginalLabel => '1.0x';

  @override
  String get speedOriginalDesc => 'Normale snelheid';

  @override
  String get speedSlow05Label => '0.5x Traag';

  @override
  String get speedSlow05Desc => 'Afspeel op halve snelheid';

  @override
  String get speedFast15Label => '1.5x';

  @override
  String get speedFast15Desc => '1.5 keer sneller';

  @override
  String get speedFast20Label => '2.0x Snel';

  @override
  String get speedFast20Desc => 'Dubbele snelheid';

  @override
  String get speedTimelapse40Label => '4.0x Timelapse';

  @override
  String get speedTimelapse40Desc => '4x snelheid voor timelapse';

  @override
  String get canvasAspectRatioTitle => 'Beeldverhouding';

  @override
  String get aspectOriginalLabel => 'Origineel';

  @override
  String get aspectOriginalDesc => 'Behoud originele verhoudingen';

  @override
  String get aspectShortsLabel => '9:16 Shorts';

  @override
  String get aspectShortsDesc => 'Voor TikTok en Reels';

  @override
  String get aspectSquareLabel => '1:1 Vierkant';

  @override
  String get aspectSquareDesc => 'Voor Instagram posts';

  @override
  String get aspectPortraitLabel => '4:5 Portret';

  @override
  String get aspectPortraitDesc => 'Voor Instagram verticaal';

  @override
  String get aspectWidescreenLabel => '16:9 Breedbeeld';

  @override
  String get aspectWidescreenDesc => 'Voor YouTube en TV';

  @override
  String get aspectClassicLabel => '4:3 Klassiek';

  @override
  String get aspectClassicDesc => 'Voor klassieke schermen';

  @override
  String get aspectCinemaLabel => '21:9 Bioscoop';

  @override
  String get aspectCinemaDesc => 'Voor ultrawide monitoren';

  @override
  String get aspectCustomLabel => 'Aangepast';

  @override
  String get aspectCustomDesc => 'Aangepaste beeldverhouding';

  @override
  String get customRatioTooltip => 'Bijv: 16:10, 2:1';

  @override
  String get rotationFlipTitle => 'Rotatie & Spiegelen';

  @override
  String get rotOriginalLabel => 'Origineel (0°)';

  @override
  String get rotOriginalDesc => 'Behoud originele richting';

  @override
  String get rot90Label => '90° Rechts';

  @override
  String get rot90Desc => 'Draai 90 graden naar rechts';

  @override
  String get rot180Label => '180° Kantelen';

  @override
  String get rot180Desc => 'Draai ondersteboven';

  @override
  String get rot270Label => '270° Links';

  @override
  String get rot270Desc => 'Draai 90 graden naar links';

  @override
  String get rotFlipHLabel => 'Horiz. Spiegelen';

  @override
  String get rotFlipHDesc => 'Horizontaal spiegelen';

  @override
  String get rotFlipVLabel => 'Vert. Spiegelen';

  @override
  String get rotFlipVDesc => 'Verticaal spiegelen';

  @override
  String get rotCustomLabel => 'Aangepaste Hoek';

  @override
  String get rotCustomDesc => 'Draai met specifieke hoek';

  @override
  String get customRotationTooltip => 'Hoek in graden bijv. 45';

  @override
  String get trimVideoTitle => 'Video Bijsnijden';

  @override
  String get fullVideoLabel => 'Volledige Video';

  @override
  String get cutClipLabel => 'Fragment Snijden';

  @override
  String get trimStartLabel => 'Start';

  @override
  String get trimEndLabel => 'Einde';

  @override
  String get trimActiveTitle => 'Bijsnijden Actief';

  @override
  String get fullVideoDesc => 'Verwerk hele video zonder te snijden.';

  @override
  String get audioModeTitle => 'Audiospoor Modus';

  @override
  String get audioOriginalLabel => 'Origineel';

  @override
  String get audioOriginalDesc => 'Geen kwaliteitsverlies van audio.';

  @override
  String get audioAac256Label => 'Hoge Kwaliteit';

  @override
  String get audioAac256Desc => 'AAC 256kbps';

  @override
  String get audioAac128Label => 'Gebalanceerd';

  @override
  String get audioAac128Desc => 'AAC 128kbps (Webstandaard)';

  @override
  String get audioAac64Label => 'Lage Kwaliteit';

  @override
  String get audioAac64Desc => 'AAC 64kbps voor spraak';

  @override
  String get audioMuteLabel => 'Audio Dempen';

  @override
  String get audioMuteDesc => 'Verwijder audiospoor volledig.';

  @override
  String get audioNormTitle => 'Volume Normalisatie';

  @override
  String get audioNormOffLabel => 'Uit';

  @override
  String get audioNormOffDesc => 'Originele dynamiek.';

  @override
  String get audioNormSpeechLabel => 'Spraak';

  @override
  String get audioNormSpeechDesc => 'EBU R128 voor duidelijke stemmen.';

  @override
  String get audioNormDynamicLabel => 'Bioscoop Dynamisch';

  @override
  String get audioNormDynamicDesc => 'Vlakt zachte en harde geluiden af.';

  @override
  String get audioNormBoostLabel => 'Lichte Boost';

  @override
  String get audioNormBoostDesc => '+3dB volumeversterking.';

  @override
  String get audioChanTitle => 'Audiokanalen';

  @override
  String get audioChanOriginalLabel => 'Origineel';

  @override
  String get audioChanOriginalDesc => 'Behoud bronkanalen.';

  @override
  String get audioChanStereoLabel => 'Stereo (2.0)';

  @override
  String get audioChanStereoDesc => '2-kanaals stereo compatibiliteit.';

  @override
  String get audioChanMonoLabel => 'Mono (1.0)';

  @override
  String get audioChanMonoDesc => 'Enkel kanaal - 50% besparing op audio.';

  @override
  String get removeNoiseLabel => 'Ruis Verwijderen';

  @override
  String get enableAudioDenoiseTitle => 'Microfoonruis Verwijderen';

  @override
  String get enableAudioDenoiseDesc => 'Filter tegen achtergrondruis.';

  @override
  String get outputDirectoryTitle => 'Output Map';

  @override
  String get defaultOutputDirectory => 'Standaard (Naast origineel bestand)';

  @override
  String get selectOutputFolderTitle => 'Map Selecteren';

  @override
  String get clearOutputFolder => 'Gebruik standaardlocatie';

  @override
  String get changeBtn => 'Wijzigen';

  @override
  String get outputLocationTitle => 'Output Gedrag';

  @override
  String get outputLocationUnifiedLabel => 'Enkele Map';

  @override
  String get outputLocationUnifiedDesc =>
      'Alle gecomprimeerde video\'s in één map.';

  @override
  String get outputLocationSameLabel => 'Naast Origineel';

  @override
  String get outputLocationSameDesc => 'Elke video naast het bronbestand.';

  @override
  String get fileManagementTitle => 'Bestandsbeheer';

  @override
  String get keepOriginalsLabel => 'Origineel Bewaren';

  @override
  String get keepOriginalsDesc => 'Laat originele bestanden ongewijzigd.';

  @override
  String get toRecycleBinLabel => 'Naar Prullenbak';

  @override
  String get toRecycleBinDesc =>
      'Verplaats origineel naar prullenbak na comprimeren.';

  @override
  String get outputFormatTitle => 'Container Formaat';

  @override
  String get formatOriginalLabel => 'Origineel';

  @override
  String get formatOriginalDesc => 'Behoud origineel formaat.';

  @override
  String get formatMp4Label => 'MP4';

  @override
  String get formatMp4Desc => 'Maximale compatibiliteit.';

  @override
  String get formatMkvLabel => 'MKV';

  @override
  String get formatMkvDesc => 'Ondersteuning voor meerdere sporen.';

  @override
  String get formatMovLabel => 'MOV';

  @override
  String get formatMovDesc => 'Apple QuickTime formaat.';

  @override
  String get scanningFilesMsg => 'Bestanden scannen...';

  @override
  String get addFilesBtn => 'Bestanden Toevoegen';

  @override
  String get addFolderBtn => 'Map Toevoegen';

  @override
  String get dragDropMoreMsg => 'Of sleep & neerzet hier meer video\'s';

  @override
  String get openOutputFolderTooltip => 'Open Output Map';

  @override
  String get statusQueued => 'In wachtrij';

  @override
  String get statusAnalyzing => 'Analyseren';

  @override
  String get statusCompressing => 'Comprimeren';

  @override
  String get statusDone => 'Klaar';

  @override
  String get statusFailed => 'Mislukt';

  @override
  String get statusCancelled => 'Geannuleerd';

  @override
  String get savedPrefix => 'Bespaard';

  @override
  String get largerSuffix => 'Groter';

  @override
  String get largerSizeWarning => 'Output kan groter zijn dan origineel.';

  @override
  String get clearCompletedBtn => 'Voltooide Wis';

  @override
  String get clearAllBtn => 'Alles Wissen';

  @override
  String get stopAllBtn => 'Alles Stoppen';

  @override
  String get startCompressionBtn => 'Start Compressie';

  @override
  String get allDoneLabel => 'Alles Klaar!';

  @override
  String get openFolderBtn => 'Map Openen';

  @override
  String get totalEtaLabel => 'Resterende Tijd';

  @override
  String get totalSavedLabel => 'Totaal Bespaard';

  @override
  String get videoSingle => 'video';

  @override
  String get videosPlural => 'video\'s';

  @override
  String get releaseToAddVideosMsg => 'Loslaten om toe te voegen';

  @override
  String get dragDropHereMsg => 'Sleep bestanden of mappen hierheen';

  @override
  String get supportedFormatsMsg => 'Ondersteunt MP4, MKV, MOV, AVI, WMV';

  @override
  String get selectFilesBtn => 'Selecteer Bestanden';

  @override
  String get selectFolderBtn => 'Selecteer Map';

  @override
  String get releaseToShrinkTitle => 'Loslaten om te comprimeren';

  @override
  String get filesWillBeAddedDesc =>
      'Bestanden worden aan wachtrij toegevoegd.';

  @override
  String get disabledLabel => 'Uitgeschakeld';

  @override
  String get compressionInProgressTitle => 'Compressie Bezig';

  @override
  String get confirmCloseDesc => 'Weet u zeker dat u Shrinkeo wilt sluiten?';

  @override
  String get keepCompressingBtn => 'Compressie Voortzetten';

  @override
  String get closeAppBtn => 'App Sluiten';

  @override
  String get lockedSettingsWarning => 'Vergrendeld tijdens compressie';

  @override
  String get updateRequiredTitle => 'Update Vereist';

  @override
  String get updateRequiredDescNewVersion => 'Nieuwe versie is beschikbaar.';

  @override
  String get updateRequiredDescOldVersion =>
      'Uw versie wordt niet meer ondersteund.';

  @override
  String get updateNowBtn => 'Nu Updaten';

  @override
  String get laterBtn => 'Later';

  @override
  String get updateAvailableTitle => 'Update Beschikbaar';

  @override
  String get whatsNewTitle => 'Wat is nieuw:';

  @override
  String get exitAppBtn => 'Afsluiten';

  @override
  String get retryBtn => 'Opnieuw Proberen';

  @override
  String get downloadFromWebsiteBtn => 'Downloaden van Website';

  @override
  String get skipUpdateConfirmTitle => 'Update overslaan?';

  @override
  String get skipUpdateConfirmDesc =>
      'Deze update bevat belangrijke oplossingen.';

  @override
  String get skipUpdateCancelBtn => 'Annuleren';

  @override
  String get skipUpdateConfirmBtn => 'Update overslaan';

  @override
  String get maintenanceTitle => 'Onderhoud';

  @override
  String get maintenanceDescDefault => 'Shrinkeo is momenteel in onderhoud.';

  @override
  String versionAvailableMsg(String version) {
    return 'Versie $version is beschikbaar.';
  }

  @override
  String get hwEncoderNotSupportedTitle =>
      'Hardwareversnelling niet ondersteund';

  @override
  String get failedCreateFolderError => 'Map aanmaken mislukt';

  @override
  String get failedProbeDurationError => 'Duur uitlezen mislukt';

  @override
  String get ffmpegNotFoundGlobalError => 'FFmpeg niet gefunden.';

  @override
  String get ffmpegMissingError =>
      'FFmpeg of FFprobe ontbreekt of is beschadigd.';

  @override
  String hwFallbackNotificationBody(String encoderLabel) {
    return '$encoderLabel mislukt. Oorgeschakeld naar CPU.';
  }

  @override
  String get failedDownloadUpdateMsg =>
      'Downloaden van update mislukt. Probeer opnieuw.';

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
