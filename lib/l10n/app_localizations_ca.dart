// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Catalan Valencian (`ca`).
class AppLocalizationsCa extends AppLocalizations {
  AppLocalizationsCa([String locale = 'ca']) : super(locale);

  @override
  String get appName => 'Shrinkeo';

  @override
  String get totalSpaceSaved => 'Espai total estalviat';

  @override
  String get savedSpacePrefix => 'Estalviat:';

  @override
  String get supportButtonText => 'Support Project';

  @override
  String get lightThemeTooltip => 'Tema Clar';

  @override
  String get darkThemeTooltip => 'Tema Fosc';

  @override
  String get settingsTooltip => 'Configuració';

  @override
  String get minimizeTooltip => 'Minimitza';

  @override
  String get closeTooltip => 'Tanca';

  @override
  String get restoreTooltip => 'Restaura';

  @override
  String get maximizeTooltip => 'Maximitza';

  @override
  String get tabCompressionQuality => 'Compressió i Qualitat';

  @override
  String get tabVideoEditingTools => 'Edició de Vídeo i Eines';

  @override
  String get tabAudioSettings => 'Configuració d\'Àudio';

  @override
  String get tabEngineOutput => 'Motor i Carpeta de Sortida';

  @override
  String get compressionSettingsTitle => 'Ajustos de Compressió';

  @override
  String get resetToDefaults => 'Restaura per defecte';

  @override
  String get resetDefaultTooltip => 'Restableix els valors inicials';

  @override
  String get modeTargetSizeTitle => 'Mode d\'Objectiu de Compressió';

  @override
  String get modeCrfLabel => 'Qualitat (CRF)';

  @override
  String get modeTargetSizeLabel => 'Mida Objectiu (MB)';

  @override
  String get crfQualityTitle => 'Factor de Qualitat CRF';

  @override
  String get crfLossless => 'Sense pèrdues';

  @override
  String get crfHighQuality => 'Alta qualitat';

  @override
  String get crfBalanced => 'Equilibrat';

  @override
  String get crfHighCompression => 'Alta compressió';

  @override
  String get crfLowQuality => 'Baixa qualitat';

  @override
  String get crfUltraCompressed => 'Ultra comprimit';

  @override
  String get targetSizeLabel => 'Mida de Fitxer Objectiu (MB)';

  @override
  String get targetSizeDesc =>
      'Calcula la taxa de bits per ajustar-se al límit de mida.';

  @override
  String get encodingSpeedTitle => 'Velocitat de Codificació';

  @override
  String get presetUltrafastLabel => 'Ultraràpid';

  @override
  String get presetUltrafastDesc =>
      'Màxima velocitat, però menor reducció de mida.';

  @override
  String get presetSuperfastLabel => 'Superràpid';

  @override
  String get presetSuperfastDesc => 'Codificació molt ràpida.';

  @override
  String get presetVeryfastLabel => 'Molt ràpid';

  @override
  String get presetVeryfastDesc => 'Més ràpid que la mitjana.';

  @override
  String get presetFasterLabel => 'Més ràpid';

  @override
  String get presetFasterDesc => 'Bona velocitat i gran compressió.';

  @override
  String get presetFastLabel => 'Ràpid';

  @override
  String get presetFastDesc => 'El millor equilibri entre velocitat i mida.';

  @override
  String get presetMediumLabel => 'Mitjà';

  @override
  String get presetMediumDesc => 'Equilibri per defecte.';

  @override
  String get presetSlowLabel => 'Llent';

  @override
  String get presetSlowDesc =>
      'Més llent però fitxers considerablement més petits.';

  @override
  String get presetVeryslowLabel => 'Molt llent';

  @override
  String get presetVeryslowDesc => 'Màxima reducció de mida.';

  @override
  String get videoCodecTitle => 'Còdec de Vídeo';

  @override
  String get codecH264Label => 'H.264';

  @override
  String get codecH264Desc => 'Màxima compatibilitat amb dispositius antics.';

  @override
  String get codecH265Label => 'H.265 / HEVC';

  @override
  String get codecH265Desc => 'Millor eficiència de compressió.';

  @override
  String get codecAv1Label => 'AV1';

