// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Indonesian (`id`).
class AppLocalizationsId extends AppLocalizations {
  AppLocalizationsId([String locale = 'id']) : super(locale);

  @override
  String get appName => 'Shrinkeo';

  @override
  String get totalSpaceSaved => 'Total Ruang Hemat';

  @override
  String get savedSpacePrefix => 'Hemat:';

  @override
  String get supportButtonText => 'Dukung Proyek';

  @override
  String get lightThemeTooltip => 'Tema Terang';

  @override
  String get darkThemeTooltip => 'Tema Gelap';

  @override
  String get settingsTooltip => 'Pengaturan';

  @override
  String get minimizeTooltip => 'Minimalkan';

  @override
  String get closeTooltip => 'Tutup';

  @override
  String get restoreTooltip => 'Pulihkan';

  @override
  String get maximizeTooltip => 'Maksimalkan';

  @override
  String get tabCompressionQuality => 'Kompresi & Kualitas';

  @override
  String get tabVideoEditingTools => 'Edit Video & Alat';

  @override
  String get tabAudioSettings => 'Pengaturan Audio';

  @override
  String get tabEngineOutput => 'Mesin & Output';

  @override
  String get compressionSettingsTitle => 'Pengaturan Kompresi';

  @override
  String get resetToDefaults => 'Reset ke Default';

  @override
  String get resetDefaultTooltip => 'Kembalikan ke nilai awal';

  @override
  String get modeTargetSizeTitle => 'Mode Target Kompresi';

  @override
  String get modeCrfLabel => 'Kualitas (CRF)';

  @override
  String get modeTargetSizeLabel => 'Ukuran Target (MB)';

  @override
  String get crfQualityTitle => 'Faktor Kualitas CRF';

  @override
  String get crfLossless => 'Tanpa kerugian';

  @override
  String get crfHighQuality => 'Kualitas Tinggi';

  @override
  String get crfBalanced => 'Seimbang';

  @override
  String get crfHighCompression => 'Kompresi Tinggi';

  @override
  String get crfLowQuality => 'Kualitas Rendah';

  @override
  String get crfUltraCompressed => 'Sangat Terkompresi';

  @override
  String get targetSizeLabel => 'Ukuran Berkas Target (MB)';

  @override
  String get targetSizeDesc => 'Menghitung bitrate agar sesuai batas ukuran.';

  @override
  String get encodingSpeedTitle => 'Kecepatan Enkoding';

  @override
  String get presetUltrafastLabel => 'Sangat Cepat';

  @override
  String get presetUltrafastDesc =>
      'Kecepatan maksimal namun pengurangan ukuran minimal.';

  @override
  String get presetSuperfastLabel => 'Super Cepat';

  @override
  String get presetSuperfastDesc => 'Enkoding sangat cepat.';

  @override
  String get presetVeryfastLabel => 'Sangat Cepat';

  @override
  String get presetVeryfastDesc => 'Lebih cepat dari rata-rata.';

  @override
  String get presetFasterLabel => 'Lebih Cepat';

  @override
  String get presetFasterDesc => 'Kecepatan dan kompresi yang baik.';

  @override
  String get presetFastLabel => 'Cepat';

  @override
  String get presetFastDesc =>
      'Keseimbangan terbaik antara kecepatan dan ukuran.';

  @override
  String get presetMediumLabel => 'Sedang';

  @override
  String get presetMediumDesc => 'Keseimbangan default.';

  @override
  String get presetSlowLabel => 'Lambat';

  @override
  String get presetSlowDesc =>
      'Lebih lambat tapi ukuran berkas jauh lebih kecil.';

  @override
  String get presetVeryslowLabel => 'Sangat Lambat';

  @override
  String get presetVeryslowDesc => 'Pengurangan ukuran maksimal.';

  @override
  String get videoCodecTitle => 'Kodek Video';

  @override
  String get codecH264Label => 'H.264';

  @override
  String get codecH264Desc => 'Kompatibilitas maksimal.';

  @override
  String get codecH265Label => 'H.265 / HEVC';

  @override
  String get codecH265Desc => 'Efisiensi kompresi lebih baik.';

  @override
  String get codecAv1Label => 'AV1';

  @override
  String get codecAv1Desc =>
      'Kodek generasi baru (30% lebih kecil dari H.265).';

  @override
  String get hardwareEncoderTitle => 'Akselerasi Perangkat Keras (GPU)';

