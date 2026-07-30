// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Croatian (`hr`).
class AppLocalizationsHr extends AppLocalizations {
  AppLocalizationsHr([String locale = 'hr']) : super(locale);

  @override
  String get appName => 'Shrinkeo';

  @override
  String get totalSpaceSaved => 'Ukupno ušteđen prostor';

  @override
  String get savedSpacePrefix => 'Ušteđeno:';

  @override
  String get supportButtonText => 'Podrži projekt';

  @override
  String get lightThemeTooltip => 'Svijetla tema';

  @override
  String get darkThemeTooltip => 'Tamna tema';

  @override
  String get settingsTooltip => 'Postavke';

  @override
  String get minimizeTooltip => 'Minimiziraj';

  @override
  String get closeTooltip => 'Zatvori';

  @override
  String get restoreTooltip => 'Vrati';

  @override
  String get maximizeTooltip => 'Maksimiziraj';

  @override
  String get tabCompressionQuality => 'Sažimanje i Kvaliteta';

  @override
  String get tabVideoEditingTools => 'Uređivanje Videa i Alati';

  @override
  String get tabAudioSettings => 'Postavke Zvuka';

  @override
  String get tabEngineOutput => 'Motor i Izlazna Mapa';

  @override
  String get compressionSettingsTitle => 'Postavke Sažimanja';

  @override
  String get resetToDefaults => 'Vrati na zadano';

  @override
  String get resetDefaultTooltip => 'Vrati na početne vrijednosti';

  @override
  String get modeTargetSizeTitle => 'Način Cilja Sažimanja';

  @override
  String get modeCrfLabel => 'Kvaliteta (CRF)';

  @override
  String get modeTargetSizeLabel => 'Ciljana Veličina (MB)';

  @override
  String get crfQualityTitle => 'CRF Faktor Kvalitete';

  @override
  String get crfLossless => 'Bez gubitaka';

  @override
  String get crfHighQuality => 'Visoka kvaliteta';

  @override
  String get crfBalanced => 'Uravnotežen';

  @override
  String get crfHighCompression => 'Visoka kompresija';

  @override
  String get crfLowQuality => 'Niska kvaliteta';

  @override
  String get crfUltraCompressed => 'Ultra komprimirano';

  @override
  String get targetSizeLabel => 'Ciljana Veličina Datoteke (MB)';

  @override
  String get targetSizeDesc => 'Izračunava bitrate kako bi stao u ograničenje.';

  @override
  String get encodingSpeedTitle => 'Brzina Kodiranja';

  @override
  String get presetUltrafastLabel => 'Ultrabrzo';

  @override
  String get presetUltrafastDesc =>
      'Maksimalna brzina, ali najmanje smanjenje veličine.';

  @override
  String get presetSuperfastLabel => 'Superbrzo';

  @override
  String get presetSuperfastDesc => 'Vrlo brzo kodiranje.';

  @override
  String get presetVeryfastLabel => 'Vrlo brzo';

  @override
  String get presetVeryfastDesc => 'Brže od prosjeka.';

  @override
  String get presetFasterLabel => 'Brže';

  @override
  String get presetFasterDesc => 'Dobra brzina i izvrsno sažimanje.';

  @override
  String get presetFastLabel => 'Brzo';

  @override
  String get presetFastDesc => 'Najbolja ravnoteža brzine i veličine.';

  @override
  String get presetMediumLabel => 'Srednje';

  @override
  String get presetMediumDesc => 'Zadana ravnoteža.';

  @override
  String get presetSlowLabel => 'Sporo';

  @override
  String get presetSlowDesc => 'Sporije, ali znatno manje datoteke.';

  @override
  String get presetVeryslowLabel => 'Vrlo sporo';

  @override
  String get presetVeryslowDesc => 'Maksimalno smanjenje veličine.';

  @override
  String get videoCodecTitle => 'Video Kodek';

  @override
  String get codecH264Label => 'H.264';

