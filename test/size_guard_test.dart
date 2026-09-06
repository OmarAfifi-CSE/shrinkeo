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
}