  @override
  String get codecAv1Desc =>
      'Còdec de nova generació (30% més petit que H.265).';

  @override
  String get hardwareEncoderTitle => 'Acceleració per Programari (GPU)';

  @override
  String get hwSoftwareLabel => 'Programari (CPU)';

  @override
  String get hwSoftwareDesc => 'El més llent, però màxima compatibilitat.';

  @override
  String get hwNvidiaLabel => 'Nvidia (NVENC)';

  @override
  String get hwNvidiaDesc => 'Codificació molt ràpida per a GPU Nvidia.';

  @override
  String get hwAmdLabel => 'AMD (AMF)';

  @override
  String get hwAmdDesc => 'Codificació molt ràpida per a GPU AMD.';

  @override
  String get hwIntelLabel => 'Intel (QSV)';

  @override
  String get hwIntelDesc => 'Codificació molt ràpida per a GPU Intel.';

  @override
  String get resolutionTitle => 'Resolució Màxima';

  @override
  String get resOriginalLabel => 'Original';

  @override
  String get resOriginalDesc => 'Manté la resolució original.';

  @override
  String get res4kLabel => '4K';

  @override
  String get res4kDesc => 'Redueix fins a màxim 4K.';

  @override
  String get res2kLabel => '2K';

  @override
  String get res2kDesc => 'Redueix fins a màxim 2K.';

  @override
  String get res1080pLabel => '1080p';

  @override
  String get res1080pDesc => 'Redueix fins a màxim 1080p Full HD.';

  @override
  String get res720pLabel => '720p';

  @override
  String get res720pDesc => 'Redueix fins a màxim 720p HD.';

  @override
  String get res480pLabel => '480p';

  @override
  String get res480pDesc => 'Redueix a 480p.';

  @override
  String get res360pLabel => '360p';

  @override
  String get res360pDesc => 'Màxima compressió.';

  @override
  String get frameRateTitle => 'Taxa de Fotogrames (FPS)';

  @override
  String get fpsOriginalLabel => 'Original';

  @override
  String get fpsOriginalDesc => 'MATEIX FPS que la font.';

  @override
  String get fps60Label => '60 fps';

  @override
  String get fps60Desc => 'Fluid per a jocs o esports.';

  @override
  String get fps30Label => '30 fps';

  @override
  String get fps30Desc => 'Estàndard per a la majoria de vídeos.';

  @override
  String get fps24Label => '24 fps';

  @override
  String get fps24Desc => 'Estil cinematogràfic.';

  @override
  String get enableVideoDenoiseTitle => 'Neteja de Soroll de Vídeo';

  @override
  String get enableVideoDenoiseDesc => 'Filtre 3D per reduir el gra i soroll.';

  @override
  String get exportFormatTitle => 'Format d\'Exportació';

  @override
  String get exportVideoLabel => 'Vídeo Estàndard';

  @override
  String get exportVideoDesc => 'Exporta com a MP4/MKV/MOV';

  @override
  String get exportGifLabel => 'GIF Animat';

  @override
  String get exportGifDesc => 'Crea un GIF animat d\'alta qualitat';

  @override
  String get exportMp3Label => 'Extreu MP3';

  @override
  String get exportMp3Desc => 'Extreu l\'àudio com a MP3 320kbps';

  @override
  String get exportAacLabel => 'Extreu AAC';

  @override
  String get exportAacDesc => 'Extreu l\'àudio com a AAC';

  @override
  String get exportWavLabel => 'Extreu WAV';

  @override
  String get exportWavDesc => 'Extreu àudio WAV sense compressió';

  @override
  String get privacyScrubbingTitle => 'Privadesa i GPS';

  @override
  String get keepMetadataLabel => 'Manté les Dades';

  @override
  String get stripGpsExifLabel => 'Elimina GPS/EXIF';

  @override
  String get stripGpsExifInfoTitle => 'Neteja les Metadades';

  @override
  String get stripGpsExifInfoDesc =>
      'Elimina la informació de la càmera i ubicació GPS.';

  @override
  String get keepMetadataInfoDesc => 'Conserva totes les metadades originals.';

  @override
  String get autoCropBlackBarsTitle => 'Retall Automàtic de Barres Negres';

