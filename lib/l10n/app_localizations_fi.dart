// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Finnish (`fi`).
class AppLocalizationsFi extends AppLocalizations {
  AppLocalizationsFi([String locale = 'fi']) : super(locale);

  @override
  String get appName => 'Shrinkeo';

  @override
  String get totalSpaceSaved => 'Yhteensä säästetty tila';

  @override
  String get savedSpacePrefix => 'Säästetty:';

  @override
  String get supportButtonText => 'Tue projektia';

  @override
  String get lightThemeTooltip => 'Vaalea teema';

  @override
  String get darkThemeTooltip => 'Tumma teema';

  @override
  String get settingsTooltip => 'Asetukset';

  @override
  String get minimizeTooltip => 'Pienennä';

  @override
  String get closeTooltip => 'Sulje';

  @override
  String get restoreTooltip => 'Palauta';

  @override
  String get maximizeTooltip => 'Suurenna';

  @override
  String get tabCompressionQuality => 'Pakkaus & Laatu';

  @override
  String get tabVideoEditingTools => 'Muokkaus & Työkalut';

  @override
  String get tabAudioSettings => 'Ääniasetukset';

  @override
  String get tabEngineOutput => 'Moottori & Kansio';

  @override
  String get compressionSettingsTitle => 'Pakkausasetukset';

  @override
  String get resetToDefaults => 'Palauta oletukset';

  @override
  String get resetDefaultTooltip => 'Palauta alkuperäiset arvot';

  @override
  String get modeTargetSizeTitle => 'Pakkauksen Tavoitetila';

  @override
  String get modeCrfLabel => 'Laatu (CRF)';

  @override
  String get modeTargetSizeLabel => 'Tavoitekoko (MB)';

  @override
  String get crfQualityTitle => 'CRF Laatutekijä';

  @override
  String get crfLossless => 'Häviötön';

  @override
  String get crfHighQuality => 'Korkea laatu';

  @override
  String get crfBalanced => 'Tasapainoinen';

  @override
  String get crfHighCompression => 'Korkea pakkaus';

  @override
  String get crfLowQuality => 'Huono laatu';

  @override
  String get crfUltraCompressed => 'Ultrapakattu';

  @override
  String get targetSizeLabel => 'Tiedoston Tavoitekoko (MB)';

  @override
  String get targetSizeDesc =>
      'Laskee bittinopeuden mahtuakseen kokorajoitukseen.';

  @override
  String get encodingSpeedTitle => 'Koodausnopeus';

  @override
  String get presetUltrafastLabel => 'Erittäin nopea';

  @override
  String get presetUltrafastDesc =>
      'Maksiminopeus, mutta pienin koon pienennys.';

  @override
  String get presetSuperfastLabel => 'Supernopea';

  @override
  String get presetSuperfastDesc => 'Erittäin nopea koodaus.';

  @override
  String get presetVeryfastLabel => 'Tosi nopea';

  @override
  String get presetVeryfastDesc => 'Keskimääräistä nopeampi.';

  @override
  String get presetFasterLabel => 'Nopeampi';

  @override
  String get presetFasterDesc => 'Hyvä nopeus ja korkea pakkaus.';

  @override
  String get presetFastLabel => 'Nopea';

  @override
  String get presetFastDesc => 'Paras tasapaino nopeuden ja koon välillä.';

  @override
  String get presetMediumLabel => 'Keskitaso';

  @override
  String get presetMediumDesc => 'Oletustasapaino.';

  @override
  String get presetSlowLabel => 'Hidas';

  @override
  String get presetSlowDesc =>
      'Hitaampi, mutta huomattavasti pienemmät tiedostot.';

  @override
  String get presetVeryslowLabel => 'Erittäin hidas';

  @override
  String get presetVeryslowDesc => 'Maksimaalinen koon pienennys.';

  @override
  String get videoCodecTitle => 'Videokoodekki';

  @override
  String get codecH264Label => 'H.264';

  @override
  String get codecH264Desc => 'Maksimaalinen yhteensopivuus.';

  @override
  String get codecH265Label => 'H.265 / HEVC';

