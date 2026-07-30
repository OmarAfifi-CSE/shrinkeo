// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Thai (`th`).
class AppLocalizationsTh extends AppLocalizations {
  AppLocalizationsTh([String locale = 'th']) : super(locale);

  @override
  String get appName => 'Shrinkeo';

  @override
  String get totalSpaceSaved => 'พื้นที่ที่ประหยัดได้ทั้งหมด';

  @override
  String get savedSpacePrefix => 'ประหยัดไป:';

  @override
  String get supportButtonText => 'สนับสนุนโครงการ';

  @override
  String get lightThemeTooltip => 'โหมดสว่าง';

  @override
  String get darkThemeTooltip => 'โหมดมืด';

  @override
  String get settingsTooltip => 'การตั้งค่า';

  @override
  String get minimizeTooltip => 'ย่อหน้าต่าง';

  @override
  String get closeTooltip => 'ปิด';

  @override
  String get restoreTooltip => 'คืนค่า';

  @override
  String get maximizeTooltip => 'ขยายเต็มจอ';

  @override
  String get tabCompressionQuality => 'การบีบอัด & คุณภาพ';

  @override
  String get tabVideoEditingTools => 'ตัดต่อวิดีโอ & เครื่องมือ';

  @override
  String get tabAudioSettings => 'การตั้งค่าเสียง';

  @override
  String get tabEngineOutput => 'เอนจิน & โฟลเดอร์ปลายทาง';

  @override
  String get compressionSettingsTitle => 'การตั้งค่าการบีบอัด';

  @override
  String get resetToDefaults => 'คืนค่าเริ่มต้น';

  @override
  String get resetDefaultTooltip => 'คืนค่าเริ่มต้นทั้งหมด';

  @override
  String get modeTargetSizeTitle => 'โหมดเป้าหมายการบีบอัด';

  @override
  String get modeCrfLabel => 'คุณภาพ (CRF)';

  @override
  String get modeTargetSizeLabel => 'ขนาดที่ต้องการ (MB)';

  @override
  String get crfQualityTitle => 'ค่าปัจจัยคุณภาพ CRF';

  @override
  String get crfLossless => 'ไม่มีการสูญเสีย';

  @override
  String get crfHighQuality => 'คุณภาพสูง';

  @override
  String get crfBalanced => 'สมดุล';

  @override
  String get crfHighCompression => 'แรงอัดสูง';

  @override
  String get crfLowQuality => 'คุณภาพต่ำ';

  @override
  String get crfUltraCompressed => 'อัลตร้าบีบอัด';

  @override
  String get targetSizeLabel => 'ขนาดไฟล์ที่ต้องการ (MB)';

  @override
  String get targetSizeDesc => 'คำนวณบิตเรตเพื่อให้พอดีกับขนาดที่กำหนด';

  @override
  String get encodingSpeedTitle => 'ความเร็วการเข้ารหัส';

  @override
  String get presetUltrafastLabel => 'เร็วที่สุด (Ultrafast)';

  @override
  String get presetUltrafastDesc =>
      'ความเร็วสูงสุด แต่ประหยัดพื้นที่ได้น้อยที่สุด';

  @override
  String get presetSuperfastLabel => 'เร็วมาก (Superfast)';

  @override
  String get presetSuperfastDesc => 'เข้ารหัสรวดเร็วมาก';

  @override
  String get presetVeryfastLabel => 'เร็วพอประมาณ (Very Fast)';

  @override
  String get presetVeryfastDesc => 'เร็วกว่าค่าเฉลี่ย';

  @override
  String get presetFasterLabel => 'เร็วกว่า (Faster)';

  @override
  String get presetFasterDesc => 'ความเร็วดีและบีบอัดได้เยี่ยม';

  @override
  String get presetFastLabel => 'เร็ว';

  @override
  String get presetFastDesc => 'สมดุลที่ดีที่สุดระหว่างความเร็วและขนาดไฟล์';

  @override
  String get presetMediumLabel => 'ปานกลาง (Medium)';

