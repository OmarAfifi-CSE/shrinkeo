import 'dart:async';
import 'dart:io';
import 'package:path/path.dart' as p;
import 'ffmpeg_service.dart';
import '../models/video_file.dart';

/// Service responsible for professional image compression, format conversion,
/// dimension resizing, and EXIF metadata stripping.
class ImageCompressionService {
  final FfmpegService _ffmpegService;

  ImageCompressionService({FfmpegService? ffmpegService})
      : _ffmpegService = ffmpegService ?? FfmpegService();

  /// Compresses or converts an image file based on configuration.
  Future<ProcessResult> processImage({
    required String inputPath,
    required String outputPath,
    required MediaActionIntent actionIntent,
    int quality = 80, // 1 - 100
    String targetFormat = 'original', // 'original', 'png', 'jpg', 'webp', 'avif'
    int? maxWidth,
    int? maxHeight,
    bool stripExif = true,
    void Function(double progress)? onProgress,
  }) async {
    onProgress?.call(0.25);
    final result = await _executeSinglePass(
      inputPath: inputPath,
      outputPath: outputPath,
      actionIntent: actionIntent,
      quality: quality,
      targetFormat: targetFormat,
      maxWidth: maxWidth,
      maxHeight: maxHeight,
      stripExif: stripExif,
    );
    onProgress?.call(1.0);
    return result;
  }

