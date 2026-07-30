// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get appName => 'Shrinkeo';

  @override
  String get totalSpaceSaved => '全球已累计节省空间';

  @override
  String get savedSpacePrefix => '已节省:';

  @override
  String get supportButtonText => '支持项目';

  @override
  String get lightThemeTooltip => '浅色模式';

  @override
  String get darkThemeTooltip => '深色模式';

  @override
  String get settingsTooltip => '设置';

  @override
  String get minimizeTooltip => '最小化';

  @override
  String get closeTooltip => '关闭';

  @override
  String get restoreTooltip => '还原';

  @override
  String get maximizeTooltip => '最大化';

  @override
  String get tabCompressionQuality => '压缩与画质';

  @override
  String get tabVideoEditingTools => '视频编辑与工具';

  @override
  String get tabAudioSettings => '音频设置';

  @override
  String get tabEngineOutput => '引擎与输出';

  @override
  String get compressionSettingsTitle => '压缩参数设置';

  @override
  String get resetToDefaults => '恢复默认设置';

  @override
  String get resetDefaultTooltip => '重置为初始默认值';

  @override
  String get modeTargetSizeTitle => '压缩目标模式';

  @override
  String get modeCrfLabel => '画质优先 (CRF)';

  @override
  String get modeTargetSizeLabel => '指定文件大小 (MB)';

  @override
  String get crfQualityTitle => 'CRF 质量因子 (Constant Rate Factor)';

  @override
  String get crfLossless => '无损';

  @override
  String get crfHighQuality => '高质量';

  @override
  String get crfBalanced => '均衡';

  @override
  String get crfHighCompression => '高压缩';

  @override
  String get crfLowQuality => '低质量';

  @override
  String get crfUltraCompressed => '超压缩';

  @override
  String get targetSizeLabel => '目标文件大小 (MB)';

  @override
  String get targetSizeDesc => '自动计算码率以符合目标限制大小。';

  @override
  String get encodingSpeedTitle => '编码速度预设';

  @override
  String get presetUltrafastLabel => '极速 (Ultrafast)';

  @override
  String get presetUltrafastDesc => '编码速度最快，但压缩率最低。';

  @override
  String get presetSuperfastLabel => '超快 (Superfast)';

  @override
  String get presetSuperfastDesc => '极快的编码速度。';

  @override
  String get presetVeryfastLabel => '非常快 (Very Fast)';

  @override
  String get presetVeryfastDesc => '高于平均速度，体积适中。';

  @override
  String get presetFasterLabel => '较快 (Faster)';

  @override
  String get presetFasterDesc => '速度与压缩率良好平衡。';

  @override
  String get presetFastLabel => '快';

  @override
  String get presetFastDesc => '速度与体积的最佳推荐平衡。';

  @override
  String get presetMediumLabel => '中等 (Medium)';

  @override
  String get presetMediumDesc => '标准默认平衡方案。';

  @override
  String get presetSlowLabel => '较慢 (Slow)';

  @override
  String get presetSlowDesc => '速度较慢，但体积明显更小。';

  @override
  String get presetVeryslowLabel => '极慢 (Very Slow)';

  @override
  String get presetVeryslowDesc => '耗时最长，提供最大极限压缩。';

  @override
  String get videoCodecTitle => '视频编码器 (Codec)';

  @override
  String get codecH264Label => 'H.264';

  @override
  String get codecH264Desc => '兼容性最好，支持绝大多数老旧设备。';

  @override
  String get codecH265Label => 'H.265 / HEVC';

  @override
  String get codecH265Desc => '压缩效率更高，文件体积更小。';

  @override
  String get codecAv1Label => 'AV1';

  @override
  String get codecAv1Desc => '下一代编码技术 (比 H.265 再节省30%体积)。';

  @override
  String get hardwareEncoderTitle => '硬件加速 (GPU)';

  @override
  String get hwSoftwareLabel => '纯软件 (CPU)';

  @override
  String get hwSoftwareDesc => '速度最慢，但兼容性最高且质量最好。';

  @override
  String get hwNvidiaLabel => 'Nvidia (NVENC)';

  @override
  String get hwNvidiaDesc => '适用于 Nvidia 显卡的极速硬件编码。';

  @override
  String get hwAmdLabel => 'AMD (AMF)';

  @override
  String get hwAmdDesc => '适用于 AMD 显卡的极速硬件编码。';

  @override
  String get hwIntelLabel => 'Intel (QSV)';

  @override
  String get hwIntelDesc => '适用于 Intel 核显及独显的极速编码。';

  @override
  String get resolutionTitle => '最大分辨率';

  @override
  String get resOriginalLabel => '保持原始';

  @override
  String get resOriginalDesc => '保持视频原本的分辨率尺寸。';

  @override
  String get res4kLabel => '4K';

  @override
  String get res4kDesc => '最高降低至 4K 分辨率。';

  @override
  String get res2kLabel => '2K';

  @override
  String get res2kDesc => '最高降低至 2K 分辨率。';

  @override
  String get res1080pLabel => '1080p';

  @override
  String get res1080pDesc => '最高降低至 1080p 高清。';

  @override
  String get res720pLabel => '720p';

  @override
  String get res720pDesc => '最高降低至 720p 标清。';

  @override
  String get res480pLabel => '480p';

  @override
  String get res480pDesc => '降低至 480p DVD 级别画质。';

  @override
  String get res360pLabel => '360p';

  @override
  String get res360pDesc => '极限压缩模式。';

  @override
  String get frameRateTitle => '帧率 (FPS)';

  @override
  String get fpsOriginalLabel => '保持原始';

  @override
  String get fpsOriginalDesc => '保持原视频的帧率数值。';

  @override
  String get fps60Label => '60 fps';

  @override
  String get fps60Desc => '极度流畅，适合游戏与体育动态。';

  @override
  String get fps30Label => '30 fps';

  @override
  String get fps30Desc => '绝大多数日常视频的标准帧率。';

  @override
  String get fps24Label => '24 fps';

  @override
  String get fps24Desc => '电影级帧率，更省空间。';

  @override
  String get enableVideoDenoiseTitle => '画面噪点与降噪';

  @override
  String get enableVideoDenoiseDesc => '开启 3D 降噪滤镜，消除噪点并提升15-25%压缩率。';

  @override
  String get exportFormatTitle => '导出格式';

  @override
  String get exportVideoLabel => '标准视频';

  @override
  String get exportVideoDesc => '导出为 MP4/MKV/MOV 视频';

  @override
  String get exportGifLabel => '动图 GIF';

  @override
  String get exportGifDesc => '将视频转换为高质量 GIF 动图';

  @override
  String get exportMp3Label => '提取 MP3 音频';

  @override
  String get exportMp3Desc => '提取音频为 320kbps MP3';

  @override
  String get exportAacLabel => '提取 AAC 音频';

  @override
  String get exportAacDesc => '提取音频为高品质 AAC';

  @override
  String get exportWavLabel => '提取 WAV 无损';

  @override
  String get exportWavDesc => '提取无损原始 WAV 录音室音频';

  @override
  String get privacyScrubbingTitle => '隐私保护与 GPS';

  @override
  String get keepMetadataLabel => '保留信息';

  @override
  String get stripGpsExifLabel => '清除 GPS/EXIF';

  @override
  String get stripGpsExifInfoTitle => '抹除元数据';

  @override
  String get stripGpsExifInfoDesc => '抹除拍摄相机型号、GPS 定位信息与时间戳。';

  @override
  String get keepMetadataInfoDesc => '完整保留视频原始 EXIF 信息。';

  @override
  String get autoCropBlackBarsTitle => '自动裁剪黑边';

  @override
  String get autoCropLabel => '自动裁剪';

  @override
  String get autoCropActiveTitle => '已开启自动裁剪';

  @override
  String get autoCropActiveDesc => '自动检测并裁剪掉视频四周黑边。';

  @override
  String get autoCropDisabledDesc => '保持原始视频黑边与画面外框。';

  @override
  String get playbackSpeedTitle => '播放速度';

  @override
  String get speedOriginalLabel => '1.0x';

  @override
  String get speedOriginalDesc => '正常原始播放速度';

  @override
  String get speedSlow05Label => '0.5x 慢动作';

  @override
  String get speedSlow05Desc => '半速慢动作播放';

  @override
  String get speedFast15Label => '1.5x';

  @override
  String get speedFast15Desc => '1.5倍轻微加速';

  @override
  String get speedFast20Label => '2.0x 快速';

  @override
  String get speedFast20Desc => '2倍快速播放';

  @override
  String get speedTimelapse40Label => '4.0x 延时摄影';

  @override
  String get speedTimelapse40Desc => '4倍超快延时效果';

  @override
  String get canvasAspectRatioTitle => '画幅比例 (Aspect Ratio)';

  @override
  String get aspectOriginalLabel => '原始比例';

  @override
  String get aspectOriginalDesc => '保持视频原始宽高比例';

  @override
  String get aspectShortsLabel => '9:16 竖屏';

  @override
  String get aspectShortsDesc => '适合抖音、Reels 与 Shorts';

  @override
  String get aspectSquareLabel => '1:1 方形';

  @override
  String get aspectSquareDesc => '适合 Instagram 帖子';

  @override
  String get aspectPortraitLabel => '4:5 肖像';

  @override
  String get aspectPortraitDesc => '适合 Instagram 竖屏帖子';

  @override
  String get aspectWidescreenLabel => '16:9 宽屏';

  @override
  String get aspectWidescreenDesc => '适合 YouTube 及电视大屏';

  @override
  String get aspectClassicLabel => '4:3 经典';

  @override
  String get aspectClassicDesc => '适合复古经典显示屏';

  @override
  String get aspectCinemaLabel => '21:9 影院宽屏';

  @override
  String get aspectCinemaDesc => '适合带黑边的带状带极宽显示器';

  @override
  String get aspectCustomLabel => '自定义比例';

  @override
  String get aspectCustomDesc => '自定义填充画幅比例';

  @override
  String get customRatioTooltip => '例如: 16:10, 2:1';

  @override
  String get rotationFlipTitle => '旋转与翻转';

  @override
  String get rotOriginalLabel => '保持原始 (0°)';

  @override
  String get rotOriginalDesc => '保持原始画面方向';

  @override
  String get rot90Label => '顺时针 90°';

  @override
  String get rot90Desc => '向右旋转 90 度';

  @override
  String get rot180Label => '颠倒 180°';

  @override
  String get rot180Desc => '上下颠倒旋转 180 度';

  @override
  String get rot270Label => '逆时针 90°';

  @override
  String get rot270Desc => '向左旋转 90 度';

  @override
  String get rotFlipHLabel => '水平镜像';

  @override
  String get rotFlipHDesc => '左右水平翻转画面';

  @override
  String get rotFlipVLabel => '垂直镜像';

  @override
  String get rotFlipVDesc => '上下垂直翻转画面';

  @override
  String get rotCustomLabel => '自定义角度';

  @override
  String get rotCustomDesc => '旋转指定的自定义角度';

  @override
  String get customRotationTooltip => '输入旋转角度，如 45, 30';

  @override
  String get trimVideoTitle => '片段裁剪';

  @override
  String get fullVideoLabel => '完整视频';

  @override
  String get cutClipLabel => '裁剪片段';

  @override
  String get trimStartLabel => '起点';

  @override
  String get trimEndLabel => '终点';

  @override
  String get trimActiveTitle => '剪辑模式已开启';

  @override
  String get fullVideoDesc => '处理整个视频而不进行裁剪。';

  @override
  String get audioModeTitle => '音频处理模式';

  @override
  String get audioOriginalLabel => '保持原始';

  @override
  String get audioOriginalDesc => '保留原音频音质，无损传输。';

  @override
  String get audioAac256Label => '高品质 (256k)';

  @override
  String get audioAac256Desc => '压缩为 AAC 256kbps';

  @override
  String get audioAac128Label => '标准平衡 (128k)';

  @override
  String get audioAac128Desc => '压缩为 AAC 128kbps (网页标准)';

  @override
  String get audioAac64Label => '小体积 (64k)';

  @override
  String get audioAac64Desc => '压缩为 AAC 64kbps (适合语音人声)';

  @override
  String get audioMuteLabel => '静音处理';

  @override
  String get audioMuteDesc => '彻底移除音频轨道以节省体积。';

  @override
  String get audioNormTitle => '音量平稳化 (Normalization)';

  @override
  String get audioNormOffLabel => '关闭';

  @override
  String get audioNormOffDesc => '保持原视频动态音量。';

  @override
  String get audioNormSpeechLabel => '人声增强';

  @override
  String get audioNormSpeechDesc => 'EBU R128 标准，突出清晰对话。';

  @override
  String get audioNormDynamicLabel => '影院动态';

  @override
  String get audioNormDynamicDesc => '自动平滑忽大忽小的声音。';

  @override
  String get audioNormBoostLabel => '微幅增益';

  @override
  String get audioNormBoostDesc => '固定 +3dB 音量放大。';

  @override
  String get audioChanTitle => '声道混音 (Downmix)';

  @override
  String get audioChanOriginalLabel => '保持原始';

  @override
  String get audioChanOriginalDesc => '保留原始声道数 (立体声、5.1等)。';

  @override
  String get audioChanStereoLabel => '双声道 (2.0)';

  @override
  String get audioChanStereoDesc => '标准双声道，适配所有播放设备。';

  @override
  String get audioChanMonoLabel => '单声道 (1.0)';

  @override
  String get audioChanMonoDesc => '合并为单声道 - 再节省50%音频体积。';

  @override
  String get removeNoiseLabel => '降噪处理';

  @override
  String get enableAudioDenoiseTitle => '消除麦克风风噪与杂音';

  @override
  String get enableAudioDenoiseDesc => '消除底噪、风扇声与房间回音。';

  @override
  String get outputDirectoryTitle => '输出目录';

  @override
  String get defaultOutputDirectory => '默认目录 (保存在源文件同级目录)';

  @override
  String get selectOutputFolderTitle => '选择输出文件夹';

  @override
  String get clearOutputFolder => '清除自定义路径 (使用默认)';

  @override
  String get changeBtn => '更改';

  @override
  String get outputLocationTitle => '保存位置策略';

  @override
  String get outputLocationUnifiedLabel => '统一文件夹';

  @override
  String get outputLocationUnifiedDesc => '将所有压缩后的视频集中存储在同一个文件夹中。';

  @override
  String get outputLocationSameLabel => '源文件同级';

  @override
  String get outputLocationSameDesc => '在每个源文件旁边生成压缩结果。';

  @override
  String get fileManagementTitle => '源文件处理';

  @override
  String get keepOriginalsLabel => '保留原文件';

  @override
  String get keepOriginalsDesc => '压缩完成后完好保留原始视频文件。';

  @override
  String get toRecycleBinLabel => '移至回收站';

  @override
  String get toRecycleBinDesc => '压缩成功后自动将原始视频移入回收站。';

  @override
  String get outputFormatTitle => '封装容器格式';

  @override
  String get formatOriginalLabel => '保持原始';

  @override
  String get formatOriginalDesc => '保持原视频容器格式 (速度最快)。';

  @override
  String get formatMp4Label => 'MP4';

  @override
  String get formatMp4Desc => '通用型格式，全平台完美兼容。';

  @override
  String get formatMkvLabel => 'MKV';

  @override
  String get formatMkvDesc => '支持多音轨与字幕的高容错格式。';

  @override
  String get formatMovLabel => 'MOV';

  @override
  String get formatMovDesc => 'Apple QuickTime 高质量视频格式。';

  @override
  String get scanningFilesMsg => '正在扫描文件... 请稍候。';

  @override
  String get addFilesBtn => '添加文件';

  @override
  String get addFolderBtn => '添加文件夹';

  @override
  String get dragDropMoreMsg => '或拖拽更多视频至任意区域';

  @override
  String get openOutputFolderTooltip => '打开输出文件夹';

  @override
  String get statusQueued => '排队中';

  @override
  String get statusAnalyzing => '分析中';

  @override
  String get statusCompressing => '压缩中';

  @override
  String get statusDone => '已完成';

  @override
  String get statusFailed => '处理失败';

  @override
  String get statusCancelled => '已取消';

  @override
  String get savedPrefix => '省空间';

  @override
  String get largerSuffix => '变大';

  @override
  String get largerSizeWarning => '压缩后体积可能大于原文件，建议检查参数并重置。';

  @override
  String get clearCompletedBtn => '清除已完成';

  @override
  String get clearAllBtn => '清空全部';

  @override
  String get stopAllBtn => '停止全部';

  @override
  String get startCompressionBtn => '开始压缩';

  @override
  String get allDoneLabel => '全部完成！';

  @override
  String get openFolderBtn => '打开文件夹';

  @override
  String get totalEtaLabel => '预计剩余时间';

  @override
  String get totalSavedLabel => '累计节省';

  @override
  String get videoSingle => '个视频';

  @override
  String get videosPlural => '个视频';

  @override
  String get releaseToAddVideosMsg => '松开鼠标添加视频';

  @override
  String get dragDropHereMsg => '拖拽视频文件或文件夹至此处';

  @override
  String get supportedFormatsMsg => '完美支持 MP4, MKV, MOV, AVI, WMV';

  @override
  String get selectFilesBtn => '选择文件';

  @override
  String get selectFolderBtn => '选择文件夹';

  @override
  String get releaseToShrinkTitle => '松开鼠标立即压缩';

  @override
  String get filesWillBeAddedDesc => '您的文件将被添加至处理队列。';

  @override
  String get disabledLabel => '已禁用';

  @override
  String get compressionInProgressTitle => '正在进行视频压缩';

  @override
  String get confirmCloseDesc => '确定要关闭 Shrinkeo 吗？\n这将取消当前正在进行的压缩任务并丢失进度。';

  @override
  String get keepCompressingBtn => '继续压缩';

  @override
  String get closeAppBtn => '关闭应用';

  @override
  String get lockedSettingsWarning => '压缩进行中已锁定参数';

  @override
  String get updateRequiredTitle => '需要更新版本';

  @override
  String get updateRequiredDescNewVersion => 'Shrinkeo 已推出包含重要改进的新版本，请更新以继续使用。';

  @override
  String get updateRequiredDescOldVersion => '您当前的版本已不再受支持，请更新至最新版本。';

  @override
  String get updateNowBtn => '立即更新';

  @override
  String get laterBtn => '稍后再说';

  @override
  String get updateAvailableTitle => '发现新版本';

  @override
  String get whatsNewTitle => '更新内容:';

  @override
  String get exitAppBtn => '退出应用';

  @override
  String get retryBtn => '重试';

  @override
  String get downloadFromWebsiteBtn => '从官网下载';

  @override
  String get skipUpdateConfirmTitle => '跳过关键更新？';

  @override
  String get skipUpdateConfirmDesc => '此更新包含关键修复，强烈建议立即更新。';

  @override
  String get skipUpdateCancelBtn => '取消';

  @override
  String get skipUpdateConfirmBtn => '仍要跳过';

  @override
  String get maintenanceTitle => '系统维护中';

  @override
  String get maintenanceDescDefault => 'Shrinkeo 当前正在维护，请稍后再试。';

  @override
  String versionAvailableMsg(String version) {
    return '版本 $version 现已发布。';
  }

  @override
  String get hwEncoderNotSupportedTitle => '显卡硬件加速不支持';

  @override
  String get failedCreateFolderError => '创建输出文件夹失败';

  @override
  String get failedProbeDurationError => '读取视频时长失败';

  @override
  String get ffmpegNotFoundGlobalError => '未找到 FFmpeg 依赖组件。';

  @override
  String get ffmpegMissingError => 'FFmpeg 或 FFprobe 组件缺失或损坏。';

  @override
  String hwFallbackNotificationBody(String encoderLabel) {
    return '$encoderLabel 加速失败，已自动切换为 CPU 软件压缩。';
  }

  @override
  String get failedDownloadUpdateMsg => '下载更新失败，请重试。';

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
  String get tabImageSuite => '图像套件';

  @override
  String get compressionModeTitle => '压缩模式';

  @override
  String get smartAutoLabel => '智能自动';

  @override
  String get smartAutoDesc => '自动减少约60-80%的文件大小，保持100%清晰度。非常适合日常照片优化。';

  @override
  String get maxSavingsLabel => '最大节省';

  @override
  String get maxSavingsDesc => '强力压缩可节省高达85-90%的文件大小。非常适合快速发送和邮件附件。';

  @override
  String get ultraFidelityLabel => '超高保真';

  @override
  String get ultraFidelityDesc => '以极小压缩保留原始视觉效果。摄影归档和高清打印的理想选择。';

  @override
  String get targetImageFormatTitle => '目标图像格式';

  @override
  String get dimensionResizingTitle => '尺寸调整';

  @override
  String get exifCameraPrivacyTitle => 'EXIF / 相机隐私';

  @override
  String get stripGpsCameraInfoLabel => '清除GPS和相机信息';

  @override
  String get intentCompressOnly => '仅压缩';

  @override
  String get intentCompressOnlyTooltip => '专注于减小文件大小（质量百分比或目标 KB/MB）';

  @override
  String get intentEditConvertOnly => '仅编辑/转换';

  @override
  String get intentEditConvertOnlyTooltip => '调整大小、旋转、修剪或转换格式，而不会降低视觉质量';

  @override
  String get intentCompressAndEdit => '压缩和编辑';

  @override
  String get intentCompressAndEditTooltip => '完全控制：编辑、调整大小、旋转和压缩文件大小';

  @override
  String get imgFmtOriginalLabel => '原始格式';

  @override
  String get imgFmtOriginalDesc => '保持原始格式（最快，无需转换）。';

  @override
  String get imgFmtPngLabel => 'PNG 图像 (.png)';

  @override
  String get imgFmtPngDesc => '具有透明度支持的无损 PNG 格式。';

  @override
  String get imgFmtJpgLabel => 'JPEG 图像 (.jpg)';

  @override
  String get imgFmtJpgDesc => '标准压缩 JPEG 格式，具有通用兼容性。';

  @override
  String get imgFmtWebpLabel => 'WebP 图像 (.webp)';

  @override
  String get imgFmtWebpDesc => '现代 WebP 格式提供卓越的压缩和小尺寸。';

  @override
  String get imgFmtAvifLabel => 'AVIF 图像 (.avif)';

  @override
  String get imgFmtAvifDesc => '具有超高压缩效率的下一代 AVIF 格式。';

  @override
  String get imgResOriginalLabel => '原始尺寸';

  @override
  String get imgResOriginalDesc => '保留原始图像的宽度和高度尺寸。';

  @override
  String get imgRes4kLabel => '4K 最大 (3840 像素)';

  @override
  String get imgRes4kDesc => '将图像最大尺寸缩小至 3840 像素（最大 4K）。';

  @override
  String get imgRes1080pLabel => '全高清最大 (1920 像素)';

  @override
  String get imgRes1080pDesc => '将图像最大尺寸缩小至 1920 像素（全高清最大）。';

  @override
  String get imgRes720pLabel => '最大高清 (1280 像素)';

  @override
  String get imgRes720pDesc => '将图像最大尺寸缩小至 1280 像素（最大高清）。';

  @override
  String get imgRes480pLabel => 'SD Max (854px)';

  @override
  String get imgRes480pDesc => '将图像最大尺寸缩小至 854 像素（SD 最大）。';

  @override
  String get keepMetadataImageInfoDesc =>
      'Preserves original image EXIF & camera metadata.';

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
