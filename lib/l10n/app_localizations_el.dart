// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Modern Greek (`el`).
class AppLocalizationsEl extends AppLocalizations {
  AppLocalizationsEl([String locale = 'el']) : super(locale);

  @override
  String get appName => 'Shrinkeo';

  @override
  String get totalSpaceSaved => 'Συνολικός Χώρος που Εξοικονομήθηκε';

  @override
  String get savedSpacePrefix => 'Εξοικονόμηση:';

  @override
  String get supportButtonText => 'Κέρασέ με έναν καφέ';

  @override
  String get lightThemeTooltip => 'Φωτεινό Θέμα';

  @override
  String get darkThemeTooltip => 'Σκούρο Θέμα';

  @override
  String get settingsTooltip => 'Ρυθμίσεις';

  @override
  String get minimizeTooltip => 'Ελαχιστοποίηση';

  @override
  String get closeTooltip => 'Κλείσιμο';

  @override
  String get restoreTooltip => 'Επαναφορά';

  @override
  String get maximizeTooltip => 'Μεγιστοποίηση';

  @override
  String get tabCompressionQuality => 'Συμπίεση & Ποιότητα';

  @override
  String get tabVideoEditingTools => 'Επεξεργασία Bίντεο & Εργαλεία';

  @override
  String get tabAudioSettings => 'Ρυθμίσεις Ήχου';

  @override
  String get tabEngineOutput => 'Μηχανή & Έξοδος';

  @override
  String get compressionSettingsTitle => 'Ρυθμίσεις Συμπίεσης';

  @override
  String get resetToDefaults => 'Επαναφορά Προεπιλογών';

  @override
  String get resetDefaultTooltip => 'Επαναφορά στις αρχικές τιμές';

  @override
  String get modeTargetSizeTitle => 'Λειτουργία Στόχου Συμπίεσης';

  @override
  String get modeCrfLabel => 'Ποιότητα (CRF)';

  @override
  String get modeTargetSizeLabel => 'Μέγεθος Στόχου (MB)';

  @override
  String get crfQualityTitle => 'Συντελεστής Ποιότητας CRF';

  @override
  String get targetSizeLabel => 'Επιθυμητό Μέγεθος Αρχείου (MB)';

  @override
  String get targetSizeDesc =>
      'Υπολογίζει το bitrate για να παραμείνει εντός ορίου.';

  @override
  String get encodingSpeedTitle => 'Ταχύτητα Κωδικοποίησης';

  @override
  String get presetUltrafastLabel => 'Υπερταχύ';

  @override
  String get presetUltrafastDesc =>
      'Μέγιστη ταχύτητα, αλλά ελάχιστη μείωση μεγέθους.';

  @override
  String get presetSuperfastLabel => 'Εξαιρετικά Γρήγορο';

  @override
  String get presetSuperfastDesc => 'Πολύ γρήγορη κωδικοποίηση.';

  @override
  String get presetVeryfastLabel => 'Πολύ Γρήγορο';

  @override
  String get presetVeryfastDesc => 'Γρηγορότερο από το μέσο όρο.';

  @override
  String get presetFasterLabel => 'Γρηγορότερο';

  @override
  String get presetFasterDesc => 'Καλή ταχύτητα και υψηλή συμπίεση.';

  @override
  String get presetFastLabel => 'Γρήγορο (Συνιστάται)';

  @override
  String get presetFastDesc => 'Εξαιρετική ισορροπία ταχύτητας και μεγέθους.';

  @override
  String get presetMediumLabel => 'Μεσαίο';

  @override
  String get presetMediumDesc => 'Προεπιλεγμένη ισορροπία.';

  @override
  String get presetSlowLabel => 'Αργό';

  @override
  String get presetSlowDesc => 'Πιο αργό, αλλά σημαντικά μικρότερα αρχεία.';

  @override
  String get presetVeryslowLabel => 'Πολύ Αργό';

  @override
  String get presetVeryslowDesc => 'Μέγιστη μείωση μεγέθους.';

  @override
  String get videoCodecTitle => 'Codec Βίντεο';

  @override
  String get codecH264Label => 'H.264';