  @override
  String get codecH264Desc =>
      'Maksimalna kompatibilnost sa starijim uređajima.';

  @override
  String get codecH265Label => 'H.265 / HEVC';

  @override
  String get codecH265Desc => 'Bolja učinkovitost sažimanja.';

  @override
  String get codecAv1Label => 'AV1';

  @override
  String get codecAv1Desc => 'Kodek sljedeće generacije (30% manji od H.265).';

  @override
  String get hardwareEncoderTitle => 'Hardversko Ubrzanje (GPU)';

  @override
  String get hwSoftwareLabel => 'Softverski (CPU)';

  @override
  String get hwSoftwareDesc => 'Najsporiji, ali najveća kompatibilnost.';

  @override
  String get hwNvidiaLabel => 'Nvidia (NVENC)';

  @override
  String get hwNvidiaDesc => 'Iznimno brzo kodiranje za Nvidia GPU.';

  @override
  String get hwAmdLabel => 'AMD (AMF)';

  @override
  String get hwAmdDesc => 'Iznimno brzo kodiranje za AMD GPU.';

  @override
  String get hwIntelLabel => 'Intel (QSV)';

  @override
  String get hwIntelDesc => 'Iznimno brzo kodiranje za Intel GPU.';

  @override
  String get resolutionTitle => 'Maksimalna Razlučivost';

  @override
  String get resOriginalLabel => 'Originalna';

  @override
  String get resOriginalDesc => 'Zadrži originalnu razlučivost.';

  @override
  String get res4kLabel => '4K';

  @override
  String get res4kDesc => 'Smanji do maks 4K.';

  @override
  String get res2kLabel => '2K';

  @override
  String get res2kDesc => 'Smanji do maks 2K.';

  @override
  String get res1080pLabel => '1080p';

  @override
  String get res1080pDesc => 'Smanji do maks 1080p Full HD.';

  @override
  String get res720pLabel => '720p';

  @override
  String get res720pDesc => 'Smanji do maks 720p HD.';

  @override
  String get res480pLabel => '480p';

  @override
  String get res480pDesc => 'Smanji na 480p.';

  @override
  String get res360pLabel => '360p';

  @override
  String get res360pDesc => 'Maksimalno sažimanje.';

  @override
  String get frameRateTitle => 'Brzina Slika (FPS)';

  @override
  String get fpsOriginalLabel => 'Originalna';

  @override
  String get fpsOriginalDesc => 'Isti FPS kao izvor.';

  @override
  String get fps60Label => '60 fps';

  @override
  String get fps60Desc => 'Tečno za igre ili sport.';

  @override
  String get fps30Label => '30 fps';

  @override
  String get fps30Desc => 'Standard za većinu videa.';

  @override
  String get fps24Label => '24 fps';

  @override
  String get fps24Desc => 'Filmski stil.';

  @override
  String get enableVideoDenoiseTitle => 'Čišćenje Šuma Videa';

  @override
  String get enableVideoDenoiseDesc => '3D filtar za smanjenje šuma.';

  @override
  String get exportFormatTitle => 'Format Izvoza';

  @override
  String get exportVideoLabel => 'Standardni Video';

  @override
  String get exportVideoDesc => 'Izvezi kao MP4/MKV/MOV';

  @override
  String get exportGifLabel => 'Animirani GIF';

  @override
  String get exportGifDesc => 'Stvori visokokvalitetni GIF';

  @override
  String get exportMp3Label => 'Izvuci MP3';

  @override
  String get exportMp3Desc => 'Izvuci audio kao MP3 320kbps';

  @override
  String get exportAacLabel => 'Izvuci AAC';

  @override
  String get exportAacDesc => 'Izvuci audio kao AAC';

  @override
  String get exportWavLabel => 'Izvuci WAV';

  @override
  String get exportWavDesc => 'Izvuci nesažeti WAV audio';

  @override
  String get privacyScrubbingTitle => 'Privatnost i GPS';

