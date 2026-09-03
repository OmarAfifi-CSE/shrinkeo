// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Filipino Pilipino (`fil`).
class AppLocalizationsFil extends AppLocalizations {
  AppLocalizationsFil([String locale = 'fil']) : super(locale);

  @override
  String get appName => 'Shrinkeo';

  @override
  String get totalSpaceSaved => 'Kabuuang Puwang na Na-save';

  @override
  String get savedSpacePrefix => 'Na-save:';

  @override
  String get supportButtonText => 'Support Project';

  @override
  String get lightThemeTooltip => 'Liwanag na Tema';

  @override
  String get darkThemeTooltip => 'Madilim na Tema';

  @override
  String get settingsTooltip => 'Mga Setting';

  @override
  String get minimizeTooltip => 'Paliitin';

  @override
  String get closeTooltip => 'Isara';

  @override
  String get restoreTooltip => 'Ibalik';

  @override
  String get maximizeTooltip => 'Palakihin';

  @override
  String get tabCompressionQuality => 'Kompresyon at Kalidad';

  @override
  String get tabVideoEditingTools => 'Pag-edit ng Video at Tools';

  @override
  String get tabAudioSettings => 'Mga Setting ng Audio';

  @override
  String get tabEngineOutput => 'Engine at Output Folder';

  @override
  String get compressionSettingsTitle => 'Mga Setting ng Kompresyon';

  @override
  String get resetToDefaults => 'Ibalik sa Default';

  @override
  String get resetDefaultTooltip => 'Ibalik sa orihinal na mga halaga';

  @override
  String get modeTargetSizeTitle => 'Mode ng Target ng Kompresyon';

  @override
  String get modeCrfLabel => 'Kalidad (CRF)';

  @override
  String get modeTargetSizeLabel => 'Target na Laki (MB)';

  @override
  String get crfQualityTitle => 'CRF Factor ng Kalidad';

  @override
  String get crfLossless => 'Lossless';

  @override
  String get crfHighQuality => 'Mataas na Kalidad';

  @override
  String get crfBalanced => 'Balanseng';

  @override
  String get crfHighCompression => 'Mataas na Compression';

  @override
  String get crfLowQuality => 'Mababang Kalidad';

  @override
  String get crfUltraCompressed => 'Ultra Compressed';

  @override
  String get targetSizeLabel => 'Target na Laki ng File (MB)';

  @override
  String get targetSizeDesc =>
      'Kinakalkula ang bitrate para magkasya sa limitasyon ng laki.';

  @override
  String get encodingSpeedTitle => 'Bilis ng Encoding';

  @override
  String get presetUltrafastLabel => 'Napaka-bilis (Ultrafast)';

  @override
  String get presetUltrafastDesc =>
      'Pinakamabilis, ngunit pinakamaliit na bawas sa laki.';

  @override
  String get presetSuperfastLabel => 'Super Bilis';

  @override
  String get presetSuperfastDesc => 'Napakabilis na encoding.';

  @override
  String get presetVeryfastLabel => 'Mas Bilis';

  @override
  String get presetVeryfastDesc => 'Mas mabilis kaysa karaniwan.';

  @override
  String get presetFasterLabel => 'Mabilis-bilis';

  @override
  String get presetFasterDesc => 'Magandang bilis at mahusay na kompresyon.';

  @override
  String get presetFastLabel => 'Mabilis';

  @override
  String get presetFastDesc => 'Pinakamagandang balanse ng bilis at laki.';

  @override
  String get presetMediumLabel => 'Katamtaman';

  @override
  String get presetMediumDesc => 'Default na balanse.';

  @override
  String get presetSlowLabel => 'Mabagal';

  @override
  String get presetSlowDesc => 'Mas mabagal ngunit mas maliit ang file.';

  @override
  String get presetVeryslowLabel => 'Napakabagal';

  @override
  String get presetVeryslowDesc => 'Pinakamataas na bawas sa laki.';

  @override
  String get videoCodecTitle => 'Video Codec';

  @override
  String get codecH264Label => 'H.264';

  @override
  String get codecH264Desc =>
      'Pinakamataas na pagkakapareho sa lumang aparato.';

  @override
  String get codecH265Label => 'H.265 / HEVC';

  @override
  String get codecH265Desc => 'Mas mahusay na kompresyon.';

  @override
  String get codecAv1Label => 'AV1';