  @override
  String get codecH265Desc => 'Parempi pakkaustehokkuus.';

  @override
  String get codecAv1Label => 'AV1';

  @override
  String get codecAv1Desc =>
      'Uuden sukupolven koodekki (30% pienempi kuin H.265).';

  @override
  String get hardwareEncoderTitle => 'Laitteistokiihdytys (GPU)';

  @override
  String get hwSoftwareLabel => 'Ohjelmisto (CPU)';

  @override
  String get hwSoftwareDesc => 'Hitain, mutta paras yhteensopivuus.';

  @override
  String get hwNvidiaLabel => 'Nvidia (NVENC)';

  @override
  String get hwNvidiaDesc => 'Erittäin nopea koodaus Nvidia GPU:lle.';

  @override
  String get hwAmdLabel => 'AMD (AMF)';

  @override
  String get hwAmdDesc => 'Erittäin nopea koodaus AMD GPU:lle.';

  @override
  String get hwIntelLabel => 'Intel (QSV)';

  @override
  String get hwIntelDesc => 'Erittäin nopea koodaus Intel GPU:lle.';

  @override
  String get resolutionTitle => 'Enimmäisresoluutio';

  @override
  String get resOriginalLabel => 'Alkuperäinen';

  @override
  String get resOriginalDesc => 'Säilytä alkuperäinen resoluutio.';

  @override
  String get res4kLabel => '4K';

  @override
  String get res4kDesc => 'Pienennä enintään 4K:hon.';

  @override
  String get res2kLabel => '2K';

  @override
  String get res2kDesc => 'Pienennä enintään 2K:hon.';

  @override
  String get res1080pLabel => '1080p';

  @override
  String get res1080pDesc => 'Pienennä enintään 1080p Full HD:hen.';

  @override
  String get res720pLabel => '720p';

  @override
  String get res720pDesc => 'Pienennä enintään 720p HD:hen.';

  @override
  String get res480pLabel => '480p';

  @override
  String get res480pDesc => 'Pienennä 480p:hen.';

  @override
  String get res360pLabel => '360p';

  @override
  String get res360pDesc => 'Maksimaalinen pakkaus.';

  @override
  String get frameRateTitle => 'Kuvataajuus (FPS)';

  @override
  String get fpsOriginalLabel => 'Alkuperäinen';

  @override
  String get fpsOriginalDesc => 'Sama FPS kuin lähteessä.';

  @override
  String get fps60Label => '60 fps';

  @override
  String get fps60Desc => 'Sujuva peleille tai urheilulle.';

  @override
  String get fps30Label => '30 fps';

  @override
  String get fps30Desc => 'Vakio useimmille videoille.';

  @override
  String get fps24Label => '24 fps';

  @override
  String get fps24Desc => 'Elokuvatyyli.';

  @override
  String get enableVideoDenoiseTitle => 'Videon Kohinan Poisto';

  @override
  String get enableVideoDenoiseDesc => '3D-suodatin kohinan vähentämiseksi.';

  @override
  String get exportFormatTitle => 'Vientimuoto';

  @override
  String get exportVideoLabel => 'Vakiovideo';

  @override
  String get exportVideoDesc => 'Vie MP4/MKV/MOV-muodossa';

  @override
  String get exportGifLabel => 'Animoitu GIF';

  @override
  String get exportGifDesc => 'Luo korkealaatuinen animoitu GIF';

  @override
  String get exportMp3Label => 'Pura MP3';

  @override
  String get exportMp3Desc => 'Pura ääni MP3 320kbps -muodossa';

  @override
  String get exportAacLabel => 'Pura AAC';

  @override
  String get exportAacDesc => 'Pura ääni AAC-muodossa';

  @override
  String get exportWavLabel => 'Pura WAV';

  @override
  String get exportWavDesc => 'Pura pakkaamaton WAV-ääni';

  @override
  String get privacyScrubbingTitle => 'Yksityisyys & GPS';

  @override
  String get keepMetadataLabel => 'Säilytä Tiedot';

  @override
  String get stripGpsExifLabel => 'Poista GPS/EXIF';

  @override
  String get stripGpsExifInfoTitle => 'Puhdista Metatiedot';