  @override
  String get keepMetadataLabel => 'Zadrži Podatke';

  @override
  String get stripGpsExifLabel => 'Ukloni GPS/EXIF';

  @override
  String get stripGpsExifInfoTitle => 'Očisti Metapodatke';

  @override
  String get stripGpsExifInfoDesc =>
      'Uklanja informacije o kameri i GPS lokaciju.';

  @override
  String get keepMetadataInfoDesc => 'Zadržava sve originalne metapodatke.';

  @override
  String get autoCropBlackBarsTitle => 'Automatsko Izrezivanje Crnih Traka';

  @override
  String get autoCropLabel => 'Auto Izrezivanje';

  @override
  String get autoCropActiveTitle => 'Auto Izrezivanje Aktivno';

  @override
  String get autoCropActiveDesc => 'Automatski uklanja crne trake.';

  @override
  String get autoCropDisabledDesc => 'Zadržava originalne rubove.';

  @override
  String get playbackSpeedTitle => 'Brzina Reprodukcije';

  @override
  String get speedOriginalLabel => '1.0x';

  @override
  String get speedOriginalDesc => 'Normalna brzina';

  @override
  String get speedSlow05Label => '0.5x Sporo';

  @override
  String get speedSlow05Desc => 'Reproduciraj na polovici brzine';

  @override
  String get speedFast15Label => '1.5x';

  @override
  String get speedFast15Desc => '1.5 puta brže';

  @override
  String get speedFast20Label => '2.0x Brzo';

  @override
  String get speedFast20Desc => 'Dvostruka brzina';

  @override
  String get speedTimelapse40Label => '4.0x Timelapse';

  @override
  String get speedTimelapse40Desc => '4x brzina za timelapse';

  @override
  String get canvasAspectRatioTitle => 'Omjer Stranica';

  @override
  String get aspectOriginalLabel => 'Originalni';

  @override
  String get aspectOriginalDesc => 'Zadrži originalni omjer';

  @override
  String get aspectShortsLabel => '9:16 Shorts';

  @override
  String get aspectShortsDesc => 'Za TikTok i Reels';

  @override
  String get aspectSquareLabel => '1:1 Kvadrat';

  @override
  String get aspectSquareDesc => 'Za Instagram objave';

  @override
  String get aspectPortraitLabel => '4:5 Portret';

  @override
  String get aspectPortraitDesc => 'Za vertikalni Instagram';

  @override
  String get aspectWidescreenLabel => '16:9 Široki';

  @override
  String get aspectWidescreenDesc => 'Za YouTube i TV';

  @override
  String get aspectClassicLabel => '4:3 Klasični';

  @override
  String get aspectClassicDesc => 'Za klasične zaslone';

  @override
  String get aspectCinemaLabel => '21:9 Kino';

  @override
  String get aspectCinemaDesc => 'Za ultrawide monitore';

  @override
  String get aspectCustomLabel => 'Prilagođeni Omjer';

  @override
  String get aspectCustomDesc => 'Željeni omjer stranica';

  @override
  String get customRatioTooltip => 'Npr: 16:10, 2:1';

  @override
  String get rotationFlipTitle => 'Rotacija i Zrcaljenje';

  @override
  String get rotOriginalLabel => 'Originalno (0°)';

  @override
  String get rotOriginalDesc => 'Zadrži orijentaciju';

  @override
  String get rot90Label => '90° Desno';

  @override
  String get rot90Desc => 'Rotiraj 90 stupnjeva u smjeru kazaljke';

  @override
  String get rot180Label => '180° Okrenuto';

  @override
  String get rot180Desc => 'Rotiraj naglavačke';

  @override
  String get rot270Label => '270° Lijevo';

  @override
  String get rot270Desc => 'Rotiraj 90 stupnjeva suprotno kazaljci';

  @override
  String get rotFlipHLabel => 'Zrcalo Horiz.';

  @override
  String get rotFlipHDesc => 'Zrcali horizontalno';

