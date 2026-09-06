import 'dart:async';
import 'dart:io';
import 'package:path/path.dart' as p;
import 'ffmpeg_service.dart';
import '../models/image_progress.dart';
import 'image_job.dart';

/// Service responsible for professional image compression, format conversion,
/// dimension resizing, and EXIF metadata stripping.
class ImageCompressionService {
  final FfmpegService _ffmpegService;
  final ImageProcessStarter? processStarter;

  ImageCompressionService({FfmpegService? ffmpegService, this.processStarter})
    : _ffmpegService = ffmpegService ?? FfmpegService();

  /// Compresses or converts an image file based on configuration.
  ///
  /// When [targetSizeKB] is set (target size mode), an iterative binary search
  /// finds the highest encoder quality whose output still fits under the size
  /// limit and the best candidate is written to [outputPath].
  /// [isCancelled] also terminates the active encoder. [onStatus] reports
  /// stages and encoder feedback; [onProgress] only signals valid completion.
  Future<ProcessResult> processImage({
    required String inputPath,
    required String outputPath,
    int quality = 80, // 1 - 100
    String targetFormat =
        'original', // 'original', 'png', 'jpg', 'webp', 'avif'
    int? maxWidth,
    int? maxHeight,
    bool stripExif = true,
    double? targetSizeKB,
    bool Function()? isCancelled,
    void Function(double progress)? onProgress,
    void Function(ImageProgress progress)? onStatus,
  }) async {
    final job = ImageJob(
      isCancelled: isCancelled,
      onStatus: onStatus,
      targetKB: targetSizeKB,
      start: processStarter,
    );
    job.report(ImageStage.preparing);
    try {
      if (targetSizeKB != null && targetSizeKB > 0) {
        return await _processWithTargetSize(
          inputPath: inputPath,
          outputPath: outputPath,
          quality: quality,
          targetFormat: targetFormat,
          maxWidth: maxWidth,
          maxHeight: maxHeight,
          stripExif: stripExif,
          targetSizeKB: targetSizeKB,
          isCancelled: isCancelled,
          onProgress: onProgress,
          job: job,
        );
      }

      final result = await _executeSinglePass(
        inputPath: inputPath,
        outputPath: outputPath,
        quality: quality,
        targetFormat: targetFormat,
        maxWidth: maxWidth,
        maxHeight: maxHeight,
        stripExif: stripExif,
        job: job,
      );
      if (job.cancelled ||
          result.exitCode != 0 ||
          !File(outputPath).existsSync() ||
          File(outputPath).lengthSync() == 0) {
        return result.exitCode == 0
            ? ProcessResult(0, 1, '', 'No usable output produced')
            : result;
      }
      job.report(ImageStage.saving);
      _applyNoLargerFileSafety(
        inputPath: inputPath,
        outputPath: outputPath,
        targetFormat: targetFormat,
        maxWidth: maxWidth,
        maxHeight: maxHeight,
        stripExif: stripExif,
      );
      if (job.cancelled) return ProcessResult(0, -1, '', 'Cancelled');
      onProgress?.call(1.0);
      return result;
    } finally {
      job.cleanup();
    }
  }