  @override
  String get stripGpsExifInfoDesc => 'Poistaa kameratiedot ja GPS-sijainnin.';

  @override
  String get keepMetadataInfoDesc =>
      'Säilyttää kaikki alkuperäiset metatiedot.';

  @override
  String get autoCropBlackBarsTitle => 'Rajaa Mustat Palkit Automaattisesti';

  @override
  String get autoCropLabel => 'Auto Rajaus';

  @override
  String get autoCropActiveTitle => 'Auto Rajaus Päällä';

  @override
  String get autoCropActiveDesc => 'Poistaa mustat palkit automaattisesti.';

  @override
  String get autoCropDisabledDesc => 'Säilyttää alkuperäiset reunat.';

  @override
  String get playbackSpeedTitle => 'Toistonopeus';

  @override
  String get speedOriginalLabel => '1.0x';

  @override
  String get speedOriginalDesc => 'Normaali nopeus';

  @override
  String get speedSlow05Label => '0.5x Hidas';

  @override
  String get speedSlow05Desc => 'Toista puolinopeudella';

  @override
  String get speedFast15Label => '1.5x';

  @override
  String get speedFast15Desc => '1.5 kertaa nopeampi';

  @override
  String get speedFast20Label => '2.0x Nopea';

  @override
  String get speedFast20Desc => 'Kaksinkertainen nopeus';

  @override
  String get speedTimelapse40Label => '4.0x Timelaps';

  @override
  String get speedTimelapse40Desc => '4x nopeus timelapselle';

  @override
  String get canvasAspectRatioTitle => 'Kuvasuhde';

  @override
  String get aspectOriginalLabel => 'Alkuperäinen';

  @override
  String get aspectOriginalDesc => 'Säilytä alkuperäinen suhde';

  @override
  String get aspectShortsLabel => '9:16 Shorts';

  @override
  String get aspectShortsDesc => 'TikTokille ja Reelsille';

  @override
  String get aspectSquareLabel => '1:1 Neliö';

  @override
  String get aspectSquareDesc => 'Instagram-julkaisuille';

  @override
  String get aspectPortraitLabel => '4:5 Pysty';

  @override
  String get aspectPortraitDesc => 'Pystysuoralle Instagramille';

  @override
  String get aspectWidescreenLabel => '16:9 Laajakuva';

  @override
  String get aspectWidescreenDesc => 'YouTubea ja TV:tä varten';

  @override
  String get aspectClassicLabel => '4:3 Perinteinen';

  @override
  String get aspectClassicDesc => 'Vanhoille näytöille';

  @override
  String get aspectCinemaLabel => '21:9 Elokuva';

  @override
  String get aspectCinemaDesc => 'Ultrawide-näytöille';

  @override
  String get aspectCustomLabel => 'Mukautettu';

  @override
  String get aspectCustomDesc => 'Mukautettu kuvasuhde';

  @override
  String get customRatioTooltip => 'Esim: 16:10, 2:1';

  @override
  String get rotationFlipTitle => 'Kääntö & Peilaus';

  @override
  String get rotOriginalLabel => 'Alkuperäinen (0°)';

  @override
  String get rotOriginalDesc => 'Säilytä suunta';

  @override
  String get rot90Label => '90° Oikealle';

  @override
  String get rot90Desc => 'Käännä 90 astetta myötäpäivään';

  @override
  String get rot180Label => '180° Ylösalaisin';

  @override
  String get rot180Desc => 'Käännä ylösalaisin';

  @override
  String get rot270Label => '270° Vasemmalle';

  @override
  String get rot270Desc => 'Käännä 90 astetta vastapäivään';

  @override
  String get rotFlipHLabel => 'Peilaa Vaaka';

  @override
  String get rotFlipHDesc => 'Peilaa vaakasuunnassa';

  @override
  String get rotFlipVLabel => 'Peilaa Pysty';

  @override
  String get rotFlipVDesc => 'Peilaa pystysuunnassa';

  @override
  String get rotCustomLabel => 'Mukautettu Kulma';

  @override
  String get rotCustomDesc => 'Käännä tiettyyn kulmaan';