  @override
  String get codecAv1Desc => 'Makabagong codec (30% mas maliit sa H.265).';

  @override
  String get hardwareEncoderTitle => 'Hardware Acceleration (GPU)';

  @override
  String get hwSoftwareLabel => 'Software (CPU)';

  @override
  String get hwSoftwareDesc => 'Pinakamabagal ngunit pinakamatugma.';

  @override
  String get hwNvidiaLabel => 'Nvidia (NVENC)';

  @override
  String get hwNvidiaDesc => 'Napakabilis na encoding para sa Nvidia GPU.';

  @override
  String get hwAmdLabel => 'AMD (AMF)';

  @override
  String get hwAmdDesc => 'Napakabilis na encoding para sa AMD GPU.';

  @override
  String get hwIntelLabel => 'Intel (QSV)';

  @override
  String get hwIntelDesc => 'Napakabilis na encoding para sa Intel GPU.';

  @override
  String get resolutionTitle => 'Pinakamataas na Resolusyon';

  @override
  String get resOriginalLabel => 'Orihinal';

  @override
  String get resOriginalDesc => 'Panatilihin ang orihinal na resolusyon.';

  @override
  String get res4kLabel => '4K';

  @override
  String get res4kDesc => 'Pababain hanggang 4K max.';

  @override
  String get res2kLabel => '2K';

  @override
  String get res2kDesc => 'Pababain hanggang 2K max.';

  @override
  String get res1080pLabel => '1080p';

  @override
  String get res1080pDesc => 'Pababain hanggang 1080p Full HD max.';

  @override
  String get res720pLabel => '720p';

  @override
  String get res720pDesc => 'Pababain hanggang 720p HD max.';

  @override
  String get res480pLabel => '480p';

  @override
  String get res480pDesc => 'Pababain sa 480p.';

  @override
  String get res360pLabel => '360p';

  @override
  String get res360pDesc => 'Pinakamataas na kompresyon.';

  @override
  String get frameRateTitle => 'Frame Rate (FPS)';

  @override
  String get fpsOriginalLabel => 'Orihinal';

  @override
  String get fpsOriginalDesc => 'Katulad ng pinagmulang FPS.';

  @override
  String get fps60Label => '60 fps';

  @override
  String get fps60Desc => 'Mabilis para sa gaming o palakasan.';

  @override
  String get fps30Label => '30 fps';

  @override
  String get fps30Desc => 'Pamantayan para sa karamihan ng video.';

  @override
  String get fps24Label => '24 fps';

  @override
  String get fps24Desc => 'Pang-sine na istilo.';

  @override
  String get enableVideoDenoiseTitle => 'Paghuhugas ng Ingay sa Video';

  @override
  String get enableVideoDenoiseDesc =>
      '3D filter para bawasan ang grain at ingay.';

  @override
  String get exportFormatTitle => 'Format ng Pag-export';

  @override
  String get exportVideoLabel => 'Karaniwang Video';

  @override
  String get exportVideoDesc => 'I-export bilang MP4/MKV/MOV';

  @override
  String get exportGifLabel => 'Animated GIF';

  @override
  String get exportGifDesc => 'Gumawa ng mataas na kalidad na GIF';

  @override
  String get exportMp3Label => 'I-extract ang MP3';

  @override
  String get exportMp3Desc => 'Kunin ang audio bilang 320kbps MP3';

  @override
  String get exportAacLabel => 'I-extract ang AAC';

  @override
  String get exportAacDesc => 'Kunin ang audio bilang AAC';

  @override
  String get exportWavLabel => 'I-extract ang WAV';

  @override
  String get exportWavDesc => 'Kunin ang hindi na-compress na WAV audio';

  @override
  String get privacyScrubbingTitle => 'Pribasya at GPS';

  @override
  String get keepMetadataLabel => 'Panatilihin ang Data';

  @override
  String get stripGpsExifLabel => 'Alisin ang GPS/EXIF';

  @override
  String get stripGpsExifInfoTitle => 'Linisin ang Metadata';

  @override
  String get stripGpsExifInfoDesc =>
      'Inaalis ang impormasyon sa camera at GPS lokasyon.';

  @override
  String get keepMetadataInfoDesc =>
      'Pinapanatili ang lahat ng orihinal na metadata.';

  @override
  String get autoCropBlackBarsTitle => 'Awtomatikong Pag-crop ng Itim na Bar';

