// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Polish (`pl`).
class AppLocalizationsPl extends AppLocalizations {
  AppLocalizationsPl([String locale = 'pl']) : super(locale);

  @override
  String get appName => 'Shrinkeo';

  @override
  String get totalSpaceSaved => 'Łącznie zaoszczędzona przestrzeń';

  @override
  String get savedSpacePrefix => 'Zaoszczędzono:';

  @override
  String get supportButtonText => 'Wesprzyj projekt';

  @override
  String get lightThemeTooltip => 'Jasny motyw';

  @override
  String get darkThemeTooltip => 'Ciemny motyw';

  @override
  String get settingsTooltip => 'Ustawienia';

  @override
  String get minimizeTooltip => 'Minimalizuj';

  @override
  String get closeTooltip => 'Zamknij';

  @override
  String get restoreTooltip => 'Przywróć';

  @override
  String get maximizeTooltip => 'Maksymalizuj';

  @override
  String get tabCompressionQuality => 'Kompresja i Jakość';

  @override
  String get tabVideoEditingTools => 'Edycja Wideo i Narzędzia';

  @override
  String get tabAudioSettings => 'Ustawienia Dźwięku';

  @override
  String get tabEngineOutput => 'Silnik i Ścieżka';

  @override
  String get compressionSettingsTitle => 'Ustawienia Kompresji';

  @override
  String get resetToDefaults => 'Przywróć domyślne';

  @override
  String get resetDefaultTooltip => 'Zresetuj do wartości początkowych';

  @override
  String get modeTargetSizeTitle => 'Tryb Docelowy Kompresji';

  @override
  String get modeCrfLabel => 'Jakość (CRF)';

  @override
  String get modeTargetSizeLabel => 'Rozmiar Docelowy (MB)';

  @override
  String get crfQualityTitle => 'Współczynnik Jakości CRF';

  @override
  String get crfLossless => 'Bezstratny';

  @override
  String get crfHighQuality => 'Wysoka jakość';

  @override
  String get crfBalanced => 'Zrównoważony';

  @override
  String get crfHighCompression => 'Wysoka kompresja';

  @override
  String get crfLowQuality => 'Niska jakość';

  @override
  String get crfUltraCompressed => 'Ultra skompresowany';

  @override
  String get targetSizeLabel => 'Docelowy Rozmiar Pliku (MB)';

  @override
  String get targetSizeDesc =>
      'Oblicza przepływność, aby zmieścić się w limicie rozmiaru.';

  @override
  String get encodingSpeedTitle => 'Prędkość Kodowania';

  @override
  String get presetUltrafastLabel => 'Ultraszybki';

  @override
  String get presetUltrafastDesc =>
      'Maksymalna prędkość, ale najmniejsza redukcja rozmiaru.';

  @override
  String get presetSuperfastLabel => 'Super szybki';

  @override
  String get presetSuperfastDesc => 'Bardzo szybkie kodowanie.';

  @override
  String get presetVeryfastLabel => 'Bardzo szybki';

  @override
  String get presetVeryfastDesc => 'Szybszy niż przeciętnie.';

  @override
  String get presetFasterLabel => 'Szybszy';

  @override
  String get presetFasterDesc => 'Dobra prędkość i wysoka kompresja.';

  @override
  String get presetFastLabel => 'Szybki';

  @override
  String get presetFastDesc => 'Doskonały stosunek prędkości do rozmiaru.';

  @override
  String get presetMediumLabel => 'Średni';

  @override
  String get presetMediumDesc => 'Domyślny balans.';

  @override
  String get presetSlowLabel => 'Wolny';

  @override
  String get presetSlowDesc => 'Wolniejszy, ale znacznie mniejsze pliki.';

  @override
  String get presetVeryslowLabel => 'Bardzo wolny';

  @override
  String get presetVeryslowDesc => 'Maksymalne zmniejszenie rozmiaru.';

  @override
  String get videoCodecTitle => 'Kodek Wideo';

  @override
  String get codecH264Label => 'H.264';

  @override
  String get codecH264Desc =>
      'Maksymalna kompatybilność ze starszymi urządzeniami.';

  @override
  String get codecH265Label => 'H.265 / HEVC';