  @override
  String get presetMediumDesc => 'ความสมดุลมาตรฐาน';

  @override
  String get presetSlowLabel => 'ช้า (Slow)';

  @override
  String get presetSlowDesc => 'ช้าลง แต่ไฟล์มีขนาดเล็กอย่างเห็นได้ชัด';

  @override
  String get presetVeryslowLabel => 'ช้ามาก (Very Slow)';

  @override
  String get presetVeryslowDesc => 'ลดขนาดไฟล์ลงให้มากที่สุด';

  @override
  String get videoCodecTitle => 'ตัวเข้ารหัสวิดีโอ (Codec)';

  @override
  String get codecH264Label => 'H.264';

  @override
  String get codecH264Desc => 'รองรับอุปกรณ์และเบราว์เซอร์เก่าได้ดีที่สุด';

  @override
  String get codecH265Label => 'H.265 / HEVC';

  @override
  String get codecH265Desc => 'ประสิทธิภาพการบีบอัดที่ดีกว่า';

  @override
  String get codecAv1Label => 'AV1';

  @override
  String get codecAv1Desc =>
      'ตัวเข้ารหัสรุ่นใหม่ (เล็กลง 30% เมื่อเทียบกับ H.265)';

  @override
  String get hardwareEncoderTitle => 'การเร่งด้วยฮาร์ดแวร์ (GPU)';

  @override
  String get hwSoftwareLabel => 'ซอฟต์แวร์ (CPU)';

  @override
  String get hwSoftwareDesc => 'ช้าที่สุด แต่รองรับได้ดีที่สุด';

  @override
  String get hwNvidiaLabel => 'Nvidia (NVENC)';

  @override
  String get hwNvidiaDesc => 'เข้ารหัสอย่างรวดเร็วสำหรับ GPU Nvidia';

  @override
  String get hwAmdLabel => 'AMD (AMF)';

  @override
  String get hwAmdDesc => 'เข้ารหัสอย่างรวดเร็วสำหรับ GPU AMD';

  @override
  String get hwIntelLabel => 'Intel (QSV)';

  @override
  String get hwIntelDesc => 'เข้ารหัสอย่างรวดเร็วสำหรับ GPU Intel';

  @override
  String get resolutionTitle => 'ความละเอียดสูงสุด';

  @override
  String get resOriginalLabel => 'ต้นฉบับ';

  @override
  String get resOriginalDesc => 'คงความละเอียดต้นฉบับไว้';

  @override
  String get res4kLabel => '4K';

  @override
  String get res4kDesc => 'ลดความละเอียดสูงสุดไม่เกิน 4K';

  @override
  String get res2kLabel => '2K';

  @override
  String get res2kDesc => 'ลดความละเอียดสูงสุดไม่เกิน 2K';

  @override
  String get res1080pLabel => '1080p';

  @override
  String get res1080pDesc => 'ลดความละเอียดสูงสุดไม่เกิน 1080p Full HD';

  @override
  String get res720pLabel => '720p';

  @override
  String get res720pDesc => 'ลดความละเอียดสูงสุดไม่เกิน 720p HD';

  @override
  String get res480pLabel => '480p';

  @override
  String get res480pDesc => 'ลดความละเอียดเป็น 480p';

  @override
  String get res360pLabel => '360p';

  @override
  String get res360pDesc => 'บีบอัดสูงสุด';

  @override
  String get frameRateTitle => 'เฟรมเรต (FPS)';

  @override
  String get fpsOriginalLabel => 'ต้นฉบับ';

  @override
  String get fpsOriginalDesc => 'ใช้จำนวนเฟรมเรตเดียวกับต้นฉบับ';

  @override
  String get fps60Label => '60 fps';

  @override
  String get fps60Desc => 'ลื่นไหลเหมาะสำหรับเกมหรือกีฬา';

  @override
  String get fps30Label => '30 fps';

  @override
  String get fps30Desc => 'มาตรฐานสำหรับวิดีโอทั่วไป';

  @override
  String get fps24Label => '24 fps';

  @override
  String get fps24Desc => 'อารมณ์แบบภาพยนตร์';