  @override
  String get rotFlipVLabel => 'Zrcalo Vert.';

  @override
  String get rotFlipVDesc => 'Zrcali vertikalno';

  @override
  String get rotCustomLabel => 'Prilagođeni Kut';

  @override
  String get rotCustomDesc => 'Rotiraj pod određenim kutom';

  @override
  String get customRotationTooltip => 'Kut u stupnjevima npr. 45';

  @override
  String get trimVideoTitle => 'Izrezivanje Videa';

  @override
  String get fullVideoLabel => 'Cijeli Video';

  @override
  String get cutClipLabel => 'Izreži Isječak';

  @override
  String get trimStartLabel => 'Početak';

  @override
  String get trimEndLabel => 'Kraj';

  @override
  String get trimActiveTitle => 'Izrezivanje je Aktivno';

  @override
  String get fullVideoDesc => 'Obradi cijeli video bez rezanja.';

  @override
  String get audioModeTitle => 'Način Audio Trake';

  @override
  String get audioOriginalLabel => 'Originalni';

  @override
  String get audioOriginalDesc => 'Bez gubitka kvalitete zvuka.';

  @override
  String get audioAac256Label => 'Visoka Kvaliteta (256k)';

  @override
  String get audioAac256Desc => 'AAC 256kbps';

  @override
  String get audioAac128Label => 'Uravnoteženo (128k)';

  @override
  String get audioAac128Desc => 'AAC 128kbps (Web standard)';

  @override
  String get audioAac64Label => 'Mala Veličina (64k)';

  @override
  String get audioAac64Desc => 'AAC 64kbps za govor';

  @override
  String get audioMuteLabel => 'Isključi Zvuk';

  @override
  String get audioMuteDesc => 'Potpuno ukloni audio traku.';

  @override
  String get audioNormTitle => 'Ujednačavanje Glasnoće';

  @override
  String get audioNormOffLabel => 'Isključeno';

  @override
  String get audioNormOffDesc => 'Originalna dinamika.';

  @override
  String get audioNormSpeechLabel => 'Ljudski Govor';

  @override
  String get audioNormSpeechDesc => 'EBU R128 za jasan dijalog.';

  @override
  String get audioNormDynamicLabel => 'Kino Dinamika';

  @override
  String get audioNormDynamicDesc => 'Ujednačava tihe i glasne zvukove.';

  @override
  String get audioNormBoostLabel => 'Blago Pojačanje';

  @override
  String get audioNormBoostDesc => '+3dB pojačanje glasnoće.';

  @override
  String get audioChanTitle => 'Audio Kanali';

  @override
  String get audioChanOriginalLabel => 'Originalni';

  @override
  String get audioChanOriginalDesc => 'Zadrži izvorne kanale.';

  @override
  String get audioChanStereoLabel => 'Stereo (2.0)';

  @override
  String get audioChanStereoDesc => 'Standardni 2-kanalni stereo.';

  @override
  String get audioChanMonoLabel => 'Mono (1.0)';

  @override
  String get audioChanMonoDesc => 'Jedan kanal - 50% uštede veličine.';

  @override
  String get removeNoiseLabel => 'Ukloni Šum';

  @override
  String get enableAudioDenoiseTitle => 'Ukloni Šum Mikrofona';

  @override
  String get enableAudioDenoiseDesc =>
      'Filtar za pročišćavanje pozadinskog šuma.';

  @override
  String get outputDirectoryTitle => 'Izlazna Mapa';

  @override
  String get defaultOutputDirectory => 'Zadano (Pored originalne datoteke)';

  @override
  String get selectOutputFolderTitle => 'Odaberi Mapu';

  @override
  String get clearOutputFolder => 'Upotrijebi zadanu lokaciju';

  @override
  String get changeBtn => 'Promijeni';

  @override
  String get outputLocationTitle => 'Ponašanje Izlaza';

  @override
  String get outputLocationUnifiedLabel => 'Jedna Mapa';