  @override
  String get codecH264Desc => 'Μέγιστη συμβατότητα με παλαιότερες συσκευές.';

  @override
  String get codecH265Label => 'H.265 / HEVC';

  @override
  String get codecH265Desc => 'Καλύτερη αποδοτικότητα συμπίεσης.';

  @override
  String get codecAv1Label => 'AV1';

  @override
  String get codecAv1Desc => 'Codec νέας γενιάς (30% μικρότερο από το H.265).';

  @override
  String get hardwareEncoderTitle => 'Επιτάχυνση Υλικού (GPU)';

  @override
  String get hwSoftwareLabel => 'Λογισμικό (CPU)';

  @override
  String get hwSoftwareDesc =>
      'Το πιο αργό, αλλά με τη μεγαλύτερη συμβατότητα.';

  @override
  String get hwNvidiaLabel => 'Nvidia (NVENC)';

  @override
  String get hwNvidiaDesc => 'Πολύ γρήγορη κωδικοποίηση για Nvidia GPU.';

  @override
  String get hwAmdLabel => 'AMD (AMF)';

  @override
  String get hwAmdDesc => 'Πολύ γρήγορη κωδικοποίηση για AMD GPU.';

  @override
  String get hwIntelLabel => 'Intel (QSV)';

  @override
  String get hwIntelDesc => 'Πολύ γρήγορη κωδικοποίηση για Intel GPU.';

  @override
  String get resolutionTitle => 'Μέγιστη Ανάλυση';

  @override
  String get resOriginalLabel => 'Αρχική';

  @override
  String get resOriginalDesc => 'Διατήρηση αρχικής ανάλυσης.';

  @override
  String get res4kLabel => '4K';

  @override
  String get res4kDesc => 'Μείωση έως το πολύ 4K.';

  @override
  String get res2kLabel => '2K';

  @override
  String get res2kDesc => 'Μείωση έως το πολύ 2K.';

  @override
  String get res1080pLabel => '1080p';

  @override
  String get res1080pDesc => 'Μείωση έως το πολύ 1080p Full HD.';

  @override
  String get res720pLabel => '720p';

  @override
  String get res720pDesc => 'Μείωση έως το πολύ 720p HD.';

  @override
  String get res480pLabel => '480p';

  @override
  String get res480pDesc => 'Μείωση σε 480p.';

  @override
  String get res360pLabel => '360p';

  @override
  String get res360pDesc => 'Μέγιστη συμπίεση.';

  @override
  String get frameRateTitle => 'Ρυθμός Καρέ (FPS)';

  @override
  String get fpsOriginalLabel => 'Αρχικός';

  @override
  String get fpsOriginalDesc => 'Ίδιος ρυθμός καρέ με την πηγή.';

  @override
  String get fps60Label => '60 fps';

  @override
  String get fps60Desc => 'Ομαλό για παιχνίδια ή σπορ.';

  @override
  String get fps30Label => '30 fps';

  @override
  String get fps30Desc => 'Τυπικό για τα περισσότερα βίντεο.';

  @override
  String get fps24Label => '24 fps';

  @override
  String get fps24Desc => 'Κινηματογραφικό στυλ.';

  @override
  String get enableVideoDenoiseTitle => 'Αφαίρεση Θορύβου Βίντεο';

  @override
  String get enableVideoDenoiseDesc => 'Φίλτρο 3D για μείωση θορύβου.';

  @override
  String get exportFormatTitle => 'Μορφή Εξαγωγής';

  @override
  String get exportVideoLabel => 'Τυπικό Βίντεο';

  @override
  String get exportVideoDesc => 'Εξαγωγή σε MP4/MKV/MOV';

  @override
  String get exportGifLabel => 'Κινούμενο GIF';

  @override
  String get exportGifDesc => 'Δημιουργία GIF υψηλής ποιότητας';

  @override
  String get exportMp3Label => 'Εξαγωγή MP3';

  @override
  String get exportMp3Desc => 'Εξαγωγή ήχου σε MP3 320kbps';

  @override
  String get exportAacLabel => 'Εξαγωγή AAC';

  @override
  String get exportAacDesc => 'Εξαγωγή ήχου σε AAC';