  @override
  String get customRotationTooltip => 'Kulma asteina esim. 45';

  @override
  String get trimVideoTitle => 'Leikkaa Video';

  @override
  String get fullVideoLabel => 'Koko Video';

  @override
  String get cutClipLabel => 'Leikkaa Pätkä';

  @override
  String get trimStartLabel => 'Alku';

  @override
  String get trimEndLabel => 'Loppu';

  @override
  String get trimActiveTitle => 'Leikkaus Päällä';

  @override
  String get fullVideoDesc => 'Käsittele koko video leikkaamatta.';

  @override
  String get audioModeTitle => 'Ääniraidan Tila';

  @override
  String get audioOriginalLabel => 'Alkuperäinen';

  @override
  String get audioOriginalDesc => 'Ei äänenlaadun heikkenemistä.';

  @override
  String get audioAac256Label => 'Korkea Laatu';

  @override
  String get audioAac256Desc => 'AAC 256kbps';

  @override
  String get audioAac128Label => 'Tasapainoinen';

  @override
  String get audioAac128Desc => 'AAC 128kbps (Web-standardi)';

  @override
  String get audioAac64Label => 'Matala Laatu';

  @override
  String get audioAac64Desc => 'AAC 64kbps puheelle';

  @override
  String get audioMuteLabel => 'Mykistä Ääni';

  @override
  String get audioMuteDesc => 'Poista ääniraita kokonaan.';

  @override
  String get audioNormTitle => 'Äänenvoimakkuuden Tasapainotus';

  @override
  String get audioNormOffLabel => 'Pois';

  @override
  String get audioNormOffDesc => 'Alkuperäinen dynamiikka.';

  @override
  String get audioNormSpeechLabel => 'Ihmispuhe';

  @override
  String get audioNormSpeechDesc => 'EBU R128 selkeään puheeseen.';

  @override
  String get audioNormDynamicLabel => 'Elokuva Dynamiikka';

  @override
  String get audioNormDynamicDesc => 'Tasoittaa hiljaiset ja kovat äänet.';

  @override
  String get audioNormBoostLabel => 'Kevyt Vahvistus';

  @override
  String get audioNormBoostDesc => '+3dB äänenvoimakkuuden lisäys.';

  @override
  String get audioChanTitle => 'Äänikanavat';

  @override
  String get audioChanOriginalLabel => 'Alkuperäiset';

  @override
  String get audioChanOriginalDesc => 'Säilytä lähdekanavat.';

  @override
  String get audioChanStereoLabel => 'Stereo (2.0)';

  @override
  String get audioChanStereoDesc => '2-kanavainen stereo.';

  @override
  String get audioChanMonoLabel => 'Mono (1.0)';

  @override
  String get audioChanMonoDesc => 'Yksi kanava - 50% säästö äänen koossa.';

  @override
  String get removeNoiseLabel => 'Poista Kohina';

  @override
  String get enableAudioDenoiseTitle => 'Poista Mikrofoni Kohina';

  @override
  String get enableAudioDenoiseDesc => 'Suodatin taustakohinalle.';

  @override
  String get outputDirectoryTitle => 'Tallennuskansio';

  @override
  String get defaultOutputDirectory => 'Oletus (Alkuperäisen vieressä)';

  @override
  String get selectOutputFolderTitle => 'Valitse Kansio';

  @override
  String get clearOutputFolder => 'Käytä oletussijaintia';

  @override
  String get changeBtn => 'Vaihda';

  @override
  String get outputLocationTitle => 'Tallennustapa';

  @override
  String get outputLocationUnifiedLabel => 'Yksi Kansio';

  @override
  String get outputLocationUnifiedDesc =>
      'Kaikki pakatut videot yhteen kansioon.';

  @override
  String get outputLocationSameLabel => 'Alkuperäisen Vieressä';

  @override
  String get outputLocationSameDesc =>
      'Jokainen video lähdetiedostonsa viereen.';

  @override
  String get fileManagementTitle => 'Tiedostojen Hallinta';

  @override
  String get keepOriginalsLabel => 'Säilytä Alkuperäiset';