  @override
  String get autoCropLabel => 'Auto Retall';

  @override
  String get autoCropActiveTitle => 'Auto Retall Actiu';

  @override
  String get autoCropActiveDesc => 'Elimina les barres negres automàticament.';

  @override
  String get autoCropDisabledDesc => 'Conserva les vores originals.';

  @override
  String get playbackSpeedTitle => 'Velocitat de Reproducció';

  @override
  String get speedOriginalLabel => '1.0x';

  @override
  String get speedOriginalDesc => 'Velocitat normal';

  @override
  String get speedSlow05Label => '0.5x Llent';

  @override
  String get speedSlow05Desc => 'Reprodueix a la meitat de velocitat';

  @override
  String get speedFast15Label => '1.5x';

  @override
  String get speedFast15Desc => '1.5 vegades més ràpid';

  @override
  String get speedFast20Label => '2.0x Ràpid';

  @override
  String get speedFast20Desc => 'Doble velocitat';

  @override
  String get speedTimelapse40Label => '4.0x Timelapse';

  @override
  String get speedTimelapse40Desc => 'Velocitat 4x per a timelapse';

  @override
  String get canvasAspectRatioTitle => 'Relació d\'Aspecte';

  @override
  String get aspectOriginalLabel => 'Original';

  @override
  String get aspectOriginalDesc => 'Manté la proporció original';

  @override
  String get aspectShortsLabel => '9:16 Shorts';

  @override
  String get aspectShortsDesc => 'Per a TikTok i Reels';

  @override
  String get aspectSquareLabel => '1:1 Quadrat';

  @override
  String get aspectSquareDesc => 'Per a publicacions d\'Instagram';

  @override
  String get aspectPortraitLabel => '4:5 Retrat';

  @override
  String get aspectPortraitDesc => 'Per a Instagram vertical';

  @override
  String get aspectWidescreenLabel => '16:9 Panoràmic';

  @override
  String get aspectWidescreenDesc => 'Per a YouTube i TV';

  @override
  String get aspectClassicLabel => '4:3 Clàssic';

  @override
  String get aspectClassicDesc => 'Per a pantalles clàssiques';

  @override
  String get aspectCinemaLabel => '21:9 Cinema';

  @override
  String get aspectCinemaDesc => 'Per a monitors ultrawide';

  @override
  String get aspectCustomLabel => 'Proporció Personalitzada';

  @override
  String get aspectCustomDesc => 'Proporció d\'aspecte al teu gust';

  @override
  String get customRatioTooltip => 'Ex: 16:10, 2:1';

  @override
  String get rotationFlipTitle => 'Rotació i Mirall';

  @override
  String get rotOriginalLabel => 'Original (0°)';

  @override
  String get rotOriginalDesc => 'Manté l\'orientació';

  @override
  String get rot90Label => '90° Dreta';

  @override
  String get rot90Desc => 'Gira 90 graus en sentit horari';

  @override
  String get rot180Label => '180° Invertit';

  @override
  String get rot180Desc => 'Gira de cap per avall';

  @override
  String get rot270Label => '270° Esquerra';

  @override
  String get rot270Desc => 'Gira 90 graus en sentit antihorari';

  @override
  String get rotFlipHLabel => 'Mirall Horiz.';

  @override
  String get rotFlipHDesc => 'Inverteix horitzontalment';

  @override
  String get rotFlipVLabel => 'Mirall Vert.';

  @override
  String get rotFlipVDesc => 'Inverteix verticalment';

  @override
  String get rotCustomLabel => 'Angle Personalitzat';

  @override
  String get rotCustomDesc => 'Gira amb un angle específic';

  @override
  String get customRotationTooltip => 'Angle en graus ex. 45';

  @override
  String get trimVideoTitle => 'Retalla el Vídeo';

  @override
  String get fullVideoLabel => 'Vídeo Sencer';

  @override
  String get cutClipLabel => 'Talla el Clip';

  @override
  String get trimStartLabel => 'Inici';

  @override
  String get trimEndLabel => 'Final';

  @override
  String get trimActiveTitle => 'Retall Actiu';

  @override
  String get fullVideoDesc => 'Processa tot el vídeo sense tallar.';

