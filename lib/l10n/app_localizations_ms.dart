// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Malay (`ms`).
class AppLocalizationsMs extends AppLocalizations {
  AppLocalizationsMs([String locale = 'ms']) : super(locale);

  @override
  String get appName => 'Shrinkeo';

  @override
  String get totalSpaceSaved => 'Jumlah Ruang Dijimatkan';

  @override
  String get savedSpacePrefix => 'Dijimatkan:';

  @override
  String get supportButtonText => 'Sokong Projek';

  @override
  String get lightThemeTooltip => 'Tema Cerah';

  @override
  String get darkThemeTooltip => 'Tema Gelap';

  @override
  String get settingsTooltip => 'Tetapan';

  @override
  String get minimizeTooltip => 'Kecilkan';

  @override
  String get closeTooltip => 'Tutup';

  @override
  String get restoreTooltip => 'Pulihkan';

  @override
  String get maximizeTooltip => 'Besarkan';

  @override
  String get tabCompressionQuality => 'Pemampatan & Kualiti';

  @override
  String get tabVideoEditingTools => 'Suntingan Video & Alat';

  @override
  String get tabAudioSettings => 'Tetapan Audio';

  @override
  String get tabEngineOutput => 'Enjin & Folder Output';

  @override
  String get compressionSettingsTitle => 'Tetapan Pemampatan';

  @override
  String get resetToDefaults => 'Set Semula Asal';

  @override
  String get resetDefaultTooltip => 'Kembali ke nilai asal';

  @override
  String get modeTargetSizeTitle => 'Mod Sasaran Pemampatan';

  @override
  String get modeCrfLabel => 'Kualiti (CRF)';

  @override
  String get modeTargetSizeLabel => 'Saiz Sasaran (MB)';

  @override
  String get crfQualityTitle => 'Faktor Kualiti CRF';

  @override
  String get crfLossless => 'Tak rugi';

  @override
  String get crfHighQuality => 'Kualiti Tinggi';

  @override
  String get crfBalanced => 'Seimbang';

  @override
  String get crfHighCompression => 'Mampatan Tinggi';

  @override
  String get crfLowQuality => 'Kualiti Rendah';

  @override
  String get crfUltraCompressed => 'Ultra Mampat';

  @override
  String get targetSizeLabel => 'Saiz Fail Sasaran (MB)';

  @override
  String get targetSizeDesc => 'Mengira kadar bit untuk muat dalam had saiz.';

  @override
  String get encodingSpeedTitle => 'Kelajuan Penkodan';

  @override
  String get presetUltrafastLabel => 'Ultra Pantas';

  @override
  String get presetUltrafastDesc =>
      'Kelajuan maksimum, namun pengurangan saiz paling sedikit.';

  @override
  String get presetSuperfastLabel => 'Super Pantas';

  @override
  String get presetSuperfastDesc => 'Penkodan sangat pantas.';

  @override
  String get presetVeryfastLabel => 'Sangat Pantas';

  @override
  String get presetVeryfastDesc => 'Lebih pantas daripada purata.';

  @override
  String get presetFasterLabel => 'Lebih Pantas';

  @override
  String get presetFasterDesc => 'Kelajuan baik dan pemampatan tinggi.';

  @override
  String get presetFastLabel => 'Pantas';

  @override
  String get presetFastDesc => 'Keseimbangan terbaik antara kelajuan dan saiz.';

  @override
  String get presetMediumLabel => 'Sederhana';

  @override
  String get presetMediumDesc => 'Keseimbangan lalai.';

  @override
  String get presetSlowLabel => 'Perlahan';

  @override
  String get presetSlowDesc =>
      'Lebih perlahan tetapi saiz fail jauh lebih kecil.';

  @override
  String get presetVeryslowLabel => 'Sangat Perlahan';

  @override
  String get presetVeryslowDesc => 'Pengurangan saiz maksimum.';

  @override
  String get videoCodecTitle => 'Kodek Video';

