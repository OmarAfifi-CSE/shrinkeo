// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appName => 'Shrinkeo';

  @override
  String get totalSpaceSaved => 'Espace total économisé';

  @override
  String get savedSpacePrefix => 'Économisé:';

  @override
  String get supportButtonText => 'Soutenir le projet';

  @override
  String get lightThemeTooltip => 'Thème Clair';

  @override
  String get darkThemeTooltip => 'Thème Sombre';

  @override
  String get settingsTooltip => 'Paramètres';

  @override
  String get minimizeTooltip => 'Réduire';

  @override
  String get closeTooltip => 'Fermer';

  @override
  String get restoreTooltip => 'Raurer';

  @override
  String get maximizeTooltip => 'Agrandir';

  @override
  String get tabCompressionQuality => 'Compression & Qualité';

  @override
  String get tabVideoEditingTools => 'Édition & Outils';

  @override
  String get tabAudioSettings => 'Paramètres Audio';

  @override
  String get tabEngineOutput => 'Moteur & Sortie';

  @override
  String get compressionSettingsTitle => 'Paramètres de Compression';

  @override
  String get resetToDefaults => 'Réinitialiser';

  @override
  String get resetDefaultTooltip => 'Rétablir par défaut';

  @override
  String get modeTargetSizeTitle => 'Mode de Compression';

  @override
  String get modeCrfLabel => 'Qualité (CRF)';

  @override
  String get modeTargetSizeLabel => 'Taille Cible (Mo)';

  @override
  String get crfQualityTitle => 'Qualité CRF';

  @override
  String get crfLossless => 'Sans perte';

  @override
  String get crfHighQuality => 'Haute qualité';

  @override
  String get crfBalanced => 'Équilibré';

  @override
  String get crfHighCompression => 'Haute compression';

  @override
  String get crfLowQuality => 'Faible qualité';

  @override
  String get crfUltraCompressed => 'Ultra compressé';

  @override
  String get targetSizeLabel => 'Taille Cible (Mo)';

  @override
  String get targetSizeDesc =>
      'Calcule le débit pour respecter la taille limite.';

  @override
  String get encodingSpeedTitle => 'Vitesse d\'Encodage';

  @override
  String get presetUltrafastLabel => 'Ultrarapide';

  @override
  String get presetUltrafastDesc => 'Vitesse maximale mais réduction minimale.';

  @override
  String get presetSuperfastLabel => 'Superrapide';

  @override
  String get presetSuperfastDesc => 'Encodage très rapide.';

  @override
  String get presetVeryfastLabel => 'Très Rapide';

  @override
  String get presetVeryfastDesc => 'Plus rapide que la moyenne.';

  @override
  String get presetFasterLabel => 'Plus Rapide';

  @override
  String get presetFasterDesc => 'Bonne vitesse et compression.';

  @override
  String get presetFastLabel => 'Rapide';

  @override
  String get presetFastDesc => 'Excellent équilibre vitesse/taille.';

  @override
  String get presetMediumLabel => 'Moyen';

  @override
  String get presetMediumDesc => 'Équilibre par défaut.';

  @override
  String get presetSlowLabel => 'Lent';

  @override
  String get presetSlowDesc => 'Plus lent mais fichiers plus petits.';

  @override
  String get presetVeryslowLabel => 'Très Lent';

  @override
  String get presetVeryslowDesc => 'Réduction maximale de la taille.';

  @override
  String get videoCodecTitle => 'Codec Vidéo';

  @override
  String get codecH264Label => 'H.264';

  @override
  String get codecH264Desc => 'Compatibilité maximale.';

  @override
  String get codecH265Label => 'H.265 / HEVC';

  @override
  String get codecH265Desc => 'Meilleure efficacité de compression.';

  @override
  String get codecAv1Label => 'AV1';

  @override
  String get codecAv1Desc =>
      'Codec nouvelle génération (30% plus petit que H.265).';

  @override
  String get hardwareEncoderTitle => 'Accélération Matérielle (GPU)';

  @override
  String get hwSoftwareLabel => 'Processeur (CPU)';

  @override
  String get hwSoftwareDesc => 'Plus lent mais compatibilité maximale.';

  @override
  String get hwNvidiaLabel => 'Nvidia (NVENC)';

  @override
  String get hwNvidiaDesc => 'Encodage ultrarapide GPU Nvidia.';

  @override
  String get hwAmdLabel => 'AMD (AMF)';

  @override
  String get hwAmdDesc => 'Encodage ultrarapide GPU AMD.';

  @override
  String get hwIntelLabel => 'Intel (QSV)';

  @override
  String get hwIntelDesc => 'Encodage ultrarapide GPU Intel.';

  @override
  String get resolutionTitle => 'Résolution Maximale';

  @override
  String get resOriginalLabel => 'Originale';

  @override
  String get resOriginalDesc => 'Conserver la résolution d\'origine.';

  @override
  String get res4kLabel => '4K';

  @override
  String get res4kDesc => 'Réduire à 4K max.';

  @override
  String get res2kLabel => '2K';

  @override
  String get res2kDesc => 'Réduire à 2K max.';

  @override
  String get res1080pLabel => '1080p';

  @override
  String get res1080pDesc => 'Réduire à 1080p Full HD.';

  @override
  String get res720pLabel => '720p';

  @override
  String get res720pDesc => 'Réduire à 720p HD.';

  @override
  String get res480pLabel => '480p';

  @override
  String get res480pDesc => 'Réduire à 480p.';

  @override
  String get res360pLabel => '360p';

  @override
  String get res360pDesc => 'Compression maximale.';

  @override
  String get frameRateTitle => 'Fréquence d\'Images (FPS)';

  @override
  String get fpsOriginalLabel => 'Originale';

  @override
  String get fpsOriginalDesc => 'Même FPS que la source.';

  @override
  String get fps60Label => '60 fps';

  @override
  String get fps60Desc => 'Ultra fluide pour jeux ou sport.';

  @override
  String get fps30Label => '30 fps';

  @override
  String get fps30Desc => 'Standard pour la plupart des vidéos.';

  @override
  String get fps24Label => '24 fps';

  @override
  String get fps24Desc => 'Rendu cinématographique.';

  @override
  String get enableVideoDenoiseTitle => 'Nettoyage du Bruit Vidéo';

  @override
  String get enableVideoDenoiseDesc =>
      'Filtre 3D pour réduire le grain et booster la compression.';

  @override
  String get exportFormatTitle => 'Format d\'Exportation';

  @override
  String get exportVideoLabel => 'Vidéo Standard';

  @override
  String get exportVideoDesc => 'Exporter vers MP4/MKV/MOV';

  @override
  String get exportGifLabel => 'GIF Animé';

  @override
  String get exportGifDesc => 'Créer un GIF animé';

  @override
  String get exportMp3Label => 'Extraire MP3';

  @override
  String get exportMp3Desc => 'Extraire l\'audio en MP3 320kbps';

  @override
  String get exportAacLabel => 'Extraire AAC';

  @override
  String get exportAacDesc => 'Extraire l\'audio en AAC';

  @override
  String get exportWavLabel => 'Extraire WAV';

  @override
  String get exportWavDesc => 'Extraire l\'audio en WAV non compressé';

  @override
  String get privacyScrubbingTitle => 'Confidentialité & GPS';

  @override
  String get keepMetadataLabel => 'Garder Métadonnées';

  @override
  String get stripGpsExifLabel => 'Supprimer GPS/EXIF';

  @override
  String get stripGpsExifInfoTitle => 'Nettoyer Métadonnées';

  @override
  String get stripGpsExifInfoDesc =>
      'Supprime les infos de caméra et coordonnées GPS.';

  @override
  String get keepMetadataInfoDesc =>
      'Conserve toutes les métadonnées d\'origine.';

  @override
  String get autoCropBlackBarsTitle => 'Rognage Automatique';

  @override
  String get autoCropLabel => 'Rognage Auto';

  @override
  String get autoCropActiveTitle => 'Rognage Actif';

  @override
  String get autoCropActiveDesc =>
      'Supprime automatiquement les bandes noires.';

  @override
  String get autoCropDisabledDesc => 'Conserve les bordures d\'origine.';

  @override
  String get playbackSpeedTitle => 'Vitesse de Lecture';

  @override
  String get speedOriginalLabel => '1.0x';

  @override
  String get speedOriginalDesc => 'Vitesse normale';

  @override
  String get speedSlow05Label => '0.5x Ralenti';

  @override
  String get speedSlow05Desc => 'Lecture demi-vitesse';

  @override
  String get speedFast15Label => '1.5x';

  @override
  String get speedFast15Desc => 'Accélération légère 1.5x';

  @override
  String get speedFast20Label => '2.0x Rapide';

  @override
  String get speedFast20Desc => 'Vitesse double';

  @override
  String get speedTimelapse40Label => '4.0x Acceleré';

  @override
  String get speedTimelapse40Desc => 'Vitesse 4x pour accéléré';

  @override
  String get canvasAspectRatioTitle => 'Format d\'Image';

  @override
  String get aspectOriginalLabel => 'Original';

  @override
  String get aspectOriginalDesc => 'Conserver les proportions d\'origine';

  @override
  String get aspectShortsLabel => '9:16 Shorts';

  @override
  String get aspectShortsDesc => 'Pour TikTok et Reels';

  @override
  String get aspectSquareLabel => '1:1 Carré';

  @override
  String get aspectSquareDesc => 'Pour publications Instagram';

  @override
  String get aspectPortraitLabel => '4:5 Portrait';

  @override
  String get aspectPortraitDesc => 'Pour Instagram vertical';

  @override
  String get aspectWidescreenLabel => '16:9 Large';

  @override
  String get aspectWidescreenDesc => 'Pour YouTube et TV';

  @override
  String get aspectClassicLabel => '4:3 Classique';

  @override
  String get aspectClassicDesc => 'Pour écrans classiques';

  @override
  String get aspectCinemaLabel => '21:9 Cinéma';

  @override
  String get aspectCinemaDesc => 'Pour moniteurs ultra-larges';

  @override
  String get aspectCustomLabel => 'Personnalisé';

  @override
  String get aspectCustomDesc => 'Format d\'image personnalisé';

  @override
  String get customRatioTooltip => 'Ex: 16:10, 2:1';

  @override
  String get rotationFlipTitle => 'Rotation & Miroir';

  @override
  String get rotOriginalLabel => 'Original (0°)';

  @override
  String get rotOriginalDesc => 'Conserver l\'orientation d\'origine';

  @override
  String get rot90Label => '90° Droite';

  @override
  String get rot90Desc => 'Pivoter de 90 degrés à droite';

  @override
  String get rot180Label => '180° Inversé';

  @override
  String get rot180Desc => 'Pivoter la tête en bas';

  @override
  String get rot270Label => '270° Gauche';

  @override
  String get rot270Desc => 'Pivoter de 90 degrés à gauche';

  @override
  String get rotFlipHLabel => 'Miroir Horiz.';

  @override
  String get rotFlipHDesc => 'Inverser horizontalement';

  @override
  String get rotFlipVLabel => 'Miroir Vert.';

  @override
  String get rotFlipVDesc => 'Inverser verticalement';

  @override
  String get rotCustomLabel => 'Angle Personnalisé';

  @override
  String get rotCustomDesc => 'Pivoter selon un angle précis';

  @override
  String get customRotationTooltip => 'Angle en degrés ex. 45, 30';

  @override
  String get trimVideoTitle => 'Couper la Vidéo';

  @override
  String get fullVideoLabel => 'Vidéo Entière';

  @override
  String get cutClipLabel => 'Couper un Extrait';

  @override
  String get trimStartLabel => 'Début';

  @override
  String get trimEndLabel => 'Fin';

  @override
  String get trimActiveTitle => 'Coupe Active';

  @override
  String get fullVideoDesc => 'Traiter la vidéo entière sans couper.';

  @override
  String get audioModeTitle => 'Mode Piste Audio';

  @override
  String get audioOriginalLabel => 'Original';

  @override
  String get audioOriginalDesc => 'Aucune perte de qualité audio.';

  @override
  String get audioAac256Label => 'Haute Qualité';

  @override
  String get audioAac256Desc => 'AAC 256kbps';

  @override
  String get audioAac128Label => 'Équilibré';

  @override
  String get audioAac128Desc => 'AAC 128kbps (Standard Web)';

  @override
  String get audioAac64Label => 'Basse Qualité';

  @override
  String get audioAac64Desc => 'AAC 64kbps pour la voix';

  @override
  String get audioMuteLabel => 'Muet';

  @override
  String get audioMuteDesc => 'Supprimer la piste audio.';

  @override
  String get audioNormTitle => 'Normalisation du Volume';

  @override
  String get audioNormOffLabel => 'Désactivé';

  @override
  String get audioNormOffDesc => 'Volume dynamique d\'origine.';

  @override
  String get audioNormSpeechLabel => 'Voix Humaine';

  @override
  String get audioNormSpeechDesc => 'EBU R128 pour des dialogues clairs.';

  @override
  String get audioNormDynamicLabel => 'Cinéma Dynamique';

  @override
  String get audioNormDynamicDesc => 'Lisse les scènes calmes et fortes.';

  @override
  String get audioNormBoostLabel => 'Amplification';

  @override
  String get audioNormBoostDesc => '+3dB de gain de volume.';

  @override
  String get audioChanTitle => 'Canaux Audio';

  @override
  String get audioChanOriginalLabel => 'Original';

  @override
  String get audioChanOriginalDesc => 'Conserver les canaux d\'origine.';

  @override
  String get audioChanStereoLabel => 'Stéréo (2.0)';

  @override
  String get audioChanStereoDesc => 'Stéréo 2 canaux.';

  @override
  String get audioChanMonoLabel => 'Mono (1.0)';

  @override
  String get audioChanMonoDesc => 'Canal unique - 50% d\'économie audio.';

  @override
  String get removeNoiseLabel => 'Réduire le Bruit';

  @override
  String get enableAudioDenoiseTitle => 'Supprimer le Bruit de Fond';

  @override
  String get enableAudioDenoiseDesc =>
      'Filtre pour éliminer le souffle du micro.';

  @override
  String get outputDirectoryTitle => 'Dossier de Sortie';

  @override
  String get defaultOutputDirectory => 'Par défaut (À côté de l\'original)';

  @override
  String get selectOutputFolderTitle => 'Sélectionner un Dossier';

  @override
  String get clearOutputFolder => 'Effacer le dossier personnalisé';

  @override
  String get changeBtn => 'Changer';

  @override
  String get outputLocationTitle => 'Comportement de Sortie';

  @override
  String get outputLocationUnifiedLabel => 'Dossier Unique';

  @override
  String get outputLocationUnifiedDesc =>
      'Toutes les vidéos dans un seul dossier.';

  @override
  String get outputLocationSameLabel => 'Même Dossier';

  @override
  String get outputLocationSameDesc =>
      'Chaque vidéo à côté de son fichier source.';

  @override
  String get fileManagementTitle => 'Gestion des Fichiers';

  @override
  String get keepOriginalsLabel => 'Garder les Originaux';

  @override
  String get keepOriginalsDesc => 'Conserver les fichiers d\'origine intacts.';

  @override
  String get toRecycleBinLabel => 'Vers la Corbeille';

  @override
  String get toRecycleBinDesc => 'Déplacer les originaux vers la corbeille.';

  @override
  String get outputFormatTitle => 'Format Conteneur';

  @override
  String get formatOriginalLabel => 'Original';

  @override
  String get formatOriginalDesc => 'Conserver le format d\'origine.';

  @override
  String get formatMp4Label => 'MP4';

  @override
  String get formatMp4Desc => 'Compatibilité maximale.';

  @override
  String get formatMkvLabel => 'MKV';

  @override
  String get formatMkvDesc => 'Prise en charge multi-pistes.';

  @override
  String get formatMovLabel => 'MOV';

  @override
  String get formatMovDesc => 'Format Apple QuickTime.';

  @override
  String get scanningFilesMsg => 'Analyse des fichiers en cours...';

  @override
  String get addFilesBtn => 'Ajouter des Fichiers';

  @override
  String get addFolderBtn => 'Ajouter un Dossier';

  @override
  String get dragDropMoreMsg =>
      'Ou glissez-déposez d\'autres fichiers n\'importe où';

  @override
  String get openOutputFolderTooltip => 'Ouvrir le Dossier de Sortie';

  @override
  String get statusQueued => 'En attente';

  @override
  String get statusAnalyzing => 'Analyse';

  @override
  String get statusCompressing => 'Compression';

  @override
  String get statusDone => 'Terminé';

  @override
  String get statusFailed => 'Échoué';

  @override
  String get statusCancelled => 'Annulé';

  @override
  String get savedPrefix => 'Économisé';

  @override
  String get largerSuffix => 'Plus grand';

  @override
  String get largerSizeWarning =>
      'La taille finale peut être plus grande que l\'original.';

  @override
  String get clearCompletedBtn => 'Effacer Terminer';

  @override
  String get clearAllBtn => 'Tout Effacer';

  @override
  String get stopAllBtn => 'Tout Arrêter';

  @override
  String get startCompressionBtn => 'Démarrer la Compression';

  @override
  String get allDoneLabel => 'Tout est prêt !';

  @override
  String get openFolderBtn => 'Ouvrir le Dossier';

  @override
  String get totalEtaLabel => 'Temps Restant';

  @override
  String get totalSavedLabel => 'Total Économisé';

  @override
  String get videoSingle => 'vidéo';

  @override
  String get videosPlural => 'vidéos';

  @override
  String get fileSingle => 'fichier';

  @override
  String get filesPlural => 'fichiers';

  @override
  String get releaseToAddVideosMsg => 'Relâchez pour ajouter des fichiers';

  @override
  String get dragDropHereMsg => 'Glissez-déposez des vidéos ou des images ici';

  @override
  String get supportedFormatsMsg =>
      'Prend en charge MP4, MKV, MOV, AVI, WMV, WebM • PNG, JPG, WebP, AVIF et plus';

  @override
  String get selectFilesBtn => 'Sélectionner des Fichiers';

  @override
  String get selectFolderBtn => 'Sélectionner un Dossier';

  @override
  String get releaseToShrinkTitle => 'Relâchez pour compacter';

  @override
  String get filesWillBeAddedDesc => 'Vos fichiers seront ajoutés à la file.';

  @override
  String get disabledLabel => 'Désactivé';

  @override
  String get compressionInProgressTitle => 'Compression en cours';

  @override
  String get confirmCloseDesc =>
      'Voulez-vous vraiment fermer Shrinkeo ?\nCela annulera les compressions actuelles.';

  @override
  String get keepCompressingBtn => 'Continuer la Compression';

  @override
  String get closeAppBtn => 'Fermer l\'Application';

  @override
  String get lockedSettingsWarning => 'Verrouillé pendant la compression';

  @override
  String get updateRequiredTitle => 'Mise à Jour Requise';

  @override
  String get updateRequiredDescNewVersion =>
      'Une nouvelle version de Shrinkeo est disponible.';

  @override
  String get updateRequiredDescOldVersion =>
      'Votre version n\'est plus prise en charge.';

  @override
  String get updateNowBtn => 'Mettre à Jour';

  @override
  String get laterBtn => 'Plus tard';

  @override
  String get updateAvailableTitle => 'Mise à Jour Disponible';

  @override
  String get whatsNewTitle => 'Nouveautés :';

  @override
  String get exitAppBtn => 'Quitter';

  @override
  String get retryBtn => 'Réessayer';

  @override
  String get downloadFromWebsiteBtn => 'Télécharger sur le Site Web';

  @override
  String get skipUpdateConfirmTitle => 'Ignorer la mise à jour ?';

  @override
  String get skipUpdateConfirmDesc =>
      'Cette mise à jour contient des correctifs critiques.';

  @override
  String get skipUpdateCancelBtn => 'Annuler';

  @override
  String get skipUpdateConfirmBtn => 'Ignorer la mise à jour';

  @override
  String get maintenanceTitle => 'Maintenance';

  @override
  String get maintenanceDescDefault =>
      'Shrinkeo est actuellement en maintenance.';

  @override
  String versionAvailableMsg(String version) {
    return 'La version $version est disponible.';
  }

  @override
  String get hwEncoderNotSupportedTitle => 'Encodeur matériel non supporté';

  @override
  String get failedCreateFolderError => 'Échec de création du dossier';

  @override
  String get failedProbeDurationError => 'Échec d\'analyse de durée';

  @override
  String get ffmpegNotFoundGlobalError => 'FFmpeg introuvable.';

  @override
  String get ffmpegMissingError => 'FFmpeg ou FFprobe manquant ou corrompu.';

  @override
  String hwFallbackNotificationBody(String encoderLabel) {
    return '$encoderLabel a échoué. Basculé sur CPU.';
  }

  @override
  String get failedDownloadUpdateMsg =>
      'Échec du téléchargement de la mise à jour. Veuillez réessayer.';

  @override
  String customRatioActiveTitle(Object ratio) {
    return 'Ratio personnalisé ($ratio)';
  }

  @override
  String customRatioActiveDesc(Object ratio) {
    return 'Cadrage adapté au ratio personnalisé ($ratio).';
  }

  @override
  String customAngleActiveTitle(Object angle) {
    return 'Angle personnalisé ($angle°)';
  }

  @override
  String customAngleActiveDesc(Object angle) {
    return 'Pivote la vidéo d\'un angle personnalisé de $angle°.';
  }

  @override
  String trimActiveDesc(Object end, Object start) {
    return 'Découpe la vidéo de $start à $end.';
  }

  @override
  String targetSizeLimitLabel(Object size) {
    return 'Limite de $size Mo';
  }

  @override
  String get customMbSizeTooltip => 'Saisir la taille en Mo';

  @override
  String get trimTimeTooltip =>
      'Saisir le temps ex. 5 (5s), 1:30 (1m30s), ou 00:01:30';

  @override
  String get tabImageSuite => 'Suite d\'Images';

  @override
  String get compressionModeTitle => 'Mode de Compression';

  @override
  String get smartAutoLabel => 'Auto Intelligent';

  @override
  String get smartAutoDesc =>
      'Réduit automatiquement la taille de 60 à 80% avec une clarté visuelle parfaite. Idéal pour vos photos quotidiennes.';

  @override
  String get maxSavingsLabel => 'Économie Max';

  @override
  String get maxSavingsDesc =>
      'Compression forte économisant jusqu\'à 85-90%. Idéal pour l\'envoi rapide et pièces jointes.';

  @override
  String get ultraFidelityLabel => 'Ultra Fidélité';

  @override
  String get ultraFidelityDesc =>
      'Conserve la qualité visuelle brute avec une compression minimale. Parfait pour l\'archivage et l\'impression.';

  @override
  String get targetImageFormatTitle => 'Format d\'Image Cible';

  @override
  String get dimensionResizingTitle => 'Redimensionnement';

  @override
  String get exifCameraPrivacyTitle => 'Confidentialité EXIF / Appareil';

  @override
  String get stripGpsCameraInfoLabel => 'Supprimer GPS et Info Appareil';

  @override
  String get imgFmtOriginalLabel => 'Format original';

  @override
  String get imgFmtOriginalDesc =>
      'Conserver le format original (le plus rapide, pas de conversion).';

  @override
  String get imgFmtPngLabel => 'Image PNG (.png)';

  @override
  String get imgFmtPngDesc =>
      'Format PNG sans perte avec prise en charge de la transparence.';

  @override
  String get imgFmtJpgLabel => 'Image JPEG (.jpg)';

  @override
  String get imgFmtJpgDesc =>
      'Format JPEG compressé standard pour une compatibilité universelle.';

  @override
  String get imgFmtWebpLabel => 'Image WebP (.webp)';

  @override
  String get imgFmtWebpDesc =>
      'Format WebP moderne offrant une compression supérieure et une petite taille.';

  @override
  String get imgFmtAvifLabel => 'Image AVIF (.avif)';

  @override
  String get imgFmtAvifDesc =>
      'Format AVIF de nouvelle génération avec une efficacité de compression ultra élevée.';

  @override
  String get imgResOriginalLabel => 'Dimensions d\'origine';

  @override
  String get imgResOriginalDesc =>
      'Conservez les dimensions originales de largeur et de hauteur de l’image.';

  @override
  String get imgRes4kLabel => '4K maximum (3 840 px)';

  @override
  String get imgRes4kDesc =>
      'Réduisez la dimension maximale de l’image à 3 840 px (4 K max).';

  @override
  String get imgRes1080pLabel => 'Pleine HD maximale (1920 px)';

  @override
  String get imgRes1080pDesc =>
      'Réduisez la dimension maximale de l’image à 1 920 px (Full HD max).';

  @override
  String get imgRes720pLabel => 'HD maximale (1280px)';

  @override
  String get imgRes720pDesc =>
      'Réduisez la dimension maximale de l’image à 1 280 px (HD max).';

  @override
  String get imgRes480pLabel => 'SD Max (854 px)';

  @override
  String get imgRes480pDesc =>
      'Réduisez la dimension maximale de l’image à 854 px (SD max).';

  @override
  String get keepMetadataImageInfoDesc =>
      'Conserve les métadonnées EXIF et les infos de l\'appareil d\'origine.';

  @override
  String get imageQualityModeLabel => 'Niveau de qualité';

  @override
  String get imageQualityModeDesc =>
      'Encode à un niveau de qualité fixe — une qualité plus élevée signifie des fichiers plus grands.';

  @override
  String get imageTargetSizeModeLabel => 'Taille cible';

  @override
  String get imageTargetSizeModeDesc =>
      'Trouve automatiquement la qualité la plus élevée tenant dans la limite de taille.';

  @override
  String get imageQualitySliderTitle => 'Qualité de l\'image';

  @override
  String get imageTargetSizeTitle => 'Taille de fichier cible';

  @override
  String get imageTargetSizeDesc =>
      'Encode de façon répétée avec une qualité décroissante jusqu\'à ce que le fichier tienne dans la limite. Des limites très petites peuvent réduire la qualité.';

  @override
  String imageTargetSizeLimitLabel(String size) {
    return 'Limite $size';
  }

  @override
  String get customKbSizeTooltip => 'Saisir une taille personnalisée en Ko';

  @override
  String get imageProcessingFailedError => 'Échec du traitement de l\'image';

  @override
  String get imageProcessingErrorMsg => 'Erreur de traitement de l\'image';

  @override
  String get cleanNoiseLabel => 'Réduction du bruit';

  @override
  String get outputLargerTooltip =>
      'Le résultat sera plus grand que l\'original !\nArrêtez et réinitialisez les paramètres.';

  @override
  String get estimatedSizePrefix => 'Est:';

  @override
  String get cancelBtnTooltip => 'Annuler';

  @override
  String get removeBtnTooltip => 'Supprimer';

  @override
  String get selectLanguageTitle => 'Sélectionner la langue';

  @override
  String get searchLanguageHint => 'Rechercher une langue par nom ou code...';

  @override
  String get noLanguagesMatchSearch =>
      'Aucune langue ne correspond à votre recherche.';

  @override
  String get languageTooltip => 'Langue';

  @override
  String get notifyCompressionCompleteTitle => 'Compression Shrinkeo terminée';

  @override
  String get notifyOutputLargerTitle => 'Résultat plus grand que l\'original';

  @override
  String languagesCountLabel(String count) {
    return '$count langues';
  }

  @override
  String notifyCompressionCompleteSuccess(String success) {
    return '$success fichiers compressés avec succès.';
  }

  @override
  String notifyCompressionCompleteFailed(String failed) {
    return ' ($failed échoués)';
  }

  @override
  String notifyOutputLargerDesc(String fileName) {
    return 'Il est prévu que $fileName soit plus grand que le fichier d\'origine. Envisagez d\'annuler et de réinitialiser.';
  }

  @override
  String get imagePreparing => 'Préparation de l’image';

  @override
  String get imageEncoding => 'Compression de l’image';

  @override
  String get imageSaving => 'Enregistrement du résultat';

  @override
  String imageTargetProgress(String size) {
    return 'Objectif : $size';
  }

  @override
  String imageAttempt(int count) {
    return 'Essai $count';
  }

  @override
  String imageBestResult(String size) {
    return 'Meilleur résultat : $size';
  }

  @override
  String queueCompleted(int done, int total) {
    return 'Terminés : $done sur $total';
  }
}
