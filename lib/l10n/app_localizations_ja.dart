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
}
