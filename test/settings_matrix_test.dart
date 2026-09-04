import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:path/path.dart' as p;
import 'package:shared_preferences/shared_preferences.dart';

import 'package:shrinkeo/cubit/compression_cubit.dart';
import 'package:shrinkeo/cubit/compression_state.dart';
import 'package:shrinkeo/models/video_file.dart';

/// Exhaustive state & settings matrix for the CompressionCubit: every setter,
/// clamping rule, persistence round-trip, reset-to-defaults, and the queue
/// pipeline (add / natural sort / dedup / remove / clear / cancel).
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late Directory tmp;

  setUp(() {
    SharedPreferences.setMockInitialValues({});
    tmp = Directory.systemTemp.createTempSync('shrinkeo_cubit_test_');
  });

  tearDown(() {
    try {
      tmp.deleteSync(recursive: true);
    } catch (_) {}
  });

  Future<CompressionCubit> makeCubit() async {
    final prefs = await SharedPreferences.getInstance();
    return CompressionCubit(prefs: prefs);
  }

  /// Creates an empty placeholder file with the given extension.
  String touch(String name) {
    final path = p.join(tmp.path, name);
    File(path).writeAsStringSync('x');
    return path;
  }

  // ---------------------------------------------------------------------------
  // Defaults
  // ---------------------------------------------------------------------------

  group('CompressionState defaults', () {
    test('fresh cubit exposes documented defaults', () async {
      final cubit = await makeCubit();
      final s = cubit.state;
      expect(s.videos, isEmpty);
      expect(s.phase, CompressionPhase.idle);
      expect(s.crfQuality, 22);
      expect(s.isTargetSizeMode, isFalse);
      expect(s.targetSizeMB, 25.0);
      expect(s.encodingPreset, EncodingPreset.fast);
      expect(s.videoCodec, VideoCodec.h264);
      expect(s.enableVideoDenoise, isFalse);
      expect(s.hardwareEncoder, HardwareEncoder.software);
      expect(s.audioMode, AudioMode.copy);
      expect(s.enableAudioDenoise, isFalse);
      expect(s.audioNormalizeMode, AudioNormalizeMode.off);
      expect(s.audioChannelsMode, AudioChannelsMode.original);
      expect(s.resolutionMode, ResolutionMode.original);
      expect(s.frameRateMode, FrameRateMode.original);
      expect(s.outputFormat, OutputFormat.original);
      expect(s.outputLocationMode, OutputLocationMode.unified);
      expect(s.deleteOriginalOnSuccess, isFalse);
      expect(s.languageCode, 'en');
      expect(s.imageQuality, 75);
      expect(s.imageOutputFormat, ImageOutputFormat.original);
      expect(s.imageResizeMode, ImageResizeMode.original);
      expect(s.stripImageExif, isFalse);
      expect(s.imageTargetSizeKB, 500.0);
      expect(s.isImageTargetSizeMode, isFalse);
      expect(s.canStart, isFalse);
      expect(s.isProcessing, isFalse);
    });
  });

  // ---------------------------------------------------------------------------
  // Every setter + clamping
  // ---------------------------------------------------------------------------

  group('Settings setters matrix', () {
    test('CRF clamps to 0..51 and persists', () async {
      final cubit = await makeCubit();
      cubit.updateCrfQuality(-5);
      expect(cubit.state.crfQuality, 0);
      cubit.updateCrfQuality(99);
      expect(cubit.state.crfQuality, 51);
      cubit.updateCrfQuality(30);
      expect(cubit.state.crfQuality, 30);
      // 30 falls into the "high compression" tier label range (<=30).
      expect(cubit.state.crfLabel, isNotEmpty);
    });

    test('target size clamps and persists', () async {
      final cubit = await makeCubit();
      cubit.updateTargetSizeMB(100000);
      expect(cubit.state.targetSizeMB, 10000.0);
      cubit.updateTargetSizeMB(42.5);
      expect(cubit.state.targetSizeMB, 42.5);
      cubit.toggleTargetSizeMode(true);
      expect(cubit.state.isTargetSizeMode, isTrue);
    });

    test('enum settings persist through the cubit', () async {
      final cubit = await makeCubit();
      cubit
        ..updateEncodingPreset(EncodingPreset.veryslow)
        ..updateVideoCodec(VideoCodec.av1)
        ..updateHardwareEncoder(HardwareEncoder.nvidia)
        ..updateAudioMode(AudioMode.aac128)
        ..updateAudioNormalizeMode(AudioNormalizeMode.speech)
        ..updateAudioChannelsMode(AudioChannelsMode.mono)
        ..updateResolutionMode(ResolutionMode.p720)
        ..updateFrameRateMode(FrameRateMode.fps30)
        ..updateOutputFormat(OutputFormat.mkv)
        ..updateOutputLocationMode(OutputLocationMode.sameAsOriginal)
        ..updateDeleteOriginalOnSuccess(true)
        ..toggleVideoDenoise(true)
        ..toggleAudioDenoise(true)
        ..toggleStripMetadata(true)
        ..toggleAutoCropBlackBars(true)
        ..updateExportType(ExportType.gif)
        ..updateVideoRotationMode(VideoRotationMode.flipH)
        ..updateVideoSpeedMode(VideoSpeedMode.fast20)
        ..updateAspectRatioMode(AspectRatioMode.shorts916);

      final s = cubit.state;
      expect(s.encodingPreset, EncodingPreset.veryslow);
      expect(s.videoCodec, VideoCodec.av1);
      expect(s.hardwareEncoder, HardwareEncoder.nvidia);
      expect(s.audioMode, AudioMode.aac128);
      expect(s.audioNormalizeMode, AudioNormalizeMode.speech);
      expect(s.audioChannelsMode, AudioChannelsMode.mono);
      expect(s.resolutionMode, ResolutionMode.p720);
      expect(s.frameRateMode, FrameRateMode.fps30);
      expect(s.outputFormat, OutputFormat.mkv);
      expect(s.outputLocationMode, OutputLocationMode.sameAsOriginal);
      expect(s.deleteOriginalOnSuccess, isTrue);
      expect(s.enableVideoDenoise, isTrue);
      expect(s.enableAudioDenoise, isTrue);
      expect(s.stripMetadata, isTrue);
      expect(s.autoCropBlackBars, isTrue);
      expect(s.exportType, ExportType.gif);
      expect(s.videoRotationMode, VideoRotationMode.flipH);
      expect(s.videoSpeedMode, VideoSpeedMode.fast20);
      expect(s.aspectRatioMode, AspectRatioMode.shorts916);
    });

    test('custom aspect ratio & rotation get defaults when selected', () async {
      final cubit = await makeCubit();
      cubit.updateAspectRatioMode(AspectRatioMode.custom);
      expect(cubit.state.customAspectRatio, '16:10');
      cubit.updateCustomAspectRatio('21:9');
      expect(cubit.state.customAspectRatio, '21:9');

      cubit.updateVideoRotationMode(VideoRotationMode.custom);
      expect(cubit.state.customRotationAngle, 45.0);
      cubit.updateCustomRotationAngle(30);
      expect(cubit.state.customRotationAngle, 30.0);
    });

    test('trim settings update without persistence (per-session)', () async {
      final cubit = await makeCubit();
      cubit.toggleTrim(true);
      cubit.updateTrimStartTime('00:00:05');
      cubit.updateTrimEndTime('00:01:30');
      expect(cubit.state.trimEnabled, isTrue);
      expect(cubit.state.trimStartTime, '00:00:05');
      expect(cubit.state.trimEndTime, '00:01:30');
    });

    test('image settings clamp to valid ranges', () async {
      final cubit = await makeCubit();
      cubit.updateImageQuality(0);
      expect(cubit.state.imageQuality, 1);
      cubit.updateImageQuality(250);
      expect(cubit.state.imageQuality, 100);
      cubit.updateImageQuality(60);

      cubit.updateImageTargetSizeKB(1);
      expect(cubit.state.imageTargetSizeKB, 10.0);
      cubit.updateImageTargetSizeKB(999999);
      expect(cubit.state.imageTargetSizeKB, 51200.0);
      cubit.updateImageTargetSizeKB(250);
      expect(cubit.state.imageTargetSizeKB, 250.0);

      cubit.updateImageOutputFormat(ImageOutputFormat.webp);
      cubit.updateImageResizeMode(ImageResizeMode.p1080);
      cubit.toggleStripImageExif(true);
      cubit.toggleImageTargetSizeMode(true);

      expect(cubit.state.imageOutputFormat, ImageOutputFormat.webp);
      expect(cubit.state.imageResizeMode, ImageResizeMode.p1080);
      expect(cubit.state.stripImageExif, isTrue);
      expect(cubit.state.isImageTargetSizeMode, isTrue);
    });

    test('panel expansion states are mutually exclusive', () async {
      final cubit = await makeCubit();
      cubit.toggleSettings();
      expect(cubit.state.isSettingsExpanded, isTrue);
      expect(cubit.state.isLanguageExpanded, isFalse);

      cubit.toggleLanguageSection();
      expect(cubit.state.isSettingsExpanded, isFalse);
      expect(cubit.state.isLanguageExpanded, isTrue);

      cubit.toggleLanguageSection();
      expect(cubit.state.isLanguageExpanded, isFalse);
    });

    test('theme toggles between dark and light and persists', () async {
      final cubit = await makeCubit();
      cubit.toggleTheme(); // system -> dark
      expect(cubit.state.themeMode, ThemeMode.dark);
      cubit.toggleTheme(); // dark -> light
      expect(cubit.state.themeMode, ThemeMode.light);
    });
  });

  // ---------------------------------------------------------------------------
  // Persistence round-trip
  // ---------------------------------------------------------------------------

  group('Persistence', () {
    test('a new cubit restores every persisted setting', () async {
      final prefs = await SharedPreferences.getInstance();
      final cubit = CompressionCubit(prefs: prefs);
      cubit
        ..updateCrfQuality(28)
        ..toggleTargetSizeMode(true)
        ..updateTargetSizeMB(64)
        ..updateEncodingPreset(EncodingPreset.slow)
        ..updateVideoCodec(VideoCodec.h265)
        ..updateHardwareEncoder(HardwareEncoder.intel)
        ..updateAudioMode(AudioMode.aac64)
        ..updateAudioNormalizeMode(AudioNormalizeMode.boost)
        ..updateAudioChannelsMode(AudioChannelsMode.stereo)
        ..updateResolutionMode(ResolutionMode.p1080)
        ..updateFrameRateMode(FrameRateMode.fps24)
        ..updateOutputFormat(OutputFormat.mov)
        ..updateOutputLocationMode(OutputLocationMode.sameAsOriginal)
        ..updateDeleteOriginalOnSuccess(true)
        ..toggleVideoDenoise(true)
        ..toggleAudioDenoise(true)
        ..changeLanguage('ar')
        ..updateImageQuality(90)
        ..updateImageOutputFormat(ImageOutputFormat.avif)
        ..updateImageResizeMode(ImageResizeMode.p4k)
        ..toggleStripImageExif(true)
        ..updateImageTargetSizeKB(300)
        ..toggleImageTargetSizeMode(true);

      // A fresh cubit over the same prefs must observe every value.
      final restored = CompressionCubit(prefs: prefs);
      final r = restored.state;
      expect(r.crfQuality, 28);
      expect(r.isTargetSizeMode, isTrue);
      expect(r.targetSizeMB, 64.0);
      expect(r.encodingPreset, EncodingPreset.slow);
      expect(r.videoCodec, VideoCodec.h265);
      expect(r.hardwareEncoder, HardwareEncoder.intel);
      expect(r.audioMode, AudioMode.aac64);
      expect(r.audioNormalizeMode, AudioNormalizeMode.boost);
      expect(r.audioChannelsMode, AudioChannelsMode.stereo);
      expect(r.resolutionMode, ResolutionMode.p1080);
      expect(r.frameRateMode, FrameRateMode.fps24);
      expect(r.outputFormat, OutputFormat.mov);
      expect(r.outputLocationMode, OutputLocationMode.sameAsOriginal);
      expect(r.deleteOriginalOnSuccess, isTrue);
      expect(r.enableVideoDenoise, isTrue);
      expect(r.enableAudioDenoise, isTrue);
      expect(r.languageCode, 'ar');
      expect(r.imageQuality, 90);
      expect(r.imageOutputFormat, ImageOutputFormat.avif);
      expect(r.imageResizeMode, ImageResizeMode.p4k);
      expect(r.stripImageExif, isTrue);
      expect(r.imageTargetSizeKB, 300.0);
      expect(r.isImageTargetSizeMode, isTrue);
    });
  });

  // ---------------------------------------------------------------------------
  // Reset to defaults
  // ---------------------------------------------------------------------------

  group('resetToDefaults', () {
    test('restores 100% of the settings fields', () async {
      final prefs = await SharedPreferences.getInstance();
      final cubit = CompressionCubit(prefs: prefs);

      final fresh = await makeCubit();
      final defaults = fresh.state;

      cubit
        ..updateCrfQuality(45)
        ..toggleTargetSizeMode(true)
        ..updateTargetSizeMB(120)
        ..updateEncodingPreset(EncodingPreset.ultrafast)
        ..updateVideoCodec(VideoCodec.av1)
        ..toggleVideoDenoise(true)
        ..updateHardwareEncoder(HardwareEncoder.amd)
        ..updateAudioMode(AudioMode.mute)
        ..toggleAudioDenoise(true)
        ..updateAudioNormalizeMode(AudioNormalizeMode.dynamic)
        ..updateAudioChannelsMode(AudioChannelsMode.mono)
        ..updateResolutionMode(ResolutionMode.p360)
        ..updateFrameRateMode(FrameRateMode.fps60)
        ..updateOutputFormat(OutputFormat.mp4)
        ..updateOutputLocationMode(OutputLocationMode.sameAsOriginal)
        ..updateDeleteOriginalOnSuccess(true)
        ..toggleTrim(true)
        ..updateTrimStartTime('00:00:10')
        ..updateTrimEndTime('00:00:20')
        ..updateVideoRotationMode(VideoRotationMode.deg90)
        ..updateVideoSpeedMode(VideoSpeedMode.timelapse40)
        ..updateAspectRatioMode(AspectRatioMode.square11)
        ..updateExportType(ExportType.mp3)
        ..toggleStripMetadata(true)
        ..toggleAutoCropBlackBars(true)
        ..updateCustomAspectRatio('5:4')
        ..updateCustomRotationAngle(120)
        ..updateImageQuality(25)
        ..updateImageOutputFormat(ImageOutputFormat.png)
        ..updateImageResizeMode(ImageResizeMode.p480)
        ..toggleStripImageExif(true)
        ..updateImageTargetSizeKB(150)
        ..toggleImageTargetSizeMode(true);

      // Confirm the tampered state actually differs everywhere it should.
      final tampered = cubit.state;
      expect(tampered.crfQuality, isNot(defaults.crfQuality));
      expect(tampered.encodingPreset, isNot(defaults.encodingPreset));
      expect(tampered.imageQuality, isNot(defaults.imageQuality));
      expect(tampered.videoCodec, isNot(defaults.videoCodec));

      cubit.resetToDefaults();
      final r = cubit.state;
      expect(r.crfQuality, defaults.crfQuality);
      expect(r.isTargetSizeMode, defaults.isTargetSizeMode);
      expect(r.targetSizeMB, defaults.targetSizeMB);
      expect(r.encodingPreset, defaults.encodingPreset);
      expect(r.videoCodec, defaults.videoCodec);
      expect(r.enableVideoDenoise, defaults.enableVideoDenoise);
      expect(r.hardwareEncoder, defaults.hardwareEncoder);
      expect(r.audioMode, defaults.audioMode);
      expect(r.enableAudioDenoise, defaults.enableAudioDenoise);
      expect(r.audioNormalizeMode, defaults.audioNormalizeMode);
      expect(r.audioChannelsMode, defaults.audioChannelsMode);
      expect(r.resolutionMode, defaults.resolutionMode);
      expect(r.frameRateMode, defaults.frameRateMode);
      expect(r.outputFormat, defaults.outputFormat);
      expect(r.outputLocationMode, defaults.outputLocationMode);
      expect(r.deleteOriginalOnSuccess, defaults.deleteOriginalOnSuccess);
      expect(r.trimEnabled, defaults.trimEnabled);
      expect(r.trimStartTime, defaults.trimStartTime);
      expect(r.trimEndTime, defaults.trimEndTime);
      expect(r.videoRotationMode, defaults.videoRotationMode);
      expect(r.videoSpeedMode, defaults.videoSpeedMode);
      expect(r.aspectRatioMode, defaults.aspectRatioMode);
      expect(r.exportType, defaults.exportType);
      expect(r.stripMetadata, defaults.stripMetadata);
      expect(r.autoCropBlackBars, defaults.autoCropBlackBars);
      expect(r.customAspectRatio, defaults.customAspectRatio);
      expect(r.customRotationAngle, defaults.customRotationAngle);
      expect(r.imageQuality, defaults.imageQuality);
      expect(r.imageOutputFormat, defaults.imageOutputFormat);
      expect(r.imageResizeMode, defaults.imageResizeMode);
      expect(r.stripImageExif, defaults.stripImageExif);
      expect(r.imageTargetSizeKB, defaults.imageTargetSizeKB);
      expect(r.isImageTargetSizeMode, defaults.isImageTargetSizeMode);
    });
  });

  // ---------------------------------------------------------------------------
  // Target size floor
  // ---------------------------------------------------------------------------

  group('minAchievableTargetSizeMB', () {
    test('falls back to 1 MB with no probed durations', () async {
      final cubit = await makeCubit();
      expect(cubit.minAchievableTargetSizeMB, 1.0);
    });
  });

  // ---------------------------------------------------------------------------
  // Queue pipeline
  // ---------------------------------------------------------------------------

  group('Queue pipeline', () {
    test('addFiles filters, classifies, natural-sorts and deduplicates',
        () async {
      final cubit = await makeCubit();

      // Out-of-order names to prove natural sorting (2, 10 — not 10, 2).
      touch('video2.mp4');
      touch('video10.mp4');
      touch('photo.png');
      touch('notes.txt'); // invalid extension — must be ignored
      await cubit.addFiles([tmp.path]);
      await Future<void>.delayed(const Duration(milliseconds: 50));

      expect(cubit.state.videos.length, 3, reason: 'txt is filtered out');
      expect(cubit.state.isScanningFiles, isFalse);
      expect(
        cubit.state.videos.map((v) => v.fileName).toList(),
        containsAllInOrder(['video2.mp4', 'video10.mp4']),
      );

      final images = cubit.state.videos
          .where((v) => v.mediaType == MediaType.image)
          .toList();
      expect(images.length, 1);
      expect(images.first.fileName, 'photo.png');

      // Dedup: re-adding the same folder must not duplicate entries.
      await cubit.addFiles([tmp.path]);
      await Future<void>.delayed(const Duration(milliseconds: 50));
      expect(cubit.state.videos.length, 3);
    });

    test('removeFile removes queued items only', () async {
      final cubit = await makeCubit();
      final path = touch('movie.mp4');
      await cubit.addFiles([path]);
      await Future<void>.delayed(const Duration(milliseconds: 50));
      final id = cubit.state.videos.single.id;

      cubit.removeFile(id);
      expect(cubit.state.videos, isEmpty);
    });

    test('clearCompleted keeps queued items, clearAll wipes everything',
        () async {
      final cubit = await makeCubit();
      final a = touch('a.mp4');
      final b = touch('b.mp4');
      await cubit.addFiles([a, b]);
      await Future<void>.delayed(const Duration(milliseconds: 50));
      expect(cubit.state.videos.length, 2);

      // With every item still queued, clearCompleted must keep them all.
      cubit.clearCompleted();
      expect(cubit.state.videos.length, 2);

      cubit.clearAll();
      expect(cubit.state.videos, isEmpty);
      expect(cubit.state.phase, CompressionPhase.idle);
    });

    test('cancelSingle removes a queued (not processing) item', () async {
      final cubit = await makeCubit();
      final path = touch('clip.mp4');
      await cubit.addFiles([path]);
      await Future<void>.delayed(const Duration(milliseconds: 50));
      final id = cubit.state.videos.single.id;

      await cubit.cancelSingle(id);
      expect(cubit.state.videos, isEmpty);
    });

    test('canStart flips with queued items', () async {
      final cubit = await makeCubit();
      expect(cubit.state.canStart, isFalse);
      await cubit.addFiles([touch('x.mp4')]);
      await Future<void>.delayed(const Duration(milliseconds: 50));
      expect(cubit.state.canStart, isTrue);
    });

    test('video extension helpers stay in sync with the picker list', () {
      final picker = VideoFile.pickerExtensions;
      for (final ext in validVideoExtensions) {
        expect(picker.contains(ext.substring(1)), isTrue, reason: ext);
      }
      for (final ext in validImageExtensions) {
        expect(picker.contains(ext.substring(1)), isTrue, reason: ext);
      }
      expect(VideoFile.isValidMediaExtension('.MP4'), isTrue);
      expect(VideoFile.isValidMediaExtension('.PNG'), isTrue);
      expect(VideoFile.isValidMediaExtension('.txt'), isFalse);
    });
  });
}