  @override
  String get enableVideoDenoiseTitle => 'ลดสัญญาณรบกวนในวิดีโอ';

  @override
  String get enableVideoDenoiseDesc => 'ตัวกรอง 3D เพื่อลดสัญญาณรบกวน';

  @override
  String get exportFormatTitle => 'รูปแบบไฟล์ส่งออก';

  @override
  String get exportVideoLabel => 'วิดีโอมาตรฐาน';

  @override
  String get exportVideoDesc => 'ส่งออกเป็นไฟล์ MP4/MKV/MOV';

  @override
  String get exportGifLabel => 'ภาพเคลื่อนไหว GIF';

  @override
  String get exportGifDesc => 'สร้างภาพเคลื่อนไหว GIF คุณภาพสูง';

  @override
  String get exportMp3Label => 'แยกไฟล์ MP3';

  @override
  String get exportMp3Desc => 'แยกเสียงเป็นไฟล์ MP3 320kbps';

  @override
  String get exportAacLabel => 'แยกไฟล์ AAC';

  @override
  String get exportAacDesc => 'แยกเสียงเป็นไฟล์ AAC';

  @override
  String get exportWavLabel => 'แยกไฟล์ WAV';

  @override
  String get exportWavDesc => 'แยกเสียงเป็น WAV แบบไม่บีบอัด';

  @override
  String get privacyScrubbingTitle => 'ความเป็นส่วนตัว & GPS';

  @override
  String get keepMetadataLabel => 'เก็บข้อมูลไว้';

  @override
  String get stripGpsExifLabel => 'ลบ GPS/EXIF';

  @override
  String get stripGpsExifInfoTitle => 'ลบข้อมูลเมทาดาตา';

  @override
  String get stripGpsExifInfoDesc => 'ลบข้อมูลกล้องและพิกัดตำแหน่ง GPS';

  @override
  String get keepMetadataInfoDesc => 'เก็บข้อมูลเมทาดาตาต้นฉบับทั้งหมดไว้';

  @override
  String get autoCropBlackBarsTitle => 'ครอบตัดขอบดำให้อัตโนมัติ';

  @override
  String get autoCropLabel => 'ครอบตัดอัตโนมัติ';

  @override
  String get autoCropActiveTitle => 'ครอบตัดอัตโนมัติทำงานอยู่';

  @override
  String get autoCropActiveDesc => 'ลบแถบขอบสีดำรอบวิดีโอให้อัตโนมัติ';

  @override
  String get autoCropDisabledDesc => 'คงขนาดขอบวิดีโอต้นฉบับไว้';

  @override
  String get playbackSpeedTitle => 'ความเร็วการเล่น';

  @override
  String get speedOriginalLabel => '1.0x';

  @override
  String get speedOriginalDesc => 'ความเร็วปกติ';

  @override
  String get speedSlow05Label => '0.5x ช้า';

  @override
  String get speedSlow05Desc => 'เล่นด้วยความเร็วครึ่งเดียว';

  @override
  String get speedFast15Label => '1.5x';

  @override
  String get speedFast15Desc => 'เร็วขึ้น 1.5 เท่า';

  @override
  String get speedFast20Label => '2.0x เร็ว';

  @override
  String get speedFast20Desc => 'ความเร็วเป็น 2 เท่า';

  @override
  String get speedTimelapse40Label => '4.0x ไทม์แลปส์';

  @override
  String get speedTimelapse40Desc => 'ความเร็ว 4 เท่าสำหรับไทม์แลปส์';

  @override
  String get canvasAspectRatioTitle => 'อัตราส่วนภาพ';

  @override
  String get aspectOriginalLabel => 'ต้นฉบับ';

  @override
  String get aspectOriginalDesc => 'คงอัตราส่วนภาพต้นฉบับไว้';

  @override
  String get aspectShortsLabel => '9:16 Shorts';

  @override
  String get aspectShortsDesc => 'สำหรับ TikTok และ Reels';

  @override
  String get aspectSquareLabel => '1:1 สี่เหลี่ยมจัตุรัส';