  @override
  String get codecH265Desc => 'Lepsza wydajność kompresji.';

  @override
  String get codecAv1Label => 'AV1';

  @override
  String get codecAv1Desc => 'Kodek nowej generacji (30% mniejszy niż H.265).';

  @override
  String get hardwareEncoderTitle => 'Akceleracja Sprzętowa (GPU)';

  @override
  String get hwSoftwareLabel => 'Programowy (CPU)';

  @override
  String get hwSoftwareDesc => 'Najwolniejszy, ale najwyższa kompatybilność.';

  @override
  String get hwNvidiaLabel => 'Nvidia (NVENC)';

  @override
  String get hwNvidiaDesc => 'Bardzo szybkie kodowanie dla kart Nvidia.';

  @override
  String get hwAmdLabel => 'AMD (AMF)';

  @override
  String get hwAmdDesc => 'Bardzo szybkie kodowanie dla kart AMD.';

  @override
  String get hwIntelLabel => 'Intel (QSV)';

  @override
  String get hwIntelDesc => 'Bardzo szybkie kodowanie dla kart Intel.';

  @override
  String get resolutionTitle => 'Maksymalna Rozdzielczość';

  @override
  String get resOriginalLabel => 'Oryginalna';

  @override
  String get resOriginalDesc => 'Zachowaj oryginalną rozdzielczość.';

  @override
  String get res4kLabel => '4K';

  @override
  String get res4kDesc => 'Zmniejsz maksymalnie do 4K.';

  @override
  String get res2kLabel => '2K';

  @override
  String get res2kDesc => 'Zmniejsz maksymalnie do 2K.';

  @override
  String get res1080pLabel => '1080p';

  @override
  String get res1080pDesc => 'Zmniejsz maksymalnie do 1080p Full HD.';

  @override
  String get res720pLabel => '720p';

  @override
  String get res720pDesc => 'Zmniejsz maksymalnie do 720p HD.';

  @override
  String get res480pLabel => '480p';

  @override
  String get res480pDesc => 'Zmniejsz do 480p.';

  @override
  String get res360pLabel => '360p';

  @override
  String get res360pDesc => 'Maksymalna kompresja.';

  @override
  String get frameRateTitle => 'Liczba Klatek (FPS)';

  @override
  String get fpsOriginalLabel => 'Oryginalna';

  @override
  String get fpsOriginalDesc => 'Ta sama liczba klatek co w źródle.';

  @override
  String get fps60Label => '60 fps';

  @override
  String get fps60Desc => 'Płynność dla gier lub sportu.';

  @override
  String get fps30Label => '30 fps';

  @override
  String get fps30Desc => 'Standard dla większości filmów.';

  @override
  String get fps24Label => '24 fps';

  @override
  String get fps24Desc => 'Styl kinowy.';

  @override
  String get enableVideoDenoiseTitle => 'Usuwanie Szumu Wideo';

  @override
  String get enableVideoDenoiseDesc =>
      'Filtr 3D usuwający ziarno i zwiększający kompresję.';

  @override
  String get exportFormatTitle => 'Format Eksportu';

  @override
  String get exportVideoLabel => 'Standardowy Film';

  @override
  String get exportVideoDesc => 'Eksportuj do MP4/MKV/MOV';

  @override
  String get exportGifLabel => 'Animowany GIF';

  @override
  String get exportGifDesc => 'Stwórz wysokiej jakości animację GIF';

  @override
  String get exportMp3Label => 'Wytnij MP3';

  @override
  String get exportMp3Desc => 'Wytnij dźwięk do MP3 320kbps';

  @override
  String get exportAacLabel => 'Wytnij AAC';

  @override
  String get exportAacDesc => 'Wytnij dźwięk do AAC';

  @override
  String get exportWavLabel => 'Wytnij WAV';

  @override
  String get exportWavDesc => 'Wytnij nieskompresowane audio WAV';

  @override
  String get privacyScrubbingTitle => 'Prywatność i GPS';

  @override
  String get keepMetadataLabel => 'Zachowaj Dane';

  @override
  String get stripGpsExifLabel => 'Usuń GPS/EXIF';

