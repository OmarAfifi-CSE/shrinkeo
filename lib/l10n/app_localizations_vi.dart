// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Vietnamese (`vi`).
class AppLocalizationsVi extends AppLocalizations {
  AppLocalizationsVi([String locale = 'vi']) : super(locale);

  @override
  String get appName => 'Shrinkeo';

  @override
  String get totalSpaceSaved => 'Tổng dung lượng đã tiết kiệm';

  @override
  String get savedSpacePrefix => 'Đã tiết kiệm:';

  @override
  String get supportButtonText => 'Ủng hộ dự án';

  @override
  String get lightThemeTooltip => 'Giao diện Sáng';

  @override
  String get darkThemeTooltip => 'Giao diện Tối';

  @override
  String get settingsTooltip => 'Cài đặt';

  @override
  String get minimizeTooltip => 'Thu nhỏ';

  @override
  String get closeTooltip => 'Đóng';

  @override
  String get restoreTooltip => 'Khôi phục';

  @override
  String get maximizeTooltip => 'Phóngใหญ่';

  @override
  String get tabCompressionQuality => 'Nén & Chất lượng';

  @override
  String get tabVideoEditingTools => 'Chỉnh sửa Video & Công cụ';

  @override
  String get tabAudioSettings => 'Cài đặt Âm thanh';

  @override
  String get tabEngineOutput => 'Động cơ & Đầu ra';

  @override
  String get compressionSettingsTitle => 'Cài đặt Nén';

  @override
  String get resetToDefaults => 'Đặt lại mặc định';

  @override
  String get resetDefaultTooltip => 'Khôi phục giá trị ban đầu';

  @override
  String get modeTargetSizeTitle => 'Chế độ Nén Mục tiêu';

  @override
  String get modeCrfLabel => 'Chất lượng (CRF)';

  @override
  String get modeTargetSizeLabel => 'Kích thước Mục tiêu (MB)';

  @override
  String get crfQualityTitle => 'Hệ số Chất lượng CRF';

  @override
  String get crfLossless => 'không mất dữ liệu';

  @override
  String get crfHighQuality => 'Chất lượng cao';

  @override
  String get crfBalanced => 'Cân bằng';

  @override
  String get crfHighCompression => 'Nén cao';

  @override
  String get crfLowQuality => 'Chất lượng thấp';

  @override
  String get crfUltraCompressed => 'Siêu nén';

  @override
  String get targetSizeLabel => 'Kích thước Tệp Mục tiêu (MB)';

  @override
  String get targetSizeDesc =>
      'Tính toán tốc độ bít để vừa với giới hạn kích thước.';

  @override
  String get encodingSpeedTitle => 'Tốc độ Mã hóa';

  @override
  String get presetUltrafastLabel => 'Siêu nhanh';

  @override
  String get presetUltrafastDesc =>
      'Tốc độ tối đa nhưng giảm dung lượng ít nhất.';

  @override
  String get presetSuperfastLabel => 'Rất nhanh';

  @override
  String get presetSuperfastDesc => 'Mã hóa cực nhanh.';

  @override
  String get presetVeryfastLabel => 'Nhanh vừa';

  @override
  String get presetVeryfastDesc => 'Nhanh hơn trung bình.';

  @override
  String get presetFasterLabel => 'Nhanh hơn';

  @override
  String get presetFasterDesc => 'Tốc độ tốt và nén hiệu quả.';

  @override
  String get presetFastLabel => 'Nhanh';

  @override
  String get presetFastDesc => 'Cân bằng tuyệt vời giữa tốc độ và dung lượng.';

  @override
  String get presetMediumLabel => 'Trung bình';

  @override
  String get presetMediumDesc => 'Cân bằng mặc định.';

  @override
  String get presetSlowLabel => 'Chậm';

  @override
  String get presetSlowDesc => 'Chậm hơn nhưng tệp nhỏ hơn đáng kể.';