  /// Executes a single compression pass using pngquant for PNG or FFmpeg for other formats.
  Future<ProcessResult> _executeSinglePass({
    required String inputPath,
    required String outputPath,
    required MediaActionIntent actionIntent,
    required int quality,
    required String targetFormat,
    int? maxWidth,
    int? maxHeight,
    required bool stripExif,
  }) async {
    final ext = p.extension(inputPath).toLowerCase();
    final ffmpegPath = _ffmpegService.ffmpegPath;

    String effectiveExt = ext;
    if (targetFormat != 'original') {
      effectiveExt = '.${targetFormat.replaceAll('.', '')}';
    }

    final outFormat = effectiveExt.toLowerCase();

    // 1. PNG images ARE COMPRESSED EXCLUSIVELY BY pngquant.exe - 0% FFMPEG!
    if (outFormat == '.png') {
      final pngquantPath = _resolveToolPath('pngquant.exe') ?? 'pngquant.exe';
      String inputForPngquant = inputPath;
      String? tempResizedPath;

      if (maxWidth != null || maxHeight != null) {
        tempResizedPath = '$outputPath.resized.png';
        final w = maxWidth ?? -1;
        final h = maxHeight ?? -1;
        final resizeArgs = [
          '-y',
          '-i',
          inputPath,
          '-vf',
          'scale=$w:$h:force_original_aspect_ratio=decrease,scale=trunc(iw/2)*2:trunc(ih/2)*2',
          if (stripExif) ...['-map_metadata', '-1'],
          tempResizedPath,
        ];
        await Process.run(ffmpegPath, resizeArgs);
        inputForPngquant = tempResizedPath;
      }

      int minQ = (quality - 30).clamp(1, 85);
      int maxQ = quality.clamp(35, 98);
      if (quality <= 40) {
        minQ = 1;
        maxQ = 40;
      } else if (quality >= 90) {
        minQ = 80;
        maxQ = 98;
      }

      final pngArgs = [
        '--quality',
        '$minQ-$maxQ',
        '--speed',
        '1',
        '--force',
        '--output',
        outputPath,
        inputForPngquant,
      ];

      final res = await Process.run(pngquantPath, pngArgs);

      if (tempResizedPath != null && File(tempResizedPath).existsSync()) {
        try { File(tempResizedPath).deleteSync(); } catch (_) {}
      }

      return res;
    }

    // 2. JPEG images ARE COMPRESSED EXCLUSIVELY BY Mozilla MozJPEG (cjpeg.exe)
    if (outFormat == '.jpg' || outFormat == '.jpeg') {
      final cjpegPath = _resolveToolPath('cjpeg.exe') ?? 'cjpeg.exe';
      String inputForCjpeg = inputPath;
      String? tempResizedPath;

      if (maxWidth != null || maxHeight != null) {
        tempResizedPath = '$outputPath.resized.jpg';
        final w = maxWidth ?? -1;
        final h = maxHeight ?? -1;
        final resizeArgs = [
          '-y',
          '-i',
          inputPath,
          '-vf',
          'scale=$w:$h:force_original_aspect_ratio=decrease,scale=trunc(iw/2)*2:trunc(ih/2)*2',
          if (stripExif) ...['-map_metadata', '-1'],
          tempResizedPath,
        ];
        await Process.run(ffmpegPath, resizeArgs);
        inputForCjpeg = tempResizedPath;
      }

      final mozArgs = [
        '-quality',
        '$quality',
        '-optimize',
        '-progressive',
        '-outfile',
        outputPath,
        inputForCjpeg,
      ];
      final res = await Process.run(cjpegPath, mozArgs);

      if (tempResizedPath != null && File(tempResizedPath).existsSync()) {
        try { File(tempResizedPath).deleteSync(); } catch (_) {}
      }

      return res;
    }

    // 3. WebP images ARE COMPRESSED EXCLUSIVELY BY Google WebP (cwebp.exe)
    if (outFormat == '.webp') {
      final cwebpPath = _resolveToolPath('cwebp.exe') ?? 'cwebp.exe';
      String inputForCwebp = inputPath;
      String? tempResizedPath;

      if (maxWidth != null || maxHeight != null) {
        tempResizedPath = '$outputPath.resized.webp';
        final w = maxWidth ?? -1;
        final h = maxHeight ?? -1;
        final resizeArgs = [
          '-y',
          '-i',
          inputPath,
          '-vf',
          'scale=$w:$h:force_original_aspect_ratio=decrease,scale=trunc(iw/2)*2:trunc(ih/2)*2',
          if (stripExif) ...['-map_metadata', '-1'],
          tempResizedPath,
        ];
        await Process.run(ffmpegPath, resizeArgs);
        inputForCwebp = tempResizedPath;
      }

      final webpArgs = [
        '-q',
        '$quality',
        '-m',
        '6',
        '-o',
        outputPath,
        inputForCwebp,
      ];
      final res = await Process.run(cwebpPath, webpArgs);

      if (tempResizedPath != null && File(tempResizedPath).existsSync()) {
        try { File(tempResizedPath).deleteSync(); } catch (_) {}
      }

      return res;
    }

    // 4. FFmpeg compression & encoding ONLY for AVIF
    final List<String> args = ['-y', '-i', inputPath];

    if (maxWidth != null || maxHeight != null) {
      final w = maxWidth ?? -1;
      final h = maxHeight ?? -1;
      args.addAll([
        '-vf',
        'scale=$w:$h:force_original_aspect_ratio=decrease,scale=trunc(iw/2)*2:trunc(ih/2)*2'
      ]);
    }

    if (stripExif) {
      args.addAll(['-map_metadata', '-1']);
    }

    switch (outFormat) {
      case '.avif':
        final crf = ((100 - quality) / 100 * 35 + 15).round().clamp(15, 52);
        args.addAll(['-c:v', 'libavif', '-crf', '$crf']);
        break;

      default:
        args.addAll(['-compression_level', '9']);
        break;
    }

    args.add(outputPath);

    return Process.run(ffmpegPath, args);
  }

  /// Resolves the absolute path to a standalone CLI tool (pngquant.exe, cjpeg.exe, cwebp.exe).
  String? _resolveToolPath(String toolName) {
    // 1. Release bin folder next to executable
    final bundledPath = p.join(
      p.dirname(Platform.resolvedExecutable),
      'bin',
      toolName,
    );
    if (File(bundledPath).existsSync()) return bundledPath;

    // 2. Next to ffmpeg.exe
    final ffmpegDir = p.dirname(_ffmpegService.ffmpegPath);
    final ffmpegTool = p.join(ffmpegDir, toolName);
    if (File(ffmpegTool).existsSync()) return ffmpegTool;

    // 3. System WinGet Links directory
    final localAppData = Platform.environment['LOCALAPPDATA'];
    if (localAppData != null) {
      final wingetPath = p.join(localAppData, 'Microsoft', 'WinGet', 'Links', toolName);
      if (File(wingetPath).existsSync()) return wingetPath;
    }

    // 4. Candidate tools release folder
    const userToolsDir = r'C:\Users\Omar\Documents\Flutter\B- Releases\Shrinkeo\tools';
    final userToolPath = p.join(userToolsDir, toolName);
    if (File(userToolPath).existsSync()) return userToolPath;

    return null;
  }
}