  @override
  String get stripGpsExifInfoTitle => 'Wyczyść Metadane';

  @override
  String get stripGpsExifInfoDesc =>
      'Usuwa informacje o aparacie i lokalizację GPS.';

  @override
  String get keepMetadataInfoDesc => 'Zachowuje wszystkie metadane.';

  @override
  String get autoCropBlackBarsTitle =>
      'Automatyczne Przycinanie Czarnych Pasów';

  @override
  String get autoCropLabel => 'Przytnij Pasy';

  @override
  String get autoCropActiveTitle => 'Przycinanie Aktywne';

  @override
  String get autoCropActiveDesc => 'Automatycznie usuwa czarne pasy.';

  @override
  String get autoCropDisabledDesc => 'Zachowuje oryginalne krawędzie.';

  @override
  String get playbackSpeedTitle => 'Prędkość Odtwarzania';

  @override
  String get speedOriginalLabel => '1.0x';

  @override
  String get speedOriginalDesc => 'Normalna prędkość';

  @override
  String get speedSlow05Label => '0.5x Zwolnione';

  @override
  String get speedSlow05Desc => 'Odtwarzanie z połową prędkości';

  @override
  String get speedFast15Label => '1.5x';

  @override
  String get speedFast15Desc => 'Przyspieszenie 1.5x';

  @override
  String get speedFast20Label => '2.0x Szybkie';

  @override
  String get speedFast20Desc => 'Podwójna prędkość';

  @override
  String get speedTimelapse40Label => '4.0x Timelapse';

  @override
  String get speedTimelapse40Desc => 'Prędkość 4x dla timelapse';

  @override
  String get canvasAspectRatioTitle => 'Proporcje Ekranu';

  @override
  String get aspectOriginalLabel => 'Oryginalne';

  @override
  String get aspectOriginalDesc => 'Zachowaj oryginalne proporcje';

  @override
  String get aspectShortsLabel => '9:16 Shorts';

  @override
  String get aspectShortsDesc => 'Dla TikTok i Reels';

  @override
  String get aspectSquareLabel => '1:1 Kwadrat';

  @override
  String get aspectSquareDesc => 'Dla postów na Instagramie';

  @override
  String get aspectPortraitLabel => '4:5 Portret';

  @override
  String get aspectPortraitDesc => 'Dla pionowego Instagrama';

  @override
  String get aspectWidescreenLabel => '16:9 Panoramiarz';

  @override
  String get aspectWidescreenDesc => 'Dla YouTube i TV';

  @override
  String get aspectClassicLabel => '4:3 Klasyczny';

  @override
  String get aspectClassicDesc => 'Dla klasycznych ekranów';

  @override
  String get aspectCinemaLabel => '21:9 Kinowy';

  @override
  String get aspectCinemaDesc => 'Dla monitorów ultrawide';

  @override
  String get aspectCustomLabel => 'Własne Proporcje';

  @override
  String get aspectCustomDesc => 'Niestandardowy format obrazu';

  @override
  String get customRatioTooltip => 'Np: 16:10, 2:1';

  @override
  String get rotationFlipTitle => 'Obrót i Odbicie';

  @override
  String get rotOriginalLabel => 'Oryginalny (0°)';

  @override
  String get rotOriginalDesc => 'Zachowaj orientację';

  @override
  String get rot90Label => '90° W prawo';

  @override
  String get rot90Desc => 'Obróć o 90 stopni w prawo';

  @override
  String get rot180Label => '180° Obrót';

  @override
  String get rot180Desc => 'Obróć do góry nogami';

  @override
  String get rot270Label => '270° W lewo';

  @override
  String get rot270Desc => 'Obróć o 90 stopni w lewo';

  @override
  String get rotFlipHLabel => 'Odbij Horiz.';

  @override
  String get rotFlipHDesc => 'Odbij poziomo';

  @override
  String get rotFlipVLabel => 'Odbij Vert.';

  @override
  String get rotFlipVDesc => 'Odbij pionowo';

  @override
  String get rotCustomLabel => 'Własny Kąt';

  @override
  String get rotCustomDesc => 'Obróć o określony kąt';

  @override
  String get customRotationTooltip => 'Kąt w stopniach np. 45';

