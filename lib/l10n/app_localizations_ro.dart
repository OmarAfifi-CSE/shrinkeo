// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Romanian Moldavian Moldovan (`ro`).
class AppLocalizationsRo extends AppLocalizations {
  AppLocalizationsRo([String locale = 'ro']) : super(locale);

  @override
  String get appName => 'Shrinkeo';

  @override
  String get totalSpaceSaved => 'Spațiu total economisit';

  @override
  String get savedSpacePrefix => 'Economisit:';

  @override
  String get supportButtonText => 'Susține proiectul';

  @override
  String get lightThemeTooltip => 'Tema Luminoasă';

  @override
  String get darkThemeTooltip => 'Tema Întunecată';

  @override
  String get settingsTooltip => 'Setări';

  @override
  String get minimizeTooltip => 'Minimizare';

  @override
  String get closeTooltip => 'Închidere';

  @override
  String get restoreTooltip => 'Restaurare';

  @override
  String get maximizeTooltip => 'Maximizare';

  @override
  String get tabCompressionQuality => 'Compresie & Calitate';

  @override
  String get tabVideoEditingTools => 'Editare Video & Unelte';

  @override
  String get tabAudioSettings => 'Setări Audio';

  @override
  String get tabEngineOutput => 'Motor & Salvare';

  @override
  String get compressionSettingsTitle => 'Setări de Compresie';

  @override
  String get resetToDefaults => 'Reinițializare';

  @override
  String get resetDefaultTooltip => 'Restabilire valori inițiale';

  @override
  String get modeTargetSizeTitle => 'Mod Țintă Compresie';

  @override
  String get modeCrfLabel => 'Calitate (CRF)';

  @override
  String get modeTargetSizeLabel => 'Dimensiune Țintă (MB)';

  @override
  String get crfQualityTitle => 'Factor de Calitate CRF';

  @override
  String get crfLossless => 'Fără pierderi';

  @override
  String get crfHighQuality => 'Calitate superioară';

  @override
  String get crfBalanced => 'Echilibrat';

  @override
  String get crfHighCompression => 'Compresie ridicată';

  @override
  String get crfLowQuality => 'Calitate scăzută';

  @override
  String get crfUltraCompressed => 'Ultra Comprimat';

  @override
  String get targetSizeLabel => 'Dimensiune Fișier Țintă (MB)';

  @override
  String get targetSizeDesc =>
      'Calculează rata de biți pentru a se încadra în limită.';

  @override
  String get encodingSpeedTitle => 'Viteză de Codare';

  @override
  String get presetUltrafastLabel => 'Ultra-rapid';

  @override
  String get presetUltrafastDesc =>
      'Viteză maximă, dar reducere minimă a dimensiunii.';

  @override
  String get presetSuperfastLabel => 'Super-rapid';

  @override
  String get presetSuperfastDesc => 'Codare foarte rapidă.';

  @override
  String get presetVeryfastLabel => 'Foarte Rapid';

  @override
  String get presetVeryfastDesc => 'Mai rapid decât media.';

  @override
  String get presetFasterLabel => 'Mai Rapid';

  @override
  String get presetFasterDesc => 'Viteză bună și compresie ridicată.';

  @override
  String get presetFastLabel => 'Rapid';

  @override
  String get presetFastDesc =>
      'Cel mai bun echilibru între viteză și dimensiune.';

  @override
  String get presetMediumLabel => 'Mediu';

  @override
  String get presetMediumDesc => 'Echilibru implicit.';

  @override
  String get presetSlowLabel => 'Lent';

  @override
  String get presetSlowDesc => 'Mai lent, dar fișiere semnificativ mai mici.';

  @override
  String get presetVeryslowLabel => 'Foarte Lent';

  @override
  String get presetVeryslowDesc => 'Reducere maximă a dimensiunii.';

  @override
  String get videoCodecTitle => 'Codec Video';

  @override
  String get codecH264Label => 'H.264';