  /// Binary-searches the highest quality whose encoded output fits under
  /// [targetSizeKB]. Each iteration encodes to a temp candidate; the best
  /// fitting candidate (or the smallest one if none fits) becomes the output.
  Future<ProcessResult> _processWithTargetSize({
    required String inputPath,
    required String outputPath,
    required int quality,
    required String targetFormat,
    int? maxWidth,
    int? maxHeight,
    required bool stripExif,
    required double targetSizeKB,
    bool Function()? isCancelled,
    void Function(double progress)? onProgress,
    required ImageJob job,
  }) async {
    final maxBytes = (targetSizeKB * 1024).round();
    final tempExt = _effectiveExtension(inputPath, targetFormat);
    final tempDir = Directory.systemTemp.path;
    final stamp = DateTime.now().microsecondsSinceEpoch;

    // Keep original format identity for "already small enough" shortcuts:
    // they only apply when the original is reused as-is.
    final ext = p.extension(inputPath).toLowerCase();
    final sameFormatNoOps =
        ext == tempExt && maxWidth == null && maxHeight == null && !stripExif;

    // Fast path: the original already fits and nothing else was requested.
    if (sameFormatNoOps &&
        File(inputPath).lengthSync() > 0 &&
        File(inputPath).lengthSync() <= maxBytes) {
      if (job.cancelled) return ProcessResult(0, -1, '', 'Cancelled');
      job.report(ImageStage.saving);
      await File(inputPath).copy(outputPath);
      if (job.cancelled) return ProcessResult(0, -1, '', 'Cancelled');
      onProgress?.call(1.0);
      return ProcessResult(0, 0, '', '');
    }

    String? bestPath;
    ProcessResult bestResult = ProcessResult(0, -1, '', '');
    String? smallestPath;
    ProcessResult smallestResult = ProcessResult(0, -1, '', '');
    int smallestSize = 1 << 62;

    int lo = 5;
    int hi = 95;
    int iteration = 0;
    const maxIterations = 7;
    bool aborted = false;

    while (lo <= hi && iteration < maxIterations) {
      if (isCancelled != null && isCancelled()) {
        aborted = true;
        break;
      }

      job.attempt = iteration + 1;
      final candidateQuality = (lo + hi) ~/ 2;
      final candidatePath = p.join(
        tempDir,
        'shrinkeo_img_${stamp}_$iteration$tempExt',
      );
      job.trackTemporary(candidatePath);

      final res = await _executeSinglePass(
        inputPath: inputPath,
        outputPath: candidatePath,
        quality: candidateQuality,
        targetFormat: targetFormat,
        maxWidth: maxWidth,
        maxHeight: maxHeight,
        stripExif: stripExif,
        job: job,
      );

      if (job.cancelled) {
        _tryDelete(candidatePath);
        aborted = true;
        break;
      }
      final candidateFile = File(candidatePath);
      final ok =
          res.exitCode == 0 &&
          candidateFile.existsSync() &&
          candidateFile.lengthSync() > 0;

      if (!ok) {
        // Encoder refused this quality level; search lower.
        _tryDelete(candidatePath);
        hi = candidateQuality - 1;
      } else {
        final size = candidateFile.lengthSync();
        if (size <= maxBytes) {
          _tryDelete(bestPath);
          bestPath = candidatePath;
          bestResult = res;
          lo = candidateQuality + 1; // Try higher quality.
        } else {
          if (size < smallestSize) {
            _tryDelete(smallestPath);
            smallestPath = candidatePath;
            smallestResult = res;
            smallestSize = size;
          } else {
            _tryDelete(candidatePath);
          }
          hi = candidateQuality - 1; // Search lower quality.
        }
      }

      iteration++;
      job.bestBytes = bestPath != null
          ? File(bestPath).lengthSync()
          : (smallestPath != null ? smallestSize : null);
      job.report(ImageStage.encoding);
    }

    if (aborted) {
      _tryDelete(bestPath);
      _tryDelete(smallestPath);
      return ProcessResult(0, -1, '', 'Cancelled');
    }

    // Prefer the best fitting candidate; otherwise keep the smallest attempt
    // so the user still gets the closest achievable result.
    final chosenPath = bestPath ?? smallestPath;
    final chosenResult = bestPath != null ? bestResult : smallestResult;

    if (chosenPath == null) {
      return ProcessResult(0, 1, '', 'No usable output produced');
    }

    final otherPath = identical(chosenPath, bestPath) ? smallestPath : bestPath;

    // Never ship a re-encode larger than the untouched original.
    if (sameFormatNoOps &&
        File(inputPath).lengthSync() <= File(chosenPath).lengthSync()) {
      _tryDelete(chosenPath);
      _tryDelete(otherPath);
      if (job.cancelled) return ProcessResult(0, -1, '', 'Cancelled');
      job.report(ImageStage.saving);
      await File(inputPath).copy(outputPath);
      if (job.cancelled) return ProcessResult(0, -1, '', 'Cancelled');
      onProgress?.call(1.0);
      return ProcessResult(0, 0, '', '');
    }

    try {
      if (job.cancelled) return ProcessResult(0, -1, '', 'Cancelled');
      job.report(ImageStage.saving);
      await File(chosenPath).copy(outputPath);
    } finally {
      _tryDelete(chosenPath);
      _tryDelete(otherPath);
    }

    if (job.cancelled) return ProcessResult(0, -1, '', 'Cancelled');
    onProgress?.call(1.0);
    return chosenResult;
  }