  @override
  String get autoCropLabel => 'Auto Crop';

  @override
  String get autoCropActiveTitle => 'Bukas ang Auto Crop';

  @override
  String get autoCropActiveDesc => 'Awtomatikong inaalis ang itim na gilid.';

  @override
  String get autoCropDisabledDesc => 'Pinapanatili ang orihinal na gilid.';

  @override
  String get playbackSpeedTitle => 'Bilis ng Playback';

  @override
  String get speedOriginalLabel => '1.0x';

  @override
  String get speedOriginalDesc => 'Karaniwang bilis';

  @override
  String get speedSlow05Label => '0.5x Mabagal';

  @override
  String get speedSlow05Desc => 'I-play sa kalahating bilis';

  @override
  String get speedFast15Label => '1.5x';

  @override
  String get speedFast15Desc => '1.5 beses na mas mabilis';

  @override
  String get speedFast20Label => '2.0x Mabilis';

  @override
  String get speedFast20Desc => 'Dalawang beses ang bilis';

  @override
  String get speedTimelapse40Label => '4.0x Timelapse';

  @override
  String get speedTimelapse40Desc => '4x bilis para sa timelapse';

  @override
  String get canvasAspectRatioTitle => 'Aspect Ratio';

  @override
  String get aspectOriginalLabel => 'Orihinal';

  @override
  String get aspectOriginalDesc => 'Panatilihin ang orihinal na sukat';

  @override
  String get aspectShortsLabel => '9:16 Shorts';

  @override
  String get aspectShortsDesc => 'Para sa TikTok at Reels';

  @override
  String get aspectSquareLabel => '1:1 Square';

  @override
  String get aspectSquareDesc => 'Para sa Instagram posts';

  @override
  String get aspectPortraitLabel => '4:5 Portrait';

  @override
  String get aspectPortraitDesc => 'Para sa vertical Instagram';

  @override
  String get aspectWidescreenLabel => '16:9 Widescreen';

  @override
  String get aspectWidescreenDesc => 'Para sa YouTube at TV';

  @override
  String get aspectClassicLabel => '4:3 Classic';

  @override
  String get aspectClassicDesc => 'Para sa mga lumang screen';

  @override
  String get aspectCinemaLabel => '21:9 Cinema';

  @override
  String get aspectCinemaDesc => 'Para sa ultrawide monitors';

  @override
  String get aspectCustomLabel => 'Kustom na Ratio';

  @override
  String get aspectCustomDesc => 'Gawa mong sukat';

  @override
  String get customRatioTooltip => 'Hal: 16:10, 2:1';

  @override
  String get rotationFlipTitle => 'Pag-ikot at Pagbaliktad';

  @override
  String get rotOriginalLabel => 'Orihinal (0°)';

  @override
  String get rotOriginalDesc => 'Panatilihin ang oryentasyon';

  @override
  String get rot90Label => '90° Pakanan';

  @override
  String get rot90Desc => 'Iikot nang 90 degrees pakanan';

  @override
  String get rot180Label => '180° Baligtad';

  @override
  String get rot180Desc => 'Iikot nang pabaligtad';

  @override
  String get rot270Label => '270° Pakaliwa';

  @override
  String get rot270Desc => 'Iikot nang 90 degrees pakaliwa';

  @override
  String get rotFlipHLabel => 'Pahalang na Baligtad';

  @override
  String get rotFlipHDesc => 'I-mirror pahalang';

  @override
  String get rotFlipVLabel => 'Patayo na Baligtad';

  @override
  String get rotFlipVDesc => 'I-mirror patayo';

  @override
  String get rotCustomLabel => 'Kustom na Anggulo';

  @override
  String get rotCustomDesc => 'Iikot sa specific na anggulo';

  @override
  String get customRotationTooltip => 'Anggulo sa degrees hal. 45';

  @override
  String get trimVideoTitle => 'Pagputol ng Video';

  @override
  String get fullVideoLabel => 'Buong Video';

  @override
  String get cutClipLabel => 'Gupitin ang Klip';

  @override
  String get trimStartLabel => 'Simula';

  @override
  String get trimEndLabel => 'Wakas';

  @override
  String get trimActiveTitle => 'Bukas ang Trim';

  @override
  String get fullVideoDesc => 'Prosesuhin ang buong video nang walang putol.';

  @override
  String get audioModeTitle => 'Mode ng Audio Track';