  @override
  String get codecH264Desc => 'Compatibilitate maximă cu dispozitivele vechi.';

  @override
  String get codecH265Label => 'H.265 / HEVC';

  @override
  String get codecH265Desc => 'Eficiență mai bună de compresie.';

  @override
  String get codecAv1Label => 'AV1';

  @override
  String get codecAv1Desc =>
      'Codec de generație nouă (cu 30% mai mic decât H.265).';

  @override
  String get hardwareEncoderTitle => 'Accelerare Hardware (GPU)';

  @override
  String get hwSoftwareLabel => 'Software (CPU)';

  @override
  String get hwSoftwareDesc =>
      'Cel mai lent, dar cea mai mare compatibilitate.';

  @override
  String get hwNvidiaLabel => 'Nvidia (NVENC)';

  @override
  String get hwNvidiaDesc => 'Codare foarte rapidă pentru plăci Nvidia.';

  @override
  String get hwAmdLabel => 'AMD (AMF)';

  @override
  String get hwAmdDesc => 'Codare foarte rapidă pentru plăci AMD.';

  @override
  String get hwIntelLabel => 'Intel (QSV)';

  @override
  String get hwIntelDesc => 'Codare foarte rapidă pentru plăci Intel.';

  @override
  String get resolutionTitle => 'Rezoluție Maximă';

  @override
  String get resOriginalLabel => 'Originală';

  @override
  String get resOriginalDesc => 'Păstrează rezoluția originală.';

  @override
  String get res4kLabel => '4K';

  @override
  String get res4kDesc => 'Reduce la maxim 4K.';

  @override
  String get res2kLabel => '2K';

  @override
  String get res2kDesc => 'Reduce la maxim 2K.';

  @override
  String get res1080pLabel => '1080p';

  @override
  String get res1080pDesc => 'Reduce la maxim 1080p Full HD.';

  @override
  String get res720pLabel => '720p';

  @override
  String get res720pDesc => 'Reduce la maxim 720p HD.';

  @override
  String get res480pLabel => '480p';

  @override
  String get res480pDesc => 'Reduce la 480p.';

  @override
  String get res360pLabel => '360p';

  @override
  String get res360pDesc => 'Compresie maximă.';

  @override
  String get frameRateTitle => 'Rată de Cadre (FPS)';

  @override
  String get fpsOriginalLabel => 'Originală';

  @override
  String get fpsOriginalDesc => 'Aceeași rată de cadre ca sursa.';

  @override
  String get fps60Label => '60 fps';

  @override
  String get fps60Desc => 'Fluid pentru jocuri sau sport.';

  @override
  String get fps30Label => '30 fps';

  @override
  String get fps30Desc => 'Standard pentru majoritatea videoclipurilor.';

  @override
  String get fps24Label => '24 fps';

  @override
  String get fps24Desc => 'Stil cinematografic.';

  @override
  String get enableVideoDenoiseTitle => 'Curățare Zgomot Video';

  @override
  String get enableVideoDenoiseDesc =>
      'Filtru 3D pentru eliminarea zgomotului.';

  @override
  String get exportFormatTitle => 'Format Export';

  @override
  String get exportVideoLabel => 'Video Standard';

  @override
  String get exportVideoDesc => 'Exportă în MP4/MKV/MOV';

  @override
  String get exportGifLabel => 'GIF Animat';

  @override
  String get exportGifDesc => 'Creează GIF animat de înaltă calitate';

  @override
  String get exportMp3Label => 'Extrage MP3';

  @override
  String get exportMp3Desc => 'Extrage audio în MP3 320kbps';

  @override
  String get exportAacLabel => 'Extrage AAC';

  @override
  String get exportAacDesc => 'Extrage audio în AAC';

  @override
  String get exportWavLabel => 'Extrage WAV';

  @override
  String get exportWavDesc => 'Extrage audio WAV necomprimat';

  @override
  String get privacyScrubbingTitle => 'Confidențialitate & GPS';

  @override
  String get keepMetadataLabel => 'Păstrează Datele';