  @override
  String get aspectSquareDesc => 'สำหรับโพสต์ Instagram';

  @override
  String get aspectPortraitLabel => '4:5 แนวตั้ง';

  @override
  String get aspectPortraitDesc => 'สำหรับวิดีโอแนวตั้ง Instagram';

  @override
  String get aspectWidescreenLabel => '16:9 จอกว้าง';

  @override
  String get aspectWidescreenDesc => 'สำหรับ YouTube และทีวี';

  @override
  String get aspectClassicLabel => '4:3 คลาสสิก';

  @override
  String get aspectClassicDesc => 'สำหรับหน้าจอแบบดั้งเดิม';

  @override
  String get aspectCinemaLabel => '21:9 ภาพยนตร์';

  @override
  String get aspectCinemaDesc => 'สำหรับจอภาพอัลตร้าไวด์';

  @override
  String get aspectCustomLabel => 'กำหนดเอง';

  @override
  String get aspectCustomDesc => 'กำหนดอัตราส่วนภาพเอง';

  @override
  String get customRatioTooltip => 'เช่น: 16:10, 2:1';

  @override
  String get rotationFlipTitle => 'การหมุน & กลับด้าน';

  @override
  String get rotOriginalLabel => 'ต้นฉบับ (0°)';

  @override
  String get rotOriginalDesc => 'คงทิศทางเดิมไว้';

  @override
  String get rot90Label => '90° หมุนขวา';

  @override
  String get rot90Desc => 'หมุนตามเข็มนาฬิกา 90 องศา';

  @override
  String get rot180Label => '180° กลับหัว';

  @override
  String get rot180Desc => 'หมุนกลับหัว 180 องศา';

  @override
  String get rot270Label => '270° หมุนซ้าย';

  @override
  String get rot270Desc => 'หมุนทวนเข็มนาฬิกา 90 องศา';

  @override
  String get rotFlipHLabel => 'กลับด้านแนวนอน';

  @override
  String get rotFlipHDesc => 'พลิกภาพแบบกระจกแนวนอน';

  @override
  String get rotFlipVLabel => 'กลับด้านแนวตั้ง';

  @override
  String get rotFlipVDesc => 'พลิกภาพแบบกระจกแนวตั้ง';

  @override
  String get rotCustomLabel => 'มุมกำหนดเอง';

  @override
  String get rotCustomDesc => 'หมุนตามมุมที่กำหนด';

  @override
  String get customRotationTooltip => 'ระบุมุมเป็นองศา เช่น 45';

  @override
  String get trimVideoTitle => 'ตัดความยาววิดีโอ';

  @override
  String get fullVideoLabel => 'วิดีโอเต็ม';

  @override
  String get cutClipLabel => 'ตัดช่วงวิดีโอ';

  @override
  String get trimStartLabel => 'จุดเริ่ม';

  @override
  String get trimEndLabel => 'จุดสิ้นสุด';

  @override
  String get trimActiveTitle => 'กำลังเปิดใช้งานการตัดช่วง';

  @override
  String get fullVideoDesc => 'ประมวลผลวิดีโอทั้งหมดโดยไม่ตัด';

  @override
  String get audioModeTitle => 'โหมดแทร็กเสียง';

  @override
  String get audioOriginalLabel => 'ต้นฉบับ';

  @override
  String get audioOriginalDesc => 'ไม่เสียคุณภาพเสียง';

  @override
  String get audioAac256Label => 'คุณภาพสูง';

  @override
  String get audioAac256Desc => 'AAC 256kbps';

  @override
  String get audioAac128Label => 'สมดุล';

  @override
  String get audioAac128Desc => 'AAC 128kbps (มาตรฐานเว็บ)';

  @override
  String get audioAac64Label => 'คุณภาพต่ำ';

  @override
  String get audioAac64Desc => 'AAC 64kbps เหมาะสำหรับเสียงพูด';

  @override
  String get audioMuteLabel => 'ปิดเสียง';