  @override
  String get audioOriginalLabel => 'Orihinal';

  @override
  String get audioOriginalDesc => 'Walang pagbawas sa kalidad ng boses.';

  @override
  String get audioAac256Label => 'Mataas na Kalidad (256k)';

  @override
  String get audioAac256Desc => 'AAC 256kbps';

  @override
  String get audioAac128Label => 'Balanse (128k)';

  @override
  String get audioAac128Desc => 'AAC 128kbps (Pamantayan sa Web)';

  @override
  String get audioAac64Label => 'Mababang Laki (64k)';

  @override
  String get audioAac64Desc => 'AAC 64kbps para sa boses';

  @override
  String get audioMuteLabel => 'I-mute ang Audio';

  @override
  String get audioMuteDesc => 'Alisin nang tuluyan ang audio track.';

  @override
  String get audioNormTitle => 'Pagbalanse ng Lakas ng Boses';

  @override
  String get audioNormOffLabel => 'Patay';

  @override
  String get audioNormOffDesc => 'Orihinal na lakas.';

  @override
  String get audioNormSpeechLabel => 'Boses ng Tao';

  @override
  String get audioNormSpeechDesc => 'EBU R128 para sa malinaw na usapan.';

  @override
  String get audioNormDynamicLabel => 'Cinema Dynamic';

  @override
  String get audioNormDynamicDesc =>
      'Binabalanse ang mahina at malakas na boses.';

  @override
  String get audioNormBoostLabel => 'Bahagyang Pagtaas';

  @override
  String get audioNormBoostDesc => '+3dB pagtaas sa boses.';

  @override
  String get audioChanTitle => 'Audio Channels';

  @override
  String get audioChanOriginalLabel => 'Orihinal';

  @override
  String get audioChanOriginalDesc => 'Panatilihin ang orihinal na channel.';

  @override
  String get audioChanStereoLabel => 'Stereo (2.0)';

  @override
  String get audioChanStereoDesc => 'Pamantayang 2-channel stereo.';

  @override
  String get audioChanMonoLabel => 'Mono (1.0)';

  @override
  String get audioChanMonoDesc => 'Isang channel - 50% bawas sa laki ng audio.';

  @override
  String get removeNoiseLabel => 'Alisin ang Ingay';

  @override
  String get enableAudioDenoiseTitle => 'Linisin ang Ingay sa Mic';

  @override
  String get enableAudioDenoiseDesc =>
      'Filter para alisin ang ingay sa paligid.';

  @override
  String get outputDirectoryTitle => 'Output Folder';

  @override
  String get defaultOutputDirectory => 'Default (Katabi ng orihinal na file)';

  @override
  String get selectOutputFolderTitle => 'Pumili ng Folder';

  @override
  String get clearOutputFolder => 'Gamitin ang default na lokasyon';

  @override
  String get changeBtn => 'Baguhin';

  @override
  String get outputLocationTitle => 'Kilos ng Output Folder';

  @override
  String get outputLocationUnifiedLabel => 'Iisang Folder';

  @override
  String get outputLocationUnifiedDesc =>
      'Lahat ng na-compress na video ay nasa iisang folder.';

  @override
  String get outputLocationSameLabel => 'Katabi ng Orihinal';

  @override
  String get outputLocationSameDesc =>
      'Bawat video ay nasa tabi ng pinagmulang file.';

  @override
  String get fileManagementTitle => 'Pamamahala ng File';

  @override
  String get keepOriginalsLabel => 'Panatilihin ang Orihinal';

  @override
  String get keepOriginalsDesc => 'Huwag galawin ang orihinal na mga file.';

  @override
  String get toRecycleBinLabel => 'Dalhin sa Recycle Bin';

  @override
  String get toRecycleBinDesc =>
      'Ilipat sa recycle bin ang orihinal pagkatapos ma-compress.';

  @override
  String get outputFormatTitle => 'Format ng Container';

  @override
  String get formatOriginalLabel => 'Orihinal';

  @override
  String get formatOriginalDesc => 'Panatilihin ang orihinal na format.';

  @override
  String get formatMp4Label => 'MP4';

  @override
  String get formatMp4Desc => 'Pinakamataas na pagkakapareho.';

  @override
  String get formatMkvLabel => 'MKV';

  @override
  String get formatMkvDesc => 'Suporta sa maraming track.';

  @override
  String get formatMovLabel => 'MOV';