  @override
  String get codecH264Label => 'H.264';

  @override
  String get codecH264Desc => 'Ketersesuaian maksimum dengan peranti lama.';

  @override
  String get codecH265Label => 'H.265 / HEVC';

  @override
  String get codecH265Desc => 'Kecekapan pemampatan lebih baik.';

  @override
  String get codecAv1Label => 'AV1';

  @override
  String get codecAv1Desc =>
      'Kodek generasi baru (30% lebih kecil daripada H.265).';

  @override
  String get hardwareEncoderTitle => 'Pecutan Perkakasan (GPU)';

  @override
  String get hwSoftwareLabel => 'Perisian (CPU)';

  @override
  String get hwSoftwareDesc => 'Paling perlahan tetapi ketersesuaian terbaik.';

  @override
  String get hwNvidiaLabel => 'Nvidia (NVENC)';

  @override
  String get hwNvidiaDesc => 'Penkodan sangat pantas untuk GPU Nvidia.';

  @override
  String get hwAmdLabel => 'AMD (AMF)';

  @override
  String get hwAmdDesc => 'Penkodan sangat pantas untuk GPU AMD.';

  @override
  String get hwIntelLabel => 'Intel (QSV)';

  @override
  String get hwIntelDesc => 'Penkodan sangat pantas untuk GPU Intel.';

  @override
  String get resolutionTitle => 'Resolusi Maksimum';

  @override
  String get resOriginalLabel => 'Asal';

  @override
  String get resOriginalDesc => 'Kekalkan resolusi asal.';

  @override
  String get res4kLabel => '4K';

  @override
  String get res4kDesc => 'Kurangkan sehingga max 4K.';

  @override
  String get res2kLabel => '2K';

  @override
  String get res2kDesc => 'Kurangkan sehingga max 2K.';

  @override
  String get res1080pLabel => '1080p';

  @override
  String get res1080pDesc => 'Kurangkan sehingga max 1080p Full HD.';

  @override
  String get res720pLabel => '720p';

  @override
  String get res720pDesc => 'Kurangkan sehingga max 720p HD.';

  @override
  String get res480pLabel => '480p';

  @override
  String get res480pDesc => 'Kurangkan ke 480p.';

  @override
  String get res360pLabel => '360p';

  @override
  String get res360pDesc => 'Pemampatan maksimum.';

  @override
  String get frameRateTitle => 'Kadar Bingkai (FPS)';

  @override
  String get fpsOriginalLabel => 'Asal';

  @override
  String get fpsOriginalDesc => 'FPS sama seperti sumber.';

  @override
  String get fps60Label => '60 fps';

  @override
  String get fps60Desc => 'Lancar untuk permainan atau sukan.';

  @override
  String get fps30Label => '30 fps';

  @override
  String get fps30Desc => 'Standard untuk kebanyakan video.';

  @override
  String get fps24Label => '24 fps';

  @override
  String get fps24Desc => 'Gaya sinematik.';

  @override
  String get enableVideoDenoiseTitle => 'Pembersih Hingar Video';

  @override
  String get enableVideoDenoiseDesc =>
      'Penapis 3D untuk mengurangkan bintik hingar.';

  @override
  String get exportFormatTitle => 'Format Eksport';

  @override
  String get exportVideoLabel => 'Video Standard';

  @override
  String get exportVideoDesc => 'Eksport ke MP4/MKV/MOV';

  @override
  String get exportGifLabel => 'GIF Animasi';

  @override
  String get exportGifDesc => 'Hasilkan GIF animasi berkualiti tinggi';

  @override
  String get exportMp3Label => 'Ekstrak MP3';

  @override
  String get exportMp3Desc => 'Ekstrak audio ke 320kbps MP3';

  @override
  String get exportAacLabel => 'Ekstrak AAC';

  @override
  String get exportAacDesc => 'Ekstrak audio ke AAC';

  @override
  String get exportWavLabel => 'Ekstrak WAV';