  @override
  String get audioMuteDesc => 'ลบแทร็กเสียงออกทั้งหมด';

  @override
  String get audioNormTitle => 'ปรับระดับความดังเสียง (Normalization)';

  @override
  String get audioNormOffLabel => 'ปิด';

  @override
  String get audioNormOffDesc => 'ระดับความดังตามต้นฉบับ';

  @override
  String get audioNormSpeechLabel => 'เสียงพูดมนุษย์';

  @override
  String get audioNormSpeechDesc => 'มาตรฐาน EBU R128 เพื่อเสียงพูดที่ชัดเจน';

  @override
  String get audioNormDynamicLabel => 'เสียงภาพยนตร์';

  @override
  String get audioNormDynamicDesc => 'ปรับสมดุลเสียงเบาและเสียงดัง';

  @override
  String get audioNormBoostLabel => 'เพิ่มเสียงเล็กน้อย';

  @override
  String get audioNormBoostDesc => 'เพิ่มระดับความดัง +3dB';

  @override
  String get audioChanTitle => 'ช่องสัญญาณเสียง';

  @override
  String get audioChanOriginalLabel => 'ต้นฉบับ';

  @override
  String get audioChanOriginalDesc => 'คงช่องสัญญาณเสียงเดิมไว้';

  @override
  String get audioChanStereoLabel => 'สเตอริโอ (2.0)';

  @override
  String get audioChanStereoDesc => 'ระบบเสียงสเตอริโอ 2 ช่อง';

  @override
  String get audioChanMonoLabel => 'โมโน (1.0)';

  @override
  String get audioChanMonoDesc => 'รวมเป็นช่องเดียว - ประหยัดขนาดเสียงได้ 50%';

  @override
  String get removeNoiseLabel => 'ลบเสียงรบกวน';

  @override
  String get enableAudioDenoiseTitle => 'ลบเสียงรบกวนไมค์ & พัดลม';

  @override
  String get enableAudioDenoiseDesc => 'ตัวกรองเพื่อลบเสียงรบกวนเบื้องหลัง';

  @override
  String get outputDirectoryTitle => 'โฟลเดอร์ปลายทาง';

  @override
  String get defaultOutputDirectory => 'ค่าเริ่มต้น (ข้างไฟล์ต้นฉบับ)';

  @override
  String get selectOutputFolderTitle => 'เลือกโฟลเดอร์';

  @override
  String get clearOutputFolder => 'ใช้ตำแหน่งค่าเริ่มต้น';

  @override
  String get changeBtn => 'เปลี่ยน';

  @override
  String get outputLocationTitle => 'รูปแบบโฟลเดอร์บันทึก';

  @override
  String get outputLocationUnifiedLabel => 'โฟลเดอร์เดียวรวม';

  @override
  String get outputLocationUnifiedDesc =>
      'บันทึกวิดีโอที่บีบอัดไว้ในโฟลเดอร์เดียวกันทั้งหมด';

  @override
  String get outputLocationSameLabel => 'ข้างไฟล์ต้นฉบับ';

  @override
  String get outputLocationSameDesc =>
      'บันทึกไว้ข้างๆ ไฟล์วิดีโอต้นฉบับแต่ละไฟล์';

  @override
  String get fileManagementTitle => 'การจัดการไฟล์ต้นฉบับ';

  @override
  String get keepOriginalsLabel => 'เก็บไฟล์ต้นฉบับไว้';

  @override
  String get keepOriginalsDesc => 'ไม่เปลี่ยนไฟล์วิดีโอต้นฉบับหลังบีบอัดเสร็จ';

  @override
  String get toRecycleBinLabel => 'ย้ายไปถังขยะ';

  @override
  String get toRecycleBinDesc =>
      'ย้ายไฟล์ต้นฉบับไปถังขยะอัตโนมัติเมื่อบีบอัดสำเร็จ';

  @override
  String get outputFormatTitle => 'ฟอร์แมตคอนเทนเนอร์';

  @override
  String get formatOriginalLabel => 'ต้นฉบับ';

  @override
  String get formatOriginalDesc => 'คงนามสกุลไฟล์เดิมไว้';