  @override
  String get presetVeryslowLabel => 'Rất chậm';

  @override
  String get presetVeryslowDesc => 'Giảm dung lượng tối đa.';

  @override
  String get videoCodecTitle => 'Codec Video';

  @override
  String get codecH264Label => 'H.264';

  @override
  String get codecH264Desc => 'Tương thích tối đa với thiết bị cũ.';

  @override
  String get codecH265Label => 'H.265 / HEVC';

  @override
  String get codecH265Desc => 'Hiệu quả nén cao hơn.';

  @override
  String get codecAv1Label => 'AV1';

  @override
  String get codecAv1Desc => 'Codec thế hệ mới (nhỏ hơn 30% so với H.265).';

  @override
  String get hardwareEncoderTitle => 'Tăng tốc Phần cứng (GPU)';

  @override
  String get hwSoftwareLabel => 'Phần mềm (CPU)';

  @override
  String get hwSoftwareDesc => 'Chậm nhất nhưng tương thích tốt nhất.';

  @override
  String get hwNvidiaLabel => 'Nvidia (NVENC)';

  @override
  String get hwNvidiaDesc => 'Mã hóa siêu nhanh cho GPU Nvidia.';

  @override
  String get hwAmdLabel => 'AMD (AMF)';

  @override
  String get hwAmdDesc => 'Mã hóa siêu nhanh cho GPU AMD.';

  @override
  String get hwIntelLabel => 'Intel (QSV)';

  @override
  String get hwIntelDesc => 'Mã hóa siêu nhanh cho GPU Intel.';

  @override
  String get resolutionTitle => 'Độ phân giải Tối đa';

  @override
  String get resOriginalLabel => 'Gốc';

  @override
  String get resOriginalDesc => 'Giữ nguyên độ phân giải gốc.';

  @override
  String get res4kLabel => '4K';

  @override
  String get res4kDesc => 'Giảm xuống tối đa 4K.';

  @override
  String get res2kLabel => '2K';

  @override
  String get res2kDesc => 'Giảm xuống tối đa 2K.';

  @override
  String get res1080pLabel => '1080p';

  @override
  String get res1080pDesc => 'Giảm xuống tối đa 1080p Full HD.';

  @override
  String get res720pLabel => '720p';

  @override
  String get res720pDesc => 'Giảm xuống tối đa 720p HD.';

  @override
  String get res480pLabel => '480p';

  @override
  String get res480pDesc => 'Giảm xuống 480p.';

  @override
  String get res360pLabel => '360p';

  @override
  String get res360pDesc => 'Nén tối đa.';

  @override
  String get frameRateTitle => 'Tốc độ Khung hình (FPS)';

  @override
  String get fpsOriginalLabel => 'Gốc';

  @override
  String get fpsOriginalDesc => 'Giữ nguyên FPS gốc.';

  @override
  String get fps60Label => '60 fps';

  @override
  String get fps60Desc => 'Mượt mà cho game hoặc thể thao.';

  @override
  String get fps30Label => '30 fps';

  @override
  String get fps30Desc => 'Chuẩn cho hầu hết video.';

  @override
  String get fps24Label => '24 fps';

  @override
  String get fps24Desc => 'Phong cách điện ảnh.';

  @override
  String get enableVideoDenoiseTitle => 'Làm sạch Nhiễu Video';

  @override
  String get enableVideoDenoiseDesc =>
      'Bộ lọc 3D giảm nhiễu hạt và tăng tỷ lệ nén.';

  @override
  String get exportFormatTitle => 'Định dạng Xuất';

  @override
  String get exportVideoLabel => 'Video Chuẩn';

  @override
  String get exportVideoDesc => 'Xuất thành tệp MP4/MKV/MOV';

  @override
  String get exportGifLabel => 'GIF Động';

  @override
  String get exportGifDesc => 'Tạo ảnh GIF động chất lượng cao';

  @override
  String get exportMp3Label => 'Trích xuất MP3';