  @override
  String get audioModeTitle => 'Mode de Pista d\'Àudio';

  @override
  String get audioOriginalLabel => 'Original';

  @override
  String get audioOriginalDesc => 'Sense pèrdua de qualitat d\'àudio.';

  @override
  String get audioAac256Label => 'Alta Qualitat';

  @override
  String get audioAac256Desc => 'AAC 256kbps';

  @override
  String get audioAac128Label => 'Equilibrat';

  @override
  String get audioAac128Desc => 'AAC 128kbps (Estàndard Web)';

  @override
  String get audioAac64Label => 'Baixa Qualitat';

  @override
  String get audioAac64Desc => 'AAC 64kbps per a veu';

  @override
  String get audioMuteLabel => 'Silencia l\'Àudio';

  @override
  String get audioMuteDesc => 'Elimina la pista d\'àudio completament.';

  @override
  String get audioNormTitle => 'Normalització de Volum';

  @override
  String get audioNormOffLabel => 'Desactivat';

  @override
  String get audioNormOffDesc => 'Dinàmica original.';

  @override
  String get audioNormSpeechLabel => 'Veu Humana';

  @override
  String get audioNormSpeechDesc => 'EBU R128 per a diàlegs clars.';

  @override
  String get audioNormDynamicLabel => 'Cinema Dinàmic';

  @override
  String get audioNormDynamicDesc => 'Nivella sons forts i febles.';

  @override
  String get audioNormBoostLabel => 'Lleuger Augment';

  @override
  String get audioNormBoostDesc => '+3dB d\'augment de volum.';

  @override
  String get audioChanTitle => 'Canals d\'Àudio';

  @override
  String get audioChanOriginalLabel => 'Originals';

  @override
  String get audioChanOriginalDesc => 'Manté els canals font.';

  @override
  String get audioChanStereoLabel => 'Estèreo (2.0)';

  @override
  String get audioChanStereoDesc => 'Compatibilitat estèreo de 2 canals.';

  @override
  String get audioChanMonoLabel => 'Mono (1.0)';

  @override
  String get audioChanMonoDesc =>
      'Canal únic - 50% d\'estalvi en mida d\'àudio.';

  @override
  String get removeNoiseLabel => 'Elimina el Soroll';

  @override
  String get enableAudioDenoiseTitle => 'Elimina Soroll de Micro';

  @override
  String get enableAudioDenoiseDesc => 'Filtre contra soroll de fons.';

  @override
  String get outputDirectoryTitle => 'Carpeta de Sortida';

  @override
  String get defaultOutputDirectory =>
      'Per defecte (Al costat del fitxer original)';

  @override
  String get selectOutputFolderTitle => 'Selecciona Carpeta';

  @override
  String get clearOutputFolder => 'Utilitza la ubicació per defecte';

  @override
  String get changeBtn => 'Canvia';

  @override
  String get outputLocationTitle => 'Comportament de Sortida';

  @override
  String get outputLocationUnifiedLabel => 'Una Sola Carpeta';

  @override
  String get outputLocationUnifiedDesc =>
      'Tots els vídeos comprimits en una carpeta.';

  @override
  String get outputLocationSameLabel => 'Al costat de l\'Original';

  @override
  String get outputLocationSameDesc =>
      'Cada vídeo al costat del seu fitxer font.';

  @override
  String get fileManagementTitle => 'Gestió de Fitxers';

  @override
  String get keepOriginalsLabel => 'Conserva els Originals';

  @override
  String get keepOriginalsDesc => 'Deixa els fitxers originals intactes.';

  @override
  String get toRecycleBinLabel => 'A la Paperera';

  @override
  String get toRecycleBinDesc =>
      'Mou els originals a la paperera després de comprimir.';

  @override
  String get outputFormatTitle => 'Format de Contenidor';

  @override
  String get formatOriginalLabel => 'Original';

  @override
  String get formatOriginalDesc => 'Manté el format original.';

  @override
  String get formatMp4Label => 'MP4';

  @override
  String get formatMp4Desc => 'Màxima compatibilitat.';

  @override
  String get formatMkvLabel => 'MKV';

  @override
  String get formatMkvDesc => 'Suport per a múltiples pistes.';

  @override
  String get formatMovLabel => 'MOV';