  @override
  String get stripGpsExifLabel => 'Șterge GPS/EXIF';

  @override
  String get stripGpsExifInfoTitle => 'Curăță Metadata';

  @override
  String get stripGpsExifInfoDesc =>
      'Șterge informațiile despre cameră și locația GPS.';

  @override
  String get keepMetadataInfoDesc => 'Păstrează toate datele originale.';

  @override
  String get autoCropBlackBarsTitle => 'Decupare Automată Benzi Negre';

  @override
  String get autoCropLabel => 'Auto Decupare';

  @override
  String get autoCropActiveTitle => 'Auto Decupare Activă';

  @override
  String get autoCropActiveDesc => 'Elimină automat benzile negre.';

  @override
  String get autoCropDisabledDesc => 'Păstrează marginile originale.';

  @override
  String get playbackSpeedTitle => 'Viteză Redare';

  @override
  String get speedOriginalLabel => '1.0x';

  @override
  String get speedOriginalDesc => 'Viteză normală';

  @override
  String get speedSlow05Label => '0.5x Lent';

  @override
  String get speedSlow05Desc => 'Redare la jumătate din viteză';

  @override
  String get speedFast15Label => '1.5x';

  @override
  String get speedFast15Desc => 'De 1.5 ori mai rapid';

  @override
  String get speedFast20Label => '2.0x Rapid';

  @override
  String get speedFast20Desc => 'Viteză dublă';

  @override
  String get speedTimelapse40Label => '4.0x Timelapse';

  @override
  String get speedTimelapse40Desc => 'Viteză 4x pentru timelapse';

  @override
  String get canvasAspectRatioTitle => 'Raport Aspect';

  @override
  String get aspectOriginalLabel => 'Original';

  @override
  String get aspectOriginalDesc => 'Păstrează raportul original';

  @override
  String get aspectShortsLabel => '9:16 Shorts';

  @override
  String get aspectShortsDesc => 'Pentru TikTok și Reels';

  @override
  String get aspectSquareLabel => '1:1 Pătrat';

  @override
  String get aspectSquareDesc => 'Pentru postări Instagram';

  @override
  String get aspectPortraitLabel => '4:5 Portret';

  @override
  String get aspectPortraitDesc => 'Pentru Instagram vertical';

  @override
  String get aspectWidescreenLabel => '16:9 Lat';

  @override
  String get aspectWidescreenDesc => 'Pentru YouTube și TV';

  @override
  String get aspectClassicLabel => '4:3 Clasic';

  @override
  String get aspectClassicDesc => 'Pentru ecran clasic';

  @override
  String get aspectCinemaLabel => '21:9 Cinema';

  @override
  String get aspectCinemaDesc => 'Pentru monitoare ultrawide';

  @override
  String get aspectCustomLabel => 'Raport Personalizat';

  @override
  String get aspectCustomDesc => 'Raport de aspect personalizat';

  @override
  String get customRatioTooltip => 'Ex: 16:10, 2:1';

  @override
  String get rotationFlipTitle => 'Rotire & Oglindire';

  @override
  String get rotOriginalLabel => 'Original (0°)';

  @override
  String get rotOriginalDesc => 'Păstrează orientarea';

  @override
  String get rot90Label => '90° Dreapta';

  @override
  String get rot90Desc => 'Rotire cu 90 grade în sens orar';

  @override
  String get rot180Label => '180° Răsturnat';

  @override
  String get rot180Desc => 'Rotire cu capul în jos';

  @override
  String get rot270Label => '270° Stânga';

  @override
  String get rot270Desc => 'Rotire cu 90 grade în sens antiorar';

  @override
  String get rotFlipHLabel => 'Oglindire Oriz.';

  @override
  String get rotFlipHDesc => 'Oglindire pe orizontală';

  @override
  String get rotFlipVLabel => 'Oglindire Vert.';

  @override
  String get rotFlipVDesc => 'Oglindire pe verticală';

  @override
  String get rotCustomLabel => 'Unghi Personalizat';