  @override
  String get exportMp3Desc => 'Trích xuất âm thanh thành MP3 320kbps';

  @override
  String get exportAacLabel => 'Trích xuất AAC';

  @override
  String get exportAacDesc => 'Trích xuất âm thanh thành AAC';

  @override
  String get exportWavLabel => 'Trích xuất WAV';

  @override
  String get exportWavDesc => 'Trích xuất âm thanh WAV không nén';

  @override
  String get privacyScrubbingTitle => 'Bảo mật & GPS';

  @override
  String get keepMetadataLabel => 'Giữ Nguyên Dữ liệu';

  @override
  String get stripGpsExifLabel => 'Xóa GPS/EXIF';

  @override
  String get stripGpsExifInfoTitle => 'Xóa Dữ liệu Tệp';

  @override
  String get stripGpsExifInfoDesc => 'Xóa thông tin máy ảnh và vị trí GPS.';

  @override
  String get keepMetadataInfoDesc => 'Giữ lại toàn bộ dữ liệu gốc.';

  @override
  String get autoCropBlackBarsTitle => 'Tự động Cắt Viền đen';

  @override
  String get autoCropLabel => 'Tự cắt';

  @override
  String get autoCropActiveTitle => 'Tự cắt Đang bật';

  @override
  String get autoCropActiveDesc => 'Tự động loại bỏ viền đen.';

  @override
  String get autoCropDisabledDesc => 'Giữ nguyên khung hình gốc.';

  @override
  String get playbackSpeedTitle => 'Tốc độ Phát';

  @override
  String get speedOriginalLabel => '1.0x';

  @override
  String get speedOriginalDesc => 'Tốc độ bình thường';

  @override
  String get speedSlow05Label => '0.5x Chậm';

  @override
  String get speedSlow05Desc => 'Phát tốc độ một nửa';

  @override
  String get speedFast15Label => '1.5x';

  @override
  String get speedFast15Desc => 'Tăng tốc 1.5 lần';

  @override
  String get speedFast20Label => '2.0x Nhanh';

  @override
  String get speedFast20Desc => 'Tốc độ gấp đôi';

  @override
  String get speedTimelapse40Label => '4.0x Tua nhanh';

  @override
  String get speedTimelapse40Desc => 'Tốc độ 4x cho tua nhanh';

  @override
  String get canvasAspectRatioTitle => 'Tỷ lệ Khung hình';

  @override
  String get aspectOriginalLabel => 'Gốc';

  @override
  String get aspectOriginalDesc => 'Giữ tỷ lệ gốc';

  @override
  String get aspectShortsLabel => '9:16 Shorts';

  @override
  String get aspectShortsDesc => 'Cho TikTok và Reels';

  @override
  String get aspectSquareLabel => '1:1 Vuông';

  @override
  String get aspectSquareDesc => 'Cho bài đăng Instagram';

  @override
  String get aspectPortraitLabel => '4:5 Dọc';

  @override
  String get aspectPortraitDesc => 'Cho Instagram dạng dọc';

  @override
  String get aspectWidescreenLabel => '16:9 Rộng';

  @override
  String get aspectWidescreenDesc => 'Cho YouTube và TV';

  @override
  String get aspectClassicLabel => '4:3 Cổ điển';

  @override
  String get aspectClassicDesc => 'Cho màn hình cổ điển';

  @override
  String get aspectCinemaLabel => '21:9 Điện ảnh';

  @override
  String get aspectCinemaDesc => 'Cho màn hình siêu rộng';

  @override
  String get aspectCustomLabel => 'Tùy chỉnh';

  @override
  String get aspectCustomDesc => 'Tỷ lệ khung hình tùy chỉnh';

  @override
  String get customRatioTooltip => 'VD: 16:10, 2:1';

  @override
  String get rotationFlipTitle => 'Xoay & Lật';

  @override
  String get rotOriginalLabel => 'Gốc (0°)';