  @override
  String get hwSoftwareLabel => 'Perangkat Lunak (CPU)';

  @override
  String get hwSoftwareDesc => 'Paling lambat tapi kompatibilitas terbaik.';

  @override
  String get hwNvidiaLabel => 'Nvidia (NVENC)';

  @override
  String get hwNvidiaDesc => 'Enkoding sangat cepat untuk GPU Nvidia.';

  @override
  String get hwAmdLabel => 'AMD (AMF)';

  @override
  String get hwAmdDesc => 'Enkoding sangat cepat untuk GPU AMD.';

  @override
  String get hwIntelLabel => 'Intel (QSV)';

  @override
  String get hwIntelDesc => 'Enkoding sangat cepat untuk GPU Intel.';

  @override
  String get resolutionTitle => 'Resolusi Maksimal';

  @override
  String get resOriginalLabel => 'Asli';

  @override
  String get resOriginalDesc => 'Pertahankan resolusi asli.';

  @override
  String get res4kLabel => '4K';

  @override
  String get res4kDesc => 'Turunkan ke maks 4K.';

  @override
  String get res2kLabel => '2K';

  @override
  String get res2kDesc => 'Turunkan ke maks 2K.';

  @override
  String get res1080pLabel => '1080p';

  @override
  String get res1080pDesc => 'Turunkan ke maks 1080p Full HD.';

  @override
  String get res720pLabel => '720p';

  @override
  String get res720pDesc => 'Turunkan ke maks 720p HD.';

  @override
  String get res480pLabel => '480p';

  @override
  String get res480pDesc => 'Turunkan ke 480p.';

  @override
  String get res360pLabel => '360p';

  @override
  String get res360pDesc => 'Kompresi maksimal.';

  @override
  String get frameRateTitle => 'Bingkai per Detik (FPS)';

  @override
  String get fpsOriginalLabel => 'Asli';

  @override
  String get fpsOriginalDesc => 'FPS sama dengan sumber.';

  @override
  String get fps60Label => '60 fps';

  @override
  String get fps60Desc => 'Sangat halus untuk game atau olahraga.';

  @override
  String get fps30Label => '30 fps';

  @override
  String get fps30Desc => 'Standar sebagian besar video.';

  @override
  String get fps24Label => '24 fps';

  @override
  String get fps24Desc => 'Gaya sinematik.';

  @override
  String get enableVideoDenoiseTitle => 'Pembersih Noise Video';

  @override
  String get enableVideoDenoiseDesc =>
      'Filter 3D mengurangi bintik dan tingkatkan kompresi.';

  @override
  String get exportFormatTitle => 'Format Ekspor';

  @override
  String get exportVideoLabel => 'Video Standar';

  @override
  String get exportVideoDesc => 'Ekspor ke MP4/MKV/MOV';

  @override
  String get exportGifLabel => 'GIF Animasi';

  @override
  String get exportGifDesc => 'Buat GIF animasi berkualitas tinggi';

  @override
  String get exportMp3Label => 'Ekstrak MP3';

  @override
  String get exportMp3Desc => 'Ekstrak audio ke MP3 320kbps';

  @override
  String get exportAacLabel => 'Ekstrak AAC';

  @override
  String get exportAacDesc => 'Ekstrak audio ke AAC';

  @override
  String get exportWavLabel => 'Ekstrak WAV';

  @override
  String get exportWavDesc => 'Ekstrak audio WAV tanpa kompresi';

  @override
  String get privacyScrubbingTitle => 'Privasi & GPS';

  @override
  String get keepMetadataLabel => 'Simpan Data';

  @override
  String get stripGpsExifLabel => 'Hapus GPS/EXIF';

  @override
  String get stripGpsExifInfoTitle => 'Bersihkan Metadata';

  @override
  String get stripGpsExifInfoDesc => 'Menghapus info kamera dan lokasi GPS.';

  @override
  String get keepMetadataInfoDesc => 'Pertahankan semua metadata asli.';

  @override
  String get autoCropBlackBarsTitle => 'Potong Garis Hitam Otomatis';

  @override
  String get autoCropLabel => 'Potong Oto';

  @override
  String get autoCropActiveTitle => 'Potong Oto Aktif';

  @override
  String get autoCropActiveDesc => 'Menghapus garis hitam otomatis.';

  @override
  String get autoCropDisabledDesc => 'Pertahankan bingkai asli.';

