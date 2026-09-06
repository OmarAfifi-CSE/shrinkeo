// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class AppLocalizationsKo extends AppLocalizations {
  AppLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get appName => 'Shrinkeo';

  @override
  String get totalSpaceSaved => '전 세계 총 절약된 용량';

  @override
  String get savedSpacePrefix => '절약:';

  @override
  String get supportButtonText => '프로젝트 후원';

  @override
  String get lightThemeTooltip => '라이트 테마';

  @override
  String get darkThemeTooltip => '다크 테마';

  @override
  String get settingsTooltip => '설정';

  @override
  String get minimizeTooltip => '최소화';

  @override
  String get closeTooltip => '닫기';

  @override
  String get restoreTooltip => '복원';

  @override
  String get maximizeTooltip => '최대화';

  @override
  String get tabCompressionQuality => '압축 및 화질';

  @override
  String get tabVideoEditingTools => '비디오 편집 및 도구';

  @override
  String get tabAudioSettings => '오디오 설정';

  @override
  String get tabEngineOutput => '엔진 및 출력';

  @override
  String get compressionSettingsTitle => '압축 설정';

  @override
  String get resetToDefaults => '기본값으로 초기화';

  @override
  String get resetDefaultTooltip => '초기 기본값으로 복원';

  @override
  String get modeTargetSizeTitle => '압축 모드';

  @override
  String get modeCrfLabel => '화질 우선 (CRF)';

  @override
  String get modeTargetSizeLabel => '목표 용량 (MB)';

  @override
  String get crfQualityTitle => 'CRF 화질 팩터';

  @override
  String get crfLossless => '무손실';

  @override
  String get crfHighQuality => '고품질';

  @override
  String get crfBalanced => '균형 잡힌';

  @override
  String get crfHighCompression => '고압축';

  @override
  String get crfLowQuality => '낮은 품질';

  @override
  String get crfUltraCompressed => '초압축';

  @override
  String get targetSizeLabel => '목표 파일 크기 (MB)';

  @override
  String get targetSizeDesc => '목표 용량에 맞춰 비트레이트를 자동으로 계산합니다.';

  @override
  String get encodingSpeedTitle => '인코딩 속도';

  @override
  String get presetUltrafastLabel => '가장 빠름 (Ultrafast)';

  @override
  String get presetUltrafastDesc => '속도 최우선, 압축률은 가장 낮음.';

  @override
  String get presetSuperfastLabel => '초고속 (Superfast)';

  @override
  String get presetSuperfastDesc => '매우 빠른 인코딩.';

  @override
  String get presetVeryfastLabel => '매우 빠름 (Very Fast)';

  @override
  String get presetVeryfastDesc => '평균보다 빠른 속도.';

  @override
  String get presetFasterLabel => '더 빠름 (Faster)';

  @override
  String get presetFasterDesc => '속도와 압축률의 좋은 균형.';

  @override
  String get presetFastLabel => '빠름';

  @override
  String get presetFastDesc => '속도와 용량 절감의 최고 추천 균형.';

  @override
  String get presetMediumLabel => '보통 (Medium)';

  @override
  String get presetMediumDesc => '기본 밸런스 설정.';

  @override
  String get presetSlowLabel => '느림 (Slow)';

  @override
  String get presetSlowDesc => '시간은 더 걸리지만 용량이 크게 줄어듭니다.';

  @override
  String get presetVeryslowLabel => '매우 느림 (Very Slow)';

  @override
  String get presetVeryslowDesc => '최고 효율로 극대화된 압축.';

  @override
  String get videoCodecTitle => '비디오 코덱';

  @override
  String get codecH264Label => 'H.264';

  @override
  String get codecH264Desc => '최고의 호환성.';

  @override
  String get codecH265Label => 'H.265 / HEVC';

  @override
  String get codecH265Desc => '더 뛰어난 압축 효율.';

  @override
  String get codecAv1Label => 'AV1';

  @override
  String get codecAv1Desc => '차세대 코덱 (H.265 대비 30% 절감).';

  @override
  String get hardwareEncoderTitle => '하드웨어 가속 (GPU)';

  @override
  String get hwSoftwareLabel => '소프트웨어 (CPU)';

  @override
  String get hwSoftwareDesc => '느리지만 최고의 호환성과 화질.';

  @override
  String get hwNvidiaLabel => 'Nvidia (NVENC)';

  @override
  String get hwNvidiaDesc => 'Nvidia GPU를 위한 초고속 인코딩.';

  @override
  String get hwAmdLabel => 'AMD (AMF)';

  @override
  String get hwAmdDesc => 'AMD GPU를 위한 초고속 인코딩.';

  @override
  String get hwIntelLabel => 'Intel (QSV)';

  @override
  String get hwIntelDesc => 'Intel GPU를 위한 초고속 인코딩.';

  @override
  String get resolutionTitle => '최대 해상도';

  @override
  String get resOriginalLabel => '원본 유지';

  @override
  String get resOriginalDesc => '원본 해상도를 그대로 유지.';

  @override
  String get res4kLabel => '4K';

  @override
  String get res4kDesc => '최대 4K로 축소.';

  @override
  String get res2kLabel => '2K';

  @override
  String get res2kDesc => '최대 2K로 축소.';

  @override
  String get res1080pLabel => '1080p';

  @override
  String get res1080pDesc => '최대 1080p Full HD로 축소.';

  @override
  String get res720pLabel => '720p';

  @override
  String get res720pDesc => '최대 720p HD로 축소.';

  @override
  String get res480pLabel => '480p';

  @override
  String get res480pDesc => '480p DVD 화질로 축소.';

  @override
  String get res360pLabel => '360p';

  @override
  String get res360pDesc => '극대화된 압축.';

  @override
  String get frameRateTitle => '프레임레이트 (FPS)';

  @override
  String get fpsOriginalLabel => '원본 유지';

  @override
  String get fpsOriginalDesc => '원본 비디오와 동일한 FPS.';

  @override
  String get fps60Label => '60 fps';

  @override
  String get fps60Desc => '게임이나 스포츠를 위한 부드러움.';

  @override
  String get fps30Label => '30 fps';

  @override
  String get fps30Desc => '대부분의 비디오를 위한 표준.';

  @override
  String get fps24Label => '24 fps';

  @override
  String get fps24Desc => '영화 같은 느낌.';

  @override
  String get enableVideoDenoiseTitle => '비디오 노이즈 제거';

  @override
  String get enableVideoDenoiseDesc => '3D 노이즈 제거로 노이즈 감소 및 압축률 향상.';

  @override
  String get exportFormatTitle => '내보내기 형식';

  @override
  String get exportVideoLabel => '표준 비디오';

  @override
  String get exportVideoDesc => 'MP4/MKV/MOV 비디오로 내보내기';

  @override
  String get exportGifLabel => '움짤 GIF';

  @override
  String get exportGifDesc => '고화질 애니메이션 GIF 생성';

  @override
  String get exportMp3Label => 'MP3 추출';

  @override
  String get exportMp3Desc => '320kbps MP3 오디오 추출';

  @override
  String get exportAacLabel => 'AAC 추출';

  @override
  String get exportAacDesc => '고품질 AAC 오디오 추출';

  @override
  String get exportWavLabel => 'WAV 추출';

  @override
  String get exportWavDesc => '무압축 스튜디오 WAV 오디오 추출';

  @override
  String get privacyScrubbingTitle => '개인정보 및 GPS';

  @override
  String get keepMetadataLabel => '메타데이터 유지';

  @override
  String get stripGpsExifLabel => 'GPS/EXIF 삭제';

  @override
  String get stripGpsExifInfoTitle => '메타데이터 삭제';

  @override
  String get stripGpsExifInfoDesc => '카메라 정보 및 GPS 위치 정보 제거.';

  @override
  String get keepMetadataInfoDesc => '모든 원본 메타데이터 보존.';

  @override
  String get autoCropBlackBarsTitle => '여백 자동 잘라내기';

  @override
  String get autoCropLabel => '자동 자르기';

  @override
  String get autoCropActiveTitle => '자동 자르기 활성';

  @override
  String get autoCropActiveDesc => '상하좌우 검은 여백을 자동으로 제거.';

  @override
  String get autoCropDisabledDesc => '원본 프레임을 그대로 유지.';

  @override
  String get playbackSpeedTitle => '재생 속도';

  @override
  String get speedOriginalLabel => '1.0x';

  @override
  String get speedOriginalDesc => '일반 재생 속도';

  @override
  String get speedSlow05Label => '0.5x 슬로우';

  @override
  String get speedSlow05Desc => '느린 재생 모드';

  @override
  String get speedFast15Label => '1.5x';

  @override
  String get speedFast15Desc => '1.5배속 빠른 재생';

  @override
  String get speedFast20Label => '2.0x 배속';

  @override
  String get speedFast20Desc => '2배속 빠른 재생';

  @override
  String get speedTimelapse40Label => '4.0x 타임랩스';

  @override
  String get speedTimelapse40Desc => '4배속 초고속 타임랩스 효과';

  @override
  String get canvasAspectRatioTitle => '화면 비율';

  @override
  String get aspectOriginalLabel => '원본';

  @override
  String get aspectOriginalDesc => '원본 비디오 비율 유지';

  @override
  String get aspectShortsLabel => '9:16 숏폼';

  @override
  String get aspectShortsDesc => '틱톡, 릴스, 숏츠용';

  @override
  String get aspectSquareLabel => '1:1 정사각형';

  @override
  String get aspectSquareDesc => '인스타그램 게시물용';

  @override
  String get aspectPortraitLabel => '4:5 세로형';

  @override
  String get aspectPortraitDesc => '인스타그램 세로 게시물용';

  @override
  String get aspectWidescreenLabel => '16:9 와이드';

  @override
  String get aspectWidescreenDesc => '유튜브 및 TV용';

  @override
  String get aspectClassicLabel => '4:3 클래식';

  @override
  String get aspectClassicDesc => '클래식 모니터용';

  @override
  String get aspectCinemaLabel => '21:9 시네마';

  @override
  String get aspectCinemaDesc => '울트라 와이드 모니터용';

  @override
  String get aspectCustomLabel => '사용자 지정 비율';

  @override
  String get aspectCustomDesc => '직접 입력한 화면 비율';

  @override
  String get customRatioTooltip => '예: 16:10, 2:1';

  @override
  String get rotationFlipTitle => '회전 및 반전';

  @override
  String get rotOriginalLabel => '원본 (0°)';

  @override
  String get rotOriginalDesc => '원본 방향 유지';

  @override
  String get rot90Label => '시계방향 90°';

  @override
  String get rot90Desc => '오른쪽으로 90도 회전';

  @override
  String get rot180Label => '180° 반전';

  @override
  String get rot180Desc => '거꾸로 회전';

  @override
  String get rot270Label => '반시계방향 90°';

  @override
  String get rot270Desc => '왼쪽으로 90도 회전';

  @override
  String get rotFlipHLabel => '좌우 반전';

  @override
  String get rotFlipHDesc => '수평 방향으로 대칭 반전';

  @override
  String get rotFlipVLabel => '상하 반전';

  @override
  String get rotFlipVDesc => '수직 방향으로 대칭 반전';

  @override
  String get rotCustomLabel => '사용자 지정 각도';

  @override
  String get rotCustomDesc => '지정한 각도로 회전';

  @override
  String get customRotationTooltip => '각도(도) 입력 예: 45, 30';

  @override
  String get trimVideoTitle => '비디오 자르기';

  @override
  String get fullVideoLabel => '전체 비디오';

  @override
  String get cutClipLabel => '구간 자르기';

  @override
  String get trimStartLabel => '시작';

  @override
  String get trimEndLabel => '끝';

  @override
  String get trimActiveTitle => '자르기 활성화';

  @override
  String get fullVideoDesc => '자르지 않고 전체 비디오를 처리.';

  @override
  String get audioModeTitle => '오디오 트랙 모드';

  @override
  String get audioOriginalLabel => '원본 유지';

  @override
  String get audioOriginalDesc => '음질 손실 없음.';

  @override
  String get audioAac256Label => '고음질 (256k)';

  @override
  String get audioAac256Desc => 'AAC 256kbps';

  @override
  String get audioAac128Label => '표준 (128k)';

  @override
  String get audioAac128Desc => 'AAC 128kbps (웹 표준)';

  @override
  String get audioAac64Label => '저용량 (64k)';

  @override
  String get audioAac64Desc => 'AAC 64kbps (음성용)';

  @override
  String get audioMuteLabel => '음소거';

  @override
  String get audioMuteDesc => '오디오 트랙 제거.';

  @override
  String get audioNormTitle => '음량 평탄화 (노멀라이즈)';

  @override
  String get audioNormOffLabel => '꺼짐';

  @override
  String get audioNormOffDesc => '원본 동적 음량 유지.';

  @override
  String get audioNormSpeechLabel => '음성 선명화';

  @override
  String get audioNormSpeechDesc => 'EBU R128 표준 대화 선명화.';

  @override
  String get audioNormDynamicLabel => '다이내믹 영화';

  @override
  String get audioNormDynamicDesc => '크고 작은 소리를 조율.';

  @override
  String get audioNormBoostLabel => '음량 증폭';

  @override
  String get audioNormBoostDesc => '+3dB 음량 증폭.';

  @override
  String get audioChanTitle => '오디오 채널';

  @override
  String get audioChanOriginalLabel => '원본';

  @override
  String get audioChanOriginalDesc => '원본 채널 수 유지.';

  @override
  String get audioChanStereoLabel => '스테레오 (2.0)';

  @override
  String get audioChanStereoDesc => '표준 2채널.';

  @override
  String get audioChanMonoLabel => '모노 (1.0)';

  @override
  String get audioChanMonoDesc => '1채널 병합으로 오디오 용량 50% 절감.';

  @override
  String get removeNoiseLabel => '노이즈 제거';

  @override
  String get enableAudioDenoiseTitle => '마이크 잡음 및 잡음 제거';

  @override
  String get enableAudioDenoiseDesc => '배경 잡음 저감 필터 적용.';

  @override
  String get outputDirectoryTitle => '저장 경로';

  @override
  String get defaultOutputDirectory => '기본값 (원본 파일 위치)';

  @override
  String get selectOutputFolderTitle => '폴더 선택';

  @override
  String get clearOutputFolder => '기본 위치 사용';

  @override
  String get changeBtn => '변경';

  @override
  String get outputLocationTitle => '저장 방식';

  @override
  String get outputLocationUnifiedLabel => '단일 폴더';

  @override
  String get outputLocationUnifiedDesc => '모든 압축 비디오를 한 폴더에 저장.';

  @override
  String get outputLocationSameLabel => '원본 옆에 저장';

  @override
  String get outputLocationSameDesc => '각 원본 파일 위치 옆에 저장.';

  @override
  String get fileManagementTitle => '파일 관리';

  @override
  String get keepOriginalsLabel => '원본 파일 보존';

  @override
  String get keepOriginalsDesc => '원본 비디오를 그대로 유지.';

  @override
  String get toRecycleBinLabel => '휴지통으로 이동';

  @override
  String get toRecycleBinDesc => '압축 후 원본을 휴지통으로 이동.';

  @override
  String get outputFormatTitle => '컨테이너 포맷';

  @override
  String get formatOriginalLabel => '원본';

  @override
  String get formatOriginalDesc => '원본 형식 유지.';

  @override
  String get formatMp4Label => 'MP4';

  @override
  String get formatMp4Desc => '호환성 우수.';

  @override
  String get formatMkvLabel => 'MKV';

  @override
  String get formatMkvDesc => '다중 트랙 지원.';

  @override
  String get formatMovLabel => 'MOV';

  @override
  String get formatMovDesc => 'Apple QuickTime 형식.';

  @override
  String get scanningFilesMsg => '파일을 스캔 중입니다...';

  @override
  String get addFilesBtn => '파일 추가';

  @override
  String get addFolderBtn => '폴더 추가';

  @override
  String get dragDropMoreMsg => '또는 다른 파일을 어디에나 끌어다 놓기';

  @override
  String get openOutputFolderTooltip => '저장 폴더 열기';

  @override
  String get statusQueued => '대기 중';

  @override
  String get statusAnalyzing => '분석 중';

  @override
  String get statusCompressing => '압축 중';

  @override
  String get statusDone => '완료';

  @override
  String get statusFailed => '실패';

  @override
  String get statusCancelled => '취소됨';

  @override
  String get savedPrefix => '절약';

  @override
  String get largerSuffix => '커짐';

  @override
  String get largerSizeWarning => '결과 파일 크기가 원본보다 커질 수 있습니다.';

  @override
  String get clearCompletedBtn => '완료 항목 삭제';

  @override
  String get clearAllBtn => '전체 지우기';

  @override
  String get stopAllBtn => '전체 중지';

  @override
  String get startCompressionBtn => '압축 시작';

  @override
  String get allDoneLabel => '모두 완료되었습니다!';

  @override
  String get openFolderBtn => '폴더 열기';

  @override
  String get totalEtaLabel => '남은 시간';

  @override
  String get totalSavedLabel => '총 절약 용량';

  @override
  String get videoSingle => '개 비디오';

  @override
  String get videosPlural => '개 비디오';

  @override
  String get fileSingle => '파일';

  @override
  String get filesPlural => '파일';

  @override
  String get releaseToAddVideosMsg => '놓아서 파일 추가';

  @override
  String get dragDropHereMsg => '동영상이나 이미지를 여기에 끌어다 놓기';

  @override
  String get supportedFormatsMsg =>
      'MP4, MKV, MOV, AVI, WMV, WebM • PNG, JPG, WebP, AVIF 등 지원';

  @override
  String get selectFilesBtn => '파일 선택';

  @override
  String get selectFolderBtn => '폴더 선택';

  @override
  String get releaseToShrinkTitle => '마우스를 놓아 바로 압축';

  @override
  String get filesWillBeAddedDesc => '파일이 대기열에 추가됩니다.';

  @override
  String get disabledLabel => '비활성화';

  @override
  String get compressionInProgressTitle => '압축 진행 중';

  @override
  String get confirmCloseDesc => 'Shrinkeo를 종료하시겠습니까?';

  @override
  String get keepCompressingBtn => '압축 계속하기';

  @override
  String get closeAppBtn => '앱 종료';

  @override
  String get lockedSettingsWarning => '압축 중에는 설정 잠김';

  @override
  String get updateRequiredTitle => '업데이트 필요';

  @override
  String get updateRequiredDescNewVersion => '새 버전이 출시되었습니다.';

  @override
  String get updateRequiredDescOldVersion => '현재 버전은 더 이상 지원되지 않습니다.';

  @override
  String get updateNowBtn => '지금 업데이트';

  @override
  String get laterBtn => '나중에';

  @override
  String get updateAvailableTitle => '업데이트 가능';

  @override
  String get whatsNewTitle => '새로운 기능:';

  @override
  String get exitAppBtn => '종료';

  @override
  String get retryBtn => '다시 시도';

  @override
  String get downloadFromWebsiteBtn => '웹사이트에서 다운로드';

  @override
  String get skipUpdateConfirmTitle => '업데이트를 건너뛸까요?';

  @override
  String get skipUpdateConfirmDesc => '중요한 오류 수정이 포함되어 있습니다.';

  @override
  String get skipUpdateCancelBtn => '취소';

  @override
  String get skipUpdateConfirmBtn => '건너뛰기';

  @override
  String get maintenanceTitle => '점검 중';

  @override
  String get maintenanceDescDefault => '현재 시스템 점검 중입니다.';

  @override
  String versionAvailableMsg(String version) {
    return '버전 $version을(를) 사용할 수 있습니다.';
  }

  @override
  String get hwEncoderNotSupportedTitle => '하드웨어 가속 미지원';

  @override
  String get failedCreateFolderError => '폴더 생성 실패';

  @override
  String get failedProbeDurationError => '재생 시간 분석 실패';

  @override
  String get ffmpegNotFoundGlobalError => 'FFmpeg을 찾을 수 없습니다.';

  @override
  String get ffmpegMissingError => 'FFmpeg 또는 FFprobe가 없거나 손상되었습니다.';

  @override
  String hwFallbackNotificationBody(String encoderLabel) {
    return '$encoderLabel 가속 실패. CPU로 전환되었습니다.';
  }

  @override
  String get failedDownloadUpdateMsg => '업데이트 다운로드 실패. 다시 시도해 주세요.';

  @override
  String customRatioActiveTitle(Object ratio) {
    return '사용자 지정 비율 ($ratio)';
  }

  @override
  String customRatioActiveDesc(Object ratio) {
    return '사용자 지정 $ratio 비율을 위한 여백 프레임.';
  }

  @override
  String customAngleActiveTitle(Object angle) {
    return '사용자 지정 각도 ($angle°)';
  }

  @override
  String customAngleActiveDesc(Object angle) {
    return '비디오를 사용자 지정 $angle° 각도로 회전합니다.';
  }

  @override
  String trimActiveDesc(Object end, Object start) {
    return '$start부터 $end까지 비디오를 자릅니다.';
  }

  @override
  String targetSizeLimitLabel(Object size) {
    return '$size MB 제한';
  }

  @override
  String get customMbSizeTooltip => '사용자 지정 MB 크기 입력';

  @override
  String get trimTimeTooltip => '시간 입력 예: 5(5초), 1:30(1분30초) 또는 00:01:30';

  @override
  String get tabImageSuite => '이미지 스위트';

  @override
  String get compressionModeTitle => '압축 모드';

  @override
  String get smartAutoLabel => '스마트 자동';

  @override
  String get smartAutoDesc =>
      '화질 손상 없이 파일 크기를 약 60~80% 자동으로 줄입니다. 일상 사진에 최적입니다.';

  @override
  String get maxSavingsLabel => '최대 절약';

  @override
  String get maxSavingsDesc => '최대 85~90% 용량을 절감하는 강력한 압축. 빠른 전송 및 메일 첨부용.';

  @override
  String get ultraFidelityLabel => '최고 화질';

  @override
  String get ultraFidelityDesc => '최소한의 압축으로 원본 화질을 유지합니다. 보관 및 인쇄용에 적합합니다.';

  @override
  String get targetImageFormatTitle => '타겟 이미지 형식';

  @override
  String get dimensionResizingTitle => '크기 조절';

  @override
  String get exifCameraPrivacyTitle => 'EXIF / 카메라 개인정보';

  @override
  String get stripGpsCameraInfoLabel => 'GPS 및 카메라 정보 삭제';

  @override
  String get imgFmtOriginalLabel => '원본 형식';

  @override
  String get imgFmtOriginalDesc => '원본 형식을 유지합니다(가장 빠름, 변환 없음).';

  @override
  String get imgFmtPngLabel => 'PNG 이미지(.png)';

  @override
  String get imgFmtPngDesc => '투명도를 지원하는 무손실 PNG 형식입니다.';

  @override
  String get imgFmtJpgLabel => 'JPEG 이미지(.jpg)';

  @override
  String get imgFmtJpgDesc => '범용 호환성을 위한 표준 압축 JPEG 형식입니다.';

  @override
  String get imgFmtWebpLabel => 'WebP 이미지(.webp)';

  @override
  String get imgFmtWebpDesc => '뛰어난 압축률과 작은 크기를 제공하는 최신 WebP 형식입니다.';

  @override
  String get imgFmtAvifLabel => 'AVIF 이미지(.avif)';

  @override
  String get imgFmtAvifDesc => '초고압축 효율성을 갖춘 차세대 AVIF 형식입니다.';

  @override
  String get imgResOriginalLabel => '원래 치수';

  @override
  String get imgResOriginalDesc => '원본 이미지의 너비와 높이 크기를 유지합니다.';

  @override
  String get imgRes4kLabel => '4K 최대(3840px)';

  @override
  String get imgRes4kDesc => '이미지 최대 크기를 3840px(최대 4K)로 축소합니다.';

  @override
  String get imgRes1080pLabel => '풀 HD 최대(1920px)';

  @override
  String get imgRes1080pDesc => '이미지 최대 크기를 1920px(최대 Full HD)로 축소합니다.';

  @override
  String get imgRes720pLabel => 'HD 맥스(1280px)';

  @override
  String get imgRes720pDesc => '이미지 최대 크기를 1280px(HD 최대)로 축소합니다.';

  @override
  String get imgRes480pLabel => 'SD 맥스(854px)';

  @override
  String get imgRes480pDesc => '이미지 최대 크기를 854px(SD 최대)로 축소합니다.';

  @override
  String get keepMetadataImageInfoDesc => '원본 이미지의 EXIF 및 카메라 메타데이터를 유지합니다.';

  @override
  String get imageQualityModeLabel => '품질 수준';

  @override
  String get imageQualityModeDesc => '고정된 품질 수준으로 인코딩합니다 — 품질이 높을수록 파일이 커집니다.';

  @override
  String get imageTargetSizeModeLabel => '목표 크기';

  @override
  String get imageTargetSizeModeDesc => '크기 제한에 맞는 최고 품질을 자동으로 찾습니다.';

  @override
  String get imageQualitySliderTitle => '이미지 품질';

  @override
  String get imageTargetSizeTitle => '목표 파일 크기';

  @override
  String get imageTargetSizeDesc =>
      '파일이 제한 안에 들어올 때까지 낮아지는 품질로 반복 인코딩합니다. 너무 작은 제한은 품질을 낮출 수 있습니다.';

  @override
  String imageTargetSizeLimitLabel(String size) {
    return '$size 제한';
  }

  @override
  String get customKbSizeTooltip => '사용자 지정 KB 크기 입력';

  @override
  String get imageProcessingFailedError => '이미지 처리 실패';

  @override
  String get imageProcessingErrorMsg => '이미지 처리 오류';

  @override
  String get cleanNoiseLabel => '노이즈 감소';

  @override
  String get outputLargerTooltip => '출력 파일이 원본보다 커집니다!\n중단하고 기본값으로 재설정하세요.';

  @override
  String get estimatedSizePrefix => '예상:';

  @override
  String get cancelBtnTooltip => '취소';

  @override
  String get removeBtnTooltip => '제거';

  @override
  String get selectLanguageTitle => '언어 선택';

  @override
  String get searchLanguageHint => '이름 또는 코드로 언어 검색...';

  @override
  String get noLanguagesMatchSearch => '검색과 일치하는 언어가 없습니다.';

  @override
  String get languageTooltip => '언어';

  @override
  String get notifyCompressionCompleteTitle => 'Shrinkeo 압축 완료';

  @override
  String get notifyOutputLargerTitle => '출력이 원본보다 큼';

  @override
  String languagesCountLabel(String count) {
    return '$count개 언어';
  }

  @override
  String notifyCompressionCompleteSuccess(String success) {
    return '$success개 파일을 성공적으로 압축했습니다.';
  }

  @override
  String notifyCompressionCompleteFailed(String failed) {
    return ' ($failed개 실패)';
  }

  @override
  String notifyOutputLargerDesc(String fileName) {
    return '$fileName이(가) 원본보다 커질 것으로 예상됩니다. 취소하고 재설정하는 것을 고려하세요.';
  }

  @override
  String get imagePreparing => '이미지 준비 중';

  @override
  String get imageEncoding => '이미지 압축 중';

  @override
  String get imageSaving => '결과 저장 중';

  @override
  String imageTargetProgress(String size) {
    return '목표: $size';
  }

  @override
  String imageAttempt(int count) {
    return '시도 $count';
  }

  @override
  String imageBestResult(String size) {
    return '최상의 결과: $size';
  }

  @override
  String queueCompleted(int done, int total) {
    return '$total개 중 $done개 완료';
  }
}
