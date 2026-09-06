import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:local_notifier/local_notifier.dart';
import 'package:path/path.dart' as p;
import 'package:shared_preferences/shared_preferences.dart';

import 'package:shrinkeo/cubit/compression_cubit.dart';
import 'package:shrinkeo/cubit/compression_state.dart';
import 'package:shrinkeo/models/file_item.dart';
import 'package:shrinkeo/models/image_progress.dart';
import 'package:shrinkeo/services/ffmpeg_service.dart';
import 'package:shrinkeo/services/image_compression_service.dart';

class BloatingFfmpegService extends FfmpegService {
  bool cancelCalled = false;

  @override
  Future<void> checkDependencies() async {}

  @override
  Future<Duration> probeDuration(String path) async =>
      const Duration(seconds: 10);

  @override
  Future<void> cancelCurrentProcess() async {
    cancelCalled = true;
  }

  @override
  Stream<CompressionProgress> compress({
    required String inputPath,
    required String outputPath,
    required Duration totalDuration,
    int crf = 22,
    bool isTargetSizeMode = false,
    double targetSizeMB = 25.0,
    String preset = 'fast',
    required VideoCodec codec,
    bool enableVideoDenoise = false,
    required HardwareEncoder hardwareEncoder,
    required AudioMode audioMode,
    bool enableAudioDenoise = false,
    AudioNormalizeMode audioNormalizeMode = AudioNormalizeMode.off,
    AudioChannelsMode audioChannelsMode = AudioChannelsMode.original,
    required ResolutionMode resolutionMode,
    required FrameRateMode frameRateMode,
    bool trimEnabled = false,
    String trimStartTime = '00:00:00',
    String trimEndTime = '00:00:00',
    VideoRotationMode videoRotationMode = VideoRotationMode.original,
    VideoSpeedMode videoSpeedMode = VideoSpeedMode.original,
    AspectRatioMode aspectRatioMode = AspectRatioMode.original,
    ExportType exportType = ExportType.video,
    bool stripMetadata = false,
    bool autoCropBlackBars = false,
    String customAspectRatio = '16:10',
    double customRotationAngle = 45.0,
  }) async* {
    final inBytes = File(inputPath).lengthSync();
    final outFile = File(outputPath);
    outFile.writeAsBytesSync(List.filled(inBytes + 5000, 99));

    yield CompressionProgress(
      progress: 0.5,
      speed: 1.0,
      eta: const Duration(seconds: 5),
      currentOutputSizeBytes: inBytes + 5000,
    );
  }
}

class PostCompleteBloatingFfmpegService extends FfmpegService {
  @override
  Future<void> checkDependencies() async {}

  @override
  Future<Duration> probeDuration(String path) async =>
      const Duration(seconds: 10);

  @override
  Stream<CompressionProgress> compress({
    required String inputPath,
    required String outputPath,
    required Duration totalDuration,
    int crf = 22,
    bool isTargetSizeMode = false,
    double targetSizeMB = 25.0,
    String preset = 'fast',
    required VideoCodec codec,
    bool enableVideoDenoise = false,
    required HardwareEncoder hardwareEncoder,
    required AudioMode audioMode,
    bool enableAudioDenoise = false,
    AudioNormalizeMode audioNormalizeMode = AudioNormalizeMode.off,
    AudioChannelsMode audioChannelsMode = AudioChannelsMode.original,
    required ResolutionMode resolutionMode,
    required FrameRateMode frameRateMode,
    bool trimEnabled = false,
    String trimStartTime = '00:00:00',
    String trimEndTime = '00:00:00',
    VideoRotationMode videoRotationMode = VideoRotationMode.original,
    VideoSpeedMode videoSpeedMode = VideoSpeedMode.original,
    AspectRatioMode aspectRatioMode = AspectRatioMode.original,
    ExportType exportType = ExportType.video,
    bool stripMetadata = false,
    bool autoCropBlackBars = false,
    String customAspectRatio = '16:10',
    double customRotationAngle = 45.0,
  }) async* {
    final inBytes = File(inputPath).lengthSync();
    final outFile = File(outputPath);
    outFile.writeAsBytesSync(List.filled(inBytes + 3000, 77));

    yield CompressionProgress(
      progress: 1.0,
      speed: 1.0,
      eta: Duration.zero,
      currentOutputSizeBytes: inBytes - 100,
    );
  }
}

