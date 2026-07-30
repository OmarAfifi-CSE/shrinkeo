// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get appName => 'Shrinkeo';

  @override
  String get totalSpaceSaved => '世界中で削減された総容量';

  @override
  String get savedSpacePrefix => '削減:';

  @override
  String get supportButtonText => 'プロジェクトを支援';

  @override
  String get lightThemeTooltip => 'ライトテーマ';

  @override
  String get darkThemeTooltip => 'ダークテーマ';

  @override
  String get settingsTooltip => '設定';

  @override
  String get minimizeTooltip => '最小化';

  @override
  String get closeTooltip => '閉じる';

  @override
  String get restoreTooltip => '元に戻す';

  @override
  String get maximizeTooltip => '最大化';

  @override
  String get tabCompressionQuality => '圧縮と画質';

  @override
  String get tabVideoEditingTools => '動画編集とツール';

  @override
  String get tabAudioSettings => '音声設定';

  @override
  String get tabEngineOutput => 'エンジンと出力';

  @override
  String get compressionSettingsTitle => '圧縮設定';

  @override
  String get resetToDefaults => '初期設定に戻す';

  @override
  String get resetDefaultTooltip => 'デフォルト値にリセット';

  @override
  String get modeTargetSizeTitle => '圧縮モード';

  @override
  String get modeCrfLabel => '画質優先 (CRF)';

  @override
  String get modeTargetSizeLabel => '指定サイズ (MB)';

  @override
  String get crfQualityTitle => 'CRF画質ファクター';

  @override
  String get crfLossless => 'ロスレス';

  @override
  String get crfHighQuality => '高品質';

  @override
  String get crfBalanced => 'バランスの取れた';

  @override
  String get crfHighCompression => '高圧縮';

  @override
  String get crfLowQuality => '低品質';

  @override
  String get crfUltraCompressed => '超圧縮';

  @override
  String get targetSizeLabel => '目標ファイルサイズ (MB)';

  @override
  String get targetSizeDesc => '制限サイズに収まるようビットレートを自動計算します。';

  @override
  String get encodingSpeedTitle => 'エンコード速度';

  @override
  String get presetUltrafastLabel => '最速 (Ultrafast)';

  @override
  String get presetUltrafastDesc => '速度最優先、圧縮率は最小。';

  @override
  String get presetSuperfastLabel => '超高速 (Superfast)';

  @override
  String get presetSuperfastDesc => '非常に高速なエンコード。';

  @override
  String get presetVeryfastLabel => '高速 (Very Fast)';

  @override
  String get presetVeryfastDesc => '平均より速い速度。';

  @override
  String get presetFasterLabel => 'やや高速 (Faster)';

  @override
  String get presetFasterDesc => '速度と圧縮率のバランス良好。';

  @override
  String get presetFastLabel => '高速';

  @override
  String get presetFastDesc => '速度と削減率の最高バランス。';

  @override
  String get presetMediumLabel => '標準 (Medium)';

  @override
  String get presetMediumDesc => 'デフォルトバランス。';

  @override
  String get presetSlowLabel => '低速 (Slow)';

  @override
  String get presetSlowDesc => '時間はかかりますが大幅に軽量化。';

  @override
  String get presetVeryslowLabel => '極小 (Very Slow)';

  @override
  String get presetVeryslowDesc => '最高効率で限界まで圧縮。';

  @override
  String get videoCodecTitle => 'ビデオコーデック';

  @override
  String get codecH264Label => 'H.264';

  @override
  String get codecH264Desc => '最高クラスの互換性。';

  @override
  String get codecH265Label => 'H.265 / HEVC';

  @override
  String get codecH265Desc => '高い圧縮効率。';

  @override
  String get codecAv1Label => 'AV1';

  @override
  String get codecAv1Desc => '次世代コーデック (H.265比30%削減)。';

  @override
  String get hardwareEncoderTitle => 'ハードウェア加速 (GPU)';

  @override
  String get hwSoftwareLabel => 'ソフトウェア (CPU)';

  @override
  String get hwSoftwareDesc => '低速ですが最高の互換性と画質。';

  @override
  String get hwNvidiaLabel => 'Nvidia (NVENC)';

  @override
  String get hwNvidiaDesc => 'Nvidia GPUによる超高速エンコード。';

  @override
  String get hwAmdLabel => 'AMD (AMF)';

  @override
  String get hwAmdDesc => 'AMD GPUによる超高速エンコード。';

  @override
  String get hwIntelLabel => 'Intel (QSV)';

  @override
  String get hwIntelDesc => 'Intel GPUによる超高速エンコード。';

  @override
  String get resolutionTitle => '最大解像度';

  @override
  String get resOriginalLabel => 'オリジナル保持';

  @override
  String get resOriginalDesc => '元の解像度を維持。';

  @override
  String get res4kLabel => '4K';

  @override
  String get res4kDesc => '最大4Kへ縮小。';

  @override
  String get res2kLabel => '2K';

  @override
  String get res2kDesc => '最大2Kへ縮小。';

  @override
  String get res1080pLabel => '1080p';

  @override
  String get res1080pDesc => '最大1080p Full HDへ縮小。';

  @override
  String get res720pLabel => '720p';

  @override
  String get res720pDesc => '最大720p HDへ縮小。';

  @override
  String get res480pLabel => '480p';

  @override
  String get res480pDesc => '480p DVD画質へ縮小。';

  @override
  String get res360pLabel => '360p';

  @override
  String get res360pDesc => '限界圧縮。';

  @override
  String get frameRateTitle => 'フレームレート (FPS)';

  @override
  String get fpsOriginalLabel => 'オリジナル保持';

  @override
  String get fpsOriginalDesc => '元動画と同じFPS。';

  @override
  String get fps60Label => '60 fps';

  @override
  String get fps60Desc => '滑らかな動き (ゲームやスポーツ)。';

  @override
  String get fps30Label => '30 fps';

  @override
  String get fps30Desc => '一般的な標準フレームレート。';

  @override
  String get fps24Label => '24 fps';

  @override
  String get fps24Desc => '映画風スタイル。';

  @override
  String get enableVideoDenoiseTitle => '映像ノイズ除去';

  @override
  String get enableVideoDenoiseDesc => '3Dノイズ除去で画質を整え圧縮率向上。';

  @override
  String get exportFormatTitle => '出力フォーマット';

  @override
  String get exportVideoLabel => '標準ビデオ';

  @override
  String get exportVideoDesc => 'MP4/MKV/MOVとして出力';

  @override
  String get exportGifLabel => 'アニメーションGIF';

  @override
  String get exportGifDesc => '高品質なGIFアニメを作成';

  @override
  String get exportMp3Label => 'MP3抽出';

  @override
  String get exportMp3Desc => '320kbps MP3として音声抽出';

  @override
  String get exportAacLabel => 'AAC抽出';

  @override
  String get exportAacDesc => '高品質AACとして音声抽出';

  @override
  String get exportWavLabel => 'WAV抽出';

  @override
  String get exportWavDesc => '無圧縮WAVとして音声抽出';

  @override
  String get privacyScrubbingTitle => 'プライバシーと位置情報';

  @override
  String get keepMetadataLabel => '保持する';

  @override
  String get stripGpsExifLabel => 'GPS/EXIF削除';

  @override
  String get stripGpsExifInfoTitle => 'メタデータ消去';

  @override
  String get stripGpsExifInfoDesc => 'カメラ情報やGPS位置情報を削除。';

  @override
  String get keepMetadataInfoDesc => 'すべてのメタデータを保持。';

  @override
  String get autoCropBlackBarsTitle => '黒帯の自動カット';

  @override
  String get autoCropLabel => '自動クロップ';

  @override
  String get autoCropActiveTitle => '自動クロップ有効';

  @override
  String get autoCropActiveDesc => '上下左右の黒帯を自動検知して削除。';

  @override
  String get autoCropDisabledDesc => '元のフレーム範囲を保持。';

  @override
  String get playbackSpeedTitle => '再生速度';

  @override
  String get speedOriginalLabel => '1.0x';

  @override
  String get speedOriginalDesc => '通常の再生速度';

  @override
  String get speedSlow05Label => '0.5x スロー';

  @override
  String get speedSlow05Desc => '半分の速度で再生';

  @override
  String get speedFast15Label => '1.5x';

  @override
  String get speedFast15Desc => '1.5倍速再生';

  @override
  String get speedFast20Label => '2.0x 倍速';

  @override
  String get speedFast20Desc => '2倍速再生';

  @override
  String get speedTimelapse40Label => '4.0x タイムラプス';

  @override
  String get speedTimelapse40Desc => '4倍速タイムラプス再生';

  @override
  String get canvasAspectRatioTitle => 'アスペクト比';

  @override
  String get aspectOriginalLabel => 'オリジナル';

  @override
  String get aspectOriginalDesc => '元動画の縦横比を維持';

  @override
  String get aspectShortsLabel => '9:16 ショート';

  @override
  String get aspectShortsDesc => 'TikTokやReels向け';

  @override
  String get aspectSquareLabel => '1:1 正方形';

  @override
  String get aspectSquareDesc => 'Instagram投稿向け';

  @override
  String get aspectPortraitLabel => '4:5 縦型';

  @override
  String get aspectPortraitDesc => 'Instagram縦型投稿向け';

  @override
  String get aspectWidescreenLabel => '16:9 ワイド';

  @override
  String get aspectWidescreenDesc => 'YouTubeやテレビ向け';

  @override
  String get aspectClassicLabel => '4:3 クラシック';

  @override
  String get aspectClassicDesc => '旧型モニター向け';

  @override
  String get aspectCinemaLabel => '21:9 シネマ';

  @override
  String get aspectCinemaDesc => 'ウルトラワイド向け';

  @override
  String get aspectCustomLabel => 'カスタム比率';

  @override
  String get aspectCustomDesc => '指定のアスペクト比';

  @override
  String get customRatioTooltip => '例: 16:10, 2:1';

  @override
  String get rotationFlipTitle => '回転と反転';

  @override
  String get rotOriginalLabel => 'オリジナル (0°)';

  @override
  String get rotOriginalDesc => '元の向きを維持';

  @override
  String get rot90Label => '右に90°';

  @override
  String get rot90Desc => '時計回りに90度回転';

  @override
  String get rot180Label => '180° 反転';

  @override
  String get rot180Desc => '上下逆さまに回転';

  @override
  String get rot270Label => '左に90°';

  @override
  String get rot270Desc => '反時計回りに90度回転';

  @override
  String get rotFlipHLabel => '左右反転';

  @override
  String get rotFlipHDesc => '水平方向にミラーリング';

  @override
  String get rotFlipVLabel => '上下反転';

  @override
  String get rotFlipVDesc => '垂直方向にミラーリング';

  @override
  String get rotCustomLabel => 'カスタム角度';

  @override
  String get rotCustomDesc => '指定した角度で回転';

  @override
  String get customRotationTooltip => '角度(度) 例: 45, 30';

  @override
  String get trimVideoTitle => '動画トリミング';

  @override
  String get fullVideoLabel => '全体処理';

  @override
  String get cutClipLabel => 'カット編集';

  @override
  String get trimStartLabel => '開始';

  @override
  String get trimEndLabel => '終了';

  @override
  String get trimActiveTitle => 'カット編集有効';

  @override
  String get fullVideoDesc => 'カットせずに動画全体を処理。';

  @override
  String get audioModeTitle => '音声トラックモード';

  @override
  String get audioOriginalLabel => 'オリジナル保持';

  @override
  String get audioOriginalDesc => '音質劣化なし。';

  @override
  String get audioAac256Label => '高音質 (256k)';

  @override
  String get audioAac256Desc => 'AAC 256kbps';

  @override
  String get audioAac128Label => '標準 (128k)';

  @override
  String get audioAac128Desc => 'AAC 128kbps (Web標準)';

  @override
  String get audioAac64Label => '軽量 (64k)';

  @override
  String get audioAac64Desc => 'AAC 64kbps (音声向け)';

  @override
  String get audioMuteLabel => '消音 (ミュート)';

  @override
  String get audioMuteDesc => '音声トラックを削除。';

  @override
  String get audioNormTitle => '音量平坦化 (ノーマライズ)';

  @override
  String get audioNormOffLabel => 'オフ';

  @override
  String get audioNormOffDesc => '元の音量を維持。';

  @override
  String get audioNormSpeechLabel => '音声強調';

  @override
  String get audioNormSpeechDesc => 'EBU R128標準。';

  @override
  String get audioNormDynamicLabel => 'ダイナミック';

  @override
  String get audioNormDynamicDesc => '大小の音量を調整。';

  @override
  String get audioNormBoostLabel => 'ブースト';

  @override
  String get audioNormBoostDesc => '+3dB音量増幅。';

  @override
  String get audioChanTitle => '音声チャンネル';

  @override
  String get audioChanOriginalLabel => 'オリジナル';

  @override
  String get audioChanOriginalDesc => '元チャンネルを維持。';

  @override
  String get audioChanStereoLabel => 'ステレオ (2.0)';

  @override
  String get audioChanStereoDesc => '標準2チャンネル。';

  @override
  String get audioChanMonoLabel => 'モノラル (1.0)';

  @override
  String get audioChanMonoDesc => '1チャンネル化で50%節約。';

  @override
  String get removeNoiseLabel => 'ノイズ除去';

  @override
  String get enableAudioDenoiseTitle => 'マイク風切り音除去';

  @override
  String get enableAudioDenoiseDesc => '背景ノイズを低減。';

  @override
  String get outputDirectoryTitle => '保存先フォルダ';

  @override
  String get defaultOutputDirectory => 'デフォルト (元動画と同じ)';

  @override
  String get selectOutputFolderTitle => 'フォルダを選択';

  @override
  String get clearOutputFolder => 'デフォルトに戻す';

  @override
  String get changeBtn => '変更';

  @override
  String get outputLocationTitle => '保存動作';

  @override
  String get outputLocationUnifiedLabel => '統一フォルダ';

  @override
  String get outputLocationUnifiedDesc => 'すべて1つのフォルダに保存。';

  @override
  String get outputLocationSameLabel => '元動画の隣';

  @override
  String get outputLocationSameDesc => '各動画の隣に保存。';

  @override
  String get fileManagementTitle => 'ファイル管理';

  @override
  String get keepOriginalsLabel => '元ファイルを保持';

  @override
  String get keepOriginalsDesc => '元動画をそのまま残す。';

  @override
  String get toRecycleBinLabel => 'ゴミ箱へ移動';

  @override
  String get toRecycleBinDesc => '圧縮完了後ゴミ箱へ移動。';

  @override
  String get outputFormatTitle => 'コンテナフォーマット';

  @override
  String get formatOriginalLabel => 'オリジナル';

  @override
  String get formatOriginalDesc => '元の形式を維持。';

  @override
  String get formatMp4Label => 'MP4';

  @override
  String get formatMp4Desc => '万能な互換性。';

  @override
  String get formatMkvLabel => 'MKV';

  @override
  String get formatMkvDesc => '多重トラック対応。';

  @override
  String get formatMovLabel => 'MOV';

  @override
  String get formatMovDesc => 'Apple QuickTime形式。';

  @override
  String get scanningFilesMsg => 'ファイルをスキャン中...';

  @override
  String get addFilesBtn => 'ファイル追加';

  @override
  String get addFolderBtn => 'フォルダ追加';

  @override
  String get dragDropMoreMsg => 'または動画をドロップ';

  @override
  String get openOutputFolderTooltip => '保存先を開く';

  @override
  String get statusQueued => '待機中';

  @override
  String get statusAnalyzing => '解析中';

  @override
  String get statusCompressing => '圧縮中';

  @override
  String get statusDone => '完了';

  @override
  String get statusFailed => '失敗';

  @override
  String get statusCancelled => 'キャンセル';

  @override
  String get savedPrefix => '削減';

  @override
  String get largerSuffix => '増加';

  @override
  String get largerSizeWarning => '元のファイルより大きくなる可能性があります。';

  @override
  String get clearCompletedBtn => '完了項目を削除';

  @override
  String get clearAllBtn => 'すべて削除';

  @override
  String get stopAllBtn => 'すべて停止';

  @override
  String get startCompressionBtn => '圧縮開始';

  @override
  String get allDoneLabel => 'すべて完了！';

  @override
  String get openFolderBtn => 'フォルダを開く';

  @override
  String get totalEtaLabel => '残り時間';

  @override
  String get totalSavedLabel => '合計削減量';

  @override
  String get videoSingle => '本';

  @override
  String get videosPlural => '本';

  @override
  String get releaseToAddVideosMsg => 'ドロップして追加';

  @override
  String get dragDropHereMsg => 'ここにファイルをドロップ';

  @override
  String get supportedFormatsMsg => 'MP4, MKV, MOV, AVI, WMV対応';

  @override
  String get selectFilesBtn => 'ファイル選択';

  @override
  String get selectFolderBtn => 'フォルダ選択';

  @override
  String get releaseToShrinkTitle => 'ドロップして圧縮';

  @override
  String get filesWillBeAddedDesc => 'キューに追加されます。';

  @override
  String get disabledLabel => '無効';

  @override
  String get compressionInProgressTitle => '圧縮を実行中';

  @override
  String get confirmCloseDesc => 'Shrinkeoを終了しますか？';

  @override
  String get keepCompressingBtn => '圧縮を続ける';

  @override
  String get closeAppBtn => 'アプリを終了';

  @override
  String get lockedSettingsWarning => '圧縮中は変更不可';

  @override
  String get updateRequiredTitle => 'アップデートが必要';

  @override
  String get updateRequiredDescNewVersion => '新バージョンが利用可能です。';

  @override
  String get updateRequiredDescOldVersion => 'サポートが終了したバージョンです。';

  @override
  String get updateNowBtn => '今すぐ更新';

  @override
  String get laterBtn => '後で';

  @override
  String get updateAvailableTitle => 'アップデートあり';

  @override
  String get whatsNewTitle => '新機能:';

  @override
  String get exitAppBtn => '終了';

  @override
  String get retryBtn => '再試行';

  @override
  String get downloadFromWebsiteBtn => 'サイトからダウンロード';

  @override
  String get skipUpdateConfirmTitle => 'スキップしますか？';

  @override
  String get skipUpdateConfirmDesc => '重要な修正が含まれています。';

  @override
  String get skipUpdateCancelBtn => 'キャンセル';

  @override
  String get skipUpdateConfirmBtn => 'スキップ';

  @override
  String get maintenanceTitle => 'メンテナンス中';

  @override
  String get maintenanceDescDefault => '現在メンテナンス中です。';

  @override
  String versionAvailableMsg(String version) {
    return 'バージョン $version が利用可能です。';
  }

  @override
  String get hwEncoderNotSupportedTitle => 'アクセラレーション非対応';

  @override
  String get failedCreateFolderError => 'フォルダ作成失敗';

  @override
  String get failedProbeDurationError => '時間取得失敗';

  @override
  String get ffmpegNotFoundGlobalError => 'FFmpegが見つかりません。';

  @override
  String get ffmpegMissingError => 'FFmpegまたはFFprobeが存在しないか破損しています。';

  @override
  String hwFallbackNotificationBody(String encoderLabel) {
    return '$encoderLabel失敗。CPUへ切り替えました。';
  }

  @override
  String get failedDownloadUpdateMsg => 'アップデートのダウンロードに失敗しました。再試行してください。';

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
  String get tabImageSuite => '画像スイート';

  @override
  String get compressionModeTitle => '解像度・圧縮モード';

  @override
  String get smartAutoLabel => 'スマート自動';

  @override
  String get smartAutoDesc => '画質を維持しながら自動的にサイズを約60〜80%削減します。日常の画像最適化に最適です。';

  @override
  String get maxSavingsLabel => '最大削減';

  @override
  String get maxSavingsDesc => '最大85〜90%のサイズ削減を行う強力圧縮。Web投稿やメール添付に最適。';

  @override
  String get ultraFidelityLabel => '最高画質';

  @override
  String get ultraFidelityDesc => '最小限の圧縮で元の美しさを維持します。保存用や印刷用に最適。';

  @override
  String get targetImageFormatTitle => '出力画像フォーマット';

  @override
  String get dimensionResizingTitle => '画像サイズ変更';

  @override
  String get exifCameraPrivacyTitle => 'EXIF / カメラプライバシー';

  @override
  String get stripGpsCameraInfoLabel => 'GPS・カメラ情報を削除';

  @override
  String get intentCompressOnly => '圧縮のみ';

  @override
  String get intentCompressOnlyTooltip =>
      'ファイル サイズ (品質 % またはターゲット KB/MB) を削減することだけに重点を置きます。';

  @override
  String get intentEditConvertOnly => '編集/変換のみ';

  @override
  String get intentEditConvertOnlyTooltip =>
      '視覚的な品質を低下させることなく、サイズ変更、回転、トリミング、または形式の変換を行うことができます';

  @override
  String get intentCompressAndEdit => '圧縮と編集';

  @override
  String get intentCompressAndEditTooltip =>
      'フルコントロール: 編集、サイズ変更、回転し、ファイルサイズをまとめて圧縮します';

  @override
  String get imgFmtOriginalLabel => 'オリジナルフォーマット';

  @override
  String get imgFmtOriginalDesc => '元の形式を維持します (最速、変換なし)。';

  @override
  String get imgFmtPngLabel => 'PNG イメージ (.png)';

  @override
  String get imgFmtPngDesc => '透明度をサポートするロスレス PNG 形式。';

  @override
  String get imgFmtJpgLabel => 'JPEG画像(.jpg)';

  @override
  String get imgFmtJpgDesc => '普遍的な互換性を実現する標準の圧縮 JPEG 形式。';

  @override
  String get imgFmtWebpLabel => 'WebP Image (.webp)';

  @override
  String get imgFmtWebpDesc => '優れた圧縮率と小さいサイズを実現する最新の WebP 形式。';

  @override
  String get imgFmtAvifLabel => 'AVIF 画像 (.avif)';

  @override
  String get imgFmtAvifDesc => '超高圧縮効率の次世代AVIFフォーマット。';

  @override
  String get imgResOriginalLabel => '元の寸法';

  @override
  String get imgResOriginalDesc => '元の画像の幅と高さの寸法を維持します。';

  @override
  String get imgRes4kLabel => '4K最大(3840ピクセル)';

  @override
  String get imgRes4kDesc => '画像の最大寸法を 3840px (最大 4K) に縮小します。';

  @override
  String get imgRes1080pLabel => 'フル HD 最大 (1920px)';

  @override
  String get imgRes1080pDesc => '画像の最大サイズを 1920px (フル HD 最大) に縮小します。';

  @override
  String get imgRes720pLabel => 'HD マックス (1280 ピクセル)';

  @override
  String get imgRes720pDesc => '画像の最大サイズを 1280px (HD 最大) に縮小します。';

  @override
  String get imgRes480pLabel => 'SD最大(854ピクセル)';

  @override
  String get imgRes480pDesc => '画像の最大サイズを 854px (SD 最大) に縮小します。';

  @override
  String get keepMetadataImageInfoDesc => '元の画像の EXIF とカメラのメタデータを保持します。';

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