  @override
  String get formatMovDesc => 'Format ng Apple QuickTime.';

  @override
  String get scanningFilesMsg => 'Sinusuri ang mga file...';

  @override
  String get addFilesBtn => 'Magdagdag ng File';

  @override
  String get addFolderBtn => 'Magdagdag ng Folder';

  @override
  String get dragDropMoreMsg =>
      'O i-drag at i-drop ang iba pang mga file kahit saan';

  @override
  String get openOutputFolderTooltip => 'Buksan ang Output Folder';

  @override
  String get statusQueued => 'Nasa pila';

  @override
  String get statusAnalyzing => 'Sinusuri';

  @override
  String get statusCompressing => 'Kasalukuyang nire-reduce';

  @override
  String get statusDone => 'Tapos na';

  @override
  String get statusFailed => 'Pumalya';

  @override
  String get statusCancelled => 'Kanselado';

  @override
  String get savedPrefix => 'Naitipid';

  @override
  String get largerSuffix => 'Mas Malaki';

  @override
  String get largerSizeWarning =>
      'Ang resulta ay maaaring mas malaki sa orihinal.';

  @override
  String get clearCompletedBtn => 'Alisin ang Tapos Na';

  @override
  String get clearAllBtn => 'Alisin Lahat';

  @override
  String get stopAllBtn => 'Itigil Lahat';

  @override
  String get startCompressionBtn => 'Simulan ang Pag-reduce';

  @override
  String get allDoneLabel => 'Tapos Na Lahat!';

  @override
  String get openFolderBtn => 'Buksan ang Folder';

  @override
  String get totalEtaLabel => 'Natitirang Oras';

  @override
  String get totalSavedLabel => 'Kabuuang Naitipid';

  @override
  String get videoSingle => 'video';

  @override
  String get videosPlural => 'mga video';

  @override
  String get fileSingle => 'file';

  @override
  String get filesPlural => 'mga file';

  @override
  String get releaseToAddVideosMsg => 'I-bitawan para magdagdag ng mga file';

  @override
  String get dragDropHereMsg => 'I-drag at i-drop ang mga video o imahe dito';

  @override
  String get supportedFormatsMsg =>
      'Sumusuporta sa MP4, MKV, MOV, AVI, WMV, WebM • PNG, JPG, WebP, AVIF at iba pa';

  @override
  String get selectFilesBtn => 'Pumili ng mga File';

  @override
  String get selectFolderBtn => 'Pumili ng Folder';

  @override
  String get releaseToShrinkTitle => 'Bitawan para i-reduce agad';

  @override
  String get filesWillBeAddedDesc => 'Ang iyong mga file ay idadagdag sa pila.';

  @override
  String get disabledLabel => 'Naka-off';

  @override
  String get compressionInProgressTitle => 'Kasalukuyang Nire-reduce';

  @override
  String get confirmCloseDesc =>
      'Sigurado ka bang gusto mong isara ang Shrinkeo?';

  @override
  String get keepCompressingBtn => 'Ipagpatuloy ang Pag-reduce';

  @override
  String get closeAppBtn => 'Isara ang App';

  @override
  String get lockedSettingsWarning => 'Naka-lock habang nire-reduce';

  @override
  String get updateRequiredTitle => 'Kailangan ng Update';

  @override
  String get updateRequiredDescNewVersion => 'May bagong bersyon na available.';

  @override
  String get updateRequiredDescOldVersion =>
      'Ang iyong bersyon ay hindi na suportado.';

  @override
  String get updateNowBtn => 'Mag-update Ngayon';

  @override
  String get laterBtn => 'Mamaya Na';

  @override
  String get updateAvailableTitle => 'May Available na Update';

  @override
  String get whatsNewTitle => 'Mga Bagong Tampok:';

  @override
  String get exitAppBtn => 'Lumabas';

  @override
  String get retryBtn => 'Subukang Ulit';

  @override
  String get downloadFromWebsiteBtn => 'I-download sa Website';

  @override
  String get skipUpdateConfirmTitle => 'Laktawan ang update?';

  @override
  String get skipUpdateConfirmDesc =>
      'Ang update na ito ay may mahahalagang ayos.';

  @override
  String get skipUpdateCancelBtn => 'Kanselahin';

  @override
  String get skipUpdateConfirmBtn => 'Laktawan ang update';

  @override
  String get maintenanceTitle => 'Maintenance';