  @override
  String get rotOriginalDesc => 'Giữ hướng gốc';

  @override
  String get rot90Label => '90° Phải';

  @override
  String get rot90Desc => 'Xoay 90 độ theo chiều kim đồng hồ';

  @override
  String get rot180Label => '180° Ngược';

  @override
  String get rot180Desc => 'Xoay ngược đầu';

  @override
  String get rot270Label => '270° Trái';

  @override
  String get rot270Desc => 'Xoay 90 độ ngược chiều kim đồng hồ';

  @override
  String get rotFlipHLabel => 'Lật Ngang';

  @override
  String get rotFlipHDesc => 'Lật đối xứng ngang';

  @override
  String get rotFlipVLabel => 'Lật Dọc';

  @override
  String get rotFlipVDesc => 'Lật đối xứng dọc';

  @override
  String get rotCustomLabel => 'Góc Tùy chỉnh';

  @override
  String get rotCustomDesc => 'Xoay theo góc chỉ định';

  @override
  String get customRotationTooltip => 'Góc theo độ VD: 45';

  @override
  String get trimVideoTitle => 'Cắt Video';

  @override
  String get fullVideoLabel => 'Toàn bộ Video';

  @override
  String get cutClipLabel => 'Cắt Đoạn';

  @override
  String get trimStartLabel => 'Bắt đầu';

  @override
  String get trimEndLabel => 'Kết thúc';

  @override
  String get trimActiveTitle => 'Cắt Đoạn Đang bật';

  @override
  String get fullVideoDesc => 'Xử lý toàn bộ video không cắt.';

  @override
  String get audioModeTitle => 'Chế độ Luồng Âm thanh';

  @override
  String get audioOriginalLabel => 'Gốc';

  @override
  String get audioOriginalDesc => 'Không giảm chất lượng âm thanh.';

  @override
  String get audioAac256Label => 'Chất lượng Cao';

  @override
  String get audioAac256Desc => 'AAC 256kbps';

  @override
  String get audioAac128Label => 'Cân bằng';

  @override
  String get audioAac128Desc => 'AAC 128kbps (Chuẩn Web)';

  @override
  String get audioAac64Label => 'Chất lượng Thấp';

  @override
  String get audioAac64Desc => 'AAC 64kbps cho giọng nói';

  @override
  String get audioMuteLabel => 'Tắt tiếng';

  @override
  String get audioMuteDesc => 'Xóa hoàn toàn âm thanh.';

  @override
  String get audioNormTitle => 'Cân bằng Âm lượng';

  @override
  String get audioNormOffLabel => 'Tắt';

  @override
  String get audioNormOffDesc => 'Âm lượng động gốc.';

  @override
  String get audioNormSpeechLabel => 'Giọng nói';

  @override
  String get audioNormSpeechDesc => 'Chuẩn EBU R128 cho hội thoại rõ ràng.';

  @override
  String get audioNormDynamicLabel => 'Điện ảnh Động';

  @override
  String get audioNormDynamicDesc => 'Làm mượt âm thanh to nhỏ.';

  @override
  String get audioNormBoostLabel => 'Tăng nhẹ';

  @override
  String get audioNormBoostDesc => '+3dB tăng âm lượng.';

  @override
  String get audioChanTitle => 'Kênh Âm thanh';

  @override
  String get audioChanOriginalLabel => 'Gốc';

  @override
  String get audioChanOriginalDesc => 'Giữ nguyên kênh gốc.';

  @override
  String get audioChanStereoLabel => 'Stereo (2.0)';

  @override
  String get audioChanStereoDesc => 'Tương thích 2 kênh stereo.';

  @override
  String get audioChanMonoLabel => 'Mono (1.0)';

  @override
  String get audioChanMonoDesc => 'Kênh đơn - tiết kiệm 50% âm thanh.';

  @override
  String get removeNoiseLabel => 'Xóa Nhiễu';

