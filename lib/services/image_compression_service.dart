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
          '-colorspace',
          'bt709',
          '-color_trc',
          'srgb',
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
      final cjpegPath = _resolveToolPath('cjpeg.exe');
      if (cjpegPath != null) {
        final tempBmpPath = '$outputPath.tmp.bmp';
        final bmpArgs = [
          '-y',
          '-i',
          inputPath,
          if (maxWidth != null || maxHeight != null) ...[
            '-vf',
            'scale=${maxWidth ?? -1}:${maxHeight ?? -1}:force_original_aspect_ratio=decrease,scale=trunc(iw/2)*2:trunc(ih/2)*2'
          ],
          '-colorspace',
          'bt709',
          '-color_trc',
          'srgb',
          '-pix_fmt',
          'rgb24', // Force 24-bit full RGB color without YUV matrix shifts or limited range truncation
          tempBmpPath,
        ];
        await Process.run(ffmpegPath, bmpArgs);

        if (File(tempBmpPath).existsSync()) {
          final mozArgs = [
            '-quality',
            '$quality',
            '-sample',
            '1x1', // 4:4:4 Chroma Subsampling: Preserves 100% vivid color saturation & sharp edges (TinyJPG style!)
            '-quanttable',
            '2', // MozJPEG Flat/ImageMagick quantization table: maintains rich color depth & prevents fading
            '-optimize',
            '-progressive',
            '-outfile',
            outputPath,
            tempBmpPath,
          ];
          final res = await Process.run(cjpegPath, mozArgs);
          try { File(tempBmpPath).deleteSync(); } catch (_) {}

          if (res.exitCode == 0 && File(outputPath).existsSync()) {
            _applyNoLargerFileSafety(
              inputPath: inputPath,
              outputPath: outputPath,
              targetFormat: targetFormat,
              ext: ext,
              outFormat: outFormat,
              maxWidth: maxWidth,
              maxHeight: maxHeight,
            );
            return res;
          }
        }
      }
    }

    // 3. WebP images ARE COMPRESSED EXCLUSIVELY BY Google WebP (cwebp.exe)
    if (outFormat == '.webp') {
      final cwebpPath = _resolveToolPath('cwebp.exe');
      if (cwebpPath != null && maxWidth == null && maxHeight == null) {
        final webpArgs = [
          '-q',
          '$quality',
          '-m',
          '6',
          '-sharp_yuv', // Preserves sharp color edges and prevents color fading/washing out!
          '-metadata',
          'icc', // Keep ICC color profile for 100% accurate gamut rendering
          '-o',
          outputPath,
          inputPath,
        ];
        final res = await Process.run(cwebpPath, webpArgs);
        if (res.exitCode == 0 && File(outputPath).existsSync()) {
          _applyNoLargerFileSafety(inputPath: inputPath, outputPath: outputPath, targetFormat: targetFormat, ext: ext, outFormat: outFormat, maxWidth: maxWidth, maxHeight: maxHeight);
          return res;
        }
      }
    }

    // 4. FFmpeg compression & encoding for WebP fallback, AVIF, etc.
    final List<String> args = ['-y', '-i', inputPath];

    if (maxWidth != null || maxHeight != null) {
      final w = maxWidth ?? -1;
      final h = maxHeight ?? -1;
      args.addAll([
        '-vf',
        'scale=$w:$h:force_original_aspect_ratio=decrease,scale=trunc(iw/2)*2:trunc(ih/2)*2'
      ]);
    }

    args.addAll(['-colorspace', 'bt709', '-color_trc', 'srgb']);

    switch (outFormat) {
      case '.webp':
        args.addAll(['-c:v', 'libwebp', '-quality', '$quality', '-sharp_yuv', '1']);
        break;

      case '.avif':
        final crf = ((100 - quality) / 100 * 35 + 15).round().clamp(15, 52);
        args.addAll(['-c:v', 'libavif', '-crf', '$crf', '-pix_fmt', 'yuv420p', '-color_range', 'pc']);
        break;

      case '.jpg':
      case '.jpeg':
        args.addAll(['-c:v', 'mjpeg', '-pix_fmt', 'yuvj420p', '-color_range', 'pc']);
        break;

      default:
        args.addAll(['-compression_level', '9']);
        break;
    }

    args.add(outputPath);

    final res = await Process.run(ffmpegPath, args);

    _applyNoLargerFileSafety(inputPath: inputPath, outputPath: outputPath, targetFormat: targetFormat, ext: ext, outFormat: outFormat, maxWidth: maxWidth, maxHeight: maxHeight);

    return res;
  }

  /// Safety Guarantee: If target format is original (or same format), no resizing was requested,
  /// and the compressed file ended up LARGER than original, preserve the original file!
  void _applyNoLargerFileSafety({
    required String inputPath,
    required String outputPath,
    required String targetFormat,
    required String ext,
    required String outFormat,
    int? maxWidth,
    int? maxHeight,
  }) {
    if (maxWidth != null || maxHeight != null) return;
    if (targetFormat != 'original' && ext != outFormat) return;

    final outFile = File(outputPath);
    final inFile = File(inputPath);

    if (outFile.existsSync() && inFile.existsSync()) {
      if (outFile.lengthSync() > inFile.lengthSync()) {
        try {
          inFile.copySync(outputPath);
        } catch (_) {}
      }
    }
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