  @override
  String get trimVideoTitle => 'Przytnij Wideo';

  @override
  String get fullVideoLabel => 'Cały Film';

  @override
  String get cutClipLabel => 'Wycinaj Fragment';

  @override
  String get trimStartLabel => 'Początek';

  @override
  String get trimEndLabel => 'Koniec';

  @override
  String get trimActiveTitle => 'Przycinanie Aktywne';

  @override
  String get fullVideoDesc => 'Przetwarzaj cały film bez przycinania.';

  @override
  String get audioModeTitle => 'Tryb Ścieżki Dźwiękowej';

  @override
  String get audioOriginalLabel => 'Oryginalny';

  @override
  String get audioOriginalDesc => 'Bez utraty jakości dźwięku.';

  @override
  String get audioAac256Label => 'Wysoka Jakość';

  @override
  String get audioAac256Desc => 'AAC 256kbps';

  @override
  String get audioAac128Label => 'Zrównoważony';

  @override
  String get audioAac128Desc => 'AAC 128kbps (Standard Web)';

  @override
  String get audioAac64Label => 'Niska Jakość';

  @override
  String get audioAac64Desc => 'AAC 64kbps dla mowy';

  @override
  String get audioMuteLabel => 'Wycisz Dźwięk';

  @override
  String get audioMuteDesc => 'Całkowicie usuń ścieżkę dźwiękową.';

  @override
  String get audioNormTitle => 'Normalizacja Głośności';

  @override
  String get audioNormOffLabel => 'Wyłączona';

  @override
  String get audioNormOffDesc => 'Oryginalna dynamika.';

  @override
  String get audioNormSpeechLabel => 'Mowa Ludzka';

  @override
  String get audioNormSpeechDesc => 'Standard EBU R128 dla czystego dialogu.';

  @override
  String get audioNormDynamicLabel => 'Kino Dynamiczne';

  @override
  String get audioNormDynamicDesc => 'Wyrównuje ciche i głośne sceny.';

  @override
  String get audioNormBoostLabel => 'Lekkie Wzmocnienie';

  @override
  String get audioNormBoostDesc => '+3dB wzmocnienia głośności.';

  @override
  String get audioChanTitle => 'Kanały Audio';

  @override
  String get audioChanOriginalLabel => 'Oryginalne';

  @override
  String get audioChanOriginalDesc => 'Zachowaj źródłowe kanały.';

  @override
  String get audioChanStereoLabel => 'Stereo (2.0)';

  @override
  String get audioChanStereoDesc => 'Kompatybilność stereo 2 kanały.';

  @override
  String get audioChanMonoLabel => 'Mono (1.0)';

  @override
  String get audioChanMonoDesc =>
      'Jednokanałowy - 50% oszczędności rozmiaru audio.';

  @override
  String get removeNoiseLabel => 'Usuń Szum';

  @override
  String get enableAudioDenoiseTitle => 'Usuń Szum Mikrofonu';

  @override
  String get enableAudioDenoiseDesc => 'Filtr usuwający szum tła.';

  @override
  String get outputDirectoryTitle => 'Katalog Wyjściowy';

  @override
  String get defaultOutputDirectory => 'Domyślny (Obok oryginalnego pliku)';

  @override
  String get selectOutputFolderTitle => 'Wybierz Folder';

  @override
  String get clearOutputFolder => 'Użyj domyślnej lokalizacji';

  @override
  String get changeBtn => 'Zmień';

  @override
  String get outputLocationTitle => 'Zachowanie Wyjścia';

  @override
  String get outputLocationUnifiedLabel => 'Jeden Folder';

  @override
  String get outputLocationUnifiedDesc =>
      'Wszystkie skompresowane pliki w jednym folderze.';

  @override
  String get outputLocationSameLabel => 'Obok Oryginału';

  @override
  String get outputLocationSameDesc => 'Każdy film obok pliku źródłowego.';

  @override
  String get fileManagementTitle => 'Zarządzanie Plikami';

  @override
  String get keepOriginalsLabel => 'Zachowaj Oryginały';

  @override
  String get keepOriginalsDesc => 'Pozostaw oryginalne pliki nienaruszone.';