  @override
  String get exportWavDesc => 'Ekstrak audio WAV tanpa mampat';

  @override
  String get privacyScrubbingTitle => 'Privasi & GPS';

  @override
  String get keepMetadataLabel => 'Simpan Data';

  @override
  String get stripGpsExifLabel => 'Padam GPS/EXIF';

  @override
  String get stripGpsExifInfoTitle => 'Bersihkan Metadata';

  @override
  String get stripGpsExifInfoDesc => 'Memadam maklumat kamera dan lokasi GPS.';

  @override
  String get keepMetadataInfoDesc => 'Mengekalkan semua metadata asal.';

  @override
  String get autoCropBlackBarsTitle => 'Potong Jalur Hitam Auto';

  @override
  String get autoCropLabel => 'Auto Potong';

  @override
  String get autoCropActiveTitle => 'Auto Potong Aktif';

  @override
  String get autoCropActiveDesc => 'Memadam jalur hitam secara automatik.';

  @override
  String get autoCropDisabledDesc => 'Mengekalkan sempadan asal.';

  @override
  String get playbackSpeedTitle => 'Kelajuan Main Semula';

  @override
  String get speedOriginalLabel => '1.0x';

  @override
  String get speedOriginalDesc => 'Kelajuan biasa';

  @override
  String get speedSlow05Label => '0.5x Perlahan';

  @override
  String get speedSlow05Desc => 'Main separuh kelajuan';

  @override
  String get speedFast15Label => '1.5x';

  @override
  String get speedFast15Desc => '1.5 kali lebih pantas';

  @override
  String get speedFast20Label => '2.0x Pantas';

  @override
  String get speedFast20Desc => 'Dua kali kelajuan';

  @override
  String get speedTimelapse40Label => '4.0x Timelapse';

  @override
  String get speedTimelapse40Desc => 'Kelajuan 4x untuk timelapse';

  @override
  String get canvasAspectRatioTitle => 'Nisbah Aspek';

  @override
  String get aspectOriginalLabel => 'Asal';

  @override
  String get aspectOriginalDesc => 'Kekalkan nisbah asal';

  @override
  String get aspectShortsLabel => '9:16 Shorts';

  @override
  String get aspectShortsDesc => 'Untuk TikTok dan Reels';

  @override
  String get aspectSquareLabel => '1:1 Empat Segi';

  @override
  String get aspectSquareDesc => 'Untuk hantaran Instagram';

  @override
  String get aspectPortraitLabel => '4:5 Potret';

  @override
  String get aspectPortraitDesc => 'Untuk Instagram menegak';

  @override
  String get aspectWidescreenLabel => '16:9 Skrin Lebar';

  @override
  String get aspectWidescreenDesc => 'Untuk YouTube dan TV';

  @override
  String get aspectClassicLabel => '4:3 Klasik';

  @override
  String get aspectClassicDesc => 'Untuk skrin klasik';

  @override
  String get aspectCinemaLabel => '21:9 Sinema';

  @override
  String get aspectCinemaDesc => 'Untuk monitor ultrawide';

  @override
  String get aspectCustomLabel => 'Nisbah Kustom';

  @override
  String get aspectCustomDesc => 'Nisbah aspek tersuai';

  @override
  String get customRatioTooltip => 'Contoh: 16:10, 2:1';

  @override
  String get rotationFlipTitle => 'Putaran & Cermin';

  @override
  String get rotOriginalLabel => 'Asal (0°)';

  @override
  String get rotOriginalDesc => 'Kekalkan arah asal';

  @override
  String get rot90Label => '90° Kanan';

  @override
  String get rot90Desc => 'Putar 90 darjah mengikut jam';

  @override
  String get rot180Label => '180° Terbalik';

  @override
  String get rot180Desc => 'Putar terbalik';

  @override
  String get rot270Label => '270° Kiri';

  @override
  String get rot270Desc => 'Putar 90 darjah lawan jam';