  @override
  String get keepOriginalsDesc =>
      'Jätä alkuperäiset tiedostot koskemattomiksi.';

  @override
  String get toRecycleBinLabel => 'Roskakoriin';

  @override
  String get toRecycleBinDesc =>
      'Siirrä alkuperäiset roskakoriin pakkauksen jälkeen.';

  @override
  String get outputFormatTitle => 'Säiliömuoto';

  @override
  String get formatOriginalLabel => 'Alkuperäinen';

  @override
  String get formatOriginalDesc => 'Säilytä alkuperäinen muoto.';

  @override
  String get formatMp4Label => 'MP4';

  @override
  String get formatMp4Desc => 'Maksimaalinen yhteensopivuus.';

  @override
  String get formatMkvLabel => 'MKV';

  @override
  String get formatMkvDesc => 'Tuki useille raidoille.';

  @override
  String get formatMovLabel => 'MOV';

  @override
  String get formatMovDesc => 'Apple QuickTime -muoto.';

  @override
  String get scanningFilesMsg => 'Etsitään tiedostoja...';

  @override
  String get addFilesBtn => 'Lisää Tiedostoja';

  @override
  String get addFolderBtn => 'Lisää Kansio';

  @override
  String get dragDropMoreMsg => 'Tai vedä & pudota lisää videoita tähän';

  @override
  String get openOutputFolderTooltip => 'Avaa Tallennuskansio';

  @override
  String get statusQueued => 'Jonossa';

  @override
  String get statusAnalyzing => 'Analysoidaan';

  @override
  String get statusCompressing => 'Pakataan';

  @override
  String get statusDone => 'Valmis';

  @override
  String get statusFailed => 'Epäonnistui';

  @override
  String get statusCancelled => 'Peruttu';

  @override
  String get savedPrefix => 'Säästetty';

  @override
  String get largerSuffix => 'Suurempi';

  @override
  String get largerSizeWarning => 'Tulos voi olla alkuperäistä suurempi.';

  @override
  String get clearCompletedBtn => 'Tyhjennä Valmiit';

  @override
  String get clearAllBtn => 'Tyhjennä Kaikki';

  @override
  String get stopAllBtn => 'Pysäytä Kaikki';

  @override
  String get startCompressionBtn => 'Aloita Pakkaus';

  @override
  String get allDoneLabel => 'Kaikki Valmista!';

  @override
  String get openFolderBtn => 'Avaa Kansio';

  @override
  String get totalEtaLabel => 'Jäljellä Oleva Aika';

  @override
  String get totalSavedLabel => 'Yhteensä Säästetty';

  @override
  String get videoSingle => 'video';

  @override
  String get videosPlural => 'videota';

  @override
  String get releaseToAddVideosMsg => 'Vapauta lisätäksesi videot';

  @override
  String get dragDropHereMsg => 'Vedä & pudota tiedostot tai kansiot tähän';

  @override
  String get supportedFormatsMsg => 'Tukee MP4, MKV, MOV, AVI, WMV';

  @override
  String get selectFilesBtn => 'Valitse Tiedostot';

  @override
  String get selectFolderBtn => 'Valitse Kansio';

  @override
  String get releaseToShrinkTitle => 'Vapauta pakataksesi heti';

  @override
  String get filesWillBeAddedDesc => 'Tiedostosi lisätään jonoon.';

  @override
  String get disabledLabel => 'Pois käytöstä';

  @override
  String get compressionInProgressTitle => 'Pakkaus Käynnissä';

  @override
  String get confirmCloseDesc =>
      'Oletko varma, että haluat sulkea Shrinkeo-sovelluksen?';

  @override
  String get keepCompressingBtn => 'Jatka Pakkausta';

  @override
  String get closeAppBtn => 'Sulje Sovellus';

  @override
  String get lockedSettingsWarning => 'Lukittu pakkauksen aikana';

  @override
  String get updateRequiredTitle => 'Päivitys Vaaditaan';

  @override
  String get updateRequiredDescNewVersion => 'Uusi versio on saatavilla.';

  @override
  String get updateRequiredDescOldVersion => 'Versiotasi ei enää tueta.';

  @override
  String get updateNowBtn => 'Päivitä Nyt';