  @override
  String get rotCustomDesc => 'Rotire cu un unghi specific';

  @override
  String get customRotationTooltip => 'Unghi în grade ex. 45';

  @override
  String get trimVideoTitle => 'Tăiere Video';

  @override
  String get fullVideoLabel => 'Video Complet';

  @override
  String get cutClipLabel => 'Tăiere Mapped';

  @override
  String get trimStartLabel => 'Start';

  @override
  String get trimEndLabel => 'Sfârșit';

  @override
  String get trimActiveTitle => 'Tăiere Activă';

  @override
  String get fullVideoDesc => 'Procesează întregul video fără tăiere.';

  @override
  String get audioModeTitle => 'Mod Pistă Audio';

  @override
  String get audioOriginalLabel => 'Originală';

  @override
  String get audioOriginalDesc => 'Fără pierdere de calitate audio.';

  @override
  String get audioAac256Label => 'Calitate Înaltă';

  @override
  String get audioAac256Desc => 'AAC 256kbps';

  @override
  String get audioAac128Label => 'Echilibrat';

  @override
  String get audioAac128Desc => 'AAC 128kbps (Standard Web)';

  @override
  String get audioAac64Label => 'Calitate Scăzută';

  @override
  String get audioAac64Desc => 'AAC 64kbps pentru voce';

  @override
  String get audioMuteLabel => 'Fără Sunet';

  @override
  String get audioMuteDesc => 'Elimină complet pista audio.';

  @override
  String get audioNormTitle => 'Normalizare Volum';

  @override
  String get audioNormOffLabel => 'Oprit';

  @override
  String get audioNormOffDesc => 'Dinamica originală.';

  @override
  String get audioNormSpeechLabel => 'Voce Umană';

  @override
  String get audioNormSpeechDesc => 'Standard EBU R128 pentru dialog clar.';

  @override
  String get audioNormDynamicLabel => 'Cinema Dinamic';

  @override
  String get audioNormDynamicDesc => 'Nivelează sunetele încet și tare.';

  @override
  String get audioNormBoostLabel => 'Amplificare Ușoară';

  @override
  String get audioNormBoostDesc => '+3dB amplificare volum.';

  @override
  String get audioChanTitle => 'Canale Audio';

  @override
  String get audioChanOriginalLabel => 'Originale';

  @override
  String get audioChanOriginalDesc => 'Păstrează canalele sursă.';

  @override
  String get audioChanStereoLabel => 'Stereo (2.0)';

  @override
  String get audioChanStereoDesc => 'Compatibilitate stereo 2 canale.';

  @override
  String get audioChanMonoLabel => 'Mono (1.0)';

  @override
  String get audioChanMonoDesc => 'Un singur canal - 50% economie audio.';

  @override
  String get removeNoiseLabel => 'Elimină Zgomotul';

  @override
  String get enableAudioDenoiseTitle => 'Elimină Zgomotul de Microfon';

  @override
  String get enableAudioDenoiseDesc =>
      'Filtru pentru eliminarea zgomotului de fundal.';

  @override
  String get outputDirectoryTitle => 'Dosar Salvare';

  @override
  String get defaultOutputDirectory => 'Implicit (Lângă fișierul original)';

  @override
  String get selectOutputFolderTitle => 'Selectează Dosar';

  @override
  String get clearOutputFolder => 'Utilizează locația implicită';

  @override
  String get changeBtn => 'Schimbă';

  @override
  String get outputLocationTitle => 'Comportament Salvare';

  @override
  String get outputLocationUnifiedLabel => 'Un Singur Dosar';

  @override
  String get outputLocationUnifiedDesc =>
      'Toate videoclipurile intr-un singur dosar.';

  @override
  String get outputLocationSameLabel => 'Lângă Original';

  @override
  String get outputLocationSameDesc => 'Fiecare video lângă fișierul sursă.';

  @override
  String get fileManagementTitle => 'Administrare Fișiere';