class BloatingImageCompressionService extends ImageCompressionService {
  @override
  Future<ProcessResult> processImage({
    required String inputPath,
    required String outputPath,
    int quality = 80,
    String targetFormat = 'original',
    int? maxWidth,
    int? maxHeight,
    bool stripExif = true,
    double? targetSizeKB,
    bool Function()? isCancelled,
    void Function(double progress)? onProgress,
    void Function(ImageProgress progress)? onStatus,
  }) async {
    final inBytes = File(inputPath).lengthSync();
    final outFile = File(outputPath);
    outFile.writeAsBytesSync(List.filled(inBytes + 2000, 88));
    return ProcessResult(1234, 0, '', '');
  }
}

class FlakyFfmpegService extends FfmpegService {
  bool shouldFail = true;

  @override
  Future<void> checkDependencies() async {}

  @override
  Future<Duration> probeDuration(String path) async =>
      const Duration(seconds: 10);

  @override
  Stream<CompressionProgress> compress({
    required String inputPath,
    required String outputPath,
    required Duration totalDuration,
    int crf = 22,
    bool isTargetSizeMode = false,
    double targetSizeMB = 25.0,
    String preset = 'fast',
    required VideoCodec codec,
    bool enableVideoDenoise = false,
    required HardwareEncoder hardwareEncoder,
    required AudioMode audioMode,
    bool enableAudioDenoise = false,
    AudioNormalizeMode audioNormalizeMode = AudioNormalizeMode.off,
    AudioChannelsMode audioChannelsMode = AudioChannelsMode.original,
    required ResolutionMode resolutionMode,
    required FrameRateMode frameRateMode,
    bool trimEnabled = false,
    String trimStartTime = '00:00:00',
    String trimEndTime = '00:00:00',
    VideoRotationMode videoRotationMode = VideoRotationMode.original,
    VideoSpeedMode videoSpeedMode = VideoSpeedMode.original,
    AspectRatioMode aspectRatioMode = AspectRatioMode.original,
    ExportType exportType = ExportType.video,
    bool stripMetadata = false,
    bool autoCropBlackBars = false,
    String customAspectRatio = '16:10',
    double customRotationAngle = 45.0,
  }) async* {
    if (shouldFail) {
      throw Exception('Simulated temporary encoder crash');
    }
    final inBytes = File(inputPath).lengthSync();
    final outFile = File(outputPath);
    outFile.writeAsBytesSync(List.filled(inBytes ~/ 2, 55));
    yield CompressionProgress(
      progress: 1.0,
      speed: 1.5,
      eta: Duration.zero,
      currentOutputSizeBytes: inBytes ~/ 2,
    );
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late Directory tmp;
  late SharedPreferences prefs;

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    prefs = await SharedPreferences.getInstance();
    tmp = Directory.systemTemp.createTempSync('shrinkeo_size_guard_');

    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
          const MethodChannel('local_notifier'),
          (_) async => true,
        );
    await localNotifier.setup(appName: 'Shrinkeo test');
  });

  tearDown(() {
    try {
      tmp.deleteSync(recursive: true);
    } catch (_) {}
  });

  String createTestFile(String name, int byteCount, int fillByte) {
    final path = p.join(tmp.path, name);
    File(path).writeAsBytesSync(List.filled(byteCount, fillByte));
    return path;
  }

  test('mid-stream video size increase aborts early and reverts to original video', () async {
    final mockFfmpeg = BloatingFfmpegService();
    final cubit = CompressionCubit(
      ffmpegService: mockFfmpeg,
      prefs: prefs,
    );

    final originalVideoPath = createTestFile('test_clip.mp4', 10000, 1);
    await cubit.addFiles([originalVideoPath]);
    await Future<void>.delayed(const Duration(milliseconds: 50));

    expect(cubit.state.videos.length, 1);
    final initialItem = cubit.state.videos.first;
    expect(initialItem.fileSizeBytes, 10000);

    // Start compression
    await cubit.startCompression();

    expect(mockFfmpeg.cancelCalled, isTrue);

    final completedItem = cubit.state.videos.first;
    expect(completedItem.status, VideoStatus.success);
    expect(completedItem.outputSizeBytes, 10000);
    expect(completedItem.savedBytes, 0);

    final resultFile = File(completedItem.outputPath!);
    expect(resultFile.existsSync(), isTrue);
    expect(resultFile.lengthSync(), 10000);
    expect(resultFile.readAsBytesSync(), List.filled(10000, 1));
  });

  test('post-completion video size increase reverts to original video', () async {
    final mockFfmpeg = PostCompleteBloatingFfmpegService();
    final cubit = CompressionCubit(
      ffmpegService: mockFfmpeg,
      prefs: prefs,
    );

    final originalVideoPath = createTestFile('test_clip_post.mp4', 8000, 2);
    await cubit.addFiles([originalVideoPath]);
    await Future<void>.delayed(const Duration(milliseconds: 50));

    // Start compression
    await cubit.startCompression();

    final completedItem = cubit.state.videos.first;
    expect(completedItem.status, VideoStatus.success);
    expect(completedItem.outputSizeBytes, 8000);
    expect(completedItem.savedBytes, 0);

    final resultFile = File(completedItem.outputPath!);
    expect(resultFile.existsSync(), isTrue);
    expect(resultFile.lengthSync(), 8000);
    expect(resultFile.readAsBytesSync(), List.filled(8000, 2));
  });

  test('image compression larger than original reverts to original image in original format', () async {
    final mockImage = BloatingImageCompressionService();
    final cubit = CompressionCubit(
      imageCompressionService: mockImage,
      prefs: prefs,
    );

    final originalImagePath = createTestFile('photo.png', 5000, 3);
    await cubit.addFiles([originalImagePath]);
    await Future<void>.delayed(const Duration(milliseconds: 50));

    expect(cubit.state.videos.first.isImage, isTrue);

    // Start compression
    await cubit.startCompression();

    final completedItem = cubit.state.videos.first;
    expect(completedItem.status, VideoStatus.success);
    expect(completedItem.outputSizeBytes, 5000);
    expect(completedItem.savedBytes, 0);

    final resultFile = File(completedItem.outputPath!);
    expect(resultFile.existsSync(), isTrue);
    expect(resultFile.lengthSync(), 5000);
    expect(resultFile.readAsBytesSync(), List.filled(5000, 3));
  });

  test('deleteOriginalOnSuccess does NOT delete original file when size is preserved (savedBytes == 0)', () async {
    final mockFfmpeg = BloatingFfmpegService();
    final cubit = CompressionCubit(
      ffmpegService: mockFfmpeg,
      prefs: prefs,
    );
    cubit.updateDeleteOriginalOnSuccess(true);

    final originalVideoPath = createTestFile('safe_clip.mp4', 12000, 4);
    await cubit.addFiles([originalVideoPath]);
    await Future<void>.delayed(const Duration(milliseconds: 50));

    await cubit.startCompression();

    final completedItem = cubit.state.videos.first;
    expect(completedItem.status, VideoStatus.success);
    expect(completedItem.savedBytes, 0);

    // Verify original file is PRESERVED and NOT deleted!
    expect(File(originalVideoPath).existsSync(), isTrue);
    expect(File(originalVideoPath).lengthSync(), 12000);
  });

  test('retrySingle re-queues and successfully compresses a previously failed item', () async {
    final mockFfmpeg = FlakyFfmpegService();
    final cubit = CompressionCubit(
      ffmpegService: mockFfmpeg,
      prefs: prefs,
    );

    final originalVideoPath = createTestFile('flaky_clip.mp4', 10000, 5);
    await cubit.addFiles([originalVideoPath]);
    await Future<void>.delayed(const Duration(milliseconds: 50));

    // First attempt fails
    await cubit.startCompression();

    expect(cubit.state.videos.first.status, VideoStatus.failed);
    expect(cubit.state.phase, CompressionPhase.completed);

    // Next attempt succeeds
    mockFfmpeg.shouldFail = false;
    await cubit.retrySingle(cubit.state.videos.first.id);

    final retriedItem = cubit.state.videos.first;
    expect(retriedItem.status, VideoStatus.success);
    expect(retriedItem.outputSizeBytes, 5000);
    expect(retriedItem.savedBytes, 5000);
    expect(File(retriedItem.outputPath!).existsSync(), isTrue);
  });

  test('bounded parallel image pool compresses multiple images concurrently and accumulates savings', () async {
    final trackingImageService = ParallelTrackingImageService();
    final cubit = CompressionCubit(
      imageCompressionService: trackingImageService,
      ffmpegService: BloatingFfmpegService(),
      maxConcurrentImages: 3,
      prefs: prefs,
    );

    final img1 = createTestFile('p1.png', 4000, 1);
    final img2 = createTestFile('p2.png', 4000, 2);
    final img3 = createTestFile('p3.png', 4000, 3);
    final img4 = createTestFile('p4.png', 4000, 4);

    await cubit.addFiles([img1, img2, img3, img4]);
    await Future<void>.delayed(const Duration(milliseconds: 50));

    expect(cubit.state.videos.length, 4);

    await cubit.startCompression();

    // Verify peak concurrency reached the pool capacity (up to 3)
    expect(trackingImageService.peakActive, greaterThanOrEqualTo(2));
    expect(trackingImageService.peakActive, lessThanOrEqualTo(3));

    // Verify all 4 images succeeded
    for (final v in cubit.state.videos) {
      expect(v.status, VideoStatus.success);
      expect(v.outputSizeBytes, 2000);
      expect(v.savedBytes, 2000);
      expect(File(v.outputPath!).existsSync(), isTrue);
    }

    // Total saved = 4 * 2000 = 8000 bytes atomically accumulated
    expect(cubit.state.globalSavedBytes, 8000);
  });

  test('cancelling parallel image compression marks active workers as cancelled', () async {
    final trackingImageService = ParallelTrackingImageService(delayMs: 150);
    final cubit = CompressionCubit(
      imageCompressionService: trackingImageService,
      ffmpegService: BloatingFfmpegService(),
      maxConcurrentImages: 2,
      prefs: prefs,
    );

    final img1 = createTestFile('c1.png', 4000, 1);
    final img2 = createTestFile('c2.png', 4000, 2);
    final img3 = createTestFile('c3.png', 4000, 3);

    await cubit.addFiles([img1, img2, img3]);
    final running = cubit.startCompression();

    // Wait until workers are in-flight
    await Future<void>.delayed(const Duration(milliseconds: 50));
    await cubit.cancelCompression();
    await running;

    expect(cubit.state.phase, CompressionPhase.idle);
    for (final v in cubit.state.videos) {
      expect(v.status == VideoStatus.cancelled || v.status == VideoStatus.queued, isTrue);
    }
  });
}