  @override
  String get playbackSpeedTitle => 'Kecepatan Putar';

  @override
  String get speedOriginalLabel => '1.0x';

  @override
  String get speedOriginalDesc => 'Kecepatan normal';

  @override
  String get speedSlow05Label => '0.5x Lambat';

  @override
  String get speedSlow05Desc => 'Putar setengah kecepatan';

  @override
  String get speedFast15Label => '1.5x';

  @override
  String get speedFast15Desc => 'Percepat 1.5 kali';

  @override
  String get speedFast20Label => '2.0x Cepat';

  @override
  String get speedFast20Desc => 'Kecepatan ganda';

  @override
  String get speedTimelapse40Label => '4.0x Timelapse';

  @override
  String get speedTimelapse40Desc => 'Kecepatan 4x untuk timelapse';

  @override
  String get canvasAspectRatioTitle => 'Rasio Aspek';

  @override
  String get aspectOriginalLabel => 'Asli';

  @override
  String get aspectOriginalDesc => 'Pertahankan rasio asli';

  @override
  String get aspectShortsLabel => '9:16 Shorts';

  @override
  String get aspectShortsDesc => 'Untuk TikTok dan Reels';

  @override
  String get aspectSquareLabel => '1:1 Persegi';

  @override
  String get aspectSquareDesc => 'Untuk postingan Instagram';

  @override
  String get aspectPortraitLabel => '4:5 Potret';

  @override
  String get aspectPortraitDesc => 'Untuk Instagram vertikal';

  @override
  String get aspectWidescreenLabel => '16:9 Lebar';

  @override
  String get aspectWidescreenDesc => 'Untuk YouTube dan TV';

  @override
  String get aspectClassicLabel => '4:3 Klasik';

  @override
  String get aspectClassicDesc => 'Untuk layar klasik';

  @override
  String get aspectCinemaLabel => '21:9 Sinema';

  @override
  String get aspectCinemaDesc => 'Untuk monitor ultrawide';

  @override
  String get aspectCustomLabel => 'Kustom';

  @override
  String get aspectCustomDesc => 'Rasio aspek kustom';

  @override
  String get customRatioTooltip => 'Mis: 16:10, 2:1';

  @override
  String get rotationFlipTitle => 'Rotasi & Cermin';

  @override
  String get rotOriginalLabel => 'Asli (0°)';

  @override
  String get rotOriginalDesc => 'Pertahankan arah asli';

  @override
  String get rot90Label => '90° Kanan';

  @override
  String get rot90Desc => 'Putar 90 derajat searah jarum jam';

  @override
  String get rot180Label => '180° Terbalik';

  @override
  String get rot180Desc => 'Putar terbalik';

  @override
  String get rot270Label => '270° Kiri';

  @override
  String get rot270Desc => 'Putar 90 derajat berlawanan jarum jam';

  @override
  String get rotFlipHLabel => 'Cermin Horiz.';

  @override
  String get rotFlipHDesc => 'Cerminkan secara horizontal';

  @override
  String get rotFlipVLabel => 'Cermin Vert.';

  @override
  String get rotFlipVDesc => 'Cerminkan secara vertikal';

  @override
  String get rotCustomLabel => 'Sudut Kustom';

  @override
  String get rotCustomDesc => 'Putar dengan sudut khusus';

  @override
  String get customRotationTooltip => 'Sudut dalam derajat misal 45';

  @override
  String get trimVideoTitle => 'Potong Video';

  @override
  String get fullVideoLabel => 'Seluruh Video';

  @override
  String get cutClipLabel => 'Potong Klip';

  @override
  String get trimStartLabel => 'Mulai';

  @override
  String get trimEndLabel => 'Selesai';

  @override
  String get trimActiveTitle => 'Pemotongan Aktif';

  @override
  String get fullVideoDesc => 'Proses seluruh video tanpa pemotongan.';

  @override
  String get audioModeTitle => 'Mode Trek Audio';

  @override
  String get audioOriginalLabel => 'Asli';

  @override
  String get audioOriginalDesc => 'Tanpa penurunan kualitas audio.';

  @override
  String get audioAac256Label => 'Kualitas Tinggi';

  @override
  String get audioAac256Desc => 'AAC 256kbps';

  @override
  String get audioAac128Label => 'Seimbang';

  @override
  String get audioAac128Desc => 'AAC 128kbps (Standar Web)';