  @override
  String get laterBtn => 'Myöhemmin';

  @override
  String get updateAvailableTitle => 'Päivitys Saatavilla';

  @override
  String get whatsNewTitle => 'Mitä uutta:';

  @override
  String get exitAppBtn => 'Poistu';

  @override
  String get retryBtn => 'Yritä uudelleen';

  @override
  String get downloadFromWebsiteBtn => 'Lataa Verkkosivulta';

  @override
  String get skipUpdateConfirmTitle => 'Ohita päivitys?';

  @override
  String get skipUpdateConfirmDesc =>
      'Tämä päivitys sisältää tärkeitä korjauksia.';

  @override
  String get skipUpdateCancelBtn => 'Peruuta';

  @override
  String get skipUpdateConfirmBtn => 'Ohita päivitys';

  @override
  String get maintenanceTitle => 'Huolto';

  @override
  String get maintenanceDescDefault => 'Shrinkeo on tällä hetkellä huollossa.';

  @override
  String versionAvailableMsg(String version) {
    return 'Versio $version on saatavilla.';
  }

  @override
  String get hwEncoderNotSupportedTitle => 'Laitteistokiihdytystä ei tueta';

  @override
  String get failedCreateFolderError => 'Kansion luominen epäonnistui';

  @override
  String get failedProbeDurationError => 'Keston lukeminen epäonnistui';

  @override
  String get ffmpegNotFoundGlobalError => 'FFmpeg-ohjelmaa ei löytynyt.';

  @override
  String get ffmpegMissingError =>
      'FFmpeg tai FFprobe puuttuu tai on vahingoittunut.';

  @override
  String hwFallbackNotificationBody(String encoderLabel) {
    return '$encoderLabel epäonnistui. Vaihdettu CPU:lle.';
  }

  @override
  String get failedDownloadUpdateMsg =>
      'Päivityksen lataus epäonnistui. Yritä uudelleen.';

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
  String get compressionModeTitle => 'Pakkaustila';

  @override
  String get smartAutoLabel => 'Smart Auto';

  @override
  String get smartAutoDesc =>
      'Pienentää automaattisesti tiedostokokoa ~60-80 % 100 % koskemattomalla visuaalisella selkeydellä. Täydellinen jokapäiväiseen valokuvien optimointiin.';

  @override
  String get maxSavingsLabel => 'Max Säästöt';

  @override
  String get maxSavingsDesc =>
      'Aggressiivinen pakkaus säästää jopa 85-90 % tiedostokokoa. Paras nopeaan viestiin, verkkolataukseen ja sähköpostin liitteisiin.';

  @override
  String get ultraFidelityLabel => 'Ultra Fidelity';

  @override
  String get ultraFidelityDesc =>
      'Säilyttää raa\'an visuaalisen tarkkuuden minimaalisella pakkauksella. Ihanteellinen valokuva-arkistoon ja korkearesoluutioisiin tulostustöihin.';

  @override
  String get targetImageFormatTitle => 'Kohdekuvamuoto';

  @override
  String get dimensionResizingTitle => 'Mittojen koon muuttaminen';

  @override
  String get exifCameraPrivacyTitle => 'EXIF / kameran tietosuoja';

  @override
  String get stripGpsCameraInfoLabel => 'Poista GPS- ja kameratiedot';

  @override
  String get intentCompressOnly => 'Pakkaa vain';

  @override
  String get intentCompressOnlyTooltip =>
      'Keskity pelkästään tiedostokoon pienentämiseen (laatuprosentti tai tavoiteKB/MB)';

  @override
  String get intentEditConvertOnly => 'Vain muokkaus / muuntaminen';

  @override
  String get intentEditConvertOnlyTooltip =>
      'Muuta kokoa, kierrä, leikkaa tai muunna muotoa heikentämättä visuaalista laatua';

  @override
  String get intentCompressAndEdit => 'Pakkaa ja muokkaa';

  @override
  String get intentCompressAndEditTooltip =>
      'Täysi hallinta: Muokkaa, muuta kokoa, kierrä JA pakkaa tiedostokokoa yhdessä';
}