  @override
  String get formatMp4Label => 'MP4';

  @override
  String get formatMp4Desc => 'รองรับได้ดีที่สุดในทุกอุปกรณ์';

  @override
  String get formatMkvLabel => 'MKV';

  @override
  String get formatMkvDesc => 'รองรับหลายแทร็กเสียงและคำบรรยาย';

  @override
  String get formatMovLabel => 'MOV';

  @override
  String get formatMovDesc => 'รูปแบบ Apple QuickTime';

  @override
  String get scanningFilesMsg => 'กำลังสแกนหาไฟล์...';

  @override
  String get addFilesBtn => 'เพิ่มไฟล์';

  @override
  String get addFolderBtn => 'เพิ่มโฟลเดอร์';

  @override
  String get dragDropMoreMsg => 'หรือลากและวางวิดีโอเพิ่มเติมที่นี่';

  @override
  String get openOutputFolderTooltip => 'เปิดโฟลเดอร์ปลายทาง';

  @override
  String get statusQueued => 'อยู่ในคิว';

  @override
  String get statusAnalyzing => 'กำลังวิเคราะห์';

  @override
  String get statusCompressing => 'กำลังบีบอัด';

  @override
  String get statusDone => 'เสร็จสิ้น';

  @override
  String get statusFailed => 'ล้มเหลว';

  @override
  String get statusCancelled => 'ยกเลิกแล้ว';

  @override
  String get savedPrefix => 'ประหยัดไป';

  @override
  String get largerSuffix => 'ใหญ่กว่าเดิม';

  @override
  String get largerSizeWarning => 'ขนาดไฟล์ใหม่อาจใหญ่กว่าไฟล์เดิม';

  @override
  String get clearCompletedBtn => 'ล้างรายการที่เสร็จแล้ว';

  @override
  String get clearAllBtn => 'ล้างทั้งหมด';

  @override
  String get stopAllBtn => 'หยุดทั้งหมด';

  @override
  String get startCompressionBtn => 'เริ่มบีบอัด';

  @override
  String get allDoneLabel => 'เสร็จสิ้นทั้งหมดแล้ว!';

  @override
  String get openFolderBtn => 'เปิดโฟลเดอร์';

  @override
  String get totalEtaLabel => 'เวลาที่เหลืออยู่';

  @override
  String get totalSavedLabel => 'ประหยัดพื้นที่รวม';

  @override
  String get videoSingle => 'วิดีโอ';

  @override
  String get videosPlural => 'วิดีโอ';

  @override
  String get releaseToAddVideosMsg => 'ปล่อยเพื่อเพิ่มไฟล์วิดีโอ';

  @override
  String get dragDropHereMsg => 'ลากและวางไฟล์หรือโฟลเดอร์ตรงนี้';

  @override
  String get supportedFormatsMsg => 'รองรับไฟล์ MP4, MKV, MOV, AVI, WMV';

  @override
  String get selectFilesBtn => 'เลือกไฟล์';

  @override
  String get selectFolderBtn => 'เลือกโฟลเดอร์';

  @override
  String get releaseToShrinkTitle => 'ปล่อยเพื่อเริ่มบีบอัดทันที';

  @override
  String get filesWillBeAddedDesc => 'ไฟล์ของคุณจะถูกเพิ่มเข้าในคิว';

  @override
  String get disabledLabel => 'ปิดใช้งาน';

  @override
  String get compressionInProgressTitle => 'กำลังดำเนินการบีบอัดวิดีโอ';

  @override
  String get confirmCloseDesc => 'คุณแน่ใจหรือไม่ว่าต้องการปิด Shrinkeo?';

  @override
  String get keepCompressingBtn => 'บีบอัดต่อไป';

  @override
  String get closeAppBtn => 'ปิดแอปพลิเคชัน';

  @override
  String get lockedSettingsWarning => 'ล็อกการตั้งค่าขณะกำลังบีบอัด';

  @override
  String get updateRequiredTitle => 'จำเป็นต้องอัปเดต';