  @override
  String get enableAudioDenoiseTitle => 'Xóa Nhiễu Mic & Quạt';

  @override
  String get enableAudioDenoiseDesc => 'Bộ lọc loại bỏ tiếng ồn nền.';

  @override
  String get outputDirectoryTitle => 'Thư mục Đầu ra';

  @override
  String get defaultOutputDirectory => 'Mặc định (Cạnh tệp gốc)';

  @override
  String get selectOutputFolderTitle => 'Chọn Thư mục';

  @override
  String get clearOutputFolder => 'Sử dụng vị trí mặc định';

  @override
  String get changeBtn => 'Thay đổi';

  @override
  String get outputLocationTitle => 'Hành vi Đầu ra';

  @override
  String get outputLocationUnifiedLabel => 'Một Thư mục';

  @override
  String get outputLocationUnifiedDesc => 'Tất cả video nén vào một thư mục.';

  @override
  String get outputLocationSameLabel => 'Cạnh Tệp Gốc';

  @override
  String get outputLocationSameDesc => 'Mỗi video lưu cạnh tệp nguồn.';

  @override
  String get fileManagementTitle => 'Quản lý Tệp';

  @override
  String get keepOriginalsLabel => 'Giữ Tệp Gốc';

  @override
  String get keepOriginalsDesc => 'Giữ nguyên tệp gốc sau khi nén.';

  @override
  String get toRecycleBinLabel => 'Vào Thùng rác';

  @override
  String get toRecycleBinDesc =>
      'Chuyển tệp gốc vào thùng rác sau khi nén thành công.';

  @override
  String get outputFormatTitle => 'Định dạng Định danh';

  @override
  String get formatOriginalLabel => 'Gốc';

  @override
  String get formatOriginalDesc => 'Giữ nguyên định dạng gốc.';

  @override
  String get formatMp4Label => 'MP4';

  @override
  String get formatMp4Desc => 'Tương thích tối đa.';

  @override
  String get formatMkvLabel => 'MKV';

  @override
  String get formatMkvDesc => 'Hỗ trợ nhiều luồng.';

  @override
  String get formatMovLabel => 'MOV';

  @override
  String get formatMovDesc => 'Định dạng Apple QuickTime.';

  @override
  String get scanningFilesMsg => 'Đang quét tệp... Vui lòng chờ.';

  @override
  String get addFilesBtn => 'Thêm Tệp';

  @override
  String get addFolderBtn => 'Thêm Thư mục';

  @override
  String get dragDropMoreMsg => 'Hoặc kéo và thả thêm tệp ở bất kỳ đâu';

  @override
  String get openOutputFolderTooltip => 'Mở Thư mục Đầu ra';

  @override
  String get statusQueued => 'Trong hàng chờ';

  @override
  String get statusAnalyzing => 'Đang phân tích';

  @override
  String get statusCompressing => 'Đang nén';

  @override
  String get statusDone => 'Hoàn thành';

  @override
  String get statusFailed => 'Thất bại';

  @override
  String get statusCancelled => 'Đã hủy';

  @override
  String get savedPrefix => 'Đã tiết kiệm';

  @override
  String get largerSuffix => 'Lớn hơn';

  @override
  String get largerSizeWarning => 'Kích thước đầu ra có thể lớn hơn gốc.';

  @override
  String get clearCompletedBtn => 'Xóa Hoàn thành';

  @override
  String get clearAllBtn => 'Xóa Tất cả';

  @override
  String get stopAllBtn => 'Dừng Tất cả';

  @override
  String get startCompressionBtn => 'Bắt đầu Nén';

  @override
  String get allDoneLabel => 'Hoàn thành Tất cả!';

  @override
  String get openFolderBtn => 'Mở Thư mục';

  @override
  String get totalEtaLabel => 'Thời gian Còn lại';

  @override
  String get totalSavedLabel => 'Tổng Tiết kiệm';