  @override
  String get exportWavLabel => 'Εξαγωγή WAV';

  @override
  String get exportWavDesc => 'Εξαγωγή ασυμπίεστου ήχου WAV';

  @override
  String get privacyScrubbingTitle => 'Ιδιωτικότητα & GPS';

  @override
  String get keepMetadataLabel => 'Διατήρηση Δεδομένων';

  @override
  String get stripGpsExifLabel => 'Αφαίρεση GPS/EXIF';

  @override
  String get stripGpsExifInfoTitle => 'Καθαρισμός Μεταδεδομένων';

  @override
  String get stripGpsExifInfoDesc =>
      'Αφαιρεί πληροφορίες κάμερας και τοποθεσίας GPS.';

  @override
  String get keepMetadataInfoDesc => 'Διατηρεί όλα τα αρχικά μεταδεδομένα.';

  @override
  String get autoCropBlackBarsTitle => 'Αυτόματη Περικοπή Μαύρων Λωρίδων';

  @override
  String get autoCropLabel => 'Αυτόματη Περικοπή';

  @override
  String get autoCropActiveTitle => 'Αυτόματη Περικοπή Ενεργή';

  @override
  String get autoCropActiveDesc => 'Αφαιρεί αυτόματα τις μαύρες λωρίδες.';

  @override
  String get autoCropDisabledDesc => 'Διατηρεί τα αρχικά περιθώρια.';

  @override
  String get playbackSpeedTitle => 'Ταχύτητα Αναπαραγωγής';

  @override
  String get speedOriginalLabel => '1.0x';

  @override
  String get speedOriginalDesc => 'Κανονική ταχύτητα';

  @override
  String get speedSlow05Label => '0.5x Αργό';

  @override
  String get speedSlow05Desc => 'Αναπαραγωγή στη μισή ταχύτητα';

  @override
  String get speedFast15Label => '1.5x';

  @override
  String get speedFast15Desc => '1.5 φορά γρηγορότερο';

  @override
  String get speedFast20Label => '2.0x Γρήγορο';

  @override
  String get speedFast20Desc => 'Διπλάσια ταχύτητα';

  @override
  String get speedTimelapse40Label => '4.0x Timelapse';

  @override
  String get speedTimelapse40Desc => '4x ταχύτητα για timelapse';

  @override
  String get canvasAspectRatioTitle => 'Αναλογία Διαστάσεων';

  @override
  String get aspectOriginalLabel => 'Αρχική';

  @override
  String get aspectOriginalDesc => 'Διατήρηση αρχικής αναλογίας';

  @override
  String get aspectShortsLabel => '9:16 Shorts';

  @override
  String get aspectShortsDesc => 'Για TikTok και Reels';

  @override
  String get aspectSquareLabel => '1:1 Τετράγωνο';

  @override
  String get aspectSquareDesc => 'Για δημοσιεύσεις Instagram';

  @override
  String get aspectPortraitLabel => '4:5 Κατακόρυφο';

  @override
  String get aspectPortraitDesc => 'Για κατακόρυφο Instagram';

  @override
  String get aspectWidescreenLabel => '16:9 Ευρεία';

  @override
  String get aspectWidescreenDesc => 'Για YouTube και TV';

  @override
  String get aspectClassicLabel => '4:3 Κλασική';

  @override
  String get aspectClassicDesc => 'Για κλασικές οθόνες';

  @override
  String get aspectCinemaLabel => '21:9 Σινεμά';

  @override
  String get aspectCinemaDesc => 'Για οθόνες ultrawide';

  @override
  String get aspectCustomLabel => 'Προσαρμοσμένη';

  @override
  String get aspectCustomDesc => 'Προσαρμοσμένη αναλογία';

  @override
  String get customRatioTooltip => 'Π.χ: 16:10, 2:1';

  @override
  String get rotationFlipTitle => 'Περιστροφή & Κατοπτρισμός';

  @override
  String get rotOriginalLabel => 'Αρχική (0°)';

  @override
  String get rotOriginalDesc => 'Διατήρηση προσανατολισμού';

  @override
  String get rot90Label => '90° Δεξιά';

  @override
  String get rot90Desc => 'Περιστροφή 90 μοίρες δεξιόστροφα';