  @override
  String get updateRequiredDescNewVersion => 'มีเวอร์ชันใหม่พร้อมใช้งาน';

  @override
  String get updateRequiredDescOldVersion =>
      'เวอร์ชันที่คุณใช้ไม่รองรับอีกต่อไป';

  @override
  String get updateNowBtn => 'อัปเดตทันที';

  @override
  String get laterBtn => 'ไว้ทีหลัง';

  @override
  String get updateAvailableTitle => 'มีอัปเดตใหม่';

  @override
  String get whatsNewTitle => 'มีอะไรใหม่:';

  @override
  String get exitAppBtn => 'ออกจากแอป';

  @override
  String get retryBtn => 'ลองอีกครั้ง';

  @override
  String get downloadFromWebsiteBtn => 'ดาวน์โหลดจากเว็บไซต์';

  @override
  String get skipUpdateConfirmTitle => 'ข้ามการอัปเดตหรือไม่?';

  @override
  String get skipUpdateConfirmDesc => 'การอัปเดตนี้มีการแก้ไขที่สำคัญ';

  @override
  String get skipUpdateCancelBtn => 'ยกเลิก';

  @override
  String get skipUpdateConfirmBtn => 'ข้ามการอัปเดต';

  @override
  String get maintenanceTitle => 'ปรับปรุงระบบ';

  @override
  String get maintenanceDescDefault =>
      'Shrinkeo กำลังอยู่ระหว่างการปรับปรุงระบบ';

  @override
  String versionAvailableMsg(String version) {
    return 'เวอร์ชัน $version พร้อมใช้งานแล้ว';
  }

  @override
  String get hwEncoderNotSupportedTitle => 'ไม่รองรับการเร่งด้วยฮาร์ดแวร์';

  @override
  String get failedCreateFolderError => 'สร้างโฟลเดอร์ปลายทางไม่สำเร็จ';

  @override
  String get failedProbeDurationError => 'อ่านความยาววิดีโอไม่สำเร็จ';

  @override
  String get ffmpegNotFoundGlobalError => 'ไม่พบโปรแกรม FFmpeg';

  @override
  String get ffmpegMissingError =>
      'โปรแกรม FFmpeg หรือ FFprobe สียหายหรือสูญหาย';

  @override
  String hwFallbackNotificationBody(String encoderLabel) {
    return '$encoderLabel ล้มเหลว สลับไปใช้ CPU แทนให้อัตโนมัติ';
  }

  @override
  String get failedDownloadUpdateMsg =>
      'ดาวน์โหลดอัปเดตไม่สำเร็จ โปรดลองอีกครั้ง';

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
  String get tabImageSuite => 'ชุดรูปภาพ';

  @override
  String get compressionModeTitle => 'โหมดการบีบอัด';

  @override
  String get smartAutoLabel => 'สมาร์ทออโต้';

  @override
  String get smartAutoDesc =>
      'ลดขนาดไฟล์โดยอัตโนมัติประมาณ 60-80% พร้อมความคมชัดของภาพ 100% เหมาะสำหรับการเพิ่มประสิทธิภาพภาพถ่ายในชีวิตประจำวัน';

  @override
  String get maxSavingsLabel => 'ออมทรัพย์สูงสุด';

  @override
  String get maxSavingsDesc =>
      'การบีบอัดข้อมูลเชิงรุกช่วยประหยัดขนาดไฟล์ได้ถึง 85-90% ดีที่สุดสำหรับการส่งข้อความที่รวดเร็ว การอัปโหลดเว็บ และไฟล์แนบอีเมล';

  @override
  String get ultraFidelityLabel => 'อัลตร้าความเที่ยงตรง';

  @override
  String get ultraFidelityDesc =>
      'รักษาความเที่ยงตรงของภาพดิบด้วยการบีบอัดน้อยที่สุด เหมาะสำหรับการเก็บถาวรภาพถ่ายและงานพิมพ์ที่มีความละเอียดสูง';

  @override
  String get targetImageFormatTitle => 'รูปแบบภาพเป้าหมาย';

