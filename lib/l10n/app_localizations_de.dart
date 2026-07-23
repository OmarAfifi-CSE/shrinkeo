// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get appName => 'Shrinkeo';

  @override
  String get totalSpaceSaved => 'Gesamter eingesparter Speicherplatz';

  @override
  String get savedSpacePrefix => 'Eingespart:';

  @override
  String get supportButtonText => 'Projekt unterstützen';

  @override
  String get lightThemeTooltip => 'Helles Design';

  @override
  String get darkThemeTooltip => 'Dunkles Design';

  @override
  String get settingsTooltip => 'Einstellungen';

  @override
  String get minimizeTooltip => 'Minimieren';

  @override
  String get closeTooltip => 'Schließen';

  @override
  String get restoreTooltip => 'Wiederherstellen';

  @override
  String get maximizeTooltip => 'Maximieren';

  @override
  String get tabCompressionQuality => 'Komprimierung & Qualität';

  @override
  String get tabVideoEditingTools => 'Videobearbeitung & Werkzeuge';

  @override
  String get tabAudioSettings => 'Audio-Einstellungen';

  @override
  String get tabEngineOutput => 'Engine & Ausgabe';

  @override
  String get compressionSettingsTitle => 'Komprimierungseinstellungen';

  @override
  String get resetToDefaults => 'Zurücksetzen';

  @override
  String get resetDefaultTooltip => 'Auf Standardwerte zurücksetzen';

  @override
  String get modeTargetSizeTitle => 'Komprimierungsmodus';

  @override
  String get modeCrfLabel => 'Qualität (CRF)';

  @override
  String get modeTargetSizeLabel => 'Zielgröße (MB)';

  @override
  String get crfQualityTitle => 'CRF-Qualität';

  @override
  String get targetSizeLabel => 'Zieldateigröße (MB)';

  @override
  String get targetSizeDesc =>
      'Berechnet die Bitrate, um das Größenlimit einzuhalten.';

  @override
  String get encodingSpeedTitle => 'Kodiergeschwindigkeit';

  @override
  String get presetUltrafastLabel => 'Ultraschnell';

  @override
  String get presetUltrafastDesc =>
      'Maximale Geschwindigkeit, aber geringste Komprimierung.';

  @override
  String get presetSuperfastLabel => 'Superschnell';

  @override
  String get presetSuperfastDesc => 'Sehr schnelle Kodierung.';

  @override
  String get presetVeryfastLabel => 'Sehr Schnell';

  @override
  String get presetVeryfastDesc => 'Schneller als der Durchschnitt.';

  @override
  String get presetFasterLabel => 'Schneller';

  @override
  String get presetFasterDesc => 'Gute Geschwindigkeit und Komprimierung.';

  @override
  String get presetFastLabel => 'Schnell';

  @override
  String get presetFastDesc =>
      'Hervorragende Balance zwischen Voreinstellung und Größe.';

  @override
  String get presetMediumLabel => 'Mittel';

  @override
  String get presetMediumDesc => 'Standard-Balance.';

  @override
  String get presetSlowLabel => 'Langsam';

  @override
  String get presetSlowDesc => 'Langsamer, erzeugt aber kleinere Dateien.';

  @override
  String get presetVeryslowLabel => 'Sehr Langsam';

  @override
  String get presetVeryslowDesc => 'Maximale Größenreduzierung.';

  @override
  String get videoCodecTitle => 'Video-Codec';

  @override
  String get codecH264Label => 'H.264';

  @override
  String get codecH264Desc => 'Maximale Kompatibilität.';

  @override
  String get codecH265Label => 'H.265 / HEVC';

  @override
  String get codecH265Desc => 'Bessere Komprimierungseffizienz.';

  @override
  String get codecAv1Label => 'AV1';

  @override
  String get codecAv1Desc =>
      'Codec der nächsten Generation (30% kleiner als H.265).';

  @override
  String get hardwareEncoderTitle => 'Hardware-Beschleunigung (GPU)';

  @override
  String get hwSoftwareLabel => 'Software (CPU)';

  @override
  String get hwSoftwareDesc => 'Langsamer, aber höchste Kompatibilität.';

  @override
  String get hwNvidiaLabel => 'Nvidia (NVENC)';

  @override
  String get hwNvidiaDesc => 'Ultraschnelle Kodierung für Nvidia GPUs.';

  @override
  String get hwAmdLabel => 'AMD (AMF)';

  @override
  String get hwAmdDesc => 'Ultraschnelle Kodierung für AMD GPUs.';

  @override
  String get hwIntelLabel => 'Intel (QSV)';

  @override
  String get hwIntelDesc => 'Ultraschnelle Kodierung für Intel GPUs.';

  @override
  String get resolutionTitle => 'Maximale Auflösung';

  @override
  String get resOriginalLabel => 'Original';

  @override
  String get resOriginalDesc => 'Originalauflösung beibehalten.';

  @override
  String get res4kLabel => '4K';

  @override
  String get res4kDesc => 'Auf max. 4K herunterskalieren.';

  @override
  String get res2kLabel => '2K';

  @override
  String get res2kDesc => 'Auf max. 2K herunterskalieren.';

  @override
  String get res1080pLabel => '1080p';

  @override
  String get res1080pDesc => 'Auf max. 1080p Full HD herunterskalieren.';

  @override
  String get res720pLabel => '720p';

  @override
  String get res720pDesc => 'Auf max. 720p HD herunterskalieren.';

  @override
  String get res480pLabel => '480p';

  @override
  String get res480pDesc => 'Auf max. 480p herunterskalieren.';

  @override
  String get res360pLabel => '360p';

  @override
  String get res360pDesc => 'Maximale Komprimierung.';

  @override
  String get frameRateTitle => 'Bildfrequenz (FPS)';

  @override
  String get fpsOriginalLabel => 'Original';

  @override
  String get fpsOriginalDesc => 'Gleiche Bildfrequenz wie die Quelle.';

  @override
  String get fps60Label => '60 fps';

  @override
  String get fps60Desc => 'Flüssig für Spiele oder Sport.';

  @override
  String get fps30Label => '30 fps';

  @override
  String get fps30Desc => 'Standard für meiste Videos.';

  @override
  String get fps24Label => '24 fps';

  @override
  String get fps24Desc => 'Kinoseitiger Look.';

  @override
  String get enableVideoDenoiseTitle => 'Videorauschen Entfernen';

  @override
  String get enableVideoDenoiseDesc => '3D-Filter zur Entfernung von Körnung.';

  @override
  String get exportFormatTitle => 'Exportformat';

  @override
  String get exportVideoLabel => 'Standardvideo';

  @override
  String get exportVideoDesc => 'Als MP4/MKV/MOV exportieren';

  @override
  String get exportGifLabel => 'Animiertes GIF';

  @override
  String get exportGifDesc => 'Hochwertiges animiertes GIF erstellen';

  @override
  String get exportMp3Label => 'MP3 Extrahieren';

  @override
  String get exportMp3Desc => 'Audio als 320kbps MP3 extrahieren';

  @override
  String get exportAacLabel => 'AAC Extrahieren';

  @override
  String get exportAacDesc => 'Audio als AAC extrahieren';

  @override
  String get exportWavLabel => 'WAV Extrahieren';

  @override
  String get exportWavDesc => 'Unkomprimiertes WAV-Audio extrahieren';

  @override
  String get privacyScrubbingTitle => 'Datenschutz & GPS';

  @override
  String get keepMetadataLabel => 'Metadaten Behalten';

  @override
  String get stripGpsExifLabel => 'GPS/EXIF Entfernen';

  @override
  String get stripGpsExifInfoTitle => 'Metadaten Bereinigen';

  @override
  String get stripGpsExifInfoDesc =>
      'Entfernt Kamerainformationen und GPS-Ortung.';

  @override
  String get keepMetadataInfoDesc => 'Bewahrt alle ursprünglichen Metadaten.';

  @override
  String get autoCropBlackBarsTitle => 'Automatisch Zuschneiden';

  @override
  String get autoCropLabel => 'Auto-Zuschneiden';

  @override
  String get autoCropActiveTitle => 'Auto-Zuschneiden Aktiv';

  @override
  String get autoCropActiveDesc => 'Entfernt schwarze Ränder automatisch.';

  @override
  String get autoCropDisabledDesc => 'Behält ursprüngliche Ränder bei.';

  @override
  String get playbackSpeedTitle => 'Wiedergabegeschwindigkeit';

  @override
  String get speedOriginalLabel => '1.0x';

  @override
  String get speedOriginalDesc => 'Normale Geschwindigkeit';

  @override
  String get speedSlow05Label => '0.5x Zeitlupe';

  @override
  String get speedSlow05Desc => 'Halbe Geschwindigkeit';

  @override
  String get speedFast15Label => '1.5x';

  @override
  String get speedFast15Desc => '1.5x Geschwindigkeit';

  @override
  String get speedFast20Label => '2.0x Schnell';

  @override
  String get speedFast20Desc => 'Doppelte Geschwindigkeit';

  @override
  String get speedTimelapse40Label => '4.0x Zeitraffer';

  @override
  String get speedTimelapse40Desc => '4x Zeitraffer-Geschwindigkeit';

  @override
  String get canvasAspectRatioTitle => 'Seitenverhältnis';

  @override
  String get aspectOriginalLabel => 'Original';

  @override
  String get aspectOriginalDesc => 'Originalabmessungen beibehalten';

  @override
  String get aspectShortsLabel => '9:16 Shorts';

  @override
  String get aspectShortsDesc => 'Für TikTok und Reels';

  @override
  String get aspectSquareLabel => '1:1 Quadrat';

  @override
  String get aspectSquareDesc => 'Für Instagram Beiträge';

  @override
  String get aspectPortraitLabel => '4:5 Hochformat';

  @override
  String get aspectPortraitDesc => 'Für Instagram vertikal';

  @override
  String get aspectWidescreenLabel => '16:9 Breitbild';

  @override
  String get aspectWidescreenDesc => 'Für YouTube und Fernseher';

  @override
  String get aspectClassicLabel => '4:3 Klassisch';

  @override
  String get aspectClassicDesc => 'Für klassische Bildschirme';

  @override
  String get aspectCinemaLabel => '21:9 Kino';

  @override
  String get aspectCinemaDesc => 'Für Ultrawide-Monitore';

  @override
  String get aspectCustomLabel => 'Benutzerdefiniert';

  @override
  String get aspectCustomDesc => 'Benutzerdefiniertes Seitenverhältnis';

  @override
  String get customRatioTooltip => 'Z.B. 16:10, 2:1';

  @override
  String get rotationFlipTitle => 'Drehung & Spiegelung';

  @override
  String get rotOriginalLabel => 'Original (0°)';

  @override
  String get rotOriginalDesc => 'Originalausrichtung beibehalten';

  @override
  String get rot90Label => '90° Rechts';

  @override
  String get rot90Desc => 'Um 90 Grad nach rechts drehen';

  @override
  String get rot180Label => '180° Drehen';

  @override
  String get rot180Desc => 'Auf den Kopf stellen';

  @override
  String get rot270Label => '270° Links';

  @override
  String get rot270Desc => 'Um 90 Grad nach links drehen';

  @override
  String get rotFlipHLabel => 'Horiz. Spiegeln';

  @override
  String get rotFlipHDesc => 'Horizontal spiegeln';

  @override
  String get rotFlipVLabel => 'Vert. Spiegeln';

  @override
  String get rotFlipVDesc => 'Vertikal spiegeln';

  @override
  String get rotCustomLabel => 'Winkel Anpassen';

  @override
  String get rotCustomDesc => 'Um bestimmten Winkel drehen';

  @override
  String get customRotationTooltip => 'Winkel in Grad z.B. 45';

  @override
  String get trimVideoTitle => 'Video Schneiden';

  @override
  String get fullVideoLabel => 'Gesamtes Video';

  @override
  String get cutClipLabel => 'Clip Schneiden';

  @override
  String get trimStartLabel => 'Start';

  @override
  String get trimEndLabel => 'Ende';

  @override
  String get trimActiveTitle => 'Schnitt Aktiv';

  @override
  String get fullVideoDesc => 'Gesamtes Video ohne Schnitt verarbeiten.';

  @override
  String get audioModeTitle => 'Audio-Spur Modus';

  @override
  String get audioOriginalLabel => 'Original';

  @override
  String get audioOriginalDesc => 'Kein Qualitätsverlust beim Audio.';

  @override
  String get audioAac256Label => 'Hohe Qualität';

  @override
  String get audioAac256Desc => 'AAC 256kbps';

  @override
  String get audioAac128Label => 'Ausgewogen';

  @override
  String get audioAac128Desc => 'AAC 128kbps (Web-Standard)';

  @override
  String get audioAac64Label => 'Niedrige Qualität';

  @override
  String get audioAac64Desc => 'AAC 64kbps für Sprachaufnahmen';

  @override
  String get audioMuteLabel => 'Stummschalten';

  @override
  String get audioMuteDesc => 'Tonspur komplett entfernen.';

  @override
  String get audioNormTitle => 'Lautstärke-Normalisierung';

  @override
  String get audioNormOffLabel => 'Aus';

  @override
  String get audioNormOffDesc => 'Original-Dynamik beibehalten.';

  @override
  String get audioNormSpeechLabel => 'Menschliche Stimme';

  @override
  String get audioNormSpeechDesc => 'EBU R128 für klaren Dialog.';

  @override
  String get audioNormDynamicLabel => 'Dynamisches Kino';

  @override
  String get audioNormDynamicDesc => 'Gleicht leise und laute Szenen aus.';

  @override
  String get audioNormBoostLabel => 'Sanfte Anhebung';

  @override
  String get audioNormBoostDesc => '+3dB Lautstärkeanhebung.';

  @override
  String get audioChanTitle => 'Audio-Kanäle';

  @override
  String get audioChanOriginalLabel => 'Original';

  @override
  String get audioChanOriginalDesc => 'Quellkanäle beibehalten.';

  @override
  String get audioChanStereoLabel => 'Stereo (2.0)';

  @override
  String get audioChanStereoDesc => '2-Kanal Stereo-Kompatibilität.';

  @override
  String get audioChanMonoLabel => 'Mono (1.0)';

  @override
  String get audioChanMonoDesc => 'Einziger Kanal - 50% Ersparnis beim Ton.';

  @override
  String get removeNoiseLabel => 'Rauschen Entfernen';

  @override
  String get enableAudioDenoiseTitle => 'Mikrofonrauschen Entfernen';

  @override
  String get enableAudioDenoiseDesc => 'Filter gegen Hintergrundrauschen.';

  @override
  String get outputDirectoryTitle => 'Ausgabeordner';

  @override
  String get defaultOutputDirectory => 'Standard (Neben Originaldatei)';

  @override
  String get selectOutputFolderTitle => 'Ordner Auswählen';

  @override
  String get clearOutputFolder => 'Eigenen Ordner zurücksetzen';

  @override
  String get changeBtn => 'Ändern';

  @override
  String get outputLocationTitle => 'Ausgabeverhalten';

  @override
  String get outputLocationUnifiedLabel => 'Einheitlicher Ordner';

  @override
  String get outputLocationUnifiedDesc =>
      'Alle komprimierten Videos in einen Ordner.';

  @override
  String get outputLocationSameLabel => 'Gleicher Ordner';

  @override
  String get outputLocationSameDesc =>
      'Jedes Video neben der Quelldatei speichern.';

  @override
  String get fileManagementTitle => 'Dateiverwaltung';

  @override
  String get keepOriginalsLabel => 'Originale Behalten';

  @override
  String get keepOriginalsDesc => 'Originaldateien unangetastet lassen.';

  @override
  String get toRecycleBinLabel => 'In den Papierkorb';

  @override
  String get toRecycleBinDesc =>
      'Originale nach Komprimierung in Papierkorb verschieben.';

  @override
  String get outputFormatTitle => 'Containerformat';

  @override
  String get formatOriginalLabel => 'Original';

  @override
  String get formatOriginalDesc => 'Originalformat beibehalten.';

  @override
  String get formatMp4Label => 'MP4';

  @override
  String get formatMp4Desc => 'Maximale Kompatibilität.';

  @override
  String get formatMkvLabel => 'MKV';

  @override
  String get formatMkvDesc => 'Unterstützung für mehrere Spuren.';

  @override
  String get formatMovLabel => 'MOV';

  @override
  String get formatMovDesc => 'Apple QuickTime Format.';

  @override
  String get scanningFilesMsg => 'Dateien werden gescannt...';

  @override
  String get addFilesBtn => 'Dateien Hinzufügen';

  @override
  String get addFolderBtn => 'Ordner Hinzufügen';

  @override
  String get dragDropMoreMsg => 'Oder weitere Videos hierher ziehen';

  @override
  String get openOutputFolderTooltip => 'Ausgabeordner Öffnen';

  @override
  String get statusQueued => 'In Warteschlange';

  @override
  String get statusAnalyzing => 'Analysieren';

  @override
  String get statusCompressing => 'Komprimieren';

  @override
  String get statusDone => 'Fertig';

  @override
  String get statusFailed => 'Fehlgeschlagen';

  @override
  String get statusCancelled => 'Abgebrochen';

  @override
  String get savedPrefix => 'Gespart';

  @override
  String get largerSuffix => 'Größer';

  @override
  String get largerSizeWarning =>
      'Ausgabegröße kann größer sein als das Original.';

  @override
  String get clearCompletedBtn => 'Abgeschlossene Löschen';

  @override
  String get clearAllBtn => 'Alle Löschen';

  @override
  String get stopAllBtn => 'Alle Stoppen';

  @override
  String get startCompressionBtn => 'Komprimierung Starten';

  @override
  String get allDoneLabel => 'Alles Erledigt!';

  @override
  String get openFolderBtn => 'Ordner Öffnen';

  @override
  String get totalEtaLabel => 'Verbleibende Zeit';

  @override
  String get totalSavedLabel => 'Gesamt Gespart';

  @override
  String get videoSingle => 'Video';

  @override
  String get videosPlural => 'Videos';

  @override
  String get releaseToAddVideosMsg => 'Loslassen zum Hinzufügen';

  @override
  String get dragDropHereMsg => 'Dateien oder Ordner hierher ziehen';

  @override
  String get supportedFormatsMsg => 'Unterstützt MP4, MKV, MOV, AVI, WMV';

  @override
  String get selectFilesBtn => 'Dateien Auswählen';

  @override
  String get selectFolderBtn => 'Ordner Auswählen';

  @override
  String get releaseToShrinkTitle => 'Loslassen zum Komprimieren';

  @override
  String get filesWillBeAddedDesc => 'Dateien werden zur Liste hinzugefügt.';

  @override
  String get disabledLabel => 'Deaktiviert';

  @override
  String get compressionInProgressTitle => 'Komprimierung läuft';

  @override
  String get confirmCloseDesc => 'Möchten Sie Shrinkeo wirklich schließen?';

  @override
  String get keepCompressingBtn => 'Komprimierung Fortsetzen';

  @override
  String get closeAppBtn => 'App Schließen';

  @override
  String get lockedSettingsWarning => 'Während der Komprimierung gesperrt';

  @override
  String get updateRequiredTitle => 'Update Erforderlich';

  @override
  String get updateRequiredDescNewVersion =>
      'Neue Version von Shrinkeo ist verfügbar.';

  @override
  String get updateRequiredDescOldVersion =>
      'Ihre Version wird nicht mehr unterstützt.';

  @override
  String get updateNowBtn => 'Jetzt Aktualisieren';

  @override
  String get laterBtn => 'Später';

  @override
  String get updateAvailableTitle => 'Update Verfügbar';

  @override
  String get whatsNewTitle => 'Was gibt\'s Neues:';

  @override
  String get exitAppBtn => 'Beenden';

  @override
  String get retryBtn => 'Wiederholen';

  @override
  String get downloadFromWebsiteBtn => 'Von Website Herunterladen';

  @override
  String get skipUpdateConfirmTitle => 'Update überspringen?';

  @override
  String get skipUpdateConfirmDesc =>
      'Dieses Update enthält wichtige Fehlerbehebungen.';

  @override
  String get skipUpdateCancelBtn => 'Abbrechen';

  @override
  String get skipUpdateConfirmBtn => 'Update überspringen';

  @override
  String get maintenanceTitle => 'Wartung';

  @override
  String get maintenanceDescDefault => 'Shrinkeo wird derzeit gewartet.';

  @override
  String versionAvailableMsg(String version) {
    return 'Version $version ist verfügbar.';
  }

  @override
  String get hwEncoderNotSupportedTitle =>
      'Hardwarebeschleunigung nicht unterstützt';

  @override
  String get failedCreateFolderError =>
      'Ausgabeordner konnte nicht erstellt werden';

  @override
  String get failedProbeDurationError => 'Dauer konnte nicht ermittelt werden';

  @override
  String get ffmpegNotFoundGlobalError => 'FFmpeg wurde nicht gefunden.';

  @override
  String get ffmpegMissingError =>
      'FFmpeg oder FFprobe fehlt oder ist beschädigt.';

  @override
  String hwFallbackNotificationBody(String encoderLabel) {
    return '$encoderLabel fehlgeschlagen. Auf CPU umgestellt.';
  }

  @override
  String get failedDownloadUpdateMsg =>
      'Update-Download fehlgeschlagen. Bitte versuchen Sie es erneut.';

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