  @override
  String get maintenanceDescDefault =>
      'Ang Shrinkeo ay kasalukuyang nasa maintenance.';

  @override
  String versionAvailableMsg(String version) {
    return 'Ang bersyong $version ay available na.';
  }

  @override
  String get hwEncoderNotSupportedTitle =>
      'Hindi suportado ang hardware acceleration';

  @override
  String get failedCreateFolderError => 'Pumalya sa paggawa ng output folder';

  @override
  String get failedProbeDurationError => 'Pumalya sa pagbasa ng haba ng video';

  @override
  String get ffmpegNotFoundGlobalError => 'Hindi nahanap ang FFmpeg.';

  @override
  String get ffmpegMissingError => 'Nawawala o sira ang FFmpeg o FFprobe.';

  @override
  String hwFallbackNotificationBody(String encoderLabel) {
    return 'Pumalya ang $encoderLabel. Lumipat sa CPU.';
  }

  @override
  String get failedDownloadUpdateMsg =>
      'Pumalya ang pag-download ng update. Subukang ulit.';

  @override
  String customRatioActiveTitle(Object ratio) {
    return 'Kustom na Proposyon ($ratio)';
  }

  @override
  String customRatioActiveDesc(Object ratio) {
    return 'May pad na canvas para sa kustom na $ratio proposyon.';
  }

  @override
  String customAngleActiveTitle(Object angle) {
    return 'Kustom na Anggulo ($angle°)';
  }

  @override
  String customAngleActiveDesc(Object angle) {
    return 'Pina-ikot ang video sa kustom na $angle° anggulo.';
  }

  @override
  String trimActiveDesc(Object end, Object start) {
    return 'Cuts video clip sa pagitan ng $start at $end.';
  }

  @override
  String targetSizeLimitLabel(Object size) {
    return 'Limit na $size MB';
  }

  @override
  String get customMbSizeTooltip => 'I-type ang kustom na laki ng MB';

  @override
  String get trimTimeTooltip =>
      'Ipasok ang oras hal. 5 (5s), 1:30 (1m30s), o 00:01:30';

  @override
  String get tabImageSuite => 'Image Suite';

  @override
  String get compressionModeTitle => 'Compression Mode';

  @override
  String get smartAutoLabel => 'Smart Auto';

  @override
  String get smartAutoDesc =>
      'Awtomatikong binabawasan ang laki ng file ng ~60-80% na may 100% malinis na visual na kalinawan. Perpekto para sa pang-araw-araw na pag-optimize ng larawan.';

  @override
  String get maxSavingsLabel => 'Pinakamataas na Savings';

  @override
  String get maxSavingsDesc =>
      'Ang agresibong compression ay nagse-save ng hanggang 85-90% na laki ng file. Pinakamahusay para sa mabilis na pagmemensahe, pag-upload sa web, at mga attachment sa email.';

  @override
  String get ultraFidelityLabel => 'Ultra Fidelity';

  @override
  String get ultraFidelityDesc =>
      'Pinapanatili ang hilaw na visual fidelity na may kaunting compression. Tamang-tama para sa mga archive ng photography at high-res na pag-print.';

  @override
  String get targetImageFormatTitle => 'Target na Format ng Larawan';

  @override
  String get dimensionResizingTitle => 'Pagbabago ng Dimensyon';

  @override
  String get exifCameraPrivacyTitle => 'EXIF / Privacy ng Camera';

  @override
  String get stripGpsCameraInfoLabel =>
      'I-strip ang GPS at Impormasyon ng Camera';

  @override
  String get imgFmtOriginalLabel => 'Orihinal na Format';

  @override
  String get imgFmtOriginalDesc =>
      'Panatilihin ang orihinal na format (Pinakamabilis, walang conversion).';

  @override
  String get imgFmtPngLabel => 'PNG Larawan (.png)';

  @override
  String get imgFmtPngDesc =>
      'Lossless PNG na format na may suporta sa transparency.';

  @override
  String get imgFmtJpgLabel => 'JPEG na Larawan (.jpg)';

  @override
  String get imgFmtJpgDesc =>
      'Standard compressed JPEG format para sa unibersal na compatibility.';

  @override
  String get imgFmtWebpLabel => 'Larawan ng WebP (.webp)';

  @override
  String get imgFmtWebpDesc =>
      'Modernong WebP format na nag-aalok ng superior compression at maliit na sukat.';