  @override
  String get outputLocationUnifiedDesc => 'Svi sažeti videi u jednoj mapi.';

  @override
  String get outputLocationSameLabel => 'Pored Originala';

  @override
  String get outputLocationSameDesc =>
      'Svaki video pored svoje izvorne datoteke.';

  @override
  String get fileManagementTitle => 'Upravljanje Datotekama';

  @override
  String get keepOriginalsLabel => 'Zadrži Originale';

  @override
  String get keepOriginalsDesc => 'Ostavi originalne datoteke netaknutima.';

  @override
  String get toRecycleBinLabel => 'U Otpad';

  @override
  String get toRecycleBinDesc => 'Premjesti originale u otpad nakon sažimanja.';

  @override
  String get outputFormatTitle => 'Format Spremnika';

  @override
  String get formatOriginalLabel => 'Originalni';

  @override
  String get formatOriginalDesc => 'Zadrži originalni format.';

  @override
  String get formatMp4Label => 'MP4';

  @override
  String get formatMp4Desc => 'Maksimalna kompatibilnost.';

  @override
  String get formatMkvLabel => 'MKV';

  @override
  String get formatMkvDesc => 'Podrška za više traka.';

  @override
  String get formatMovLabel => 'MOV';

  @override
  String get formatMovDesc => 'Apple QuickTime format.';

  @override
  String get scanningFilesMsg => 'Skeniranje datoteka...';

  @override
  String get addFilesBtn => 'Dodaj Datoteke';

  @override
  String get addFolderBtn => 'Dodaj Mapu';

  @override
  String get dragDropMoreMsg => 'Ili povucite i ispustite još videa ovdje';

  @override
  String get openOutputFolderTooltip => 'Otvori Izlaznu Mapu';

  @override
  String get statusQueued => 'U redu';

  @override
  String get statusAnalyzing => 'Analiziranje';

  @override
  String get statusCompressing => 'Sažimanje';

  @override
  String get statusDone => 'Završeno';

  @override
  String get statusFailed => 'Neuspješno';

  @override
  String get statusCancelled => 'Otkazano';

  @override
  String get savedPrefix => 'Ušteđeno';

  @override
  String get largerSuffix => 'Veće';

  @override
  String get largerSizeWarning =>
      'Izlazna veličina može biti veća od originala.';

  @override
  String get clearCompletedBtn => 'Očisti Završene';

  @override
  String get clearAllBtn => 'Očisti Sve';

  @override
  String get stopAllBtn => 'Zaustavi Sve';

  @override
  String get startCompressionBtn => 'Pokreni Sažimanje';

  @override
  String get allDoneLabel => 'Sve je Završeno!';

  @override
  String get openFolderBtn => 'Otvori Mapu';

  @override
  String get totalEtaLabel => 'Preostalo Vrijeme';

  @override
  String get totalSavedLabel => 'Ukupno Ušteđeno';

  @override
  String get videoSingle => 'video';

  @override
  String get videosPlural => 'videa';

  @override
  String get releaseToAddVideosMsg => 'Ispustite za dodavanje videa';

  @override
  String get dragDropHereMsg => 'Povucite i ispustite datoteke ili mape ovdje';

  @override
  String get supportedFormatsMsg => 'Podržava MP4, MKV, MOV, AVI, WMV';

  @override
  String get selectFilesBtn => 'Odaberi Datoteke';

  @override
  String get selectFolderBtn => 'Odaberi Mapu';

  @override
  String get releaseToShrinkTitle => 'Ispustite za trenutačno sažimanje';

  @override
  String get filesWillBeAddedDesc => 'Vaše datoteke bit će dodane u red.';

  @override
  String get disabledLabel => 'Onemogućeno';

  @override
  String get compressionInProgressTitle => 'Sažimanje je u Tijeku';

  @override
  String get confirmCloseDesc =>
      'Jeste li sigurni da želite zatvoriti Shrinkeo?';

  @override
  String get keepCompressingBtn => 'Nastavi Sažimanje';