  @override
  String get keepOriginalsLabel => 'Păstrează Originalele';

  @override
  String get keepOriginalsDesc => 'Lasă fișierele originale neschimbate.';

  @override
  String get toRecycleBinLabel => 'La Coșul de Gunoi';

  @override
  String get toRecycleBinDesc =>
      'Mută fișierele originale la coș după compresie.';

  @override
  String get outputFormatTitle => 'Format Container';

  @override
  String get formatOriginalLabel => 'Original';

  @override
  String get formatOriginalDesc => 'Păstrează formatul original.';

  @override
  String get formatMp4Label => 'MP4';

  @override
  String get formatMp4Desc => 'Compatibilitate maximă.';

  @override
  String get formatMkvLabel => 'MKV';

  @override
  String get formatMkvDesc => 'Suport pentru mai multe piste.';

  @override
  String get formatMovLabel => 'MOV';

  @override
  String get formatMovDesc => 'Format Apple QuickTime.';

  @override
  String get scanningFilesMsg => 'Scenare fișiere...';

  @override
  String get addFilesBtn => 'Adaugă Fișiere';

  @override
  String get addFolderBtn => 'Adaugă Dosar';

  @override
  String get dragDropMoreMsg =>
      'Sau trageți & plasați mai multe videoclipuri aici';

  @override
  String get openOutputFolderTooltip => 'Deschide Dosarul de Salvare';

  @override
  String get statusQueued => 'În așteptare';

  @override
  String get statusAnalyzing => 'Analizare';

  @override
  String get statusCompressing => 'Compresie';

  @override
  String get statusDone => 'Gata';

  @override
  String get statusFailed => 'Eșuat';

  @override
  String get statusCancelled => 'Anulat';

  @override
  String get savedPrefix => 'Economisit';

  @override
  String get largerSuffix => 'Mai Mare';

  @override
  String get largerSizeWarning =>
      'Dimensiunea finală poate fi mai mare decât cea originală.';

  @override
  String get clearCompletedBtn => 'Șterge Finalizate';

  @override
  String get clearAllBtn => 'Șterge Tot';

  @override
  String get stopAllBtn => 'Oprește Tot';

  @override
  String get startCompressionBtn => 'Începe Compresia';

  @override
  String get allDoneLabel => 'Totul este Gata!';

  @override
  String get openFolderBtn => 'Deschide Dosar';

  @override
  String get totalEtaLabel => 'Timp Rămas';

  @override
  String get totalSavedLabel => 'Total Economisit';

  @override
  String get videoSingle => 'video';

  @override
  String get videosPlural => 'video-uri';

  @override
  String get releaseToAddVideosMsg => 'Eliberați pentru adăugare';

  @override
  String get dragDropHereMsg => 'Trageți & plasați fișiere sau dosare aici';

  @override
  String get supportedFormatsMsg => 'Suportă MP4, MKV, MOV, AVI, WMV';

  @override
  String get selectFilesBtn => 'Selectează Fișiere';

  @override
  String get selectFolderBtn => 'Selectează Dosar';

  @override
  String get releaseToShrinkTitle => 'Eliberați pentru compresie';

  @override
  String get filesWillBeAddedDesc => 'Fișierele dvs. vor fi adăugate în coadă.';

  @override
  String get disabledLabel => 'Dezactivat';

  @override
  String get compressionInProgressTitle => 'Compresie în Curs';

  @override
  String get confirmCloseDesc => 'Sigur doriți să închideți Shrinkeo?';

  @override
  String get keepCompressingBtn => 'Continuă Compresia';

  @override
  String get closeAppBtn => 'Închide Aplicația';

  @override
  String get lockedSettingsWarning => 'Blocat în timpul compresiei';

  @override
  String get updateRequiredTitle => 'Actualizare Necesară';

  @override
  String get updateRequiredDescNewVersion =>
      'O nouă versiune este disponibilă.';

  @override
  String get updateRequiredDescOldVersion =>
      'Versiunea dvs. nu mai este suportată.';