  @override
  String get videoSingle => 'video';

  @override
  String get videosPlural => 'video';

  @override
  String get fileSingle => 'tệp';

  @override
  String get filesPlural => 'tệp';

  @override
  String get releaseToAddVideosMsg => 'Thả để thêm tệp';

  @override
  String get dragDropHereMsg => 'Kéo và thả video hoặc hình ảnh vào đây';

  @override
  String get supportedFormatsMsg =>
      'Hỗ trợ MP4, MKV, MOV, AVI, WMV, WebM • PNG, JPG, WebP, AVIF và nhiều hơn';

  @override
  String get selectFilesBtn => 'Chọn Tệp';

  @override
  String get selectFolderBtn => 'Chọn Thư mục';

  @override
  String get releaseToShrinkTitle => 'Thả để nén ngay';

  @override
  String get filesWillBeAddedDesc => 'Các tệp sẽ được thêm vào hàng chờ.';

  @override
  String get disabledLabel => 'Đã tắt';

  @override
  String get compressionInProgressTitle => 'Đang Nén Video';

  @override
  String get confirmCloseDesc => 'Bạn có chắc chắn muốn đóng Shrinkeo không?';

  @override
  String get keepCompressingBtn => 'Tiếp tục Nén';

  @override
  String get closeAppBtn => 'Đóng Ứng dụng';

  @override
  String get lockedSettingsWarning => 'Đã khóa trong khi nén';

  @override
  String get updateRequiredTitle => 'Yêu cầu Cập nhật';

  @override
  String get updateRequiredDescNewVersion => 'Có phiên bản mới của Shrinkeo.';

  @override
  String get updateRequiredDescOldVersion =>
      'Phiên bản hiện tại không còn được hỗ trợ.';

  @override
  String get updateNowBtn => 'Cập nhật Ngay';

  @override
  String get laterBtn => 'Để sau';

  @override
  String get updateAvailableTitle => 'Có Cập nhật mới';

  @override
  String get whatsNewTitle => 'Có gì mới:';

  @override
  String get exitAppBtn => 'Thoát';

  @override
  String get retryBtn => 'Thử lại';

  @override
  String get downloadFromWebsiteBtn => 'Tải từ Trang web';

  @override
  String get skipUpdateConfirmTitle => 'Bỏ qua Cập nhật?';

  @override
  String get skipUpdateConfirmDesc =>
      'Bản cập nhật chứa các sửa lỗi quan trọng.';

  @override
  String get skipUpdateCancelBtn => 'Hủy';

  @override
  String get skipUpdateConfirmBtn => 'Bỏ qua Cập nhật';

  @override
  String get maintenanceTitle => 'Bảo trì Hệ thống';

  @override
  String get maintenanceDescDefault => 'Shrinkeo hiện đang bảo trì.';

  @override
  String versionAvailableMsg(String version) {
    return 'Phiên bản $version hiện đã có.';
  }

  @override
  String get hwEncoderNotSupportedTitle => 'Không hỗ trợ tăng tốc phần cứng';

  @override
  String get failedCreateFolderError => 'Tạo thư mục đầu ra thất bại';

  @override
  String get failedProbeDurationError => 'Phân tích thời lượng thất bại';

  @override
  String get ffmpegNotFoundGlobalError => 'Không tìm thấy FFmpeg.';

  @override
  String get ffmpegMissingError => 'FFmpeg hoặc FFprobe bị thiếu hoặc hỏng.';

  @override
  String hwFallbackNotificationBody(String encoderLabel) {
    return '$encoderLabel thất bại. Đã chuyển sang CPU.';
  }

  @override
  String get failedDownloadUpdateMsg =>
      'Tải bản cập nhật thất bại. Vui lòng thử lại.';

  @override
  String customRatioActiveTitle(Object ratio) {
    return 'Tỷ lệ tùy chỉnh ($ratio)';
  }