  @override
  String get formatMovDesc => 'Format Apple QuickTime.';

  @override
  String get scanningFilesMsg => 'Escanejant fitxers...';

  @override
  String get addFilesBtn => 'Afegeix Fitxers';

  @override
  String get addFolderBtn => 'Afegeix Carpeta';

  @override
  String get dragDropMoreMsg => 'O arrossegueu més fitxers a qualsevol lloc';

  @override
  String get openOutputFolderTooltip => 'Obre Carpeta de Sortida';

  @override
  String get statusQueued => 'A la cua';

  @override
  String get statusAnalyzing => 'Analitzant';

  @override
  String get statusCompressing => 'Compriment';

  @override
  String get statusDone => 'Fet';

  @override
  String get statusFailed => 'Ha fallat';

  @override
  String get statusCancelled => 'Cancel·lat';

  @override
  String get savedPrefix => 'Estalviat';

  @override
  String get largerSuffix => 'Més Gran';

  @override
  String get largerSizeWarning =>
      'La mida final pot ser més gran que l\'original.';

  @override
  String get clearCompletedBtn => 'Neteja Completats';

  @override
  String get clearAllBtn => 'Neteja-ho Tot';

  @override
  String get stopAllBtn => 'Atura-ho Tot';

  @override
  String get startCompressionBtn => 'Inicia la Compressió';

  @override
  String get allDoneLabel => 'Tot Fet!';

  @override
  String get openFolderBtn => 'Obre Carpeta';

  @override
  String get totalEtaLabel => 'Temps Restant';

  @override
  String get totalSavedLabel => 'Total Estalviat';

  @override
  String get videoSingle => 'vídeo';

  @override
  String get videosPlural => 'vídeos';

  @override
  String get fileSingle => 'fitxer';

  @override
  String get filesPlural => 'fitxers';

  @override
  String get releaseToAddVideosMsg => 'Deixeu anar per afegir fitxers';

  @override
  String get dragDropHereMsg => 'Arrossegueu vídeos o imatges aquí';

  @override
  String get supportedFormatsMsg =>
      'Admet MP4, MKV, MOV, AVI, WMV, WebM • PNG, JPG, WebP, AVIF i més';

  @override
  String get selectFilesBtn => 'Selecciona Fitxers';

  @override
  String get selectFolderBtn => 'Selecciona Carpeta';

  @override
  String get releaseToShrinkTitle => 'Deixa anar per comprimir immediatament';

  @override
  String get filesWillBeAddedDesc => 'Els teus fitxers s\'afegiran a la cua.';

  @override
  String get disabledLabel => 'Desactivat';

  @override
  String get compressionInProgressTitle => 'Compressió en Curs';

  @override
  String get confirmCloseDesc => 'Segur que vols tancar Shrinkeo?';

  @override
  String get keepCompressingBtn => 'Continua Compriment';

  @override
  String get closeAppBtn => 'Tanca l\'Aplicació';

  @override
  String get lockedSettingsWarning => 'Bloquejat durant la compressió';

  @override
  String get updateRequiredTitle => 'Actualització Necessària';

  @override
  String get updateRequiredDescNewVersion =>
      'Hi ha una nova versió disponible.';

  @override
  String get updateRequiredDescOldVersion => 'La teva versió ja no té suport.';

  @override
  String get updateNowBtn => 'Actualitza Ara';

  @override
  String get laterBtn => 'Més tard';

  @override
  String get updateAvailableTitle => 'Actualització Disponible';

  @override
  String get whatsNewTitle => 'Novetats:';

  @override
  String get exitAppBtn => 'Surt';

  @override
  String get retryBtn => 'Torna-ho a provar';

  @override
  String get downloadFromWebsiteBtn => 'Descarrega del Lloc Web';

  @override
  String get skipUpdateConfirmTitle => 'Ometre l\'actualització?';

  @override
  String get skipUpdateConfirmDesc =>
      'Aquesta actualització conté correccions importants.';

  @override
  String get skipUpdateCancelBtn => 'Cancel·la';

  @override
  String get skipUpdateConfirmBtn => 'Omet l\'actualització';

  @override
  String get maintenanceTitle => 'Manteniment';