  @override
  String get updateNowBtn => 'Actualizează Acum';

  @override
  String get laterBtn => 'Mai târziu';

  @override
  String get updateAvailableTitle => 'Actualizare Disponibilă';

  @override
  String get whatsNewTitle => 'Ce este nou:';

  @override
  String get exitAppBtn => 'Ieșire';

  @override
  String get retryBtn => 'Încearcă din nou';

  @override
  String get downloadFromWebsiteBtn => 'Descarcă de pe Site';

  @override
  String get skipUpdateConfirmTitle => 'Omiteți actualizarea?';

  @override
  String get skipUpdateConfirmDesc =>
      'Această actualizare conține remedieri importante.';

  @override
  String get skipUpdateCancelBtn => 'Anulare';

  @override
  String get skipUpdateConfirmBtn => 'Omite actualizarea';

  @override
  String get maintenanceTitle => 'Mentenanță';

  @override
  String get maintenanceDescDefault => 'Shrinkeo este în mentenanță.';

  @override
  String versionAvailableMsg(String version) {
    return 'Versiunea $version este disponibilă.';
  }

  @override
  String get hwEncoderNotSupportedTitle =>
      'Accelerarea hardware nu este suportată';

  @override
  String get failedCreateFolderError => 'Crearea dosarului a eșuat';

  @override
  String get failedProbeDurationError => 'Aflarea duratei a eșuat';

  @override
  String get ffmpegNotFoundGlobalError => 'FFmpeg nu a fost găsit.';

  @override
  String get ffmpegMissingError =>
      'FFmpeg sau FFprobe lipsește sau este deteriorat.';

  @override
  String hwFallbackNotificationBody(String encoderLabel) {
    return '$encoderLabel a eșuat. S-a trecut automat la CPU.';
  }

  @override
  String get failedDownloadUpdateMsg =>
      'Descărcarea actualizării a eșuat. Încercați din nou.';

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
  String get compressionModeTitle => 'Modul de compresie';

  @override
  String get smartAutoLabel => 'Smart Auto';

  @override
  String get smartAutoDesc =>
      'Reduce automat dimensiunea fișierului cu ~60-80%, cu o claritate vizuală impecabilă de 100%. Perfect pentru optimizarea zilnică a fotografiilor.';

  @override
  String get maxSavingsLabel => 'Economii maxime';

  @override
  String get maxSavingsDesc =>
      'Compresie agresivă care economisește până la 85-90% dimensiunea fișierului. Cel mai bun pentru mesaje rapide, încărcări web și atașamente de e-mail.';

  @override
  String get ultraFidelityLabel => 'Ultra Fidelitate';

  @override
  String get ultraFidelityDesc =>
      'Păstrează fidelitatea vizuală brută cu o compresie minimă. Ideal pentru arhive fotografice și lucrări de imprimare de înaltă rezoluție.';

  @override
  String get targetImageFormatTitle => 'Format de imagine țintă';

  @override
  String get dimensionResizingTitle => 'Redimensionarea dimensiunii';

  @override
  String get exifCameraPrivacyTitle => 'EXIF / Confidențialitate a camerei';

  @override
  String get stripGpsCameraInfoLabel => 'Strip GPS și informații despre cameră';

  @override
  String get intentCompressOnly => 'Doar compresă';

  @override
  String get intentCompressOnlyTooltip =>
      'Concentrați-vă exclusiv pe reducerea dimensiunii fișierului (% calitate sau KB/MB țintă)';

  @override
  String get intentEditConvertOnly => 'Numai editați / convertiți';

  @override
  String get intentEditConvertOnlyTooltip =>
      'Redimensionați, rotiți, tăiați sau convertiți formatul fără a reduce calitatea vizuală';

  @override
  String get intentCompressAndEdit => 'Comprimați și editați';

  @override
  String get intentCompressAndEditTooltip =>
      'Control total: editați, redimensionați, rotiți ȘI comprimați dimensiunea fișierului împreună';
}