  @override
  String get toRecycleBinLabel => 'Do Kosza';

  @override
  String get toRecycleBinDesc => 'Przenieś oryginały do kosza po kompresji.';

  @override
  String get outputFormatTitle => 'Format Kontenera';

  @override
  String get formatOriginalLabel => 'Oryginalny';

  @override
  String get formatOriginalDesc => 'Zachowaj oryginalny format.';

  @override
  String get formatMp4Label => 'MP4';

  @override
  String get formatMp4Desc => 'Maksymalna kompatybilność.';

  @override
  String get formatMkvLabel => 'MKV';

  @override
  String get formatMkvDesc => 'Obsługa wielu ścieżek.';

  @override
  String get formatMovLabel => 'MOV';

  @override
  String get formatMovDesc => 'Format Apple QuickTime.';

  @override
  String get scanningFilesMsg => 'Skanowanie plików...';

  @override
  String get addFilesBtn => 'Dodaj Pliki';

  @override
  String get addFolderBtn => 'Dodaj Folder';

  @override
  String get dragDropMoreMsg =>
      'Albo przeciągnij więcej plików w dowolnym miejscu';

  @override
  String get openOutputFolderTooltip => 'Otwórz Folder Wyjściowy';

  @override
  String get statusQueued => 'W kolejce';

  @override
  String get statusAnalyzing => 'Analizowanie';

  @override
  String get statusCompressing => 'Kompresowanie';

  @override
  String get statusDone => 'Gotowe';

  @override
  String get statusFailed => 'Błąd';

  @override
  String get statusCancelled => 'Anulowano';

  @override
  String get savedPrefix => 'Zaoszczędzono';

  @override
  String get largerSuffix => 'Większy';

  @override
  String get largerSizeWarning =>
      'Rozmiar wyjściowy może być większy niż oryginalny.';

  @override
  String get clearCompletedBtn => 'Wyczyść Ukończone';

  @override
  String get clearAllBtn => 'Wyczyść Wszystko';

  @override
  String get stopAllBtn => 'Zatrzymaj Wszystko';

  @override
  String get startCompressionBtn => 'Rozpocznij Kompresję';

  @override
  String get allDoneLabel => 'Wszystko Gotowe!';

  @override
  String get openFolderBtn => 'Otwórz Folder';

  @override
  String get totalEtaLabel => 'Pozostały Czas';

  @override
  String get totalSavedLabel => 'Łącznie Zaoszczędzono';

  @override
  String get videoSingle => 'film';

  @override
  String get videosPlural => 'filmy';

  @override
  String get fileSingle => 'plik';

  @override
  String get filesPlural => 'plików';

  @override
  String get releaseToAddVideosMsg => 'Upuść, aby dodać pliki';

  @override
  String get dragDropHereMsg => 'Przeciągnij i upuść filmy lub obrazy tutaj';

  @override
  String get supportedFormatsMsg =>
      'Obsługuje MP4, MKV, MOV, AVI, WMV, WebM • PNG, JPG, WebP, AVIF i więcej';

  @override
  String get selectFilesBtn => 'Wybierz Pliki';

  @override
  String get selectFolderBtn => 'Wybierz Folder';

  @override
  String get releaseToShrinkTitle => 'Upuść, aby skompresować';

  @override
  String get filesWillBeAddedDesc => 'Twoje pliki zostaną dodane do kolejki.';

  @override
  String get disabledLabel => 'Wyłączone';

  @override
  String get compressionInProgressTitle => 'Kompresja w toku';

  @override
  String get confirmCloseDesc => 'Czy na pewno chcesz zamknąć Shrinkeo?';

  @override
  String get keepCompressingBtn => 'Kontynuuj Kompresję';

  @override
  String get closeAppBtn => 'Zamknij Aplikację';

  @override
  String get lockedSettingsWarning => 'Zablokowane podczas kompresji';

  @override
  String get updateRequiredTitle => 'Wymagana Aktualizacja';

  @override
  String get updateRequiredDescNewVersion =>
      'Dostępna jest nowa wersja programu.';

  @override
  String get updateRequiredDescOldVersion =>
      'Twoja wersja nie jest już obsługiwana.';