  @override
  String get maintenanceDescDefault =>
      'Shrinkeo està actualment en manteniment.';

  @override
  String versionAvailableMsg(String version) {
    return 'La versió $version està disponible.';
  }

  @override
  String get hwEncoderNotSupportedTitle =>
      'Acceleració per hardware no suportada';

  @override
  String get failedCreateFolderError => 'Error en crear la carpeta de sortida';

  @override
  String get failedProbeDurationError => 'Error en llegir la durada';

  @override
  String get ffmpegNotFoundGlobalError => 'No s\'ha trobat FFmpeg.';

  @override
  String get ffmpegMissingError => 'Falta FFmpeg o FFprobe o està malmès.';

  @override
  String hwFallbackNotificationBody(String encoderLabel) {
    return '$encoderLabel ha fallat. S\'ha canviat a CPU.';
  }

  @override
  String get failedDownloadUpdateMsg =>
      'Error en descarregar l\'actualització. Torna-ho a provar.';

  @override
  String customRatioActiveTitle(Object ratio) {
    return 'Proporció personalitzada ($ratio)';
  }

  @override
  String customRatioActiveDesc(Object ratio) {
    return 'Llenç amb farciment per a la proporció personalitzada $ratio.';
  }

  @override
  String customAngleActiveTitle(Object angle) {
    return 'Angle personalitzat ($angle°)';
  }

  @override
  String customAngleActiveDesc(Object angle) {
    return 'Gira el vídeo un angle personalitzat de $angle°.';
  }

  @override
  String trimActiveDesc(Object end, Object start) {
    return 'Retalla el clip de vídeo entre $start i $end.';
  }

  @override
  String targetSizeLimitLabel(Object size) {
    return 'Límit de $size MB';
  }

  @override
  String get customMbSizeTooltip => 'Escriu la mida en MB personalitzada';

  @override
  String get trimTimeTooltip =>
      'Escriu el temps p. ex. 5 (5s), 1:30 (1m30s), o 00:01:30';

  @override
  String get tabImageSuite => 'Suite d\'imatges';

  @override
  String get compressionModeTitle => 'Mode de compressió';

  @override
  String get smartAutoLabel => 'Automòbil intel·ligent';

  @override
  String get smartAutoDesc =>
      'Redueix automàticament la mida del fitxer entre un 60 i un 80% amb una claredat visual impecable al 100%. Perfecte per a l\'optimització de fotos diària.';

  @override
  String get maxSavingsLabel => 'Estalvi màxim';

  @override
  String get maxSavingsDesc =>
      'Compressió agressiva que estalvia fins a un 85-90% de la mida del fitxer. El millor per a missatges ràpids, càrregues web i fitxers adjunts de correu electrònic.';

  @override
  String get ultraFidelityLabel => 'Ultra Fidelitat';

  @override
  String get ultraFidelityDesc =>
      'Conserva la fidelitat visual en brut amb una compressió mínima. Ideal per a arxius fotogràfics i treballs d\'impressió d\'alta resolució.';

  @override
  String get targetImageFormatTitle => 'Format d\'imatge objectiu';

  @override
  String get dimensionResizingTitle => 'Redimensionament de la dimensió';

  @override
  String get exifCameraPrivacyTitle => 'EXIF / Privadesa de la càmera';

  @override
  String get stripGpsCameraInfoLabel => 'Elimina GPS i informació de la càmera';

  @override
  String get imgFmtOriginalLabel => 'Format original';

  @override
  String get imgFmtOriginalDesc =>
      'Manteniu el format original (més ràpid, sense conversió).';

  @override
  String get imgFmtPngLabel => 'Imatge PNG (.png)';

  @override
  String get imgFmtPngDesc =>
      'Format PNG sense pèrdues amb suport de transparència.';

  @override
  String get imgFmtJpgLabel => 'Imatge JPEG (.jpg)';

  @override
  String get imgFmtJpgDesc =>
      'Format JPEG comprimit estàndard per a una compatibilitat universal.';

  @override
  String get imgFmtWebpLabel => 'Imatge WebP (.webp)';

  @override
  String get imgFmtWebpDesc =>
      'Format WebP modern que ofereix compressió superior i mida petita.';