  @override
  String customRatioActiveDesc(Object ratio) {
    return 'Khung hình có viền cho tỷ lệ tùy chỉnh $ratio.';
  }

  @override
  String customAngleActiveTitle(Object angle) {
    return 'Góc tùy chỉnh ($angle°)';
  }

  @override
  String customAngleActiveDesc(Object angle) {
    return 'Xoay video theo góc tùy chỉnh $angle°.';
  }

  @override
  String trimActiveDesc(Object end, Object start) {
    return 'Cắt video giữa $start và $end.';
  }

  @override
  String targetSizeLimitLabel(Object size) {
    return 'Giới hạn $size MB';
  }

  @override
  String get customMbSizeTooltip => 'Nhập dung lượng MB tùy chỉnh';

  @override
  String get trimTimeTooltip =>
      'Nhập thời gian ví dụ 5 (5 giây), 1:30 (1 phút 30 giây), hoặc 00:01:30';

  @override
  String get tabImageSuite => 'Bộ ảnh';

  @override
  String get compressionModeTitle => 'Chế độ nén';

  @override
  String get smartAutoLabel => 'Tự động thông minh';

  @override
  String get smartAutoDesc =>
      'Tự động giảm kích thước tệp xuống ~60-80% với hình ảnh rõ ràng nguyên sơ 100%. Hoàn hảo cho việc tối ưu hóa ảnh hàng ngày.';

  @override
  String get maxSavingsLabel => 'Tiết kiệm tối đa';

  @override
  String get maxSavingsDesc =>
      'Nén mạnh mẽ tiết kiệm tới 85-90% kích thước tệp. Tốt nhất để nhắn tin nhanh, tải lên web và đính kèm email.';

  @override
  String get ultraFidelityLabel => 'Siêu trung thực';

  @override
  String get ultraFidelityDesc =>
      'Duy trì độ trung thực hình ảnh thô với độ nén tối thiểu. Lý tưởng cho việc lưu trữ ảnh và tác phẩm in có độ phân giải cao.';

  @override
  String get targetImageFormatTitle => 'Định dạng hình ảnh mục tiêu';

  @override
  String get dimensionResizingTitle => 'Thay đổi kích thước kích thước';

  @override
  String get exifCameraPrivacyTitle => 'EXIF ​​/ Quyền riêng tư của máy ảnh';

  @override
  String get stripGpsCameraInfoLabel => 'Tách thông tin GPS và camera';

  @override
  String get imgFmtOriginalLabel => 'Định dạng gốc';

  @override
  String get imgFmtOriginalDesc =>
      'Giữ nguyên định dạng gốc (Nhanh nhất, không chuyển đổi).';

  @override
  String get imgFmtPngLabel => 'Hình ảnh PNG (.png)';

  @override
  String get imgFmtPngDesc => 'Định dạng PNG lossless có hỗ trợ độ trong suốt.';

  @override
  String get imgFmtJpgLabel => 'Hình ảnh JPEG (.jpg)';

  @override
  String get imgFmtJpgDesc =>
      'Định dạng JPEG nén tiêu chuẩn để có khả năng tương thích phổ quát.';

  @override
  String get imgFmtWebpLabel => 'Hình ảnh WebP (.webp)';

  @override
  String get imgFmtWebpDesc =>
      'Định dạng WebP hiện đại cung cấp khả năng nén vượt trội và kích thước nhỏ.';

  @override
  String get imgFmtAvifLabel => 'Hình ảnh AVIF (.avif)';

  @override
  String get imgFmtAvifDesc =>
      'Định dạng AVIF thế hệ tiếp theo với hiệu suất nén cực cao.';

  @override
  String get imgResOriginalLabel => 'Kích thước ban đầu';

  @override
  String get imgResOriginalDesc =>
      'Giữ kích thước chiều rộng và chiều cao của hình ảnh gốc.';

  @override
  String get imgRes4kLabel => 'Tối đa 4K (3840px)';