  @override
  String get imgFmtAvifLabel => 'AVIF Image (.avif)';

  @override
  String get imgFmtAvifDesc =>
      'Next-gen na AVIF na format na may napakataas na kahusayan sa compression.';

  @override
  String get imgResOriginalLabel => 'Mga Orihinal na Dimensyon';

  @override
  String get imgResOriginalDesc =>
      'Panatilihin ang orihinal na sukat ng lapad at taas ng larawan.';

  @override
  String get imgRes4kLabel => '4K Max (3840px)';

  @override
  String get imgRes4kDesc =>
      'Pababain ang max na dimensyon ng larawan sa 3840px (4K max).';

  @override
  String get imgRes1080pLabel => 'Full HD Max (1920px)';

  @override
  String get imgRes1080pDesc =>
      'I-scale pababa ang max na dimensyon ng larawan sa 1920px (Full HD max).';

  @override
  String get imgRes720pLabel => 'HD Max (1280px)';

  @override
  String get imgRes720pDesc =>
      'Pababain ang max na dimensyon ng larawan sa 1280px (HD max).';

  @override
  String get imgRes480pLabel => 'SD Max (854px)';

  @override
  String get imgRes480pDesc =>
      'Pababain ang max na dimensyon ng larawan sa 854px (SD max).';

  @override
  String get keepMetadataImageInfoDesc =>
      'Pinapanatili ang orihinal na larawang EXIF ​​at metadata ng camera.';

  @override
  String get imageQualityModeLabel => 'Antas ng Kalidad';

  @override
  String get imageQualityModeDesc =>
      'Nag-e-encode sa fixed na antas ng kalidad — mas mataas na kalidad, mas malalaking file.';

  @override
  String get imageTargetSizeModeLabel => 'Target na Laki';

  @override
  String get imageTargetSizeModeDesc =>
      'Awtomatikong hinahanap ang pinakamataas na kalidad na kasya sa limitasyon ng laki.';

  @override
  String get imageQualitySliderTitle => 'Kalidad ng Imahe';

  @override
  String get imageTargetSizeTitle => 'Target na Laki ng File';

  @override
  String get imageTargetSizeDesc =>
      'Paulit-ulit na nag-e-encode na pababang kalidad hanggang pumasa ang file sa limit. Napakaliit na limit ay maaaring magpababa ng kalidad.';

  @override
  String imageTargetSizeLimitLabel(String size) {
    return 'Limitasyon $size';
  }

  @override
  String get customKbSizeTooltip => 'Mag-type ng custom na laki sa KB';

  @override
  String get imageProcessingFailedError => 'Nabigo ang pagproseso ng imahe';

  @override
  String get imageProcessingErrorMsg => 'Error sa pagproseso ng imahe';

  @override
  String get cleanNoiseLabel => 'Linisin ang ingay';

  @override
  String get outputLargerTooltip =>
      'Ang output ay magiging mas malaki kaysa sa orihinal!\nHuminto at subukang I-reset sa Mga Default.';

  @override
  String get estimatedSizePrefix => 'Est:';

  @override
  String get cancelBtnTooltip => 'Kanselahin';

  @override
  String get removeBtnTooltip => 'Alisin';

  @override
  String get selectLanguageTitle => 'Piliin ang Wika';

  @override
  String get searchLanguageHint =>
      'Maghanap ng wika ayon sa pangalan o code...';

  @override
  String get noLanguagesMatchSearch =>
      'Walang mga wikang tumutugma sa iyong paghahanap.';

  @override
  String get languageTooltip => 'Wika';

  @override
  String get notifyCompressionCompleteTitle =>
      'Kumpleto na ang Shrinkeo Compression';

  @override
  String get notifyOutputLargerTitle =>
      'Mas Malaki ang Output kaysa sa Orihinal';

  @override
  String languagesCountLabel(String count) {
    return '$count Wika';
  }

  @override
  String notifyCompressionCompleteSuccess(String success) {
    return 'Matagumpay na na-compress ang $success na file.';
  }

  @override
  String notifyCompressionCompleteFailed(String failed) {
    return '($failed ang nabigo)';
  }

  @override
  String notifyOutputLargerDesc(String fileName) {
    return '$fileName ay inaasahang mas malaki kaysa sa orihinal na laki ng file. Pag-isipang kanselahin at i-reset ang mga setting sa default.';
  }
}
