import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:path/path.dart' as p;

import 'package:shrinkeo/services/ffmpeg_service.dart';
import 'package:shrinkeo/services/image_compression_service.dart';
import 'package:shrinkeo/models/image_progress.dart';

/// End-to-end smoke tests for the image pipeline, exercising the real
/// bundled/host encoders (FFmpeg, pngquant, MozJPEG, cwebp).
///
/// Skips automatically when FFmpeg is unavailable (e.g. CI without tools).
void main() {
  final service = ImageCompressionService();
  final ffmpegPath = FfmpegService().ffmpegPath;

  late Directory tmp;
  late String pngPath; // 1600x900 detailed source (PNG)
  late String jpgPath; // 800x600 source (JPEG)

  Future<void> genImage(String out, List<String> extra) async {
    final res = await Process.run(ffmpegPath, [
      '-y',
      '-f',
      'lavfi',
      '-i',
      'testsrc2=size=1600x900',
      '-frames:v',
      '1',
      ...extra,
      out,
    ]);
    expect(res.exitCode, 0, reason: 'failed to generate $out: ${res.stderr}');
  }

  setUpAll(() async {
    final probe = await Process.run(ffmpegPath, ['-version']);
    if (probe.exitCode != 0) {
      fail('FFmpeg unavailable — skipping image pipeline smoke tests.');
    }

    tmp = await Directory.systemTemp.createTemp('shrinkeo_img_test_');
    pngPath = p.join(tmp.path, 'source.png');
    jpgPath = p.join(tmp.path, 'source.jpg');

    await genImage(pngPath, []);
    // Generate the smaller JPEG via a two-step scale so cjpeg tests are light.
    final res = await Process.run(ffmpegPath, [
      '-y',
      '-f',
      'lavfi',
      '-i',
      'testsrc2=size=800x600',
      '-frames:v',
      '1',
      '-q:v',
      '2',
      jpgPath,
    ]);
    expect(res.exitCode, 0);
  });

  tearDownAll(() {
    try {
      tmp.deleteSync(recursive: true);
    } catch (_) {}
  });

  int sizeOf(String path) => File(path).lengthSync();

  test('PNG → JPEG conversion via MozJPEG succeeds and is small', () async {
    final out = p.join(tmp.path, 'conv.jpg');
    final updates = <ImageProgress>[];
    final res = await service.processImage(
      inputPath: pngPath,
      outputPath: out,
      quality: 80,
      targetFormat: 'jpg',
      onStatus: updates.add,
    );
    expect(res.exitCode, 0, reason: res.stderr);
    expect(File(out).existsSync(), isTrue);
    expect(sizeOf(out), lessThan(sizeOf(pngPath)));
    final tool = File(
      p.join(
        Platform.environment['LOCALAPPDATA'] ?? '',
        'Microsoft',
        'WinGet',
        'Links',
        'cjpeg.exe',
      ),
    );
    if (tool.existsSync()) {
      expect(
        updates.any((update) => update.fraction != null),
        isTrue,
        reason: 'MozJPEG must deliver encoder progress',
      );
    }
    expect(updates.last.stage, ImageStage.saving);
  }, timeout: const Timeout(Duration(minutes: 2)));

  test('PNG quantization via pngquant shrinks the file', () async {
    final out = p.join(tmp.path, 'quant.png');
    final res = await service.processImage(
      inputPath: pngPath,
      outputPath: out,
      quality: 60,
      targetFormat: 'original',
    );
    expect(res.exitCode, 0, reason: res.stderr);
    expect(File(out).existsSync(), isTrue);
    expect(sizeOf(out), lessThan(sizeOf(pngPath)));
  }, timeout: const Timeout(Duration(minutes: 2)));

  test('JPEG → WebP conversion via cwebp succeeds', () async {
    final out = p.join(tmp.path, 'conv.webp');
    final updates = <ImageProgress>[];
    final res = await service.processImage(
      inputPath: jpgPath,
      outputPath: out,
      quality: 80,
      targetFormat: 'webp',
      onStatus: updates.add,
    );
    expect(res.exitCode, 0, reason: res.stderr);
    expect(File(out).existsSync(), isTrue);
    final tool = File(
      p.join(
        Platform.environment['LOCALAPPDATA'] ?? '',
        'Microsoft',
        'WinGet',
        'Links',
        'cwebp.exe',
      ),
    );
    if (tool.existsSync()) {
      expect(
        updates.any((update) => update.fraction != null),
        isTrue,
        reason: 'WebP must deliver encoder progress',
      );
    }
  }, timeout: const Timeout(Duration(minutes: 2)));

  test('Target size mode produces output under the limit', () async {
    final out = p.join(tmp.path, 'target.jpg');
    final res = await service.processImage(
      inputPath: jpgPath,
      outputPath: out,
      quality: 80,
      targetFormat: 'jpg',
      targetSizeKB: 60,
    );
    expect(res.exitCode, 0, reason: res.stderr);
    expect(File(out).existsSync(), isTrue);
    expect(
      sizeOf(out),
      lessThanOrEqualTo(60 * 1024),
      reason: 'output ${sizeOf(out)} bytes exceeded 60 KB target',
    );
  }, timeout: const Timeout(Duration(minutes: 2)));

  test('Target size mode keeps the original when it already fits', () async {
    final small = p.join(tmp.path, 'small.jpg');
    final gen = await Process.run(ffmpegPath, [
      '-y',
      '-f',
      'lavfi',
      '-i',
      'testsrc2=size=320x240',
      '-frames:v',
      '1',
      '-q:v',
      '2',
      small,
    ]);
    expect(gen.exitCode, 0);

    final out = p.join(tmp.path, 'fastpath.jpg');
    final res = await service.processImage(
      inputPath: small,
      outputPath: out,
      quality: 80,
      targetFormat: 'jpg',
      stripExif: false, // Required for the keep-original fast path to apply.
      targetSizeKB:
          5000, // Generous limit: original must be kept byte-identical.
    );
    expect(res.exitCode, 0, reason: res.stderr);
    expect(File(out).existsSync(), isTrue);
    expect(
      sizeOf(out),
      sizeOf(small),
      reason: 'original should be copied as-is',
    );
  }, timeout: const Timeout(Duration(minutes: 2)));

  test('Resizing caps the maximum dimension', () async {
    final out = p.join(tmp.path, 'resized.png');
    final res = await service.processImage(
      inputPath: pngPath,
      outputPath: out,
      quality: 80,
      targetFormat: 'png',
      maxWidth: 640,
      maxHeight: 640,
    );
    expect(res.exitCode, 0, reason: res.stderr);
    expect(File(out).existsSync(), isTrue);

    final probe = await Process.run(FfmpegService().ffprobePath, [
      '-v',
      'error',
      '-select_streams',
      'v:0',
      '-show_entries',
      'stream=width,height',
      '-of',
      'csv=s=x:p=0',
      out,
    ]);
    expect(probe.exitCode, 0);
    final dims = (probe.stdout as String).trim().split('x');
    final w = int.parse(dims[0]);
    final h = int.parse(dims[1]);
    expect(w, lessThanOrEqualTo(640));
    expect(h, lessThanOrEqualTo(640));
  }, timeout: const Timeout(Duration(minutes: 2)));
}