  @override
  String get audioAac64Label => 'Kualitas Rendah';

  @override
  String get audioAac64Desc => 'AAC 64kbps untuk suara';

  @override
  String get audioMuteLabel => 'Bisu Audio';

  @override
  String get audioMuteDesc => 'Hapus trek audio sepenuhnya.';

  @override
  String get audioNormTitle => 'Normalisasi Volume';

  @override
  String get audioNormOffLabel => 'Mati';

  @override
  String get audioNormOffDesc => 'Volume dinamik asli.';

  @override
  String get audioNormSpeechLabel => 'Suara Manusia';

  @override
  String get audioNormSpeechDesc => 'EBU R128 untuk percakapan jelas.';

  @override
  String get audioNormDynamicLabel => 'Sinema Dinamik';

  @override
  String get audioNormDynamicDesc => 'Haluskan suara pelan dan keras.';

  @override
  String get audioNormBoostLabel => 'Peningkatan Halus';

  @override
  String get audioNormBoostDesc => '+3dB peningkatan volume.';

  @override
  String get audioChanTitle => 'Saluran Audio';

  @override
  String get audioChanOriginalLabel => 'Asli';

  @override
  String get audioChanOriginalDesc => 'Pertahankan saluran asal.';

  @override
  String get audioChanStereoLabel => 'Stereo (2.0)';

  @override
  String get audioChanStereoDesc => 'Kompatibilitas stereo 2 saluran.';

  @override
  String get audioChanMonoLabel => 'Mono (1.0)';

  @override
  String get audioChanMonoDesc => 'Saluran tunggal - hemat 50% ukuran audio.';

  @override
  String get removeNoiseLabel => 'Hapus Noise';

  @override
  String get enableAudioDenoiseTitle => 'Hapus Noise Mikrofon';

  @override
  String get enableAudioDenoiseDesc =>
      'Filter untuk menghilangkan bising latar belakang.';

  @override
  String get outputDirectoryTitle => 'Direktori Output';

  @override
  String get defaultOutputDirectory => 'Default (Di samping berkas asli)';

  @override
  String get selectOutputFolderTitle => 'Pilih Folder';

  @override
  String get clearOutputFolder => 'Gunakan lokasi default';

  @override
  String get changeBtn => 'Ubah';

  @override
  String get outputLocationTitle => 'Perilaku Output';

  @override
  String get outputLocationUnifiedLabel => 'Folder Tunggal';

  @override
  String get outputLocationUnifiedDesc =>
      'Semua video kompresi dalam satu folder.';

  @override
  String get outputLocationSameLabel => 'Di Samping Asli';

  @override
  String get outputLocationSameDesc =>
      'Setiap video di samping berkas sumbernya.';

  @override
  String get fileManagementTitle => 'Manajemen Berkas';

  @override
  String get keepOriginalsLabel => 'Simpan Asli';

  @override
  String get keepOriginalsDesc => 'Biarkan berkas asli tidak tersentuh.';

  @override
  String get toRecycleBinLabel => 'Ke Tempat Sampah';

  @override
  String get toRecycleBinDesc =>
      'Pindahkan berkas asli ke tempat sampah setelah sukses.';

  @override
  String get outputFormatTitle => 'Format Kontainer';

  @override
  String get formatOriginalLabel => 'Asli';

  @override
  String get formatOriginalDesc => 'Pertahankan format asli.';

  @override
  String get formatMp4Label => 'MP4';

  @override
  String get formatMp4Desc => 'Kompatibilitas maksimal.';

  @override
  String get formatMkvLabel => 'MKV';

  @override
  String get formatMkvDesc => 'Dukungan banyak trek.';

  @override
  String get formatMovLabel => 'MOV';

  @override
  String get formatMovDesc => 'Format Apple QuickTime.';

  @override
  String get scanningFilesMsg => 'Mepindai berkas...';

  @override
  String get addFilesBtn => 'Tambah Berkas';

  @override
  String get addFolderBtn => 'Tambah Folder';

  @override
  String get dragDropMoreMsg => 'Atau seret & lepas lebih banyak video di sini';

  @override
  String get openOutputFolderTooltip => 'Buka Folder Output';

  @override
  String get statusQueued => 'Dalam antrean';

  @override
  String get statusAnalyzing => 'Menganalisis';

  @override
  String get statusCompressing => 'Mengompresi';