  /// Executes a single compression pass using pngquant for PNG, MozJPEG for
  /// JPEG, cwebp for WebP, or FFmpeg for everything else.
  Future<ProcessResult> _executeSinglePass({
    required String inputPath,
    required String outputPath,
    required int quality,
    required String targetFormat,
    int? maxWidth,
    int? maxHeight,
    required bool stripExif,
    required ImageJob job,
  }) async {
    final ffmpegPath = _ffmpegService.ffmpegPath;
    final outFormat = _effectiveExtension(inputPath, targetFormat);

    // 1. PNG images ARE COMPRESSED EXCLUSIVELY BY pngquant.exe - 0% FFMPEG!
    if (outFormat == '.png') {
      return _encodePng(
        inputPath: inputPath,
        outputPath: outputPath,
        quality: quality,
        maxWidth: maxWidth,
        maxHeight: maxHeight,
        ffmpegPath: ffmpegPath,
        job: job,
      );
    }

    // 2. JPEG images ARE COMPRESSED EXCLUSIVELY BY Mozilla MozJPEG (cjpeg.exe)
    if (outFormat == '.jpg' || outFormat == '.jpeg') {
      final cjpegPath = _resolveToolPath('cjpeg.exe');
      if (cjpegPath != null) {
        final tempBmpPath = '$outputPath.tmp.bmp';
        job.trackTemporary(tempBmpPath);
        final bmpArgs = [
          '-y',
          '-i',
          inputPath,
          if (maxWidth != null || maxHeight != null) ...[
            '-vf',
            'scale=${maxWidth ?? -1}:${maxHeight ?? -1}:force_original_aspect_ratio=decrease,scale=trunc(iw/2)*2:trunc(ih/2)*2',
          ],
          '-pix_fmt',
          'bgr24', // Full 24-bit RGB pixel format for BMP extraction
          tempBmpPath,
        ];
        final bmpRes = await job.run(
          ffmpegPath,
          bmpArgs,
          stage: ImageStage.preparing,
        );

        if (bmpRes.exitCode == 0 && File(tempBmpPath).existsSync()) {
          final mozArgs = [
            '-report',
            '-quality',
            '$quality',
            '-sample',
            '1x1', // 4:4:4 Chroma Subsampling: Preserves 100% vivid color saturation & sharp edges (TinyJPG style!)
            '-quant-table',
            '2', // MozJPEG table tuned for MS-SSIM.
            '-optimize',
            '-progressive',
            '-outfile',
            outputPath,
            tempBmpPath,
          ];
          final res = await job.run(cjpegPath, mozArgs, progress: true);
          _tryDelete(tempBmpPath);

          if (res.exitCode == 0 && File(outputPath).existsSync()) {
            return res;
          }
          // Otherwise fall through to the FFmpeg fallback below.
        } else {
          _tryDelete(tempBmpPath);
        }
      }
    }

    // 3. WebP images ARE COMPRESSED EXCLUSIVELY BY Google WebP (cwebp.exe)
    if (outFormat == '.webp') {
      final cwebpPath = _resolveToolPath('cwebp.exe');
      if (cwebpPath != null && maxWidth == null && maxHeight == null) {
        final webpArgs = [
          '-progress',
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
        final res = await job.run(cwebpPath, webpArgs, progress: true);
        if (res.exitCode == 0 && File(outputPath).existsSync()) {
          return res;
        }
        // Otherwise fall through to the FFmpeg fallback below.
      }
    }

    // 4. FFmpeg compression & encoding for WebP fallback, AVIF, etc.
    final List<String> args = ['-y', '-i', inputPath];

    if (stripExif) {
      args.addAll(['-map_metadata', '-1']);
    }

    if (maxWidth != null || maxHeight != null) {
      final w = maxWidth ?? -1;
      final h = maxHeight ?? -1;
      args.addAll([
        '-vf',
        'scale=$w:$h:force_original_aspect_ratio=decrease,scale=trunc(iw/2)*2:trunc(ih/2)*2',
      ]);
    }

    switch (outFormat) {
      case '.webp':
        args.addAll([
          '-c:v',
          'libwebp',
          '-quality',
          '$quality',
          '-sharp_yuv',
          '1',
        ]);
        break;

      case '.avif':
        final crf = ((100 - quality) / 100 * 35 + 15).round().clamp(15, 52);
        args.addAll([
          '-c:v',
          'libavif',
          '-crf',
          '$crf',
          '-pix_fmt',
          'yuv420p',
          '-color_range',
          'pc',
        ]);
        break;

      case '.jpg':
      case '.jpeg':
        args.addAll([
          '-c:v',
          'mjpeg',
          '-q:v',
          '${(quality / 10).round().clamp(1, 10)}',
          '-pix_fmt',
          'yuvj420p',
          '-color_range',
          'pc',
        ]);
        break;

      default:
        args.addAll(['-compression_level', '9']);
        break;
    }

    args.add(outputPath);

    return job.run(ffmpegPath, args);
  }

  /// PNG pipeline: optional FFmpeg pre-resize, then pngquant with a wide-range
  /// retry (pngquant refuses to save when the palette can't reach the
  /// requested minimum quality) and a final FFmpeg lossless fallback.
  Future<ProcessResult> _encodePng({
    required String inputPath,
    required String outputPath,
    required int quality,
    required int? maxWidth,
    required int? maxHeight,
    required String ffmpegPath,
    required ImageJob job,
  }) async {
    final pngquantPath = _resolveToolPath('pngquant.exe');
    String inputForPngquant = inputPath;
    String? tempResizedPath;

    if (maxWidth != null || maxHeight != null) {
      tempResizedPath = '$outputPath.resized.png';
      job.trackTemporary(tempResizedPath);
      final w = maxWidth ?? -1;
      final h = maxHeight ?? -1;
      final resizeArgs = [
        '-y',
        '-i',
        inputPath,
        '-vf',
        'scale=$w:$h:force_original_aspect_ratio=decrease,scale=trunc(iw/2)*2:trunc(ih/2)*2',
        tempResizedPath,
      ];
      final resized = await job.run(
        ffmpegPath,
        resizeArgs,
        stage: ImageStage.preparing,
      );
      if (resized.exitCode != 0 || !File(tempResizedPath).existsSync()) {
        _tryDelete(tempResizedPath);
        return resized.exitCode == 0
            ? ProcessResult(0, 1, '', 'No resized image produced')
            : resized;
      }
      inputForPngquant = tempResizedPath;
    }

    if (pngquantPath != null) {
      int minQ = (quality - 30).clamp(1, 85);
      int maxQ = quality.clamp(35, 98);
      if (quality <= 40) {
        minQ = 1;
        maxQ = 40;
      } else if (quality >= 90) {
        minQ = 80;
        maxQ = 98;
      }

      final res = await job.run(pngquantPath, [
        '--quality',
        '$minQ-$maxQ',
        '--speed',
        '1',
        '--force',
        '--output',
        outputPath,
        inputForPngquant,
      ]);

      if (res.exitCode == 0 && File(outputPath).existsSync()) {
        _tryDelete(tempResizedPath);
        return res;
      }

      // Retry without a quality floor: pngquant fails with exit code 2 or 99
      // when the image palette cannot reach the requested minimum quality.
      _tryDelete(outputPath);
      final retry = await job.run(pngquantPath, [
        '--speed',
        '1',
        '--force',
        '--output',
        outputPath,
        inputForPngquant,
      ]);

      if (retry.exitCode == 0 && File(outputPath).existsSync()) {
        _tryDelete(tempResizedPath);
        return retry;
      }
    }

    // FFmpeg lossless PNG fallback when pngquant is missing or refuses.
    _tryDelete(outputPath);
    final fallbackArgs = [
      '-y',
      '-i',
      inputForPngquant,
      if (maxWidth != null || maxHeight != null) ...[
        '-vf',
        'scale=${maxWidth ?? -1}:${maxHeight ?? -1}:force_original_aspect_ratio=decrease,scale=trunc(iw/2)*2:trunc(ih/2)*2',
      ],
      '-compression_level',
      '9',
      outputPath,
    ];
    final fallback = await job.run(ffmpegPath, fallbackArgs);
    _tryDelete(tempResizedPath);
    return fallback;
  }

  /// Safety Guarantee: if the target format is original (or the same format),
  /// no resizing was requested, EXIF privacy stripping is off, and the
  /// compressed file ended up LARGER than the original, preserve the original!
  void _applyNoLargerFileSafety({
    required String inputPath,
    required String outputPath,
    required String targetFormat,
    int? maxWidth,
    int? maxHeight,
    bool stripExif = false,
  }) {
    if (maxWidth != null || maxHeight != null) return;
    if (stripExif) {
      return; // Never restore EXIF metadata the user asked to strip.
    }
    final ext = p.extension(inputPath).toLowerCase();
    final outFormat = _effectiveExtension(inputPath, targetFormat);
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

  /// The output extension after applying [targetFormat] to [inputPath].
  String _effectiveExtension(String inputPath, String targetFormat) {
    if (targetFormat != 'original' && targetFormat.isNotEmpty) {
      return '.${targetFormat.replaceAll('.', '').toLowerCase()}';
    }
    return p.extension(inputPath).toLowerCase();
  }

  void _tryDelete(String? path) {
    if (path == null) return;
    try {
      final file = File(path);
      if (file.existsSync()) file.deleteSync();
    } catch (_) {}
  }

  /// Resolves the absolute path to a standalone CLI tool (pngquant.exe, cjpeg.exe, cwebp.exe).
  String? _resolveToolPath(String toolName) {
    // 1. Release bin folder next to the executable
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
      final wingetPath = p.join(
        localAppData,
        'Microsoft',
        'WinGet',
        'Links',
        toolName,
      );
      if (File(wingetPath).existsSync()) return wingetPath;
    }

    return null;
  }
}