  @override
  String get dimensionResizingTitle => 'การปรับขนาดมิติ';

  @override
  String get exifCameraPrivacyTitle => 'EXIF / ความเป็นส่วนตัวของกล้อง';

  @override
  String get stripGpsCameraInfoLabel => 'ตัดข้อมูล GPS และกล้อง';

  @override
  String get intentCompressOnly => 'บีบอัดเท่านั้น';

  @override
  String get intentCompressOnlyTooltip =>
      'มุ่งเน้นที่การลดขนาดไฟล์เพียงอย่างเดียว (% คุณภาพหรือเป้าหมาย KB/MB)';

  @override
  String get intentEditConvertOnly => 'แก้ไข/แปลงเท่านั้น';

  @override
  String get intentEditConvertOnlyTooltip =>
      'ปรับขนาด หมุน ตัดแต่ง หรือแปลงรูปแบบโดยไม่ลดคุณภาพของภาพ';

  @override
  String get intentCompressAndEdit => 'บีบอัดและแก้ไข';

  @override
  String get intentCompressAndEditTooltip =>
      'การควบคุมเต็มรูปแบบ: แก้ไข ปรับขนาด หมุน และบีบอัดขนาดไฟล์เข้าด้วยกัน';

  @override
  String get imgFmtOriginalLabel => 'รูปแบบดั้งเดิม';

  @override
  String get imgFmtOriginalDesc => 'คงรูปแบบเดิมไว้ (เร็วที่สุด ไม่มีการแปลง)';

  @override
  String get imgFmtPngLabel => 'รูปภาพ PNG (.png)';

  @override
  String get imgFmtPngDesc =>
      'รูปแบบ PNG แบบไม่สูญเสียข้อมูลพร้อมการสนับสนุนที่โปร่งใส';

  @override
  String get imgFmtJpgLabel => 'รูปภาพ JPEG (.jpg)';

  @override
  String get imgFmtJpgDesc =>
      'รูปแบบ JPEG บีบอัดมาตรฐานเพื่อความเข้ากันได้สากล';

  @override
  String get imgFmtWebpLabel => 'รูปภาพ WebP (.webp)';

  @override
  String get imgFmtWebpDesc =>
      'รูปแบบ WebP สมัยใหม่ที่ให้การบีบอัดที่เหนือกว่าและขนาดที่เล็ก';

  @override
  String get imgFmtAvifLabel => 'รูปภาพ AVIF (.avif)';

  @override
  String get imgFmtAvifDesc =>
      'รูปแบบ AVIF ยุคถัดไปที่มีประสิทธิภาพการบีบอัดสูงเป็นพิเศษ';

  @override
  String get imgResOriginalLabel => 'ขนาดดั้งเดิม';

  @override
  String get imgResOriginalDesc =>
      'คงขนาดความกว้างและความสูงของรูปภาพต้นฉบับไว้';

  @override
  String get imgRes4kLabel => 'สูงสุด 4K (3840px)';

  @override
  String get imgRes4kDesc => 'ลดขนาดขนาดสูงสุดของรูปภาพเป็น 3840px (สูงสุด 4K)';

  @override
  String get imgRes1080pLabel => 'Full HD สูงสุด (1920px)';

  @override
  String get imgRes1080pDesc =>
      'ลดขนาดขนาดสูงสุดของรูปภาพเป็น 1920px (สูงสุด Full HD)';

  @override
  String get imgRes720pLabel => 'HD สูงสุด (1280px)';

  @override
  String get imgRes720pDesc =>
      'ลดขนาดขนาดสูงสุดของรูปภาพเป็น 1280px (สูงสุด HD)';

  @override
  String get imgRes480pLabel => 'SD สูงสุด (854px)';

  @override
  String get imgRes480pDesc => 'ลดขนาดรูปภาพสูงสุดเป็น 854px (สูงสุด SD)';

  @override
  String get keepMetadataImageInfoDesc =>
      'รักษาภาพต้นฉบับ EXIF ​​​​และข้อมูลเมตาของกล้อง';

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