class ParallelTrackingImageService extends ImageCompressionService {
  final int delayMs;
  int currentActive = 0;
  int peakActive = 0;

  ParallelTrackingImageService({this.delayMs = 60});

  @override
  Future<ProcessResult> processImage({
    required String inputPath,
    required String outputPath,
    int quality = 80,
    String targetFormat = 'original',
    int? maxWidth,
    int? maxHeight,
    bool stripExif = true,
    double? targetSizeKB,
    bool Function()? isCancelled,
    void Function(double progress)? onProgress,
    void Function(ImageProgress progress)? onStatus,
  }) async {
    currentActive++;
    if (currentActive > peakActive) {
      peakActive = currentActive;
    }

    try {
      final step = (delayMs ~/ 5).clamp(1, 100);
      for (int i = 0; i < 5; i++) {
        if (isCancelled?.call() ?? false) {
          return ProcessResult(999, -1, '', 'Cancelled');
        }
        await Future<void>.delayed(Duration(milliseconds: step));
      }

      if (isCancelled?.call() ?? false) {
        return ProcessResult(999, -1, '', 'Cancelled');
      }

      final inBytes = File(inputPath).lengthSync();
      final outFile = File(outputPath);
      final outBytes = inBytes ~/ 2;
      outFile.writeAsBytesSync(List.filled(outBytes, 11));

      return ProcessResult(999, 0, '', '');
    } finally {
      currentActive--;
    }
  }
}