  @override
  String get imgRes4kDesc =>
      'Giảm kích thước tối đa của hình ảnh xuống 3840px (tối đa 4K).';

  @override
  String get imgRes1080pLabel => 'Full HD tối đa (1920px)';

  @override
  String get imgRes1080pDesc =>
      'Giảm kích thước tối đa của hình ảnh xuống 1920px (tối đa Full HD).';

  @override
  String get imgRes720pLabel => 'HD Tối đa (1280px)';

  @override
  String get imgRes720pDesc =>
      'Giảm kích thước tối đa của hình ảnh xuống 1280px (tối đa HD).';

  @override
  String get imgRes480pLabel => 'SD tối đa (854px)';

  @override
  String get imgRes480pDesc =>
      'Giảm kích thước tối đa của hình ảnh xuống 854px (SD tối đa).';

  @override
  String get keepMetadataImageInfoDesc =>
      'Bảo tồn siêu dữ liệu máy ảnh và EXIF ​​​​hình ảnh gốc.';

  @override
  String get imageQualityModeLabel => 'Mức chất lượng';

  @override
  String get imageQualityModeDesc =>
      'Mã hóa ở mức chất lượng cố định — chất lượng cao hơn nghĩa là tệp lớn hơn.';

  @override
  String get imageTargetSizeModeLabel => 'Kích thước mục tiêu';

  @override
  String get imageTargetSizeModeDesc =>
      'Tự động tìm chất lượng cao nhất vừa trong giới hạn kích thước.';

  @override
  String get imageQualitySliderTitle => 'Chất lượng ảnh';

  @override
  String get imageTargetSizeTitle => 'Kích thước tệp mục tiêu';

  @override
  String get imageTargetSizeDesc =>
      'Mã hóa lặp lại với chất lượng giảm dần cho đến khi tệp vừa trong giới hạn. Giới hạn rất nhỏ có thể giảm chất lượng.';

  @override
  String imageTargetSizeLimitLabel(String size) {
    return 'Giới hạn $size';
  }

  @override
  String get customKbSizeTooltip => 'Nhập kích thước KB tùy chỉnh';

  @override
  String get imageProcessingFailedError => 'Xử lý ảnh thất bại';

  @override
  String get imageProcessingErrorMsg => 'Lỗi xử lý ảnh';

  @override
  String get cleanNoiseLabel => 'Làm sạch tiếng ồn';

  @override
  String get outputLargerTooltip =>
      'Kích thước đầu ra sẽ lớn hơn gốc!\nDừng lại và đặt lại về mặc định.';

  @override
  String get estimatedSizePrefix => 'Ước tính:';

  @override
  String get cancelBtnTooltip => 'Hủy';

  @override
  String get removeBtnTooltip => 'Xóa';

  @override
  String get selectLanguageTitle => 'Chọn ngôn ngữ';

  @override
  String get searchLanguageHint => 'Tìm kiếm ngôn ngữ theo tên hoặc mã...';

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
    return 'Đã nén thành công $success tệp.';
  }

  @override
  String notifyCompressionCompleteFailed(String failed) {
    return ' ($failed failed)';
  }

  @override
  String notifyOutputLargerDesc(String fileName) {
    return '$fileName is expected to be larger than the original file size. Consider cancelling and resetting settings to default.';
  }

  @override
  String get imagePreparing => 'Đang chuẩn bị ảnh';

  @override
  String get imageEncoding => 'Đang nén ảnh';

  @override
  String get imageSaving => 'Đang lưu kết quả';

  @override
  String imageTargetProgress(String size) {
    return 'Mục tiêu: $size';
  }

  @override
  String imageAttempt(int count) {
    return 'Lần thử $count';
  }

  @override
  String imageBestResult(String size) {
    return 'Kết quả tốt nhất: $size';
  }

  @override
  String queueCompleted(int done, int total) {
    return 'Đã hoàn thành $done/$total';
  }
}
