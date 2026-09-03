// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appName => 'Shrinkeo';

  @override
  String get totalSpaceSaved => 'Espaço total economizado';

  @override
  String get savedSpacePrefix => 'Economizado:';

  @override
  String get supportButtonText => 'Apoiar o projeto';

  @override
  String get lightThemeTooltip => 'Tema Claro';

  @override
  String get darkThemeTooltip => 'Tema Escuro';

  @override
  String get settingsTooltip => 'Configurações';

  @override
  String get minimizeTooltip => 'Minimizar';

  @override
  String get closeTooltip => 'Fechar';

  @override
  String get restoreTooltip => 'Restaurar';

  @override
  String get maximizeTooltip => 'Maximizar';

  @override
  String get tabCompressionQuality => 'Compressão e Qualidade';

  @override
  String get tabVideoEditingTools => 'Edição e Ferramentas';

  @override
  String get tabAudioSettings => 'Configurações de Áudio';

  @override
  String get tabEngineOutput => 'Motor e Destino';

  @override
  String get compressionSettingsTitle => 'Configurações de Compressão';

  @override
  String get resetToDefaults => 'Restaurar padrão';

  @override
  String get resetDefaultTooltip => 'Restaurar valores iniciais';

  @override
  String get modeTargetSizeTitle => 'Modo de Compressão';

  @override
  String get modeCrfLabel => 'Qualidade (CRF)';

  @override
  String get modeTargetSizeLabel => 'Tamanho Alvo (MB)';

  @override
  String get crfQualityTitle => 'Qualidade CRF';

  @override
  String get crfLossless => 'Sem perdas';

  @override
  String get crfHighQuality => 'Alta qualidade';

  @override
  String get crfBalanced => 'Equilibrado';

  @override
  String get crfHighCompression => 'Alta Compressão';

  @override
  String get crfLowQuality => 'Baixa qualidade';

  @override
  String get crfUltraCompressed => 'Ultracomprimido';

  @override
  String get targetSizeLabel => 'Tamanho do Arquivo Alvo (MB)';

  @override
  String get targetSizeDesc =>
      'Calcula a taxa de bits para caber no tamanho limite.';

  @override
  String get encodingSpeedTitle => 'Velocidade de Codificação';

  @override
  String get presetUltrafastLabel => 'Ultrarrápido';

  @override
  String get presetUltrafastDesc => 'Máxima velocidade, menor redução.';

  @override
  String get presetSuperfastLabel => 'Superrápido';

  @override
  String get presetSuperfastDesc => 'Codificação muito rápida.';

  @override
  String get presetVeryfastLabel => 'Muito Rápido';

  @override
  String get presetVeryfastDesc => 'Mais rápido que a média.';

  @override
  String get presetFasterLabel => 'Mais Rápido';

  @override
  String get presetFasterDesc => 'Boa velocidade e compressão.';

  @override
  String get presetFastLabel => 'Rápido';

  @override
  String get presetFastDesc => 'Excelente equilíbrio velocidade/tamanho.';

  @override
  String get presetMediumLabel => 'Médio';

  @override
  String get presetMediumDesc => 'Balanço padrão.';

  @override
  String get presetSlowLabel => 'Lento';

  @override
  String get presetSlowDesc => 'Mais lento mas arquivos menores.';

  @override
  String get presetVeryslowLabel => 'Muito Lento';

  @override
  String get presetVeryslowDesc => 'Máxima redução de tamanho.';

  @override
  String get videoCodecTitle => 'Codec de Vídeo';

  @override
  String get codecH264Label => 'H.264';

  @override
  String get codecH264Desc => 'Máxima compatibilidade.';

  @override
  String get codecH265Label => 'H.265 / HEVC';

  @override
  String get codecH265Desc => 'Melhor eficiência de compressão.';

  @override
  String get codecAv1Label => 'AV1';

  @override
  String get codecAv1Desc => 'Codec de última geração (30% menor que H.265).';

  @override
  String get hardwareEncoderTitle => 'Aceleração por Hardware (GPU)';

  @override
  String get hwSoftwareLabel => 'Software (CPU)';

  @override
  String get hwSoftwareDesc => 'Mais lento mas máxima compatibilidade.';

  @override
  String get hwNvidiaLabel => 'Nvidia (NVENC)';

  @override
  String get hwNvidiaDesc => 'Codificação ultrarrápida para GPUs Nvidia.';

  @override
  String get hwAmdLabel => 'AMD (AMF)';

  @override
  String get hwAmdDesc => 'Codificação ultrarrápida para GPUs AMD.';

  @override
  String get hwIntelLabel => 'Intel (QSV)';

  @override
  String get hwIntelDesc => 'Codificação ultrarrápida para GPUs Intel.';

  @override
  String get resolutionTitle => 'Resolução Máxima';

  @override
  String get resOriginalLabel => 'Original';

  @override
  String get resOriginalDesc => 'Manter resolução original.';

  @override
  String get res4kLabel => '4K';

  @override
  String get res4kDesc => 'Reduzir para max 4K.';

  @override
  String get res2kLabel => '2K';

  @override
  String get res2kDesc => 'Reduzir para max 2K.';

  @override
  String get res1080pLabel => '1080p';

  @override
  String get res1080pDesc => 'Reduzir para max 1080p Full HD.';

  @override
  String get res720pLabel => '720p';

  @override
  String get res720pDesc => 'Reduzir para max 720p HD.';

  @override
  String get res480pLabel => '480p';

  @override
  String get res480pDesc => 'Reduzir para max 480p.';

  @override
  String get res360pLabel => '360p';

  @override
  String get res360pDesc => 'Compressão máxima.';

  @override
  String get frameRateTitle => 'Taxa de Quadros (FPS)';

  @override
  String get fpsOriginalLabel => 'Original';

  @override
  String get fpsOriginalDesc => 'Mesmo FPS que a fonte.';

  @override
  String get fps60Label => '60 fps';

  @override
  String get fps60Desc => 'Ultra fluido para jogos ou esportes.';

  @override
  String get fps30Label => '30 fps';

  @override
  String get fps30Desc => 'Padrão para a maioria dos vídeos.';

  @override
  String get fps24Label => '24 fps';

  @override
  String get fps24Desc => 'Aspecto cinematográfico.';

  @override
  String get enableVideoDenoiseTitle => 'Remover Ruído do Vídeo';

  @override
  String get enableVideoDenoiseDesc => 'Filtro 3D para reduzir granulado.';

  @override
  String get exportFormatTitle => 'Formato de Exportação';

  @override
  String get exportVideoLabel => 'Vídeo Padrão';

  @override
  String get exportVideoDesc => 'Exportar para MP4/MKV/MOV';

  @override
  String get exportGifLabel => 'GIF Animado';

  @override
  String get exportGifDesc => 'Criar GIF animado de alta qualidade';

  @override
  String get exportMp3Label => 'Extrair MP3';

  @override
  String get exportMp3Desc => 'Extrair áudio como MP3 320kbps';

  @override
  String get exportAacLabel => 'Extrair AAC';

  @override
  String get exportAacDesc => 'Extrair áudio como AAC';

  @override
  String get exportWavLabel => 'Extrair WAV';

  @override
  String get exportWavDesc => 'Extrair áudio WAV sem compressão';

  @override
  String get privacyScrubbingTitle => 'Privacidade e GPS';

  @override
  String get keepMetadataLabel => 'Manter Dados';

  @override
  String get stripGpsExifLabel => 'Remover GPS/EXIF';

  @override
  String get stripGpsExifInfoTitle => 'Limpar Metadados';

  @override
  String get stripGpsExifInfoDesc =>
      'Remove dados da câmera e localização GPS.';

  @override
  String get keepMetadataInfoDesc => 'Preserva todos os metadados originais.';

  @override
  String get autoCropBlackBarsTitle => 'Recorte Automático';

  @override
  String get autoCropLabel => 'Recorte Auto';

  @override
  String get autoCropActiveTitle => 'Recorte Ativo';

  @override
  String get autoCropActiveDesc => 'Remove bordas pretas automaticamente.';

  @override
  String get autoCropDisabledDesc => 'Mantém bordas originais.';

  @override
  String get playbackSpeedTitle => 'Velocidade de Reprodução';

  @override
  String get speedOriginalLabel => '1.0x';

  @override
  String get speedOriginalDesc => 'Velocidade normal';

  @override
  String get speedSlow05Label => '0.5x Câmera Lenta';

  @override
  String get speedSlow05Desc => 'Reprodução na metade da velocidade';

  @override
  String get speedFast15Label => '1.5x';

  @override
  String get speedFast15Desc => 'Aceleração 1.5x';

  @override
  String get speedFast20Label => '2.0x Rápido';

  @override
  String get speedFast20Desc => 'Velocidade dupla';

  @override
  String get speedTimelapse40Label => '4.0x Timelapse';

  @override
  String get speedTimelapse40Desc => 'Velocidade 4x para acelerado';

  @override
  String get canvasAspectRatioTitle => 'Proporção da Tela';

  @override
  String get aspectOriginalLabel => 'Original';

  @override
  String get aspectOriginalDesc => 'Manter proporções originais';

  @override
  String get aspectShortsLabel => '9:16 Shorts';

  @override
  String get aspectShortsDesc => 'Para TikTok e Reels';

  @override
  String get aspectSquareLabel => '1:1 Quadrado';

  @override
  String get aspectSquareDesc => 'Para posts do Instagram';

  @override
  String get aspectPortraitLabel => '4:5 Retrato';

  @override
  String get aspectPortraitDesc => 'Para Instagram vertical';

  @override
  String get aspectWidescreenLabel => '16:9 Widescreen';

  @override
  String get aspectWidescreenDesc => 'Para YouTube e TV';

  @override
  String get aspectClassicLabel => '4:3 Clássico';

  @override
  String get aspectClassicDesc => 'Para telas clássicas';

  @override
  String get aspectCinemaLabel => '21:9 Cinema';

  @override
  String get aspectCinemaDesc => 'Para monitores ultrawide';

  @override
  String get aspectCustomLabel => 'Personalizado';

  @override
  String get aspectCustomDesc => 'Proporção de tela personalizada';

  @override
  String get customRatioTooltip => 'Ex: 16:10, 2:1';

  @override
  String get rotationFlipTitle => 'Rotação e Espelho';

  @override
  String get rotOriginalLabel => 'Original (0°)';

  @override
  String get rotOriginalDesc => 'Manter orientação original';

  @override
  String get rot90Label => '90° Direita';

  @override
  String get rot90Desc => 'Girar 90 graus à direita';

  @override
  String get rot180Label => '180° Inverter';

  @override
  String get rot180Desc => 'Girar de cabeça para baixo';

  @override
  String get rot270Label => '270° Esquerda';

  @override
  String get rot270Desc => 'Girar 90 graus à esquerda';

  @override
  String get rotFlipHLabel => 'Espelhar Horiz.';

  @override
  String get rotFlipHDesc => 'Refletir horizontalmente';

  @override
  String get rotFlipVLabel => 'Espelhar Vert.';

  @override
  String get rotFlipVDesc => 'Refletir verticalmente';

  @override
  String get rotCustomLabel => 'Ângulo Personalizado';

  @override
  String get rotCustomDesc => 'Girar por ângulo específico';

  @override
  String get customRotationTooltip => 'Ângulo em graus ex. 45';

  @override
  String get trimVideoTitle => 'Cortar Vídeo';

  @override
  String get fullVideoLabel => 'Vídeo Completo';

  @override
  String get cutClipLabel => 'Cortar Trecho';

  @override
  String get trimStartLabel => 'Início';

  @override
  String get trimEndLabel => 'Fim';

  @override
  String get trimActiveTitle => 'Corte Ativo';

  @override
  String get fullVideoDesc => 'Processar o vídeo completo sem cortar.';

  @override
  String get audioModeTitle => 'Modo de Faixa de Áudio';

  @override
  String get audioOriginalLabel => 'Original';

  @override
  String get audioOriginalDesc => 'Sem perda de qualidade de áudio.';

  @override
  String get audioAac256Label => 'Alta Qualidade';

  @override
  String get audioAac256Desc => 'AAC 256kbps';

  @override
  String get audioAac128Label => 'Equilibrado';

  @override
  String get audioAac128Desc => 'AAC 128kbps (Padrão Web)';

  @override
  String get audioAac64Label => 'Baixa Qualidade';

  @override
  String get audioAac64Desc => 'AAC 64kbps para voz';

  @override
  String get audioMuteLabel => 'Silenciar Áudio';

  @override
  String get audioMuteDesc => 'Remover faixa de áudio completamente.';

  @override
  String get audioNormTitle => 'Normalização de Volume';

  @override
  String get audioNormOffLabel => 'Desativado';

  @override
  String get audioNormOffDesc => 'Volume dinâmico original.';

  @override
  String get audioNormSpeechLabel => 'Voz Humana';

  @override
  String get audioNormSpeechDesc => 'EBU R128 para diálogos claros.';

  @override
  String get audioNormDynamicLabel => 'Cinema Dinâmico';

  @override
  String get audioNormDynamicDesc => 'Suaviza cenas silenciosas e barulhentas.';

  @override
  String get audioNormBoostLabel => 'Aumento Leve';

  @override
  String get audioNormBoostDesc => '+3dB de ganho de volume.';

  @override
  String get audioChanTitle => 'Canais de Áudio';

  @override
  String get audioChanOriginalLabel => 'Original';

  @override
  String get audioChanOriginalDesc => 'Preservar canais de origem.';

  @override
  String get audioChanStereoLabel => 'Estéreo (2.0)';

  @override
  String get audioChanStereoDesc => 'Compatibilidade estéreo 2 canais.';

  @override
  String get audioChanMonoLabel => 'Mono (1.0)';

  @override
  String get audioChanMonoDesc => 'Canal único - 50% de economia de áudio.';

  @override
  String get removeNoiseLabel => 'Remover Ruído';

  @override
  String get enableAudioDenoiseTitle => 'Remover Ruído do Microfone';

  @override
  String get enableAudioDenoiseDesc => 'Filtro para eliminar chiado de fundo.';

  @override
  String get outputDirectoryTitle => 'Pasta de Destino';

  @override
  String get defaultOutputDirectory => 'Padrão (Ao lado do original)';

  @override
  String get selectOutputFolderTitle => 'Selecionar Pasta';

  @override
  String get clearOutputFolder => 'Usar local padrão';

  @override
  String get changeBtn => 'Alterar';

  @override
  String get outputLocationTitle => 'Comportamento de Destino';

  @override
  String get outputLocationUnifiedLabel => 'Pasta Única';

  @override
  String get outputLocationUnifiedDesc =>
      'Todos os vídeos comprimidos em uma pasta.';

  @override
  String get outputLocationSameLabel => 'Ao Lado do Original';

  @override
  String get outputLocationSameDesc =>
      'Cada vídeo ao lado de seu arquivo fonte.';

  @override
  String get fileManagementTitle => 'Gerenciamento de Arquivos';

  @override
  String get keepOriginalsLabel => 'Manter Originais';

  @override
  String get keepOriginalsDesc => 'Deixar arquivos originais intactos.';

  @override
  String get toRecycleBinLabel => 'Para a Lixeira';

  @override
  String get toRecycleBinDesc => 'Mover originais para lixeira após comprimir.';

  @override
  String get outputFormatTitle => 'Formato do Contêiner';

  @override
  String get formatOriginalLabel => 'Original';

  @override
  String get formatOriginalDesc => 'Manter formato original.';

  @override
  String get formatMp4Label => 'MP4';

  @override
  String get formatMp4Desc => 'Máxima compatibilidade.';

  @override
  String get formatMkvLabel => 'MKV';

  @override
  String get formatMkvDesc => 'Suporte a múltiplas faixas.';

  @override
  String get formatMovLabel => 'MOV';

  @override
  String get formatMovDesc => 'Formato Apple QuickTime.';

  @override
  String get scanningFilesMsg => 'Escaneando arquivos...';

  @override
  String get addFilesBtn => 'Adicionar Arquivos';

  @override
  String get addFolderBtn => 'Adicionar Pasta';

  @override
  String get dragDropMoreMsg => 'Ou arraste mais arquivos em qualquer lugar';

  @override
  String get openOutputFolderTooltip => 'Abrir Pasta de Destino';

  @override
  String get statusQueued => 'Na fila';

  @override
  String get statusAnalyzing => 'Analisando';

  @override
  String get statusCompressing => 'Comprimindo';

  @override
  String get statusDone => 'Concluído';

  @override
  String get statusFailed => 'Falhou';

  @override
  String get statusCancelled => 'Cancelado';

  @override
  String get savedPrefix => 'Economizado';

  @override
  String get largerSuffix => 'Maior';

  @override
  String get largerSizeWarning =>
      'O tamanho final pode ser maior que o original.';

  @override
  String get clearCompletedBtn => 'Limpar Concluídos';

  @override
  String get clearAllBtn => 'Limpar Tudo';

  @override
  String get stopAllBtn => 'Parar Tudo';

  @override
  String get startCompressionBtn => 'Iniciar Compressão';

  @override
  String get allDoneLabel => 'Tudo Pronto!';

  @override
  String get openFolderBtn => 'Abrir Pasta';

  @override
  String get totalEtaLabel => 'Tempo Restante';

  @override
  String get totalSavedLabel => 'Total Economizado';

  @override
  String get videoSingle => 'vídeo';

  @override
  String get videosPlural => 'vídeos';

  @override
  String get fileSingle => 'arquivo';

  @override
  String get filesPlural => 'arquivos';

  @override
  String get releaseToAddVideosMsg => 'Solte para adicionar arquivos';

  @override
  String get dragDropHereMsg => 'Arraste e solte vídeos ou imagens aqui';

  @override
  String get supportedFormatsMsg =>
      'Suporta MP4, MKV, MOV, AVI, WMV, WebM • PNG, JPG, WebP, AVIF e mais';

  @override
  String get selectFilesBtn => 'Selecionar Arquivos';

  @override
  String get selectFolderBtn => 'Selecionar Pasta';

  @override
  String get releaseToShrinkTitle => 'Solte para comprimir';

  @override
  String get filesWillBeAddedDesc => 'Seus arquivos serão adicionados à fila.';

  @override
  String get disabledLabel => 'Desativado';

  @override
  String get compressionInProgressTitle => 'Compressão em andamento';

  @override
  String get confirmCloseDesc => 'Tem certeza que deseja fechar o Shrinkeo?';

  @override
  String get keepCompressingBtn => 'Continuar Comprimindo';

  @override
  String get closeAppBtn => 'Fechar Aplicativo';

  @override
  String get lockedSettingsWarning => 'Bloqueado durante compressão';

  @override
  String get updateRequiredTitle => 'Atualização Necessária';

  @override
  String get updateRequiredDescNewVersion => 'Nova versão disponível.';

  @override
  String get updateRequiredDescOldVersion => 'Sua versão não é mais suportada.';

  @override
  String get updateNowBtn => 'Atualizar Agora';

  @override
  String get laterBtn => 'Mais tarde';

  @override
  String get updateAvailableTitle => 'Atualização Disponível';

  @override
  String get whatsNewTitle => 'Novidades:';

  @override
  String get exitAppBtn => 'Sair';

  @override
  String get retryBtn => 'Tentar Novamente';

  @override
  String get downloadFromWebsiteBtn => 'Baixar no Site';

  @override
  String get skipUpdateConfirmTitle => 'Ignorar atualização?';

  @override
  String get skipUpdateConfirmDesc =>
      'Esta atualização contém correções críticas.';

  @override
  String get skipUpdateCancelBtn => 'Cancelar';

  @override
  String get skipUpdateConfirmBtn => 'Ignorar atualização';

  @override
  String get maintenanceTitle => 'Manutenção';

  @override
  String get maintenanceDescDefault => 'Shrinkeo está em manutenção.';

  @override
  String versionAvailableMsg(String version) {
    return 'Versão $version disponível.';
  }

  @override
  String get hwEncoderNotSupportedTitle => 'Aceleração não suportada';

  @override
  String get failedCreateFolderError => 'Falha ao criar pasta';

  @override
  String get failedProbeDurationError => 'Falha ao obter duração';

  @override
  String get ffmpegNotFoundGlobalError => 'FFmpeg não encontrado.';

  @override
  String get ffmpegMissingError => 'FFmpeg ou FFprobe ausente ou corrompido.';

  @override
  String hwFallbackNotificationBody(String encoderLabel) {
    return '$encoderLabel falhou. Alterado para CPU.';
  }

  @override
  String get failedDownloadUpdateMsg =>
      'Falha ao baixar a atualização. Tente novamente.';

  @override
  String customRatioActiveTitle(Object ratio) {
    return 'Proporção personalizada ($ratio)';
  }

  @override
  String customRatioActiveDesc(Object ratio) {
    return 'Enquadramento adaptado à proporção personalizada ($ratio).';
  }

  @override
  String customAngleActiveTitle(Object angle) {
    return 'Ângulo personalizado ($angle°)';
  }

  @override
  String customAngleActiveDesc(Object angle) {
    return 'Gira o vídeo em um ângulo personalizado de $angle°.';
  }

  @override
  String trimActiveDesc(Object end, Object start) {
    return 'Corta o vídeo de $start até $end.';
  }

  @override
  String targetSizeLimitLabel(Object size) {
    return 'Limite de $size MB';
  }

  @override
  String get customMbSizeTooltip => 'Digite o tamanho em MB';

  @override
  String get trimTimeTooltip =>
      'Digite o tempo ex: 5 (5s), 1:30 (1m30s), ou 00:01:30';

  @override
  String get tabImageSuite => 'Suíte de Imagens';

  @override
  String get compressionModeTitle => 'Modo de Compressão';

  @override
  String get smartAutoLabel => 'Auto Inteligente';

  @override
  String get smartAutoDesc =>
      'Reduz automaticamente o tamanho em ~60-80% com 100% de clareza. Perfeito para fotos diárias.';

  @override
  String get maxSavingsLabel => 'Economia Máxima';

  @override
  String get maxSavingsDesc =>
      'Compressão agressiva economizando até 85-90%. Ideal para envio rápido e anexos.';

  @override
  String get ultraFidelityLabel => 'Ultra Fidelidade';

  @override
  String get ultraFidelityDesc =>
      'Preserva a qualidade original com compressão mínima. Ideal para arquivos e impressão.';

  @override
  String get targetImageFormatTitle => 'Formato de Imagem de Destino';

  @override
  String get dimensionResizingTitle => 'Redimensionamento';

  @override
  String get exifCameraPrivacyTitle => 'Privacidade EXIF / Câmera';

  @override
  String get stripGpsCameraInfoLabel => 'Remover GPS e Info da Câmera';

  @override
  String get imgFmtOriginalLabel => 'Formato Original';

  @override
  String get imgFmtOriginalDesc =>
      'Mantenha o formato original (mais rápido, sem conversão).';

  @override
  String get imgFmtPngLabel => 'Imagem PNG (.png)';

  @override
  String get imgFmtPngDesc =>
      'Formato PNG sem perdas com suporte para transparência.';

  @override
  String get imgFmtJpgLabel => 'Imagem JPEG (.jpg)';

  @override
  String get imgFmtJpgDesc =>
      'Formato JPEG compactado padrão para compatibilidade universal.';

  @override
  String get imgFmtWebpLabel => 'Imagem WebP (.webp)';

  @override
  String get imgFmtWebpDesc =>
      'Formato WebP moderno que oferece compactação superior e tamanho pequeno.';

  @override
  String get imgFmtAvifLabel => 'Imagem AVIF (.avif)';

  @override
  String get imgFmtAvifDesc =>
      'Formato AVIF de última geração com eficiência de compactação ultra-alta.';

  @override
  String get imgResOriginalLabel => 'Dimensões Originais';

  @override
  String get imgResOriginalDesc =>
      'Mantenha as dimensões originais de largura e altura da imagem.';

  @override
  String get imgRes4kLabel => '4K máx. (3840px)';

  @override
  String get imgRes4kDesc =>
      'Reduza a dimensão máxima da imagem para 3840px (máximo de 4K).';

  @override
  String get imgRes1080pLabel => 'Full HD máximo (1920px)';

  @override
  String get imgRes1080pDesc =>
      'Reduza a dimensão máxima da imagem para 1920px (Full HD máx.).';

  @override
  String get imgRes720pLabel => 'HD máximo (1280px)';

  @override
  String get imgRes720pDesc =>
      'Reduza a dimensão máxima da imagem para 1280px (HD máx.).';

  @override
  String get imgRes480pLabel => 'SD máximo (854px)';

  @override
  String get imgRes480pDesc =>
      'Reduza a dimensão máxima da imagem para 854px (SD máx.).';

  @override
  String get keepMetadataImageInfoDesc =>
      'Preserva os metadados EXIF e as informações da câmera originais.';

  @override
  String get imageQualityModeLabel => 'Nível de qualidade';

  @override
  String get imageQualityModeDesc =>
      'Codifica com nível de qualidade fixo — qualidade maior significa arquivos maiores.';

  @override
  String get imageTargetSizeModeLabel => 'Tamanho alvo';

  @override
  String get imageTargetSizeModeDesc =>
      'Encontra automaticamente a qualidade mais alta que cabe no limite de tamanho.';

  @override
  String get imageQualitySliderTitle => 'Qualidade da imagem';

  @override
  String get imageTargetSizeTitle => 'Tamanho de arquivo alvo';

  @override
  String get imageTargetSizeDesc =>
      'Codifica repetidamente com qualidade decrescente até o arquivo caber no limite. Limites muito pequenos podem reduzir a qualidade.';

  @override
  String imageTargetSizeLimitLabel(String size) {
    return 'Limite $size';
  }

  @override
  String get customKbSizeTooltip => 'Digite um tamanho personalizado em KB';

  @override
  String get imageProcessingFailedError => 'Falha no processamento da imagem';

  @override
  String get imageProcessingErrorMsg => 'Erro no processamento da imagem';

  @override
  String get cleanNoiseLabel => 'Redução de ruído';

  @override
  String get outputLargerTooltip =>
      'O resultado será maior que o original!\nPare e redefina para os padrões.';

  @override
  String get estimatedSizePrefix => 'Est:';

  @override
  String get cancelBtnTooltip => 'Cancelar';

  @override
  String get removeBtnTooltip => 'Remover';

  @override
  String get selectLanguageTitle => 'Selecionar idioma';

  @override
  String get searchLanguageHint => 'Pesquisar idioma por nome ou código...';

  @override
  String get noLanguagesMatchSearch =>
      'Nenhum idioma corresponde à sua pesquisa.';

  @override
  String get languageTooltip => 'Idioma';

  @override
  String get notifyCompressionCompleteTitle =>
      'Compressão do Shrinkeo concluída';

  @override
  String get notifyOutputLargerTitle => 'Resultado maior que o original';

  @override
  String languagesCountLabel(String count) {
    return '$count idiomas';
  }

  @override
  String notifyCompressionCompleteSuccess(String success) {
    return '$success arquivos comprimidos com sucesso.';
  }

  @override
  String notifyCompressionCompleteFailed(String failed) {
    return ' ($failed com falha)';
  }

  @override
  String notifyOutputLargerDesc(String fileName) {
    return 'Espera-se que $fileName seja maior que o original. Considere cancelar e redefinir.';
  }
}