  @override
  String get closeAppBtn => 'Zatvori Aplikaciju';

  @override
  String get lockedSettingsWarning => 'Zaključano tijekom sažimanja';

  @override
  String get updateRequiredTitle => 'Zahtijeva se Ažuriranje';

  @override
  String get updateRequiredDescNewVersion => 'Dostupna je nova verzija.';

  @override
  String get updateRequiredDescOldVersion => 'Vaša verzija više nije podržana.';

  @override
  String get updateNowBtn => 'Ažuriraj Sada';

  @override
  String get laterBtn => 'Kasnije';

  @override
  String get updateAvailableTitle => 'Dostupno Ažuriranje';

  @override
  String get whatsNewTitle => 'Što je novo:';

  @override
  String get exitAppBtn => 'Izlaz';

  @override
  String get retryBtn => 'Pokušaj ponovo';

  @override
  String get downloadFromWebsiteBtn => 'Preuzmi s Web stranice';

  @override
  String get skipUpdateConfirmTitle => 'Preskočiti ažuriranje?';

  @override
  String get skipUpdateConfirmDesc => 'Ovo ažuriranje sadrži važne ispravke.';

  @override
  String get skipUpdateCancelBtn => 'Odustani';

  @override
  String get skipUpdateConfirmBtn => 'Preskoči ažuriranje';

  @override
  String get maintenanceTitle => 'Održavanje';

  @override
  String get maintenanceDescDefault => 'Shrinkeo je trenutno na održavanju.';

  @override
  String versionAvailableMsg(String version) {
    return 'Verzija $version je dostupna.';
  }

  @override
  String get hwEncoderNotSupportedTitle => 'Hardversko ubrzanje nije podržano';

  @override
  String get failedCreateFolderError => 'Pogreška pri stvaranju izlazne mape';

  @override
  String get failedProbeDurationError => 'Pogreška pri očitavanju trajanja';

  @override
  String get ffmpegNotFoundGlobalError => 'FFmpeg nije pronađen.';

  @override
  String get ffmpegMissingError =>
      'FFmpeg ili FFprobe nedostaje ili je oštećen.';

  @override
  String hwFallbackNotificationBody(String encoderLabel) {
    return '$encoderLabel nije uspio. Prebačeno na CPU.';
  }

  @override
  String get failedDownloadUpdateMsg =>
      'Preuzimanje ažuriranja nije uspjelo. Pokušajte ponovo.';

  @override
  String customRatioActiveTitle(Object ratio) {
    return 'Prilagođeni omjer ($ratio)';
  }

  @override
  String customRatioActiveDesc(Object ratio) {
    return 'Platno s podlogom za prilagođeni omjer $ratio.';
  }

  @override
  String customAngleActiveTitle(Object angle) {
    return 'Prilagođeni kut ($angle°)';
  }

  @override
  String customAngleActiveDesc(Object angle) {
    return 'Rotira video za prilagođeni kut od $angle°.';
  }

  @override
  String trimActiveDesc(Object end, Object start) {
    return 'Izrezuje video zapis između $start i $end.';
  }

  @override
  String targetSizeLimitLabel(Object size) {
    return 'Ograničenje od $size MB';
  }

  @override
  String get customMbSizeTooltip => 'Unesite veličinu u MB';

  @override
  String get trimTimeTooltip =>
      'Unesite vrijeme npr. 5 (5s), 1:30 (1m30s), ili 00:01:30';

  @override
  String get tabImageSuite => 'Image Suite';

  @override
  String get compressionModeTitle => 'Način kompresije';

  @override
  String get smartAutoLabel => 'Smart Auto';

  @override
  String get smartAutoDesc =>
      'Automatski smanjuje veličinu datoteke za ~60-80% uz 100% netaknutu vizualnu jasnoću. Savršeno za svakodnevnu optimizaciju fotografija.';

  @override
  String get maxSavingsLabel => 'Maksimalna ušteda';