  @override
  String get statusDone => 'Selesai';

  @override
  String get statusFailed => 'Gagal';

  @override
  String get statusCancelled => 'Dibatalkan';

  @override
  String get savedPrefix => 'Hemat';

  @override
  String get largerSuffix => 'Lebih Besar';

  @override
  String get largerSizeWarning => 'Ukuran akhir bisa lebih besar dari asli.';

  @override
  String get clearCompletedBtn => 'Hapus Selesai';

  @override
  String get clearAllBtn => 'Hapus Semua';

  @override
  String get stopAllBtn => 'Hentikan Semua';

  @override
  String get startCompressionBtn => 'Mulai Kompresi';

  @override
  String get allDoneLabel => 'Semua Selesai!';

  @override
  String get openFolderBtn => 'Buka Folder';

  @override
  String get totalEtaLabel => 'Sisa Waktu';

  @override
  String get totalSavedLabel => 'Total Hemat';

  @override
  String get videoSingle => 'video';

  @override
  String get videosPlural => 'video';

  @override
  String get releaseToAddVideosMsg => 'Lepaskan untuk menambah video';

  @override
  String get dragDropHereMsg => 'Seret & lepas berkas atau folder di sini';

  @override
  String get supportedFormatsMsg => 'Mendukung MP4, MKV, MOV, AVI, WMV';

  @override
  String get selectFilesBtn => 'Pilih Berkas';

  @override
  String get selectFolderBtn => 'Pilih Folder';

  @override
  String get releaseToShrinkTitle => 'Lepaskan untuk kompresi';

  @override
  String get filesWillBeAddedDesc => 'Berkas Anda akan ditambahkan ke antrean.';

  @override
  String get disabledLabel => 'Dinonaktifkan';

  @override
  String get compressionInProgressTitle => 'Kompresi Sedang Berjalan';

  @override
  String get confirmCloseDesc => 'Apakah Anda yakin ingin menutup Shrinkeo?';

  @override
  String get keepCompressingBtn => 'Lanjutkan Kompresi';

  @override
  String get closeAppBtn => 'Tutup Aplikasi';

  @override
  String get lockedSettingsWarning => 'Terkunci saat kompresi';

  @override
  String get updateRequiredTitle => 'Pembaruan Diperlukan';

  @override
  String get updateRequiredDescNewVersion => 'Versi baru telah tersedia.';

  @override
  String get updateRequiredDescOldVersion => 'Versi Anda tidak lagi didukung.';

  @override
  String get updateNowBtn => 'Perbarui Sekarang';

  @override
  String get laterBtn => 'Nanti';

  @override
  String get updateAvailableTitle => 'Pembaruan Tersedia';

  @override
  String get whatsNewTitle => 'Yang Baru:';

  @override
  String get exitAppBtn => 'Keluar';

  @override
  String get retryBtn => 'Coba Lagi';

  @override
  String get downloadFromWebsiteBtn => 'Unduh dari Situs Web';

  @override
  String get skipUpdateConfirmTitle => 'Lewati Pembaruan?';

  @override
  String get skipUpdateConfirmDesc => 'Pembaruan ini berisi perbaikan penting.';

  @override
  String get skipUpdateCancelBtn => 'Batal';

  @override
  String get skipUpdateConfirmBtn => 'Lewati Pembaruan';

  @override
  String get maintenanceTitle => 'Pemeliharaan';

  @override
  String get maintenanceDescDefault => 'Shrinkeo sedang dalam pemeliharaan.';

  @override
  String versionAvailableMsg(String version) {
    return 'Versi $version telah tersedia.';
  }

  @override
  String get hwEncoderNotSupportedTitle => 'Akselerasi tidak didukung';

  @override
  String get failedCreateFolderError => 'Gagal membuat folder output';

  @override
  String get failedProbeDurationError => 'Gagal menganalisis durasi';

  @override
  String get ffmpegNotFoundGlobalError => 'FFmpeg tidak ditemukan.';

  @override
  String get ffmpegMissingError => 'FFmpeg atau FFprobe hilang atau rusak.';

  @override
  String hwFallbackNotificationBody(String encoderLabel) {
    return '$encoderLabel gagal. Beralih ke CPU.';
  }

  @override
  String get failedDownloadUpdateMsg =>
      'Gagal mengunduh pembaruan. Silakan coba lagi.';

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
  String get tabImageSuite => 'Rangkaian Gambar';