  @override
  String get rotFlipHLabel => 'Cermin Horiz.';

  @override
  String get rotFlipHDesc => 'Cermin secara melintang';

  @override
  String get rotFlipVLabel => 'Cermin Vert.';

  @override
  String get rotFlipVDesc => 'Cermin secara menegak';

  @override
  String get rotCustomLabel => 'Sudut Kustom';

  @override
  String get rotCustomDesc => 'Putar dengan sudut khusus';

  @override
  String get customRotationTooltip => 'Sudut dalam darjah contoh 45';

  @override
  String get trimVideoTitle => 'Potong Video';

  @override
  String get fullVideoLabel => 'Keseluruhan Video';

  @override
  String get cutClipLabel => 'Potong Klip';

  @override
  String get trimStartLabel => 'Mula';

  @override
  String get trimEndLabel => 'Tamat';

  @override
  String get trimActiveTitle => 'Pemotongan Aktif';

  @override
  String get fullVideoDesc => 'Proses keseluruhan video tanpa memotong.';

  @override
  String get audioModeTitle => 'Mod Trek Audio';

  @override
  String get audioOriginalLabel => 'Asal';

  @override
  String get audioOriginalDesc => 'Tiada penurunan kualiti suara.';

  @override
  String get audioAac256Label => 'Kualiti Tinggi';

  @override
  String get audioAac256Desc => 'AAC 256kbps';

  @override
  String get audioAac128Label => 'Seimbang';

  @override
  String get audioAac128Desc => 'AAC 128kbps (Standard Web)';

  @override
  String get audioAac64Label => 'Kualiti Rendah';

  @override
  String get audioAac64Desc => 'AAC 64kbps untuk percakapan';

  @override
  String get audioMuteLabel => 'Bisu Audio';

  @override
  String get audioMuteDesc => 'Padam trek audio sepenuhnya.';

  @override
  String get audioNormTitle => 'Normalisasi Kelantangan';

  @override
  String get audioNormOffLabel => 'Mati';

  @override
  String get audioNormOffDesc => 'Dinamik asal.';

  @override
  String get audioNormSpeechLabel => 'Suara Manusia';

  @override
  String get audioNormSpeechDesc => 'EBU R128 untuk dialog jelas.';

  @override
  String get audioNormDynamicLabel => 'Sinema Dinamik';

  @override
  String get audioNormDynamicDesc => 'Meratakan suara perlahan dan kuat.';

  @override
  String get audioNormBoostLabel => 'Tingkatan Ringan';

  @override
  String get audioNormBoostDesc => '+3dB peningkatan kelantangan.';

  @override
  String get audioChanTitle => 'Saluran Audio';

  @override
  String get audioChanOriginalLabel => 'Asal';

  @override
  String get audioChanOriginalDesc => 'Kekalkan saluran sumber.';

  @override
  String get audioChanStereoLabel => 'Stereo (2.0)';

  @override
  String get audioChanStereoDesc => 'Ketersesuaian stereo 2 saluran.';

  @override
  String get audioChanMonoLabel => 'Mono (1.0)';

  @override
  String get audioChanMonoDesc =>
      'Saluran tunggal - 50% penjimatan saiz audio.';

  @override
  String get removeNoiseLabel => 'Padam Hingar';

  @override
  String get enableAudioDenoiseTitle => 'Padam Hingar Mikrofon';

  @override
  String get enableAudioDenoiseDesc =>
      'Penapis untuk memadam hingar latar belakang.';

  @override
  String get outputDirectoryTitle => 'Direktori Output';

  @override
  String get defaultOutputDirectory => 'Lalai (Sebelah fail asal)';

  @override
  String get selectOutputFolderTitle => 'Pilih Folder';

  @override
  String get clearOutputFolder => 'Guna lokasi lalai';

  @override
  String get changeBtn => 'Tukar';

  @override
  String get outputLocationTitle => 'Tingkah Laku Output';

