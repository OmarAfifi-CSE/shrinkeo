// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appName => 'Shrinkeo';

  @override
  String get totalSpaceSaved => 'Espacio total ahorrado';

  @override
  String get savedSpacePrefix => 'Ahorrado:';

  @override
  String get supportButtonText => 'Apoyar el proyecto';

  @override
  String get lightThemeTooltip => 'Tema Claro';

  @override
  String get darkThemeTooltip => 'Tema Oscuro';

  @override
  String get settingsTooltip => 'Ajustes';

  @override
  String get minimizeTooltip => 'Minimizar';

  @override
  String get closeTooltip => 'Cerrar';

  @override
  String get restoreTooltip => 'Restaurar';

  @override
  String get maximizeTooltip => 'Maximizar';

  @override
  String get tabCompressionQuality => 'Compresión y Calidad';

  @override
  String get tabVideoEditingTools => 'Edición y Herramientas';

  @override
  String get tabAudioSettings => 'Ajustes de Audio';

  @override
  String get tabEngineOutput => 'Motor y Salida';

  @override
  String get compressionSettingsTitle => 'Ajustes de Compresión';

  @override
  String get resetToDefaults => 'Restablecer por defecto';

  @override
  String get resetDefaultTooltip => 'Restablecer a valores iniciales';

  @override
  String get modeTargetSizeTitle => 'Modo de Compresión';

  @override
  String get modeCrfLabel => 'Calidad (CRF)';

  @override
  String get modeTargetSizeLabel => 'Tamaño Objetivo (MB)';

  @override
  String get crfQualityTitle => 'Calidad CRF (Factor de Tasa Constante)';

  @override
  String get targetSizeLabel => 'Tamaño Objetivo del Archivo (MB)';

  @override
  String get targetSizeDesc =>
      'Calcula la tasa de bits para ajustarse al tamaño límite (Mínimo: 1 MB).';

  @override
  String get encodingSpeedTitle => 'Velocidad de Codificación';

  @override
  String get presetUltrafastLabel => 'Ultrarrápido';

  @override
  String get presetUltrafastDesc =>
      'Máxima velocidad pero menor reducción de tamaño.';

  @override
  String get presetSuperfastLabel => 'Superrápido';

  @override
  String get presetSuperfastDesc =>
      'Codificación muy rápida con eficiencia moderada.';

  @override
  String get presetVeryfastLabel => 'Muy Rápido';

  @override
  String get presetVeryfastDesc =>
      'Más rápido que el promedio con buena reducción.';

  @override
  String get presetFasterLabel => 'Más Rápido';

  @override
  String get presetFasterDesc =>
      'Buen equilibrio con buena compresión general.';

  @override
  String get presetFastLabel => 'Rápido';

  @override
  String get presetFastDesc =>
      'Excelente equilibrio entre velocidad y reducción.';

  @override
  String get presetMediumLabel => 'Medio';

  @override
  String get presetMediumDesc => 'Equilibrio predeterminado.';

  @override
  String get presetSlowLabel => 'Lento';

  @override
  String get presetSlowDesc =>
      'Más lento pero produce archivos significativamente más pequeños.';

  @override
  String get presetVeryslowLabel => 'Muy Lento';

  @override
  String get presetVeryslowDesc =>
      'Toma más tiempo pero garantiza máxima compresión.';

  @override
  String get videoCodecTitle => 'Códec de Video';

  @override
  String get codecH264Label => 'H.264';

  @override
  String get codecH264Desc =>
      'Máxima compatibilidad con dispositivos antiguos.';

  @override
  String get codecH265Label => 'H.265 / HEVC';

  @override
  String get codecH265Desc => 'Mayor eficiencia de compresión.';

  @override
  String get codecAv1Label => 'AV1';

  @override
  String get codecAv1Desc =>
      'Códec de última generación (30% más eficiente que H.265).';

  @override
  String get hardwareEncoderTitle => 'Aceleración por Hardware (GPU)';

  @override
  String get hwSoftwareLabel => 'Software (CPU)';

  @override
  String get hwSoftwareDesc => 'Más lento pero máxima compatibilidad.';

  @override
  String get hwNvidiaLabel => 'Nvidia (NVENC)';

  @override
  String get hwNvidiaDesc => 'Codificación ultrarrápida para GPUs Nvidia.';

  @override
  String get hwAmdLabel => 'AMD (AMF)';

  @override
  String get hwAmdDesc => 'Codificación ultrarrápida para GPUs AMD.';

  @override
  String get hwIntelLabel => 'Intel (QSV)';

  @override
  String get hwIntelDesc => 'Codificación ultrarrápida para GPUs Intel.';

  @override
  String get resolutionTitle => 'Resolución Máxima';

  @override
  String get resOriginalLabel => 'Original';

  @override
  String get resOriginalDesc => 'Mantener resolución original.';

  @override
  String get res4kLabel => '4K';

  @override
  String get res4kDesc => 'Reducir a máximo 4K.';

  @override
  String get res2kLabel => '2K';

  @override
  String get res2kDesc => 'Reducir a máximo 2K.';

  @override
  String get res1080pLabel => '1080p';

  @override
  String get res1080pDesc => 'Reducir a máximo 1080p Full HD.';

  @override
  String get res720pLabel => '720p';

  @override
  String get res720pDesc => 'Reducir a máximo 720p HD.';

  @override
  String get res480pLabel => '480p';

  @override
  String get res480pDesc => 'Reducir a máximo 480p.';

  @override
  String get res360pLabel => '360p';

  @override
  String get res360pDesc => 'Máxima compresión.';

  @override
  String get frameRateTitle => 'Tasa de Fotogramas (FPS)';

  @override
  String get fpsOriginalLabel => 'Original';

  @override
  String get fpsOriginalDesc => 'Mantener FPS original.';

  @override
  String get fps60Label => '60 fps';

  @override
  String get fps60Desc => 'Movimiento ultranítido.';

  @override
  String get fps30Label => '30 fps';

  @override
  String get fps30Desc => 'Estándar para la mayoría de videos.';

  @override
  String get fps24Label => '24 fps';

  @override
  String get fps24Desc => 'Aspecto cinematográfico.';

  @override
  String get enableVideoDenoiseTitle => 'Limpieza de Ruido de Video';

  @override
  String get enableVideoDenoiseDesc =>
      'Filtro 3D para eliminar grano y mejorar la compresión.';

  @override
  String get exportFormatTitle => 'Formato de Exportación';

  @override
  String get exportVideoLabel => 'Video Estándar';

  @override
  String get exportVideoDesc => 'Exportar como MP4/MKV/MOV';

  @override
  String get exportGifLabel => 'GIF Animado';

  @override
  String get exportGifDesc => 'Crear GIF animado de alta calidad';

  @override
  String get exportMp3Label => 'Extraer MP3';

  @override
  String get exportMp3Desc => 'Extraer audio como MP3 320kbps';

  @override
  String get exportAacLabel => 'Extraer AAC';

  @override
  String get exportAacDesc => 'Extraer audio como AAC';

  @override
  String get exportWavLabel => 'Extraer WAV';

  @override
  String get exportWavDesc => 'Extraer audio sin compresión WAV';

  @override
  String get privacyScrubbingTitle => 'Privacidad y GPS';

  @override
  String get keepMetadataLabel => 'Mantener Datos';

  @override
  String get stripGpsExifLabel => 'Eliminar GPS/EXIF';

  @override
  String get stripGpsExifInfoTitle => 'Limpiar Metadatos';

  @override
  String get stripGpsExifInfoDesc =>
      'Elimina información de cámara y ubicación GPS.';

  @override
  String get keepMetadataInfoDesc => 'Conserva todos los metadatos originales.';

  @override
  String get autoCropBlackBarsTitle => 'Recorte Automático';

  @override
  String get autoCropLabel => 'Recorte Auto';

  @override
  String get autoCropActiveTitle => 'Recorte Activo';

  @override
  String get autoCropActiveDesc => 'Elimina franjas negras automáticamente.';

  @override
  String get autoCropDisabledDesc => 'Mantiene los bordes originales.';

  @override
  String get playbackSpeedTitle => 'Velocidad de Reproducción';

  @override
  String get speedOriginalLabel => '1.0x';

  @override
  String get speedOriginalDesc => 'Velocidad normal';

  @override
  String get speedSlow05Label => '0.5x Lento';

  @override
  String get speedSlow05Desc => 'Reproducción a mitad de velocidad';

  @override
  String get speedFast15Label => '1.5x';

  @override
  String get speedFast15Desc => 'Aceleración ligera 1.5x';

  @override
  String get speedFast20Label => '2.0x Rápido';

  @override
  String get speedFast20Desc => 'Doble velocidad';

  @override
  String get speedTimelapse40Label => '4.0x Rápido';

  @override
  String get speedTimelapse40Desc => 'Velocidad 4x para cámara rápida';

  @override
  String get canvasAspectRatioTitle => 'Relación de Aspecto';

  @override
  String get aspectOriginalLabel => 'Original';

  @override
  String get aspectOriginalDesc => 'Mantener proporciones originales';

  @override
  String get aspectShortsLabel => '9:16 Shorts';

  @override
  String get aspectShortsDesc => 'Para TikTok y Reels';

  @override
  String get aspectSquareLabel => '1:1 Cuadrado';

  @override
  String get aspectSquareDesc => 'Para publicaciones de Instagram';

  @override
  String get aspectPortraitLabel => '4:5 Retrato';

  @override
  String get aspectPortraitDesc => 'Para Instagram vertical';

  @override
  String get aspectWidescreenLabel => '16:9 Panorámico';

  @override
  String get aspectWidescreenDesc => 'Para YouTube y pantallas TV';

  @override
  String get aspectClassicLabel => '4:3 Clásico';

  @override
  String get aspectClassicDesc => 'Para pantallas clásicas';

  @override
  String get aspectCinemaLabel => '21:9 Cine';

  @override
  String get aspectCinemaDesc => 'Para monitores ultrawide';

  @override
  String get aspectCustomLabel => 'Personalizado';

  @override
  String get aspectCustomDesc => 'Relación de aspecto personalizada';

  @override
  String get customRatioTooltip => 'Ejemplo: 16:10, 2:1';

  @override
  String get rotationFlipTitle => 'Rotación y Espejo';

  @override
  String get rotOriginalLabel => 'Original (0°)';

  @override
  String get rotOriginalDesc => 'Mantener orientación original';

  @override
  String get rot90Label => '90° Horario';

  @override
  String get rot90Desc => 'Rotar 90 grados a la derecha';

  @override
  String get rot180Label => '180° Invertir';

  @override
  String get rot180Desc => 'Girar de cabeza';

  @override
  String get rot270Label => '270° Horario';

  @override
  String get rot270Desc => 'Rotar 90 grados a la izquierda';

  @override
  String get rotFlipHLabel => 'Voltear H';

  @override
  String get rotFlipHDesc => 'Reflejar horizontalmente';

  @override
  String get rotFlipVLabel => 'Voltear V';

  @override
  String get rotFlipVDesc => 'Reflejar verticalmente';

  @override
  String get rotCustomLabel => 'Ángulo Personalizado';

  @override
  String get rotCustomDesc => 'Rotar por ángulo específico';

  @override
  String get customRotationTooltip => 'Ángulo en grados ej. 45, 30';

  @override
  String get trimVideoTitle => 'Recortar Video';

  @override
  String get fullVideoLabel => 'Video Completo';

  @override
  String get cutClipLabel => 'Cortar Clip';

  @override
  String get trimStartLabel => 'Inicio';

  @override
  String get trimEndLabel => 'Fin';

  @override
  String get trimActiveTitle => 'Corte Activo';

  @override
  String get fullVideoDesc => 'Procesar el video completo sin recortar.';

  @override
  String get audioModeTitle => 'Modo de Pista de Audio';

  @override
  String get audioOriginalLabel => 'Original';

  @override
  String get audioOriginalDesc => 'Sin pérdida de calidad de audio.';

  @override
  String get audioAac256Label => 'Alta Calidad';

  @override
  String get audioAac256Desc => 'AAC 256kbps';

  @override
  String get audioAac128Label => 'Equilibrado';

  @override
  String get audioAac128Desc => 'AAC 128kbps (Estándar Web)';

  @override
  String get audioAac64Label => 'Baja Calidad';

  @override
  String get audioAac64Desc => 'AAC 64kbps para voz';

  @override
  String get audioMuteLabel => 'Silenciar Audio';

  @override
  String get audioMuteDesc => 'Eliminar pista de audio por completo.';

  @override
  String get audioNormTitle => 'Normalización de Volumen';

  @override
  String get audioNormOffLabel => 'Apagado';

  @override
  String get audioNormOffDesc => 'Volumen dinámico original.';

  @override
  String get audioNormSpeechLabel => 'Voz Humana';

  @override
  String get audioNormSpeechDesc => 'EBU R128 para diálogos claros.';

  @override
  String get audioNormDynamicLabel => 'Cine Dinámico';

  @override
  String get audioNormDynamicDesc => 'Suaviza escenas silenciosas y ruidosas.';

  @override
  String get audioNormBoostLabel => 'Aumento Suave';

  @override
  String get audioNormBoostDesc => '+3dB de ganancia de volumen.';

  @override
  String get audioChanTitle => 'Canales de Audio';

  @override
  String get audioChanOriginalLabel => 'Original';

  @override
  String get audioChanOriginalDesc => 'Preservar canales de origen.';

  @override
  String get audioChanStereoLabel => 'Estéreo (2.0)';

  @override
  String get audioChanStereoDesc => 'Compatibilidad de 2 canales.';

  @override
  String get audioChanMonoLabel => 'Mono (1.0)';

  @override
  String get audioChanMonoDesc => 'Canal único - 50% de ahorro de audio.';

  @override
  String get removeNoiseLabel => 'Eliminar Ruido';

  @override
  String get enableAudioDenoiseTitle => 'Eliminar Ruido de Micrófono';

  @override
  String get enableAudioDenoiseDesc =>
      'Filtro para eliminar zumbidos de fondo.';

  @override
  String get outputDirectoryTitle => 'Directorio de Salida';

  @override
  String get defaultOutputDirectory => 'Predeterminado (Junto al original)';

  @override
  String get selectOutputFolderTitle => 'Seleccionar Carpeta';

  @override
  String get clearOutputFolder => 'Usar ubicación predeterminada';

  @override
  String get changeBtn => 'Cambiar';

  @override
  String get outputLocationTitle => 'Comportamiento de Salida';

  @override
  String get outputLocationUnifiedLabel => 'Carpeta Única';

  @override
  String get outputLocationUnifiedDesc =>
      'Todos los videos comprimidos en una sola carpeta.';

  @override
  String get outputLocationSameLabel => 'Junto al Original';

  @override
  String get outputLocationSameDesc =>
      'Cada video en una subcarpeta junto a su origen.';

  @override
  String get fileManagementTitle => 'Gestión de Archivos';

  @override
  String get keepOriginalsLabel => 'Conservar Originales';

  @override
  String get keepOriginalsDesc => 'Mantener los archivos originales intactos.';

  @override
  String get toRecycleBinLabel => 'A la Papelera';

  @override
  String get toRecycleBinDesc =>
      'Mover los originales a la papelera tras comprimir.';

  @override
  String get outputFormatTitle => 'Formato de Contenedor';

  @override
  String get formatOriginalLabel => 'Original';

  @override
  String get formatOriginalDesc => 'Mantener formato original.';

  @override
  String get formatMp4Label => 'MP4';

  @override
  String get formatMp4Desc => 'Máxima compatibilidad.';

  @override
  String get formatMkvLabel => 'MKV';

  @override
  String get formatMkvDesc => 'Soporte para múltiples pistas.';

  @override
  String get formatMovLabel => 'MOV';

  @override
  String get formatMovDesc => 'Formato QuickTime de Apple.';

  @override
  String get scanningFilesMsg =>
      'Escaneando archivos... Esto puede tomar un momento.';

  @override
  String get addFilesBtn => 'Añadir Archivos';

  @override
  String get addFolderBtn => 'Añadir Carpeta';

  @override
  String get dragDropMoreMsg => 'O arrastra y suelta más videos aquí';

  @override
  String get openOutputFolderTooltip => 'Abrir Carpeta de Salida';

  @override
  String get statusQueued => 'En cola';

  @override
  String get statusAnalyzing => 'Analizando';

  @override
  String get statusCompressing => 'Comprimiendo';

  @override
  String get statusDone => 'Listo';

  @override
  String get statusFailed => 'Fallido';

  @override
  String get statusCancelled => 'Cancelado';

  @override
  String get savedPrefix => 'Ahorrado';

  @override
  String get largerSuffix => 'Más grande';

  @override
  String get largerSizeWarning =>
      'El tamaño de salida puede ser más grande que el original.';

  @override
  String get clearCompletedBtn => 'Limpiar Completados';

  @override
  String get clearAllBtn => 'Limpiar Todo';

  @override
  String get stopAllBtn => 'Detener Todo';

  @override
  String get startCompressionBtn => 'Iniciar Compresión';

  @override
  String get allDoneLabel => '¡Todo Listo!';

  @override
  String get openFolderBtn => 'Abrir Carpeta';

  @override
  String get totalEtaLabel => 'Tiempo Restante';

  @override
  String get totalSavedLabel => 'Total Ahorrado';

  @override
  String get videoSingle => 'video';

  @override
  String get videosPlural => 'videos';

  @override
  String get releaseToAddVideosMsg => 'Suela para añadir videos';

  @override
  String get dragDropHereMsg => 'Arrastra y suelta archivos o carpetas aquí';

  @override
  String get supportedFormatsMsg => 'Soporta MP4, MKV, MOV, AVI, WMV';

  @override
  String get selectFilesBtn => 'Seleccionar Archivos';

  @override
  String get selectFolderBtn => 'Seleccionar Carpeta';

  @override
  String get releaseToShrinkTitle => 'Suelta para comprimir';

  @override
  String get filesWillBeAddedDesc => 'Tus archivos serán añadidos a la cola.';

  @override
  String get disabledLabel => 'Desactivado';

  @override
  String get compressionInProgressTitle => 'Compresión en curso';

  @override
  String get confirmCloseDesc =>
      '¿Seguro que quieres cerrar Shrinkeo?\nEsto cancelará las compresiones actuales.';

  @override
  String get keepCompressingBtn => 'Continuar Comprimiendo';

  @override
  String get closeAppBtn => 'Cerrar Aplicación';

  @override
  String get lockedSettingsWarning => 'Bloqueado durante compresión';

  @override
  String get updateRequiredTitle => 'Actualización Requerida';

  @override
  String get updateRequiredDescNewVersion =>
      'Nueva versión disponible con mejoras importantes.';

  @override
  String get updateRequiredDescOldVersion => 'Tu versión ya no es compatible.';

  @override
  String get updateNowBtn => 'Actualizar Ahora';

  @override
  String get laterBtn => 'Más tarde';

  @override
  String get updateAvailableTitle => 'Actualización Disponible';

  @override
  String get whatsNewTitle => 'Novedades:';

  @override
  String get exitAppBtn => 'Salir';

  @override
  String get retryBtn => 'Reintentar';

  @override
  String get downloadFromWebsiteBtn => 'Descargar del Sitio Web';

  @override
  String get skipUpdateConfirmTitle => '¿Omitir actualización?';

  @override
  String get skipUpdateConfirmDesc =>
      'Esta actualización contiene soluciones críticas.';

  @override
  String get skipUpdateCancelBtn => 'Cancelar';

  @override
  String get skipUpdateConfirmBtn => 'Omitir actualización';

  @override
  String get maintenanceTitle => 'Mantenimiento';

  @override
  String get maintenanceDescDefault => 'Shrinkeo está en mantenimiento.';

  @override
  String versionAvailableMsg(String version) {
    return 'Versión $version disponible.';
  }

  @override
  String get hwEncoderNotSupportedTitle => 'Aceleración no soportada';

  @override
  String get failedCreateFolderError => 'Error al crear carpeta de salida';

  @override
  String get failedProbeDurationError => 'Error al obtener duración';

  @override
  String get ffmpegNotFoundGlobalError => 'FFmpeg no encontrado.';

  @override
  String get ffmpegMissingError => 'FFmpeg o FFprobe faltan o están dañados.';

  @override
  String hwFallbackNotificationBody(String encoderLabel) {
    return '$encoderLabel falló. Cambiado a Software (CPU).';
  }

  @override
  String get failedDownloadUpdateMsg =>
      'Error al descargar la actualización. Inténtelo de nuevo.';

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
