// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get appName => 'Shrinkeo';

  @override
  String get totalSpaceSaved => 'Toplam Kazanılan Alan';

  @override
  String get savedSpacePrefix => 'Tasarruf:';

  @override
  String get supportButtonText => 'Projeyi Destekle';

  @override
  String get lightThemeTooltip => 'Açık Tema';

  @override
  String get darkThemeTooltip => 'Koyu Tema';

  @override
  String get settingsTooltip => 'Ayarlar';

  @override
  String get minimizeTooltip => 'Küçült';

  @override
  String get closeTooltip => 'Kapat';

  @override
  String get restoreTooltip => 'Geri Yükle';

  @override
  String get maximizeTooltip => 'Ekranı Kapla';

  @override
  String get tabCompressionQuality => 'Sıkıştırma ve Kalite';

  @override
  String get tabVideoEditingTools => 'Video Düzenleme ve Araçlar';

  @override
  String get tabAudioSettings => 'Ses Ayarları';

  @override
  String get tabEngineOutput => 'Motor ve Çıktı';

  @override
  String get compressionSettingsTitle => 'Sıkıştırma Ayarları';

  @override
  String get resetToDefaults => 'Varsayılana Sıfırla';

  @override
  String get resetDefaultTooltip => 'Varsayılan değerlere sıfırla';

  @override
  String get modeTargetSizeTitle => 'Sıkıştırma Modu';

  @override
  String get modeCrfLabel => 'Kalite (CRF)';

  @override
  String get modeTargetSizeLabel => 'Hedef Boyut (MB)';

  @override
  String get crfQualityTitle => 'CRF Kalitesi';

  @override
  String get crfLossless => 'Kayıpsız';

  @override
  String get crfHighQuality => 'Yüksek Kalite';

  @override
  String get crfBalanced => 'Dengeli';

  @override
  String get crfHighCompression => 'Yüksek Sıkıştırma';

  @override
  String get crfLowQuality => 'Düşük Kalite';

  @override
  String get crfUltraCompressed => 'Ultra Sıkıştırılmış';

  @override
  String get targetSizeLabel => 'Hedef Dosya Boyutu (MB)';

  @override
  String get targetSizeDesc =>
      'Belirtilen boyuta ulaşmak için bit hızını hesaplar.';

  @override
  String get encodingSpeedTitle => 'Kodlama Hızı';

  @override
  String get presetUltrafastLabel => 'Çok Hızlı';

  @override
  String get presetUltrafastDesc => 'En yüksek hız, en az sıkıştırma.';

  @override
  String get presetSuperfastLabel => 'Süper Hızlı';

  @override
  String get presetSuperfastDesc => 'Çok hızlı kodlama.';

  @override
  String get presetVeryfastLabel => 'Bayağı Hızlı';

  @override
  String get presetVeryfastDesc => 'Ortalamadan daha hızlı.';

  @override
  String get presetFasterLabel => 'Daha Hızlı';

  @override
  String get presetFasterDesc => 'İyi hız ve sıkıştırma.';

  @override
  String get presetFastLabel => 'Hızlı';

  @override
  String get presetFastDesc => 'Hız ve boyut arasında mükemmel denge.';

  @override
  String get presetMediumLabel => 'Orta';

  @override
  String get presetMediumDesc => 'Varsayılan denge.';

  @override
  String get presetSlowLabel => 'Yavaş';

  @override
  String get presetSlowDesc => 'Daha yavaş ama daha küçük dosyalar.';

  @override
  String get presetVeryslowLabel => 'Çok Yavaş';

  @override
  String get presetVeryslowDesc => 'Maksimum dosya boyutu küçültme.';

  @override
  String get videoCodecTitle => 'Video Kodeği';

  @override
  String get codecH264Label => 'H.264';

  @override
  String get codecH264Desc => 'Maksimum uyumluluk.';

  @override
  String get codecH265Label => 'H.265 / HEVC';

  @override
  String get codecH265Desc => 'Daha iyi sıkıştırma verimliliği.';

  @override
  String get codecAv1Label => 'AV1';

  @override
  String get codecAv1Desc => 'Yeni nesil kodek (H.265\'ten %30 daha küçük).';

  @override
  String get hardwareEncoderTitle => 'Donanım Hızlandırma (GPU)';

  @override
  String get hwSoftwareLabel => 'Yazılım (CPU)';

  @override
  String get hwSoftwareDesc => 'En yavaş ancak en yüksek uyumluluk.';

  @override
  String get hwNvidiaLabel => 'Nvidia (NVENC)';

  @override
  String get hwNvidiaDesc => 'Nvidia GPU\'lar için çok hızlı kodlama.';

  @override
  String get hwAmdLabel => 'AMD (AMF)';

  @override
  String get hwAmdDesc => 'AMD GPU\'lar için çok hızlı kodlama.';

  @override
  String get hwIntelLabel => 'Intel (QSV)';

  @override
  String get hwIntelDesc => 'Intel GPU\'lar için çok hızlı kodlama.';

  @override
  String get resolutionTitle => 'Maksimum Çözünürlük';

  @override
  String get resOriginalLabel => 'Orijinal';

  @override
  String get resOriginalDesc => 'Orijinal çözünürlüğü koru.';

  @override
  String get res4kLabel => '4K';

  @override
  String get res4kDesc => 'En fazla 4K çözünürlüğe düşür.';

  @override
  String get res2kLabel => '2K';

  @override
  String get res2kDesc => 'En fazla 2K çözünürlüğe düşür.';

  @override
  String get res1080pLabel => '1080p';

  @override
  String get res1080pDesc => 'En fazla 1080p Full HD\'ye düşür.';

  @override
  String get res720pLabel => '720p';

  @override
  String get res720pDesc => 'En fazla 720p HD\'ye düşür.';

  @override
  String get res480pLabel => '480p';

  @override
  String get res480pDesc => 'En fazla 480p çözünürlüğe düşür.';

  @override
  String get res360pLabel => '360p';

  @override
  String get res360pDesc => 'Maksimum sıkıştırma.';

  @override
  String get frameRateTitle => 'Kare Hızı (FPS)';

  @override
  String get fpsOriginalLabel => 'Orijinal';

  @override
  String get fpsOriginalDesc => 'Kaynak video ile aynı FPS.';

  @override
  String get fps60Label => '60 fps';

  @override
  String get fps60Desc => 'Oyun veya spor için ultra akıcı.';

  @override
  String get fps30Label => '30 fps';

  @override
  String get fps30Desc => 'Çoğu video için standart.';

  @override
  String get fps24Label => '24 fps';

  @override
  String get fps24Desc => 'Sinematik görünüm.';

  @override
  String get enableVideoDenoiseTitle => 'Video Gürültü Temizleme';

  @override
  String get enableVideoDenoiseDesc =>
      'Karıncalanmayı azaltmak için 3D filtre.';

  @override
  String get exportFormatTitle => 'Dışa Aktarım Biçimi';

  @override
  String get exportVideoLabel => 'Standart Video';

  @override
  String get exportVideoDesc => 'MP4/MKV/MOV olarak aktar';

  @override
  String get exportGifLabel => 'Hareketli GIF';

  @override
  String get exportGifDesc => 'Yüksek kaliteli GIF oluştur';

  @override
  String get exportMp3Label => 'MP3 Çıkar';

  @override
  String get exportMp3Desc => 'Sesi 320kbps MP3 olarak çıkar';

  @override
  String get exportAacLabel => 'AAC Çıkar';

  @override
  String get exportAacDesc => 'Sesi AAC olarak çıkar';

  @override
  String get exportWavLabel => 'WAV Çıkar';

  @override
  String get exportWavDesc => 'Sesi sıkıştırmasız WAV olarak çıkar';

  @override
  String get privacyScrubbingTitle => 'Gizlilik ve GPS';

  @override
  String get keepMetadataLabel => 'Verileri Koru';

  @override
  String get stripGpsExifLabel => 'GPS/EXIF Sil';

  @override
  String get stripGpsExifInfoTitle => 'Üstveriyi Temizle';

  @override
  String get stripGpsExifInfoDesc =>
      'Kamera bilgilerini ve GPS konumunu siler.';

  @override
  String get keepMetadataInfoDesc => 'Tüm orijinal üstverileri korur.';

  @override
  String get autoCropBlackBarsTitle => 'Otomatik Siyah Çizgi Kırpma';

  @override
  String get autoCropLabel => 'Oto Kırp';

  @override
  String get autoCropActiveTitle => 'Oto Kırpma Aktif';

  @override
  String get autoCropActiveDesc => 'Siyah kenarlıkları otomatik siler.';

  @override
  String get autoCropDisabledDesc => 'Orijinal kenarlıkları korur.';

  @override
  String get playbackSpeedTitle => 'Oynatma Hızı';

  @override
  String get speedOriginalLabel => '1.0x';

  @override
  String get speedOriginalDesc => 'Normal hız';

  @override
  String get speedSlow05Label => '0.5x Yavaş';

  @override
  String get speedSlow05Desc => 'Yarı hızda oynatma';

  @override
  String get speedFast15Label => '1.5x';

  @override
  String get speedFast15Desc => '1.5x hızlandırma';

  @override
  String get speedFast20Label => '2.0x Hızlı';

  @override
  String get speedFast20Desc => 'İki kat hız';

  @override
  String get speedTimelapse40Label => '4.0x Hızlandırılmış';

  @override
  String get speedTimelapse40Desc => 'Hızlandırılmış çekim için 4x hız';

  @override
  String get canvasAspectRatioTitle => 'En Boy Oranı';

  @override
  String get aspectOriginalLabel => 'Orijinal';

  @override
  String get aspectOriginalDesc => 'Orijinal boyutları koru';

  @override
  String get aspectShortsLabel => '9:16 Shorts';

  @override
  String get aspectShortsDesc => 'TikTok ve Reels için';

  @override
  String get aspectSquareLabel => '1:1 Kare';

  @override
  String get aspectSquareDesc => 'Instagram gönderileri için';

  @override
  String get aspectPortraitLabel => '4:5 Dikey';

  @override
  String get aspectPortraitDesc => 'Dikey Instagram için';

  @override
  String get aspectWidescreenLabel => '16:9 Geniş';

  @override
  String get aspectWidescreenDesc => 'YouTube ve TV ekranları için';

  @override
  String get aspectClassicLabel => '4:3 Klasik';

  @override
  String get aspectClassicDesc => 'Klasik ekranlar için';

  @override
  String get aspectCinemaLabel => '21:9 Sinema';

  @override
  String get aspectCinemaDesc => 'Ultra geniş monitörler için';

  @override
  String get aspectCustomLabel => 'Özel Oran';

  @override
  String get aspectCustomDesc => 'Özel en boy oranı';

  @override
  String get customRatioTooltip => 'Örn: 16:10, 2:1';

  @override
  String get rotationFlipTitle => 'Döndürme ve Aynalama';

  @override
  String get rotOriginalLabel => 'Orijinal (0°)';

  @override
  String get rotOriginalDesc => 'Orijinal yönü koru';

  @override
  String get rot90Label => '90° Sağa';

  @override
  String get rot90Desc => 'Sağa 90 derece döndür';

  @override
  String get rot180Label => '180° Ters';

  @override
  String get rot180Desc => 'Baş aşağı çevir';

  @override
  String get rot270Label => '270° Sola';

  @override
  String get rot270Desc => 'Sola 90 derece döndür';

  @override
  String get rotFlipHLabel => 'Yatay Çevir';

  @override
  String get rotFlipHDesc => 'Yatay olarak aynala';

  @override
  String get rotFlipVLabel => 'Dikey Çevir';

  @override
  String get rotFlipVDesc => 'Dikey olarak aynala';

  @override
  String get rotCustomLabel => 'Özel Açı';

  @override
  String get rotCustomDesc => 'Belirtilen açıda döndür';

  @override
  String get customRotationTooltip => 'Derece cinsinden açı örn. 45';

  @override
  String get trimVideoTitle => 'Videoyu Kes';

  @override
  String get fullVideoLabel => 'Tüm Video';

  @override
  String get cutClipLabel => 'Klip Kes';

  @override
  String get trimStartLabel => 'Başlangıç';

  @override
  String get trimEndLabel => 'Bitiş';

  @override
  String get trimActiveTitle => 'Kesme Aktif';

  @override
  String get fullVideoDesc => 'Tüm videoyu kesmeden işle.';

  @override
  String get audioModeTitle => 'Ses Parçası Modu';

  @override
  String get audioOriginalLabel => 'Orijinal';

  @override
  String get audioOriginalDesc => 'Ses kalitesinde kayıp yok.';

  @override
  String get audioAac256Label => 'Yüksek Kalite';

  @override
  String get audioAac256Desc => 'AAC 256kbps';

  @override
  String get audioAac128Label => 'Dengeli';

  @override
  String get audioAac128Desc => 'AAC 128kbps (Web Standardı)';

  @override
  String get audioAac64Label => 'Düşük Kalite';

  @override
  String get audioAac64Desc => 'Ses için AAC 64kbps';

  @override
  String get audioMuteLabel => 'Sesi Kapat';

  @override
  String get audioMuteDesc => 'Ses izini tamamen kaldır.';

  @override
  String get audioNormTitle => 'Ses Seviyesi Dengeleme';

  @override
  String get audioNormOffLabel => 'Kapalı';

  @override
  String get audioNormOffDesc => 'Orijinal dinamik ses.';

  @override
  String get audioNormSpeechLabel => 'Konuşma Sesi';

  @override
  String get audioNormSpeechDesc => 'Net konuşmalar için EBU R128.';

  @override
  String get audioNormDynamicLabel => 'Sinema Dinamik';

  @override
  String get audioNormDynamicDesc => 'Sessiz ve yüksek sesleri dengeler.';

  @override
  String get audioNormBoostLabel => 'Hafif Artış';

  @override
  String get audioNormBoostDesc => '+3dB ses seviyesi artışı.';

  @override
  String get audioChanTitle => 'Ses Kanalları';

  @override
  String get audioChanOriginalLabel => 'Orijinal';

  @override
  String get audioChanOriginalDesc => 'Kaynak kanalları koru.';

  @override
  String get audioChanStereoLabel => 'Stereo (2.0)';

  @override
  String get audioChanStereoDesc => '2 kanallı stereo uyumluluğu.';

  @override
  String get audioChanMonoLabel => 'Mono (1.0)';

  @override
  String get audioChanMonoDesc => 'Tek kanal - %50 ses boyutu tasarrufu.';

  @override
  String get removeNoiseLabel => 'Gürültüyü Sil';

  @override
  String get enableAudioDenoiseTitle => 'Mikrofon Gürültüsünü Sil';

  @override
  String get enableAudioDenoiseDesc => 'Arka plan cızırtı filtresi.';

  @override
  String get outputDirectoryTitle => 'Çıktı Klasörü';

  @override
  String get defaultOutputDirectory => 'Varsayılan (Orijinal dosya yanı)';

  @override
  String get selectOutputFolderTitle => 'Klasör Seç';

  @override
  String get clearOutputFolder => 'Varsayılan konumu kullan';

  @override
  String get changeBtn => 'Değiştir';

  @override
  String get outputLocationTitle => 'Çıktı Davranışı';

  @override
  String get outputLocationUnifiedLabel => 'Tek Klasör';

  @override
  String get outputLocationUnifiedDesc =>
      'Tüm sıkıştırılmış videolar tek klasörde.';

  @override
  String get outputLocationSameLabel => 'Orijinal Yanında';

  @override
  String get outputLocationSameDesc => 'Her video kendi kaynağının yanında.';

  @override
  String get fileManagementTitle => 'Dosya Yönetimi';

  @override
  String get keepOriginalsLabel => 'Orijinalleri Koru';

  @override
  String get keepOriginalsDesc => 'Orijinal dosyaları elleme.';

  @override
  String get toRecycleBinLabel => 'Geri Dönüşüme Gönder';

  @override
  String get toRecycleBinDesc =>
      'Sıkıştırma sonrası orijinalleri çöp kutusuna at.';

  @override
  String get outputFormatTitle => 'Kapsayıcı Biçimi';

  @override
  String get formatOriginalLabel => 'Orijinal';

  @override
  String get formatOriginalDesc => 'Orijinal biçimi koru.';

  @override
  String get formatMp4Label => 'MP4';

  @override
  String get formatMp4Desc => 'Maksimum uyumluluk.';

  @override
  String get formatMkvLabel => 'MKV';

  @override
  String get formatMkvDesc => 'Çoklu iz desteği.';

  @override
  String get formatMovLabel => 'MOV';

  @override
  String get formatMovDesc => 'Apple QuickTime biçimi.';

  @override
  String get scanningFilesMsg => 'Dosyalar taranıyor...';

  @override
  String get addFilesBtn => 'Dosya Ekle';

  @override
  String get addFolderBtn => 'Klasör Ekle';

  @override
  String get dragDropMoreMsg => 'Veya videoları buraya sürükleyip bırakın';

  @override
  String get openOutputFolderTooltip => 'Çıktı Klasörünü Aç';

  @override
  String get statusQueued => 'Sırada';

  @override
  String get statusAnalyzing => 'İnceleniyor';

  @override
  String get statusCompressing => 'Sıkıştırılıyor';

  @override
  String get statusDone => 'Tamamlandı';

  @override
  String get statusFailed => 'Başarısız';

  @override
  String get statusCancelled => 'İptal Edildi';

  @override
  String get savedPrefix => 'Tasarruf';

  @override
  String get largerSuffix => 'Daha Büyük';

  @override
  String get largerSizeWarning =>
      'Çıktı boyutu orijinalden daha büyük olabilir.';

  @override
  String get clearCompletedBtn => 'Tamamlananları Temizle';

  @override
  String get clearAllBtn => 'Tümünü Temizle';

  @override
  String get stopAllBtn => 'Tümünü Durdur';

  @override
  String get startCompressionBtn => 'Sıkıştırmayı Başlat';

  @override
  String get allDoneLabel => 'Hepsi Tamam!';

  @override
  String get openFolderBtn => 'Klasörü Aç';

  @override
  String get totalEtaLabel => 'Kalan Süre';

  @override
  String get totalSavedLabel => 'Toplam Tasarruf';

  @override
  String get videoSingle => 'video';

  @override
  String get videosPlural => 'video';

  @override
  String get releaseToAddVideosMsg => 'Videoları eklemek için bırakın';

  @override
  String get dragDropHereMsg => 'Dosya veya klasörleri buraya sürükleyin';

  @override
  String get supportedFormatsMsg => 'MP4, MKV, MOV, AVI, WMV destekler';

  @override
  String get selectFilesBtn => 'Dosya Seç';

  @override
  String get selectFolderBtn => 'Klasör Seç';

  @override
  String get releaseToShrinkTitle => 'Sıkıştırmak için bırakın';

  @override
  String get filesWillBeAddedDesc => 'Dosyalarınız sıraya eklenecek.';

  @override
  String get disabledLabel => 'Devre Dışı';

  @override
  String get compressionInProgressTitle => 'Sıkıştırma Devam Ediyor';

  @override
  String get confirmCloseDesc =>
      'Shrinkeo uygulamasını kapatmak istediğinizden emin misiniz?';

  @override
  String get keepCompressingBtn => 'Sıkıştırmaya Devam Et';

  @override
  String get closeAppBtn => 'Uygulamayı Kapat';

  @override
  String get lockedSettingsWarning => 'Sıkıştırma sırasında kilitli';

  @override
  String get updateRequiredTitle => 'Güncelleme Gerekli';

  @override
  String get updateRequiredDescNewVersion => 'Yeni bir güncelleme mevcut.';

  @override
  String get updateRequiredDescOldVersion => 'Sürümünüz artık desteklenmiyor.';

  @override
  String get updateNowBtn => 'Şimdi Güncelle';

  @override
  String get laterBtn => 'Daha Sonra';

  @override
  String get updateAvailableTitle => 'Güncelleme Var';

  @override
  String get whatsNewTitle => 'Yenilikler:';

  @override
  String get exitAppBtn => 'Çıkış';

  @override
  String get retryBtn => 'Yeniden Dene';

  @override
  String get downloadFromWebsiteBtn => 'Web Sitesinden İndir';

  @override
  String get skipUpdateConfirmTitle => 'Güncelleme atlansın mı?';

  @override
  String get skipUpdateConfirmDesc =>
      'Bu güncelleme kritik düzeltmeler içeriyor.';

  @override
  String get skipUpdateCancelBtn => 'İptal';

  @override
  String get skipUpdateConfirmBtn => 'Güncellemeyi atla';

  @override
  String get maintenanceTitle => 'Bakım';

  @override
  String get maintenanceDescDefault => 'Shrinkeo şu anda bakımda.';

  @override
  String versionAvailableMsg(String version) {
    return 'Sürüm $version mevcut.';
  }

  @override
  String get hwEncoderNotSupportedTitle => 'Donanım Hızlandırma Desteklenmiyor';

  @override
  String get failedCreateFolderError => 'Klasör oluşturulamadı';

  @override
  String get failedProbeDurationError => 'Süre okunamadı';

  @override
  String get ffmpegNotFoundGlobalError => 'FFmpeg bulunamadı.';

  @override
  String get ffmpegMissingError => 'FFmpeg veya FFprobe eksik veya bozuk.';

  @override
  String hwFallbackNotificationBody(String encoderLabel) {
    return '$encoderLabel başarısız oldu. CPU\'ya geçildi.';
  }

  @override
  String get failedDownloadUpdateMsg =>
      'Güncelleme indirilemedi. Lütfen tekrar deneyin.';

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
  String get tabImageSuite => 'Resim Araçları';

  @override
  String get compressionModeTitle => 'Sıkıştırma Modu';

  @override
  String get smartAutoLabel => 'Akıllı Otomatik';

  @override
  String get smartAutoDesc =>
      'Mükemmel netlikle dosya boyutunu otomatik olarak %60-80 azaltır. Günlük fotoğraflar için idealdir.';

  @override
  String get maxSavingsLabel => 'Maksimum Tasarruf';

  @override
  String get maxSavingsDesc =>
      '%85-90\'a varan dosya boyutu tasarrufu sağlayan güçlü sıkıştırma. Mesajlar ve e-postalar için harika.';

  @override
  String get ultraFidelityLabel => 'Ultra Kalite';

  @override
  String get ultraFidelityDesc =>
      'Minimum sıkıştırma ile orijinal kaliteyi korur. Arşivleme ve baskı için idealdir.';

  @override
  String get targetImageFormatTitle => 'Hedef Resim Formatı';

  @override
  String get dimensionResizingTitle => 'Yeniden Boyutlandırma';

  @override
  String get exifCameraPrivacyTitle => 'EXIF / Kamera Gizliliği';

  @override
  String get stripGpsCameraInfoLabel => 'GPS ve Kamera Bilgilerini Sil';

  @override
  String get intentCompressOnly => 'Yalnızca Sıkıştır';

  @override
  String get intentCompressOnlyTooltip =>
      'Tamamen dosya boyutunu küçültmeye odaklanın (Kalite %\'si veya Hedef KB/MB)';

  @override
  String get intentEditConvertOnly => 'Yalnızca Düzenle / Dönüştür';

  @override
  String get intentEditConvertOnlyTooltip =>
      'Görsel kaliteyi düşürmeden formatı yeniden boyutlandırın, döndürün, kırpın veya dönüştürün';

  @override
  String get intentCompressAndEdit => 'Sıkıştır ve Düzenle';

  @override
  String get intentCompressAndEditTooltip =>
      'Tam kontrol: Dosya boyutunu birlikte düzenleyin, yeniden boyutlandırın, döndürün VE sıkıştırın';

  @override
  String get imgFmtOriginalLabel => 'Orijinal Format';

  @override
  String get imgFmtOriginalDesc =>
      'Orijinal formatı koruyun (En hızlı, dönüştürme yok).';

  @override
  String get imgFmtPngLabel => 'PNG Resmi (.png)';

  @override
  String get imgFmtPngDesc => 'Şeffaflık desteğine sahip kayıpsız PNG formatı.';

  @override
  String get imgFmtJpgLabel => 'JPEG Görüntüsü (.jpg)';

  @override
  String get imgFmtJpgDesc =>
      'Evrensel uyumluluk için standart sıkıştırılmış JPEG formatı.';

  @override
  String get imgFmtWebpLabel => 'WebP Görüntüsü (.webp)';

  @override
  String get imgFmtWebpDesc =>
      'Üstün sıkıştırma ve küçük boyut sunan modern WebP formatı.';

  @override
  String get imgFmtAvifLabel => 'AVIF Görüntüsü (.avif)';

  @override
  String get imgFmtAvifDesc =>
      'Ultra yüksek sıkıştırma verimliliğine sahip yeni nesil AVIF formatı.';

  @override
  String get imgResOriginalLabel => 'Orijinal Boyutlar';

  @override
  String get imgResOriginalDesc =>
      'Orijinal görselin genişlik ve yükseklik boyutlarını koruyun.';

  @override
  String get imgRes4kLabel => 'Maksimum 4K (3840 piksel)';

  @override
  String get imgRes4kDesc =>
      'Görüntünün maksimum boyutunu 3840 piksele (maks. 4K) düşürün.';

  @override
  String get imgRes1080pLabel => 'Tam HD Maksimum (1920 piksel)';

  @override
  String get imgRes1080pDesc =>
      'Görüntünün maksimum boyutunu 1920 piksele (Full HD maksimum) düşürün.';

  @override
  String get imgRes720pLabel => 'HD Maksimum (1280 piksel)';

  @override
  String get imgRes720pDesc =>
      'Görüntünün maksimum boyutunu 1280 piksele (HD maksimum) kadar küçültün.';

  @override
  String get imgRes480pLabel => 'SD Maks (854 piksel)';

  @override
  String get imgRes480pDesc =>
      'Görüntünün maksimum boyutunu 854 piksele (SD maksimum) kadar küçültün.';

  @override
  String get keepMetadataImageInfoDesc =>
      'Orijinal görüntü EXIF\'sini ve kamera meta verilerini korur.';

  @override
  String get cleanNoiseLabel => 'Clean Noise';

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