  @override
  String get outputLocationUnifiedLabel => 'Satu Folder';

  @override
  String get outputLocationUnifiedDesc =>
      'Semua video mampat dalam satu folder.';

  @override
  String get outputLocationSameLabel => 'Sebelah Asal';

  @override
  String get outputLocationSameDesc =>
      'Setiap video di sebelah fail sumbernya.';

  @override
  String get fileManagementTitle => 'Pengurusan Fail';

  @override
  String get keepOriginalsLabel => 'Simpan Asal';

  @override
  String get keepOriginalsDesc => 'Biarkan fail asal tidak disentuh.';

  @override
  String get toRecycleBinLabel => 'Ke Tong Sampah';

  @override
  String get toRecycleBinDesc =>
      'Pindahkan fail asal ke tong sampah selepas memampat.';

  @override
  String get outputFormatTitle => 'Format Bekas';

  @override
  String get formatOriginalLabel => 'Asal';

  @override
  String get formatOriginalDesc => 'Kekalkan format asal.';

  @override
  String get formatMp4Label => 'MP4';

  @override
  String get formatMp4Desc => 'Ketersesuaian maksimum.';

  @override
  String get formatMkvLabel => 'MKV';

  @override
  String get formatMkvDesc => 'Sokongan pelbagai trek.';

  @override
  String get formatMovLabel => 'MOV';

  @override
  String get formatMovDesc => 'Format Apple QuickTime.';

  @override
  String get scanningFilesMsg => 'Imbas fail...';

  @override
  String get addFilesBtn => 'Tambah Fail';

  @override
  String get addFolderBtn => 'Tambah Folder';

  @override
  String get dragDropMoreMsg => 'Atau seret & lepas lebih banyak video di sini';

  @override
  String get openOutputFolderTooltip => 'Buka Folder Output';

  @override
  String get statusQueued => 'Dalam giliran';

  @override
  String get statusAnalyzing => 'Menganalisis';

  @override
  String get statusCompressing => 'Memampatkan';

  @override
  String get statusDone => 'Selesai';

  @override
  String get statusFailed => 'Gagal';

  @override
  String get statusCancelled => 'Dibatalkan';

  @override
  String get savedPrefix => 'Dijimatkan';

  @override
  String get largerSuffix => 'Lebih Besar';

  @override
  String get largerSizeWarning =>
      'Saiz akhir mungkin lebih besar daripada asal.';

  @override
  String get clearCompletedBtn => 'Padam Selesai';

  @override
  String get clearAllBtn => 'Padam Semua';

  @override
  String get stopAllBtn => 'Hentikan Semua';

  @override
  String get startCompressionBtn => 'Mula Memampat';

  @override
  String get allDoneLabel => 'Semua Selesai!';

  @override
  String get openFolderBtn => 'Buka Folder';

  @override
  String get totalEtaLabel => 'Masa Baki';

  @override
  String get totalSavedLabel => 'Jumlah Dijimatkan';

  @override
  String get videoSingle => 'video';

  @override
  String get videosPlural => 'video';

  @override
  String get releaseToAddVideosMsg => 'Lepaskan untuk menambah video';

  @override
  String get dragDropHereMsg => 'Seret & lepas fail atau folder di sini';

  @override
  String get supportedFormatsMsg => 'Menyokong MP4, MKV, MOV, AVI, WMV';

  @override
  String get selectFilesBtn => 'Pilih Fail';

  @override
  String get selectFolderBtn => 'Pilih Folder';

  @override
  String get releaseToShrinkTitle => 'Lepaskan untuk mampat segera';

  @override
  String get filesWillBeAddedDesc => 'Fail anda akan ditambahkan ke giliran.';

  @override
  String get disabledLabel => 'Nyahaktif';

  @override
  String get compressionInProgressTitle => 'Pemampatan Sedang Berjalan';

  @override
  String get confirmCloseDesc => 'Adakah anda pasti mahu menutup Shrinkeo?';