  @override
  String get compressionModeTitle => 'Mode Kompresi';

  @override
  String get smartAutoLabel => 'Otomatis Cerdas';

  @override
  String get smartAutoDesc =>
      'Secara otomatis mengurangi ukuran file hingga ~60-80% dengan kejernihan visual 100%. Sempurna untuk pengoptimalan foto sehari-hari.';

  @override
  String get maxSavingsLabel => 'Penghematan Maks';

  @override
  String get maxSavingsDesc =>
      'Kompresi agresif menghemat ukuran file hingga 85-90%. Terbaik untuk perpesanan cepat, unggahan web, dan lampiran email.';

  @override
  String get ultraFidelityLabel => 'Kesetiaan Ultra';

  @override
  String get ultraFidelityDesc =>
      'Mempertahankan fidelitas visual mentah dengan kompresi minimal. Ideal untuk arsip fotografi dan pekerjaan cetak resolusi tinggi.';

  @override
  String get targetImageFormatTitle => 'Format Gambar Sasaran';

  @override
  String get dimensionResizingTitle => 'Mengubah Ukuran Dimensi';

  @override
  String get exifCameraPrivacyTitle => 'EXIF / Privasi Kamera';

  @override
  String get stripGpsCameraInfoLabel => 'Hapus Info GPS & Kamera';

  @override
  String get intentCompressOnly => 'Kompres Saja';

  @override
  String get intentCompressOnlyTooltip =>
      'Fokus murni pada pengurangan ukuran file (% Kualitas atau Target KB/MB)';

  @override
  String get intentEditConvertOnly => 'Edit / Konversi Saja';

  @override
  String get intentEditConvertOnlyTooltip =>
      'Ubah ukuran, putar, potong, atau ubah format tanpa mengurangi kualitas visual';

  @override
  String get intentCompressAndEdit => 'Kompres & Edit';

  @override
  String get intentCompressAndEditTooltip =>
      'Kontrol penuh: Edit, ubah ukuran, putar DAN kompres ukuran file secara bersamaan';

  @override
  String get imgFmtOriginalLabel => 'Format Asli';

  @override
  String get imgFmtOriginalDesc =>
      'Pertahankan format asli (Tercepat, tanpa konversi).';

  @override
  String get imgFmtPngLabel => 'Gambar PNG (.png)';

  @override
  String get imgFmtPngDesc =>
      'Format PNG lossless dengan dukungan transparansi.';

  @override
  String get imgFmtJpgLabel => 'Gambar JPEG (.jpg)';

  @override
  String get imgFmtJpgDesc =>
      'Format JPEG terkompresi standar untuk kompatibilitas universal.';

  @override
  String get imgFmtWebpLabel => 'Gambar WebP (.webp)';

  @override
  String get imgFmtWebpDesc =>
      'Format WebP modern menawarkan kompresi superior dan ukuran kecil.';

  @override
  String get imgFmtAvifLabel => 'Gambar AVIF (.avif)';

  @override
  String get imgFmtAvifDesc =>
      'Format AVIF generasi berikutnya dengan efisiensi kompresi sangat tinggi.';

  @override
  String get imgResOriginalLabel => 'Dimensi Asli';

  @override
  String get imgResOriginalDesc =>
      'Pertahankan dimensi lebar dan tinggi gambar asli.';

  @override
  String get imgRes4kLabel => '4K Maks (3840 piksel)';

  @override
  String get imgRes4kDesc =>
      'Turunkan dimensi maksimal gambar menjadi 3840 piksel (maks 4K).';

  @override
  String get imgRes1080pLabel => 'Full HD Maks (1920 piksel)';

  @override
  String get imgRes1080pDesc =>
      'Turunkan dimensi maksimal gambar menjadi 1920 piksel (maks Full HD).';

  @override
  String get imgRes720pLabel => 'HD Maks (1280 piksel)';

  @override
  String get imgRes720pDesc =>
      'Turunkan dimensi maksimal gambar menjadi 1280 piksel (HD maks).';

  @override
  String get imgRes480pLabel => 'SD Maks (854 piksel)';

  @override
  String get imgRes480pDesc =>
      'Turunkan dimensi maksimal gambar menjadi 854 piksel (SD maks).';

  @override
  String get keepMetadataImageInfoDesc =>
      'Mempertahankan EXIF ​​gambar asli & metadata kamera.';

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