  @override
  String get rot180Label => '180° Αναποδογύρισμα';

  @override
  String get rot180Desc => 'Περιστροφή ανάποδα';

  @override
  String get rot270Label => '270° Αριστερά';

  @override
  String get rot270Desc => 'Περιστροφή 90 μοίρες αριστερόστροφα';

  @override
  String get rotFlipHLabel => 'Οριζόντιος Κατοπτρισμός';

  @override
  String get rotFlipHDesc => 'Κατοπτρισμός οριζόντια';

  @override
  String get rotFlipVLabel => 'Κατακόρυφος Κατοπτρισμός';

  @override
  String get rotFlipVDesc => 'Κατοπτρισμός κατακόρυφα';

  @override
  String get rotCustomLabel => 'Προσαρμοσμένη Γωνία';

  @override
  String get rotCustomDesc => 'Περιστροφή με συγκεκριμένη γωνία';

  @override
  String get customRotationTooltip => 'Γωνία σε μοίρες π.χ. 45';

  @override
  String get trimVideoTitle => 'Περικοπή Βίντεο';

  @override
  String get fullVideoLabel => 'Πλήρες Βίντεο';

  @override
  String get cutClipLabel => 'Κοπή Κλιπ';

  @override
  String get trimStartLabel => 'Έναρξη';

  @override
  String get trimEndLabel => 'Τέλος';

  @override
  String get trimActiveTitle => 'Περικοπή Ενεργή';

  @override
  String get fullVideoDesc => 'Επεξεργασία ολόκληρου του βίντεο χωρίς κοπή.';

  @override
  String get audioModeTitle => 'Λειτουργία Κομματιού Ήχου';

  @override
  String get audioOriginalLabel => 'Αρχικός';

  @override
  String get audioOriginalDesc => 'Καμία απώλεια ποιότητας ήχου.';

  @override
  String get audioAac256Label => 'Υψηλή Ποιότητα';

  @override
  String get audioAac256Desc => 'AAC 256kbps';

  @override
  String get audioAac128Label => 'Ισορροπημένος';

  @override
  String get audioAac128Desc => 'AAC 128kbps (Πρότυπο Ιστού)';

  @override
  String get audioAac64Label => 'Χαμηλή Ποιότητα';

  @override
  String get audioAac64Desc => 'AAC 64kbps για ομιλία';

  @override
  String get audioMuteLabel => 'Σίγαση Ήχου';

  @override
  String get audioMuteDesc => 'Πλήρης αφαίρεση του ήχου.';

  @override
  String get audioNormTitle => 'Κανονικοποίηση Έντασης';

  @override
  String get audioNormOffLabel => 'Απενεργοποιημένο';

  @override
  String get audioNormOffDesc => 'Αρχική δυναμική.';

  @override
  String get audioNormSpeechLabel => 'Ανθρώπινη Ομιλία';

  @override
  String get audioNormSpeechDesc => 'Πρότυπο EBU R128 για καθαρούς διαλόγους.';

  @override
  String get audioNormDynamicLabel => 'Δυναμικό Σινεμά';

  @override
  String get audioNormDynamicDesc => 'Εξομαλύνει χαμηλούς και δυνατούς ήχους.';

  @override
  String get audioNormBoostLabel => 'Ελαφριά Ενίσχυση';

  @override
  String get audioNormBoostDesc => '+3dB ενίσχυση έντασης.';

  @override
  String get audioChanTitle => 'Κανάλια Ήχου';

  @override
  String get audioChanOriginalLabel => 'Αρχικά';

  @override
  String get audioChanOriginalDesc => 'Διατήρηση αρχικών καναλιών.';

  @override
  String get audioChanStereoLabel => 'Stereo (2.0)';

  @override
  String get audioChanStereoDesc => 'Συμβατότητα stereo 2 καναλιών.';

  @override
  String get audioChanMonoLabel => 'Mono (1.0)';

  @override
  String get audioChanMonoDesc => 'Μονό κανάλι - 50% εξοικονόμηση ήχου.';

  @override
  String get removeNoiseLabel => 'Αφαίρεση Θορύβου';