  @override
  String get keepCompressingBtn => 'Teruskan Memampat';

  @override
  String get closeAppBtn => 'Tutup Aplikasi';

  @override
  String get lockedSettingsWarning => 'Terkunci semasa memampat';

  @override
  String get updateRequiredTitle => 'Kemas Kini Diperlukan';

  @override
  String get updateRequiredDescNewVersion => 'Versi baru sedia ada.';

  @override
  String get updateRequiredDescOldVersion => 'Versi anda tidak lagi disokong.';

  @override
  String get updateNowBtn => 'Kemas Kini Sekarang';

  @override
  String get laterBtn => 'Kemudian';

  @override
  String get updateAvailableTitle => 'Kemas Kini Sedia Ada';

  @override
  String get whatsNewTitle => 'Yang Baru:';

  @override
  String get exitAppBtn => 'Keluar';

  @override
  String get retryBtn => 'Cuba Lagi';

  @override
  String get downloadFromWebsiteBtn => 'Muat Turun dari Laman Web';

  @override
  String get skipUpdateConfirmTitle => 'Langkau kemas kini?';

  @override
  String get skipUpdateConfirmDesc =>
      'Kemas kini ini mengandungi pembaikan penting.';

  @override
  String get skipUpdateCancelBtn => 'Batal';

  @override
  String get skipUpdateConfirmBtn => 'Langkau kemas kini';

  @override
  String get maintenanceTitle => 'Penyelenggaraan';

  @override
  String get maintenanceDescDefault => 'Shrinkeo kini dalam penyelenggaraan.';

  @override
  String versionAvailableMsg(String version) {
    return 'Versi $version sedia ada.';
  }

  @override
  String get hwEncoderNotSupportedTitle => 'Pecutan perkakasan tidak disokong';

  @override
  String get failedCreateFolderError => 'Gagal mencipta folder output';

  @override
  String get failedProbeDurationError => 'Gagal membaca durasi';

  @override
  String get ffmpegNotFoundGlobalError => 'FFmpeg tidak ditemui.';

  @override
  String get ffmpegMissingError => 'FFmpeg atau FFprobe hilang atau rosak.';

  @override
  String hwFallbackNotificationBody(String encoderLabel) {
    return '$encoderLabel gagal. Beralih ke CPU.';
  }

  @override
  String get failedDownloadUpdateMsg =>
      'Gagal memuat turun kemas kini. Sila cuba lagi.';

  @override
  String customRatioActiveTitle(Object ratio) {
    return 'Nisbah Kustom ($ratio)';
  }

  @override
  String customRatioActiveDesc(Object ratio) {
    return 'Kanvas berpad untuk nisbah kustom $ratio.';
  }

  @override
  String customAngleActiveTitle(Object angle) {
    return 'Sudut Kustom ($angle°)';
  }

  @override
  String customAngleActiveDesc(Object angle) {
    return 'Memutar video mengikut sudut kustom $angle°.';
  }

  @override
  String trimActiveDesc(Object end, Object start) {
    return 'Memotong klip video antara $start dan $end.';
  }

  @override
  String targetSizeLimitLabel(Object size) {
    return 'Ahad $size MB';
  }

  @override
  String get customMbSizeTooltip => 'Taip saiz MB kustom';

  @override
  String get trimTimeTooltip =>
      'Masukkan masa cth. 5 (5s), 1:30 (1m30s), atau 00:01:30';

  @override
  String get tabImageSuite => 'Suite Imej';

  @override
  String get compressionModeTitle => 'Mod Mampatan';

  @override
  String get smartAutoLabel => 'Auto Pintar';

  @override
  String get smartAutoDesc =>
      'Mengecilkan saiz fail secara automatik sebanyak ~60-80% dengan 100% kejelasan visual yang murni. Sesuai untuk pengoptimuman foto setiap hari.';

  @override
  String get maxSavingsLabel => 'Penjimatan Maks';

