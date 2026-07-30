// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get appName => 'Shrinkeo';

  @override
  String get totalSpaceSaved => 'Spazio totale risparmiato';

  @override
  String get savedSpacePrefix => 'Risparmiato:';

  @override
  String get supportButtonText => 'Sostieni il progetto';

  @override
  String get lightThemeTooltip => 'Tema Chiaro';

  @override
  String get darkThemeTooltip => 'Tema Scuro';

  @override
  String get settingsTooltip => 'Impostazioni';

  @override
  String get minimizeTooltip => 'Riduci a icona';

  @override
  String get closeTooltip => 'Chiudi';

  @override
  String get restoreTooltip => 'Ripristina';

  @override
  String get maximizeTooltip => 'Ingrandisci';

  @override
  String get tabCompressionQuality => 'Compressione e Qualità';

  @override
  String get tabVideoEditingTools => 'Modifica e Strumenti';

  @override
  String get tabAudioSettings => 'Impostazioni Audio';

  @override
  String get tabEngineOutput => 'Motore e Destinazione';

  @override
  String get compressionSettingsTitle => 'Impostazioni di Compressione';

  @override
  String get resetToDefaults => 'Ripristina predefiniti';

  @override
  String get resetDefaultTooltip => 'Ripristina valori iniziali';

  @override
  String get modeTargetSizeTitle => 'Modalità di Compressione';

  @override
  String get modeCrfLabel => 'Qualità (CRF)';

  @override
  String get modeTargetSizeLabel => 'Dimensione Obiettivo (MB)';

  @override
  String get crfQualityTitle => 'Qualità CRF';

  @override
  String get crfLossless => 'Senza perdite';

  @override
  String get crfHighQuality => 'Alta qualità';

  @override
  String get crfBalanced => 'Equilibrato';

  @override
  String get crfHighCompression => 'Alta compressione';

  @override
  String get crfLowQuality => 'Bassa qualità';

  @override
  String get crfUltraCompressed => 'Ultra compresso';

  @override
  String get targetSizeLabel => 'Dimensione File Obiettivo (MB)';

  @override
  String get targetSizeDesc =>
      'Calcola il bitrate per rientrare nella dimensione limite.';

  @override
  String get encodingSpeedTitle => 'Velocità di Codifica';

  @override
  String get presetUltrafastLabel => 'Ultrafast';

  @override
  String get presetUltrafastDesc => 'Massima velocità, minore riduzione.';

  @override
  String get presetSuperfastLabel => 'Superfast';

  @override
  String get presetSuperfastDesc => 'Codifica molto veloce.';

  @override
  String get presetVeryfastLabel => 'Very Fast';

  @override
  String get presetVeryfastDesc => 'Più veloce della media.';

  @override
  String get presetFasterLabel => 'Faster';

  @override
  String get presetFasterDesc => 'Buona velocità e compressione.';

  @override
  String get presetFastLabel => 'Veloce';

  @override
  String get presetFastDesc => 'Ottimo equilibrio velocità/dimensione.';

  @override
  String get presetMediumLabel => 'Medium';

  @override
  String get presetMediumDesc => 'Bilanciamento predefinito.';

  @override
  String get presetSlowLabel => 'Slow';

  @override
  String get presetSlowDesc => 'Più lento ma file più piccoli.';

  @override
  String get presetVeryslowLabel => 'Very Slow';

  @override
  String get presetVeryslowDesc => 'Massima riduzione delle dimensioni.';

  @override
  String get videoCodecTitle => 'Codec Video';

  @override
  String get codecH264Label => 'H.264';

  @override
  String get codecH264Desc => 'Massima compatibilità.';

  @override
  String get codecH265Label => 'H.265 / HEVC';

  @override
  String get codecH265Desc => 'Migliore efficienza di compressione.';

  @override
  String get codecAv1Label => 'AV1';

  @override
  String get codecAv1Desc =>
      'Codec di nuova generazione (30% più piccolo di H.265).';

  @override
  String get hardwareEncoderTitle => 'Accelerazione Hardware (GPU)';

  @override
  String get hwSoftwareLabel => 'Software (CPU)';

  @override
  String get hwSoftwareDesc => 'Più lento ma massima compatibilità.';

  @override
  String get hwNvidiaLabel => 'Nvidia (NVENC)';

  @override
  String get hwNvidiaDesc => 'Codifica ultraveloce per GPU Nvidia.';

  @override
  String get hwAmdLabel => 'AMD (AMF)';

  @override
  String get hwAmdDesc => 'Codifica ultraveloce per GPU AMD.';

  @override
  String get hwIntelLabel => 'Intel (QSV)';

  @override
  String get hwIntelDesc => 'Codifica ultraveloce per GPU Intel.';

  @override
  String get resolutionTitle => 'Risoluzione Massima';

  @override
  String get resOriginalLabel => 'Originale';

  @override
  String get resOriginalDesc => 'Mantiene la risoluzione originale.';

  @override
  String get res4kLabel => '4K';

  @override
  String get res4kDesc => 'Riduci a max 4K.';

  @override
  String get res2kLabel => '2K';

  @override
  String get res2kDesc => 'Riduci a max 2K.';

  @override
  String get res1080pLabel => '1080p';

  @override
  String get res1080pDesc => 'Riduci a max 1080p Full HD.';

  @override
  String get res720pLabel => '720p';

  @override
  String get res720pDesc => 'Riduci a max 720p HD.';

  @override
  String get res480pLabel => '480p';

  @override
  String get res480pDesc => 'Riduci a max 480p.';

  @override
  String get res360pLabel => '360p';

  @override
  String get res360pDesc => 'Massima compressione.';

  @override
  String get frameRateTitle => 'Frequenza Fotogrammi (FPS)';

  @override
  String get fpsOriginalLabel => 'Originale';

  @override
  String get fpsOriginalDesc => 'Stesso FPS della sorgente.';

  @override
  String get fps60Label => '60 fps';

  @override
  String get fps60Desc => 'Ultra fluido per giochi o sport.';

  @override
  String get fps30Label => '30 fps';

  @override
  String get fps30Desc => 'Standard per la maggior parte dei video.';

  @override
  String get fps24Label => '24 fps';

  @override
  String get fps24Desc => 'Aspetto cinematografico.';

  @override
  String get enableVideoDenoiseTitle => 'Pulizia Rumore Video';

  @override
  String get enableVideoDenoiseDesc =>
      'Filtro 3D per ridurre la grana del video.';

  @override
  String get exportFormatTitle => 'Formato di Esportazione';

  @override
  String get exportVideoLabel => 'Video Standard';

  @override
  String get exportVideoDesc => 'Esporta in MP4/MKV/MOV';

  @override
  String get exportGifLabel => 'GIF Animata';

  @override
  String get exportGifDesc => 'Crea GIF animata ad alta qualità';

  @override
  String get exportMp3Label => 'Estrai MP3';

  @override
  String get exportMp3Desc => 'Estrai audio come MP3 320kbps';

  @override
  String get exportAacLabel => 'Estrai AAC';

  @override
  String get exportAacDesc => 'Estrai audio come AAC';

  @override
  String get exportWavLabel => 'Estrai WAV';

  @override
  String get exportWavDesc => 'Estrai audio WAV non compresso';

  @override
  String get privacyScrubbingTitle => 'Privacy & GPS';

  @override
  String get keepMetadataLabel => 'Conserva Metadati';

  @override
  String get stripGpsExifLabel => 'Rimuovi GPS/EXIF';

  @override
  String get stripGpsExifInfoTitle => 'Rimuovi Metadati';

  @override
  String get stripGpsExifInfoDesc =>
      'Rimuove informazioni su fotocamera e coordinate GPS.';

  @override
  String get keepMetadataInfoDesc => 'Conserva tutti i metadati originali.';

  @override
  String get autoCropBlackBarsTitle => 'Ritaglio Automatico';

  @override
  String get autoCropLabel => 'Ritaglio Auto';

  @override
  String get autoCropActiveTitle => 'Ritaglio Attivo';

  @override
  String get autoCropActiveDesc => 'Rimuove automaticamente le bande nere.';

  @override
  String get autoCropDisabledDesc => 'Mantiene i bordi originali.';

  @override
  String get playbackSpeedTitle => 'Velocità di Riproduzione';

  @override
  String get speedOriginalLabel => '1.0x';

  @override
  String get speedOriginalDesc => 'Velocità normale';

  @override
  String get speedSlow05Label => '0.5x Lento';

  @override
  String get speedSlow05Desc => 'Riproduzione a metà velocità';

  @override
  String get speedFast15Label => '1.5x';

  @override
  String get speedFast15Desc => 'Accelerazione 1.5x';

  @override
  String get speedFast20Label => '2.0x Veloce';

  @override
  String get speedFast20Desc => 'Doppia velocità';

  @override
  String get speedTimelapse40Label => '4.0x Timelapse';

  @override
  String get speedTimelapse40Desc => 'Velocità 4x per timelapse';

  @override
  String get canvasAspectRatioTitle => 'Rapporto d\'Aspetto';

  @override
  String get aspectOriginalLabel => 'Originale';

  @override
  String get aspectOriginalDesc => 'Mantiene proporzioni originali';

  @override
  String get aspectShortsLabel => '9:16 Shorts';

  @override
  String get aspectShortsDesc => 'Per TikTok e Reels';

  @override
  String get aspectSquareLabel => '1:1 Quadrato';

  @override
  String get aspectSquareDesc => 'Per post Instagram';

  @override
  String get aspectPortraitLabel => '4:5 Ritratto';

  @override
  String get aspectPortraitDesc => 'Per Instagram verticale';

  @override
  String get aspectWidescreenLabel => '16:9 Widescreen';

  @override
  String get aspectWidescreenDesc => 'Per YouTube e TV';

  @override
  String get aspectClassicLabel => '4:3 Classico';

  @override
  String get aspectClassicDesc => 'Per schermi classici';

  @override
  String get aspectCinemaLabel => '21:9 Cinema';

  @override
  String get aspectCinemaDesc => 'Per monitor ultrawide';

  @override
  String get aspectCustomLabel => 'Personalizzato';

  @override
  String get aspectCustomDesc => 'Rapporto d\'aspetto personalizzato';

  @override
  String get customRatioTooltip => 'Es: 16:10, 2:1';

  @override
  String get rotationFlipTitle => 'Rotazione e Specchio';

  @override
  String get rotOriginalLabel => 'Originale (0°)';

  @override
  String get rotOriginalDesc => 'Mantiene orientamento originale';

  @override
  String get rot90Label => '90° Orario';

  @override
  String get rot90Desc => 'Ruota di 90 gradi a destra';

  @override
  String get rot180Label => '180° Capovolgi';

  @override
  String get rot180Desc => 'Ruota sottosopra';

  @override
  String get rot270Label => '270° Antiorario';

  @override
  String get rot270Desc => 'Ruota di 90 gradi a sinistra';

  @override
  String get rotFlipHLabel => 'Rifletti Orizz.';

  @override
  String get rotFlipHDesc => 'Specchia orizzontalmente';

  @override
  String get rotFlipVLabel => 'Rifletti Vert.';

  @override
  String get rotFlipVDesc => 'Specchia verticalmente';

  @override
  String get rotCustomLabel => 'Angolo Personalizzato';

  @override
  String get rotCustomDesc => 'Ruota per angolo specifico';

  @override
  String get customRotationTooltip => 'Angolo in gradi es. 45';

  @override
  String get trimVideoTitle => 'Taglia Video';

  @override
  String get fullVideoLabel => 'Video Intero';

  @override
  String get cutClipLabel => 'Taglia Clip';

  @override
  String get trimStartLabel => 'Inizio';

  @override
  String get trimEndLabel => 'Fine';

  @override
  String get trimActiveTitle => 'Taglio Attivo';

  @override
  String get fullVideoDesc => 'Elabora l\'intero video senza tagliare.';

  @override
  String get audioModeTitle => 'Modalità Traccia Audio';

  @override
  String get audioOriginalLabel => 'Originale';

  @override
  String get audioOriginalDesc => 'Nessuna perdita di qualità audio.';

  @override
  String get audioAac256Label => 'Alta Qualità';

  @override
  String get audioAac256Desc => 'AAC 256kbps';

  @override
  String get audioAac128Label => 'Bilanciato';

  @override
  String get audioAac128Desc => 'AAC 128kbps (Standard Web)';

  @override
  String get audioAac64Label => 'Bassa Qualità';

  @override
  String get audioAac64Desc => 'AAC 64kbps per voce';

  @override
  String get audioMuteLabel => 'Disattiva Audio';

  @override
  String get audioMuteDesc => 'Rimuovi completamente la traccia audio.';

  @override
  String get audioNormTitle => 'Normalizzazione Volume';

  @override
  String get audioNormOffLabel => 'Disattivato';

  @override
  String get audioNormOffDesc => 'Volume dinamico originale.';

  @override
  String get audioNormSpeechLabel => 'Voce Umana';

  @override
  String get audioNormSpeechDesc => 'EBU R128 per dialoghi chiari.';

  @override
  String get audioNormDynamicLabel => 'Cinema Dinamico';

  @override
  String get audioNormDynamicDesc => 'Livella i suoni bassi e alti.';

  @override
  String get audioNormBoostLabel => 'Incremento Lieve';

  @override
  String get audioNormBoostDesc => '+3dB di incremento volume.';

  @override
  String get audioChanTitle => 'Canali Audio';

  @override
  String get audioChanOriginalLabel => 'Originale';

  @override
  String get audioChanOriginalDesc => 'Conserva canali sorgente.';

  @override
  String get audioChanStereoLabel => 'Stereo (2.0)';

  @override
  String get audioChanStereoDesc => 'Compatibilità stereo 2 canali.';

  @override
  String get audioChanMonoLabel => 'Mono (1.0)';

  @override
  String get audioChanMonoDesc => 'Canale singolo - 50% risparmio audio.';

  @override
  String get removeNoiseLabel => 'Rimuovi Rumore';

  @override
  String get enableAudioDenoiseTitle => 'Rimuovi Rumore Microfono';

  @override
  String get enableAudioDenoiseDesc => 'Filtro contro il fruscio di fondo.';

  @override
  String get outputDirectoryTitle => 'Cartella di Destinazione';

  @override
  String get defaultOutputDirectory => 'Predefinita (Accanto all\'originale)';

  @override
  String get selectOutputFolderTitle => 'Seleziona Cartella';

  @override
  String get clearOutputFolder => 'Usa posizione predefinita';

  @override
  String get changeBtn => 'Cambia';

  @override
  String get outputLocationTitle => 'Comportamento Salvataggio';

  @override
  String get outputLocationUnifiedLabel => 'Cartella Unica';

  @override
  String get outputLocationUnifiedDesc =>
      'Tutti i video in un\'unica cartella.';

  @override
  String get outputLocationSameLabel => 'Accanto all\'Originale';

  @override
  String get outputLocationSameDesc => 'Ogni video accanto al file sorgente.';

  @override
  String get fileManagementTitle => 'Gestione File';

  @override
  String get keepOriginalsLabel => 'Mantieni Originali';

  @override
  String get keepOriginalsDesc => 'Lascia intatti i file originali.';

  @override
  String get toRecycleBinLabel => 'Nel Cestino';

  @override
  String get toRecycleBinDesc =>
      'Sposta gli originali nel cestino dopo la compressione.';

  @override
  String get outputFormatTitle => 'Formato Contenitore';

  @override
  String get formatOriginalLabel => 'Originale';

  @override
  String get formatOriginalDesc => 'Mantiene formato originale.';

  @override
  String get formatMp4Label => 'MP4';

  @override
  String get formatMp4Desc => 'Massima compatibilità.';

  @override
  String get formatMkvLabel => 'MKV';

  @override
  String get formatMkvDesc => 'Supporto per tracce multiple.';

  @override
  String get formatMovLabel => 'MOV';

  @override
  String get formatMovDesc => 'Formato Apple QuickTime.';

  @override
  String get scanningFilesMsg => 'Scansione dei file in corso...';

  @override
  String get addFilesBtn => 'Aggiungi File';

  @override
  String get addFolderBtn => 'Aggiungi Cartella';

  @override
  String get dragDropMoreMsg => 'O trascina e rilascia altri video qui';

  @override
  String get openOutputFolderTooltip => 'Apri Cartella di Destinazione';

  @override
  String get statusQueued => 'In coda';

  @override
  String get statusAnalyzing => 'Analisi';

  @override
  String get statusCompressing => 'Compressione';

  @override
  String get statusDone => 'Completato';

  @override
  String get statusFailed => 'Fallito';

  @override
  String get statusCancelled => 'Annullato';

  @override
  String get savedPrefix => 'Risparmiato';

  @override
  String get largerSuffix => 'Più grande';

  @override
  String get largerSizeWarning =>
      'La dimensione finale potrebbe essere maggiore dell\'originale.';

  @override
  String get clearCompletedBtn => 'Rimuovi Completati';

  @override
  String get clearAllBtn => 'Rimuovi Tutti';

  @override
  String get stopAllBtn => 'Interrompi Tutti';

  @override
  String get startCompressionBtn => 'Avvia Compressione';

  @override
  String get allDoneLabel => 'Tutto Pronto!';

  @override
  String get openFolderBtn => 'Apri Cartella';

  @override
  String get totalEtaLabel => 'Tempo Rimanente';

  @override
  String get totalSavedLabel => 'Totale Risparmiato';

  @override
  String get videoSingle => 'video';

  @override
  String get videosPlural => 'video';

  @override
  String get releaseToAddVideosMsg => 'Rilascia per aggiungere video';

  @override
  String get dragDropHereMsg => 'Trascina e rilascia file o cartelle qui';

  @override
  String get supportedFormatsMsg => 'Supporta MP4, MKV, MOV, AVI, WMV';

  @override
  String get selectFilesBtn => 'Seleziona File';

  @override
  String get selectFolderBtn => 'Seleziona Cartella';

  @override
  String get releaseToShrinkTitle => 'Rilascia per comprimere';

  @override
  String get filesWillBeAddedDesc => 'I file verranno aggiunti alla coda.';

  @override
  String get disabledLabel => 'Disabilitato';

  @override
  String get compressionInProgressTitle => 'Compressione in corso';

  @override
  String get confirmCloseDesc => 'Sei sicuro di voler chiudere Shrinkeo?';

  @override
  String get keepCompressingBtn => 'Continua Compressione';

  @override
  String get closeAppBtn => 'Chiudi App';

  @override
  String get lockedSettingsWarning => 'Bloccato durante la compressione';

  @override
  String get updateRequiredTitle => 'Aggiornamento Richiesto';

  @override
  String get updateRequiredDescNewVersion => 'Nuova versione disponibile.';

  @override
  String get updateRequiredDescOldVersion =>
      'La tua versione non è più supportata.';

  @override
  String get updateNowBtn => 'Aggiorna Ora';

  @override
  String get laterBtn => 'Più tardi';

  @override
  String get updateAvailableTitle => 'Aggiornamento Disponibile';

  @override
  String get whatsNewTitle => 'Novità:';

  @override
  String get exitAppBtn => 'Esci';

  @override
  String get retryBtn => 'Riprova';

  @override
  String get downloadFromWebsiteBtn => 'Scarica dal Sito Web';

  @override
  String get skipUpdateConfirmTitle => 'Ignorare aggiornamento?';

  @override
  String get skipUpdateConfirmDesc =>
      'Questo aggiornamento contiene correzioni critiche.';

  @override
  String get skipUpdateCancelBtn => 'Annulla';

  @override
  String get skipUpdateConfirmBtn => 'Ignora aggiornamento';

  @override
  String get maintenanceTitle => 'Manutenzione';

  @override
  String get maintenanceDescDefault =>
      'Shrinkeo è attualmente in manutenzione.';

  @override
  String versionAvailableMsg(String version) {
    return 'Versione $version disponibile.';
  }

  @override
  String get hwEncoderNotSupportedTitle => 'Accelerazione non supportata';

  @override
  String get failedCreateFolderError => 'Impossibile creare cartella';

  @override
  String get failedProbeDurationError => 'Impossibile calcolare durata';

  @override
  String get ffmpegNotFoundGlobalError => 'FFmpeg non trovato.';

  @override
  String get ffmpegMissingError => 'FFmpeg o FFprobe mancante o danneggiato.';

  @override
  String hwFallbackNotificationBody(String encoderLabel) {
    return '$encoderLabel fallito. Passato a CPU.';
  }

  @override
  String get failedDownloadUpdateMsg =>
      'Download dell\'aggiornamento non riuscito. Riprova.';

  @override
  String customRatioActiveTitle(Object ratio) {
    return 'Rapporto personalizzato ($ratio)';
  }

  @override
  String customRatioActiveDesc(Object ratio) {
    return 'Inquadratura adattata al rapporto personalizzato ($ratio).';
  }

  @override
  String customAngleActiveTitle(Object angle) {
    return 'Angolo personalizzato ($angle°)';
  }

  @override
  String customAngleActiveDesc(Object angle) {
    return 'Ruota il video di un angolo personalizzato di $angle°.';
  }

  @override
  String trimActiveDesc(Object end, Object start) {
    return 'Ritaglia il video da $start a $end.';
  }

  @override
  String targetSizeLimitLabel(Object size) {
    return 'Limite di $size MB';
  }

  @override
  String get customMbSizeTooltip => 'Inserisci dimensione in MB';

  @override
  String get trimTimeTooltip =>
      'Inserisci tempo es. 5 (5s), 1:30 (1m30s), o 00:01:30';

  @override
  String get tabImageSuite => 'Suite Immagini';

  @override
  String get compressionModeTitle => 'Modalità di Compressione';

  @override
  String get smartAutoLabel => 'Auto Intelligente';

  @override
  String get smartAutoDesc =>
      'Riduce automaticamente la dimensione del 60-80% con nitidezza perfetta. Ideale per l\'uso quotidiano.';

  @override
  String get maxSavingsLabel => 'Risparmio Massimo';

  @override
  String get maxSavingsDesc =>
      'Compressione forte con risparmio fino all\'85-90%. Perfetto per messaggi e allegati.';

  @override
  String get ultraFidelityLabel => 'Ultra Fedeltà';

  @override
  String get ultraFidelityDesc =>
      'Conserva la qualità visiva originale con compressione minima. Ideale per archivi e stampe.';

  @override
  String get targetImageFormatTitle => 'Formato Immagine di Destinazione';

  @override
  String get dimensionResizingTitle => 'Ridimensionamento';

  @override
  String get exifCameraPrivacyTitle => 'Privacy EXIF / Fotocamera';

  @override
  String get stripGpsCameraInfoLabel => 'Rimuovi GPS e Info Fotocamera';

  @override
  String get intentCompressOnly => 'Solo compressione';

  @override
  String get intentCompressOnlyTooltip =>
      'Concentrarsi esclusivamente sulla riduzione delle dimensioni del file (% qualità o KB/MB target)';

  @override
  String get intentEditConvertOnly => 'Solo modifica/converti';

  @override
  String get intentEditConvertOnlyTooltip =>
      'Ridimensiona, ruota, ritaglia o converti il ​​formato senza ridurre la qualità visiva';

  @override
  String get intentCompressAndEdit => 'Comprimi e modifica';

  @override
  String get intentCompressAndEditTooltip =>
      'Controllo completo: modifica, ridimensiona, ruota e comprimi insieme le dimensioni del file';

  @override
  String get imgFmtOriginalLabel => 'Formato originale';

  @override
  String get imgFmtOriginalDesc =>
      'Mantieni il formato originale (il più veloce, nessuna conversione).';

  @override
  String get imgFmtPngLabel => 'Immagine PNG (.png)';

  @override
  String get imgFmtPngDesc =>
      'Formato PNG senza perdita di dati con supporto per la trasparenza.';

  @override
  String get imgFmtJpgLabel => 'Immagine JPEG (.jpg)';

  @override
  String get imgFmtJpgDesc =>
      'Formato JPEG compresso standard per compatibilità universale.';

  @override
  String get imgFmtWebpLabel => 'Immagine WebP (.webp)';

  @override
  String get imgFmtWebpDesc =>
      'Formato WebP moderno che offre compressione superiore e dimensioni ridotte.';

  @override
  String get imgFmtAvifLabel => 'Immagine AVIF (.avif)';

  @override
  String get imgFmtAvifDesc =>
      'Formato AVIF di prossima generazione con efficienza di compressione ultraelevata.';

  @override
  String get imgResOriginalLabel => 'Dimensioni originali';

  @override
  String get imgResOriginalDesc =>
      'Mantieni le dimensioni di larghezza e altezza dell\'immagine originale.';

  @override
  String get imgRes4kLabel => '4K massimo (3840px)';

  @override
  String get imgRes4kDesc =>
      'Riduci la dimensione massima dell\'immagine a 3840 px (4K max).';

  @override
  String get imgRes1080pLabel => 'Full HD massimo (1920 px)';

  @override
  String get imgRes1080pDesc =>
      'Riduci la dimensione massima dell\'immagine a 1920 px (Full HD max).';

  @override
  String get imgRes720pLabel => 'HD massimo (1280px)';

  @override
  String get imgRes720pDesc =>
      'Riduci la dimensione massima dell\'immagine a 1280 px (HD max).';

  @override
  String get imgRes480pLabel => 'SD massima (854px)';

  @override
  String get imgRes480pDesc =>
      'Riduci la dimensione massima dell\'immagine a 854 px (SD max).';

  @override
  String get keepMetadataImageInfoDesc =>
      'Conserva i metadati EXIF e le informazioni della fotocamera originali.';

  @override
  String get cleanNoiseLabel => 'Riduzione del rumore';

  @override
  String get outputLargerTooltip =>
      'L\'output sarà più grande dell\'originale!\nInterrompi e ripristina le impostazioni predefinite.';

  @override
  String get estimatedSizePrefix => 'Stima:';

  @override
  String get cancelBtnTooltip => 'Annulla';

  @override
  String get removeBtnTooltip => 'Rimuovi';

  @override
  String get selectLanguageTitle => 'Seleziona lingua';

  @override
  String get searchLanguageHint => 'Cerca lingua per nome o codice...';

  @override
  String get noLanguagesMatchSearch =>
      'Nessuna lingua corrisponde alla ricerca.';

  @override
  String get languageTooltip => 'Lingua';

  @override
  String get notifyCompressionCompleteTitle =>
      'Compressione Shrinkeo completata';

  @override
  String get notifyOutputLargerTitle => 'Output più grande dell\'originale';

  @override
  String languagesCountLabel(String count) {
    return '$count lingue';
  }

  @override
  String notifyCompressionCompleteSuccess(String success) {
    return '$success video compressi con successo.';
  }

  @override
  String notifyCompressionCompleteFailed(String failed) {
    return ' ($failed non riusciti)';
  }

  @override
  String notifyOutputLargerDesc(String fileName) {
    return 'Si prevede che $fileName sia più grande dell\'originale. Valuta di annullare e ripristinare.';
  }
}