  @override
  String get enableAudioDenoiseTitle => 'Αφαίρεση Θορύβου Μικροφώνου';

  @override
  String get enableAudioDenoiseDesc => 'Φίλτρο για αφαίρεση θορύβου υποβάθρου.';

  @override
  String get outputDirectoryTitle => 'Φάκελος Εξόδου';

  @override
  String get defaultOutputDirectory => 'Προεπιλογή (Δίπλα στο αρχικό)';

  @override
  String get selectOutputFolderTitle => 'Επιλογή Φακέλου';

  @override
  String get clearOutputFolder => 'Χρήση προεπιλεγμένης τοποθεσίας';

  @override
  String get changeBtn => 'Αλλαγή';

  @override
  String get outputLocationTitle => 'Συμπεριφορά Εξόδου';

  @override
  String get outputLocationUnifiedLabel => 'Ένας Φάκελος';

  @override
  String get outputLocationUnifiedDesc =>
      'Όλα τα συμπιεσμένα βίντεο σε έναν φάκελο.';

  @override
  String get outputLocationSameLabel => 'Δίπλα στο Αρχικό';

  @override
  String get outputLocationSameDesc =>
      'Κάθε βίντεο δίπλα στο αρχείο πηγής του.';

  @override
  String get fileManagementTitle => 'Διαχείριση Αρχείων';

  @override
  String get keepOriginalsLabel => 'Διατήρηση Αρχικών';

  @override
  String get keepOriginalsDesc => 'Αφήνει τα αρχικά αρχεία ανέπαφα.';

  @override
  String get toRecycleBinLabel => 'Στον Κάδο Ανακύκλωσης';

  @override
  String get toRecycleBinDesc => 'Μεταφορά αρχικών στον κάδο μετά τη συμπίεση.';

  @override
  String get outputFormatTitle => 'Μορφή Περιέκτη';

  @override
  String get formatOriginalLabel => 'Αρχική';

  @override
  String get formatOriginalDesc => 'Διατήρηση αρχικής μορφής.';

  @override
  String get formatMp4Label => 'MP4';

  @override
  String get formatMp4Desc => 'Μέγιστη συμβατότητα.';

  @override
  String get formatMkvLabel => 'MKV';

  @override
  String get formatMkvDesc => 'Υποστήριξη πολλαπλών κομματιών.';

  @override
  String get formatMovLabel => 'MOV';

  @override
  String get formatMovDesc => 'Μορφή Apple QuickTime.';

  @override
  String get scanningFilesMsg => 'Σάρωση αρχείων...';

  @override
  String get addFilesBtn => 'Προσθήκη Αρχείων';

  @override
  String get addFolderBtn => 'Προσθήκη Φακέλου';

  @override
  String get dragDropMoreMsg => 'Ή σύρετε & αφήστε περισσότερα βίντεο εδώ';

  @override
  String get openOutputFolderTooltip => 'Άνοιγμα Φακέλου Εξόδου';

  @override
  String get statusQueued => 'Στην ουρά';

  @override
  String get statusAnalyzing => 'Ανάλυση';

  @override
  String get statusCompressing => 'Συμπίεση';

  @override
  String get statusDone => 'Ολοκληρώθηκε';

  @override
  String get statusFailed => 'Αποτυχία';

  @override
  String get statusCancelled => 'Ακυρώθηκε';

  @override
  String get savedPrefix => 'Εξοικονόμηση';

  @override
  String get largerSuffix => 'Μεγαλύτερο';

  @override
  String get largerSizeWarning =>
      'Το τελικό μέγεθος ενδέχεται να είναι μεγαλύτερο από το αρχικό.';

  @override
  String get clearCompletedBtn => 'Καθαρισμός Ολοκληρωμένων';

  @override
  String get clearAllBtn => 'Καθαρισμός Όλων';

  @override
  String get stopAllBtn => 'Διακοπή Όλων';

  @override
  String get startCompressionBtn => 'Έναρξη Συμπίεσης';

  @override
  String get allDoneLabel => 'Όλα Έτοιμα!';

  @override
  String get openFolderBtn => 'Άνοιγμα Φακέλου';

  @override
  String get totalEtaLabel => 'Υπολειπόμενος Χρόνος';