  @override
  String get maxSavingsDesc =>
      'Pemampatan agresif menjimatkan sehingga 85-90% saiz fail. Terbaik untuk pemesejan pantas, muat naik web dan lampiran e-mel.';

  @override
  String get ultraFidelityLabel => 'Kesetiaan Ultra';

  @override
  String get ultraFidelityDesc =>
      'Mengekalkan kesetiaan visual mentah dengan pemampatan minimum. Sesuai untuk arkib fotografi dan kerja cetakan resolusi tinggi.';

  @override
  String get targetImageFormatTitle => 'Format Imej Sasaran';

  @override
  String get dimensionResizingTitle => 'Saiz Semula Dimensi';

  @override
  String get exifCameraPrivacyTitle => 'EXIF / Privasi Kamera';

  @override
  String get stripGpsCameraInfoLabel => 'Jalur GPS & Maklumat Kamera';

  @override
  String get intentCompressOnly => 'Mampat Sahaja';

  @override
  String get intentCompressOnlyTooltip =>
      'Fokus semata-mata pada mengurangkan saiz fail (% Kualiti atau Sasaran KB/MB)';

  @override
  String get intentEditConvertOnly => 'Edit / Tukar Sahaja';

  @override
  String get intentEditConvertOnlyTooltip =>
      'Ubah saiz, putar, pangkas atau tukar format tanpa mengurangkan kualiti visual';

  @override
  String get intentCompressAndEdit => 'Mampat & Edit';

  @override
  String get intentCompressAndEditTooltip =>
      'Kawalan penuh: Edit, ubah saiz, putar DAN mampatkan saiz fail bersama-sama';

  @override
  String get imgFmtOriginalLabel => 'Format Asal';

  @override
  String get imgFmtOriginalDesc =>
      'Kekalkan format asal (Paling pantas, tiada penukaran).';

  @override
  String get imgFmtPngLabel => 'Imej PNG (.png)';

  @override
  String get imgFmtPngDesc => 'Format PNG lossless dengan sokongan ketelusan.';

  @override
  String get imgFmtJpgLabel => 'Imej JPEG (.jpg)';

  @override
  String get imgFmtJpgDesc =>
      'Format JPEG termampat standard untuk keserasian universal.';

  @override
  String get imgFmtWebpLabel => 'Imej WebP (.webp)';

  @override
  String get imgFmtWebpDesc =>
      'Format WebP moden menawarkan pemampatan unggul dan saiz kecil.';

  @override
  String get imgFmtAvifLabel => 'Imej AVIF (.avif)';

  @override
  String get imgFmtAvifDesc =>
      'Format AVIF generasi seterusnya dengan kecekapan mampatan ultra tinggi.';

  @override
  String get imgResOriginalLabel => 'Dimensi Asal';

  @override
  String get imgResOriginalDesc =>
      'Kekalkan dimensi lebar dan ketinggian imej asal.';

  @override
  String get imgRes4kLabel => '4K Maks (3840px)';

  @override
  String get imgRes4kDesc =>
      'Turunkan dimensi maks imej kepada 3840px (maks 4K).';

  @override
  String get imgRes1080pLabel => 'HD Penuh Maks (1920px)';

  @override
  String get imgRes1080pDesc =>
      'Turunkan dimensi maks imej kepada 1920px (maks HD Penuh).';

  @override
  String get imgRes720pLabel => 'HD Maks (1280px)';

  @override
  String get imgRes720pDesc =>
      'Turunkan dimensi maks imej kepada 1280px (maks HD).';

  @override
  String get imgRes480pLabel => 'SD Max (854px)';

  @override
  String get imgRes480pDesc =>
      'Turunkan dimensi maksimum imej kepada 854px (SD maks).';

  @override
  String get keepMetadataImageInfoDesc =>
      'Mengekalkan imej asal EXIF ​​​​& metadata kamera.';

  @override
  String get cleanNoiseLabel => 'Bersihkan bunyi';

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