  @override
  String get maxSavingsDesc =>
      'Agresivna kompresija štedi do 85-90% veličine datoteke. Najbolje za brzu razmjenu poruka, prijenos na web i privitke e-pošte.';

  @override
  String get ultraFidelityLabel => 'Ultra vjernost';

  @override
  String get ultraFidelityDesc =>
      'Čuva sirovu vizualnu vjernost uz minimalnu kompresiju. Idealno za arhive fotografija i ispise visoke rezolucije.';

  @override
  String get targetImageFormatTitle => 'Format ciljne slike';

  @override
  String get dimensionResizingTitle => 'Promjena veličine dimenzija';

  @override
  String get exifCameraPrivacyTitle => 'EXIF / Privatnost kamere';

  @override
  String get stripGpsCameraInfoLabel => 'Skini podatke o GPS-u i kameri';

  @override
  String get intentCompressOnly => 'Samo komprimirati';

  @override
  String get intentCompressOnlyTooltip =>
      'Usredotočite se isključivo na smanjenje veličine datoteke (% kvalitete ili ciljani KB/MB)';

  @override
  String get intentEditConvertOnly => 'Samo uređivanje/pretvorba';

  @override
  String get intentEditConvertOnlyTooltip =>
      'Promijenite veličinu, rotirajte, izrežite ili pretvorite format bez smanjenja vizualne kvalitete';

  @override
  String get intentCompressAndEdit => 'Komprimiraj i uredi';

  @override
  String get intentCompressAndEditTooltip =>
      'Potpuna kontrola: zajedno uređujte, mijenjajte veličinu, rotirajte I komprimirajte veličinu datoteke';

  @override
  String get imgFmtOriginalLabel => 'Izvorni format';

  @override
  String get imgFmtOriginalDesc =>
      'Zadrži izvorni format (najbrži, bez konverzije).';

  @override
  String get imgFmtPngLabel => 'PNG slika (.png)';

  @override
  String get imgFmtPngDesc =>
      'PNG format bez gubitaka s podrškom za transparentnost.';

  @override
  String get imgFmtJpgLabel => 'JPEG slika (.jpg)';

  @override
  String get imgFmtJpgDesc =>
      'Standardni komprimirani JPEG format za univerzalnu kompatibilnost.';

  @override
  String get imgFmtWebpLabel => 'WebP slika (.webp)';

  @override
  String get imgFmtWebpDesc =>
      'Moderni WebP format koji nudi vrhunsku kompresiju i malu veličinu.';

  @override
  String get imgFmtAvifLabel => 'AVIF slika (.avif)';

  @override
  String get imgFmtAvifDesc =>
      'Format AVIF sljedeće generacije s iznimno visokom učinkovitošću kompresije.';

  @override
  String get imgResOriginalLabel => 'Originalne dimenzije';

  @override
  String get imgResOriginalDesc =>
      'Zadrži originalne dimenzije širine i visine slike.';

  @override
  String get imgRes4kLabel => '4K Max (3840 px)';

  @override
  String get imgRes4kDesc =>
      'Smanjite maksimalnu dimenziju slike na 3840 px (maks. 4K).';

  @override
  String get imgRes1080pLabel => 'Full HD Max (1920 px)';

  @override
  String get imgRes1080pDesc =>
      'Smanjite maksimalnu dimenziju slike na 1920 px (Full HD max).';

  @override
  String get imgRes720pLabel => 'HD Max (1280 px)';

  @override
  String get imgRes720pDesc =>
      'Smanjite maksimalnu dimenziju slike na 1280 px (HD max).';

  @override
  String get imgRes480pLabel => 'SD Max (854 px)';

  @override
  String get imgRes480pDesc =>
      'Smanjite maksimalnu dimenziju slike na 854 px (SD max).';

  @override
  String get keepMetadataImageInfoDesc =>
      'Čuva originalnu sliku EXIF ​​i metapodatke kamere.';

  @override
  String get cleanNoiseLabel => 'Očisti šum';

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