  @override
  String get totalSavedLabel => 'Συνολική Εξοικονόμηση';

  @override
  String get videoSingle => 'βίντεο';

  @override
  String get videosPlural => 'βίντεο';

  @override
  String get releaseToAddVideosMsg => 'Αφήστε για προσθήκη βίντεο';

  @override
  String get dragDropHereMsg => 'Σύρετε & αφήστε αρχεία ή φακέλους εδώ';

  @override
  String get supportedFormatsMsg => 'Υποστηρίζει MP4, MKV, MOV, AVI, WMV';

  @override
  String get selectFilesBtn => 'Επιλογή Αρχείων';

  @override
  String get selectFolderBtn => 'Επιλογή Φακέλου';

  @override
  String get releaseToShrinkTitle => 'Αφήστε για άμεση συμπίεση';

  @override
  String get filesWillBeAddedDesc => 'Τα αρχεία σας θα προστεθούν στην ουρά.';

  @override
  String get disabledLabel => 'Απενεργοποιημένο';

  @override
  String get compressionInProgressTitle => 'Συμπίεση σε Εξέλιξη';

  @override
  String get confirmCloseDesc =>
      'Είστε βέβαιοι ότι θέλετε να κλείσετε το Shrinkeo;';

  @override
  String get keepCompressingBtn => 'Συνέχιση Συμπίεσης';

  @override
  String get closeAppBtn => 'Κλείσιμο Εφαρμογής';

  @override
  String get lockedSettingsWarning => 'Κλειδωμένο κατά τη συμπίεση';

  @override
  String get updateRequiredTitle => 'Απαιτείται Ενημέρωση';

  @override
  String get updateRequiredDescNewVersion => 'Μια νέα έκδοση είναι διαθέσιμη.';

  @override
  String get updateRequiredDescOldVersion =>
      'Η έκδοσή σας δεν υποστηρίζεται πλέον.';

  @override
  String get updateNowBtn => 'Ενημέρωση Τώρα';

  @override
  String get laterBtn => 'Αργότερα';

  @override
  String get updateAvailableTitle => 'Διαθέσιμη Ενημέρωση';

  @override
  String get whatsNewTitle => 'Τι νέο υπάρχει:';

  @override
  String get exitAppBtn => 'Έξοδος';

  @override
  String get retryBtn => 'Δοκιμάστε ξανά';

  @override
  String get downloadFromWebsiteBtn => 'Λήψη από τον Ιστότοπο';

  @override
  String get skipUpdateConfirmTitle => 'Παράλειψη ενημέρωσης;';

  @override
  String get skipUpdateConfirmDesc =>
      'Αυτή η ενημέρωση περιέχει σημαντικές διορθώσεις.';

  @override
  String get skipUpdateCancelBtn => 'Ακύρωση';

  @override
  String get skipUpdateConfirmBtn => 'Παράλειψη ενημέρωσης';

  @override
  String get maintenanceTitle => 'Συντήρηση';

  @override
  String get maintenanceDescDefault => 'Το Shrinkeo βρίσκεται υπό συντήρηση.';

  @override
  String versionAvailableMsg(String version) {
    return 'Η έκδοση $version είναι διαθέσιμη.';
  }

  @override
  String get hwEncoderNotSupportedTitle =>
      'Η επιτάχυνση υλικού δεν υποστηρίζεται';

  @override
  String get failedCreateFolderError => 'Αποτυχία δημιουργίας φακέλου';

  @override
  String get failedProbeDurationError => 'Αποτυχία ανάγνωσης διάρκειας';

  @override
  String get ffmpegNotFoundGlobalError => 'Το FFmpeg δεν βρέθηκε.';

  @override
  String get ffmpegMissingError =>
      'Το FFmpeg ή το FFprobe λείπει ή είναι κατεστραμμένο.';

  @override
  String hwFallbackNotificationBody(String encoderLabel) {
    return 'Το $encoderLabel απέτυχε. Αυτόματη αλλαγή σε CPU.';
  }

  @override
  String get failedDownloadUpdateMsg =>
      'Η λήψη της ενημέρωσης απέτυχε. Δοκιμάστε ξανά.';
}