  @override
  String get imgFmtAvifLabel => 'Imatge AVIF (.avif)';

  @override
  String get imgFmtAvifDesc =>
      'Format AVIF de nova generació amb una eficiència de compressió ultra alta.';

  @override
  String get imgResOriginalLabel => 'Dimensions originals';

  @override
  String get imgResOriginalDesc =>
      'Mantingueu les dimensions de l\'amplada i l\'alçada de la imatge original.';

  @override
  String get imgRes4kLabel => '4K màxim (3840 píxels)';

  @override
  String get imgRes4kDesc =>
      'Redueix la dimensió màxima de la imatge a 3840 píxels (4K màx).';

  @override
  String get imgRes1080pLabel => 'Full HD màxim (1920 píxels)';

  @override
  String get imgRes1080pDesc =>
      'Redueix la dimensió màxima de la imatge a 1920 píxels (màx. Full HD).';

  @override
  String get imgRes720pLabel => 'HD màxim (1280 píxels)';

  @override
  String get imgRes720pDesc =>
      'Redueix la dimensió màxima de la imatge a 1280 píxels (HD màx.).';

  @override
  String get imgRes480pLabel => 'SD màxim (854 píxels)';

  @override
  String get imgRes480pDesc =>
      'Redueix la dimensió màxima de la imatge a 854 píxels (SD màx.).';

  @override
  String get keepMetadataImageInfoDesc =>
      'Conserva la imatge original EXIF ​​i les metadades de la càmera.';

  @override
  String get imageQualityModeLabel => 'Nivell de qualitat';

  @override
  String get imageQualityModeDesc =>
      'Codifica amb un nivell de qualitat fix — més qualitat significa fitxers més grans.';

  @override
  String get imageTargetSizeModeLabel => 'Mida objectiu';

  @override
  String get imageTargetSizeModeDesc =>
      'Troba automàticament la qualitat més alta que cap dins del límit de mida.';

  @override
  String get imageQualitySliderTitle => 'Qualitat de la imatge';

  @override
  String get imageTargetSizeTitle => 'Mida objectiu del fitxer';

  @override
  String get imageTargetSizeDesc =>
      'Codifica repetidament amb qualitat decreixent fins que el fitxer cap dins del límit. Els límits molt petits poden reduir la qualitat.';

  @override
  String imageTargetSizeLimitLabel(String size) {
    return 'Límit $size';
  }

  @override
  String get customKbSizeTooltip => 'Escriviu una mida personalitzada en KB';

  @override
  String get imageProcessingFailedError =>
      'El processament de la imatge ha fallat';

  @override
  String get imageProcessingErrorMsg => 'Error de processament de la imatge';

  @override
  String get cleanNoiseLabel => 'Netejar soroll';

  @override
  String get outputLargerTooltip =>
      'La sortida serà més gran que l\'original!\nAtureu-vos i proveu de restablir els valors predeterminats.';

  @override
  String get estimatedSizePrefix => 'Est:';

  @override
  String get cancelBtnTooltip => 'Cancel·la';

  @override
  String get removeBtnTooltip => 'Eliminar';

  @override
  String get selectLanguageTitle => 'Seleccioneu Idioma';

  @override
  String get searchLanguageHint => 'Cerca l\'idioma per nom o codi...';

  @override
  String get noLanguagesMatchSearch =>
      'No hi ha cap idioma que coincideixi amb la vostra cerca.';

  @override
  String get languageTooltip => 'Llengua';

  @override
  String get notifyCompressionCompleteTitle => 'Compressió Shrinkeo completa';

  @override
  String get notifyOutputLargerTitle => 'Sortida més gran que l\'original';

  @override
  String languagesCountLabel(String count) {
    return '$count idiomes';
  }

  @override
  String notifyCompressionCompleteSuccess(String success) {
    return 'S\'han comprimit correctament $success fitxers.';
  }

  @override
  String notifyCompressionCompleteFailed(String failed) {
    return '($failed fallat)';
  }

  @override
  String notifyOutputLargerDesc(String fileName) {
    return 'S\'espera que $fileName sigui més gran que la mida del fitxer original. Considereu la possibilitat de cancel·lar i restablir la configuració per defecte.';
  }
}