  @override
  String get updateNowBtn => 'Aktualizuj Teraz';

  @override
  String get laterBtn => 'Później';

  @override
  String get updateAvailableTitle => 'Dostępna Aktualizacja';

  @override
  String get whatsNewTitle => 'Co nowego:';

  @override
  String get exitAppBtn => 'Wyjdź';

  @override
  String get retryBtn => 'Spróbuj ponowie';

  @override
  String get downloadFromWebsiteBtn => 'Pobierz ze Strony';

  @override
  String get skipUpdateConfirmTitle => 'Pominąć aktualizację?';

  @override
  String get skipUpdateConfirmDesc => 'Ta aktualizacja zawiera ważne poprawki.';

  @override
  String get skipUpdateCancelBtn => 'Anuluj';

  @override
  String get skipUpdateConfirmBtn => 'Pomiń aktualizację';

  @override
  String get maintenanceTitle => 'Przerwa Techniczna';

  @override
  String get maintenanceDescDefault => 'Shrinkeo jest obecnie konserwowane.';

  @override
  String versionAvailableMsg(String version) {
    return 'Wersja $version jest dostępna.';
  }

  @override
  String get hwEncoderNotSupportedTitle => 'Akceleracja nieobsługiwana';

  @override
  String get failedCreateFolderError => 'Nie udało się utworzyć folderu';

  @override
  String get failedProbeDurationError => 'Nie udało się pobrać czasu trwania';

  @override
  String get ffmpegNotFoundGlobalError => 'Nie znaleziono programu FFmpeg.';

  @override
  String get ffmpegMissingError => 'Brak programu FFmpeg lub FFprobe.';

  @override
  String hwFallbackNotificationBody(String encoderLabel) {
    return '$encoderLabel nie powiodło się. Przełączono na CPU.';
  }

  @override
  String get failedDownloadUpdateMsg =>
      'Pobieranie aktualizacji nie powiodło się. Spróbuj ponownie.';

  @override
  String customRatioActiveTitle(Object ratio) {
    return 'Niestandardowe proporcje ($ratio)';
  }

  @override
  String customRatioActiveDesc(Object ratio) {
    return 'Płótno z marginesami dla proporcji $ratio.';
  }

  @override
  String customAngleActiveTitle(Object angle) {
    return 'Niestandardowy kąt ($angle°)';
  }

  @override
  String customAngleActiveDesc(Object angle) {
    return 'Obraca wideo o niestandardowy kąt $angle°.';
  }

  @override
  String trimActiveDesc(Object end, Object start) {
    return 'Tnie klip wideo między $start a $end.';
  }

  @override
  String targetSizeLimitLabel(Object size) {
    return 'Limit $size MB';
  }

  @override
  String get customMbSizeTooltip => 'Wpisz niestandardowy rozmiar w MB';

  @override
  String get trimTimeTooltip =>
      'Wpisz czas np. 5 (5s), 1:30 (1m30s), lub 00:01:30';

  @override
  String get tabImageSuite => 'Pakiet Obrazów';

  @override
  String get compressionModeTitle => 'Tryb Kompresji';

  @override
  String get smartAutoLabel => 'Inteligentny Auto';

  @override
  String get smartAutoDesc =>
      'Automatycznie zmniejsza rozmiar o ~60-80% przy zachowaniu 100% ostrości. Idealny na co dzień.';

  @override
  String get maxSavingsLabel => 'Maks. Oszczędność';

  @override
  String get maxSavingsDesc =>
      'Silna kompresja oszczędzająca do 85-90% rozmiaru. Świetna do wiadomości i załączników.';

  @override
  String get ultraFidelityLabel => 'Ultra Jakość';

  @override
  String get ultraFidelityDesc =>
      'Zachowuje oryginalną jakość przy minimalnej kompresji. Idealny do archiwów i druku.';

  @override
  String get targetImageFormatTitle => 'Docelowy Format Obrazu';

  @override
  String get dimensionResizingTitle => 'Zmiana Rozmiaru';

  @override
  String get exifCameraPrivacyTitle => 'Prywatność EXIF / Aparatu';

  @override
  String get stripGpsCameraInfoLabel => 'Usuń GPS i Info o Aparacie';

  @override
  String get imgFmtOriginalLabel => 'Oryginalny format';

  @override
  String get imgFmtOriginalDesc =>
      'Zachowaj oryginalny format (najszybszy, bez konwersji).';

  @override
  String get imgFmtPngLabel => 'Obraz PNG (.png)';

  @override
  String get imgFmtPngDesc =>
      'Bezstratny format PNG z obsługą przezroczystości.';

  @override
  String get imgFmtJpgLabel => 'Obraz JPEG (.jpg)';

  @override
  String get imgFmtJpgDesc =>
      'Standardowy skompresowany format JPEG zapewniający uniwersalną kompatybilność.';

  @override
  String get imgFmtWebpLabel => 'Obraz WebP (.webp)';

  @override
  String get imgFmtWebpDesc =>
      'Nowoczesny format WebP oferujący doskonałą kompresję i mały rozmiar.';

  @override
  String get imgFmtAvifLabel => 'Obraz AVIF (.avif)';

  @override
  String get imgFmtAvifDesc =>
      'Format AVIF nowej generacji o wyjątkowo wysokiej wydajności kompresji.';

  @override
  String get imgResOriginalLabel => 'Oryginalne wymiary';

  @override
  String get imgResOriginalDesc =>
      'Zachowaj oryginalne wymiary szerokości i wysokości obrazu.';

  @override
  String get imgRes4kLabel => 'Maks. 4K (3840 pikseli)';

  @override
  String get imgRes4kDesc =>
      'Zmniejsz maksymalny wymiar obrazu do 3840 pikseli (maks. 4K).';

  @override
  String get imgRes1080pLabel => 'Full HD maks. (1920 pikseli)';

  @override
  String get imgRes1080pDesc =>
      'Zmniejsz maksymalny wymiar obrazu do 1920 pikseli (maks. Full HD).';

  @override
  String get imgRes720pLabel => 'Maksymalna rozdzielczość HD (1280 pikseli)';

  @override
  String get imgRes720pDesc =>
      'Zmniejsz maksymalny wymiar obrazu do 1280 pikseli (maks. HD).';

  @override
  String get imgRes480pLabel => 'Maks. SD (854px)';

  @override
  String get imgRes480pDesc =>
      'Zmniejsz maksymalny wymiar obrazu do 854 pikseli (maks. SD).';

  @override
  String get keepMetadataImageInfoDesc =>
      'Zachowuje oryginalny obraz EXIF ​​​​i metadane aparatu.';

  @override
  String get imageQualityModeLabel => 'Poziom jakości';

  @override
  String get imageQualityModeDesc =>
      'Koduje na stałym poziomie jakości — wyższa oznacza większe pliki.';

  @override
  String get imageTargetSizeModeLabel => 'Rozmiar docelowy';

  @override
  String get imageTargetSizeModeDesc =>
      'Automatycznie znajduje najwyższą jakość mieszczącą się w limicie rozmiaru.';

  @override
  String get imageQualitySliderTitle => 'Jakość obrazu';

  @override
  String get imageTargetSizeTitle => 'Docelowy rozmiar pliku';

  @override
  String get imageTargetSizeDesc =>
      'Koduje wielokrotnie z malejącą jakością, aż plik zmieści się w limicie. Bardzo małe limity mogą obniżyć jakość.';

  @override
  String imageTargetSizeLimitLabel(String size) {
    return 'Limit $size';
  }

  @override
  String get customKbSizeTooltip => 'Wpisz niestandardowy rozmiar w KB';

  @override
  String get imageProcessingFailedError =>
      'Przetwarzanie obrazu nie powiodło się';

  @override
  String get imageProcessingErrorMsg => 'Błąd przetwarzania obrazu';

  @override
  String get cleanNoiseLabel => 'Usuń szum';

  @override
  String get outputLargerTooltip =>
      'Plik wyjściowy będzie większy niż oryginał!\nZatrzymaj i zresetuj do ustawień domyślnych.';

  @override
  String get estimatedSizePrefix => 'Szac:';

  @override
  String get cancelBtnTooltip => 'Anuluj';

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
    return 'Pomyślnie skompresowano pliki: $success.';
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
