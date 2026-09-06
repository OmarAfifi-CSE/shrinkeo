import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:local_notifier/local_notifier.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:shrinkeo/core/app_strings.dart';
import 'package:shrinkeo/cubit/compression_cubit.dart';
import 'package:shrinkeo/cubit/compression_state.dart';
import 'package:shrinkeo/l10n/app_localizations.dart';
import 'package:shrinkeo/models/file_item.dart';
import 'package:shrinkeo/models/image_progress.dart';
import 'package:shrinkeo/services/ffmpeg_service.dart';
import 'package:shrinkeo/services/image_compression_service.dart';
import 'package:shrinkeo/ui/widgets/bottom_action_bar.dart';

class PausableFfmpegService extends FfmpegService {
  @override
  Future<void> checkDependencies() async {}

  @override
  Future<Duration> probeDuration(String path) async => const Duration(seconds: 5);

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
    yield CompressionProgress(
      progress: 0.5,
      speed: 1.0,
      eta: const Duration(seconds: 2),
    );

    await Future<void>.delayed(const Duration(milliseconds: 60));

    final inBytes = File(inputPath).lengthSync();
    final outFile = File(outputPath);
    outFile.writeAsBytesSync(List.filled(inBytes ~/ 2, 7));

    yield CompressionProgress(
      progress: 1.0,
      speed: 1.0,
      eta: Duration.zero,
    );
  }
}

class PausableImageService extends ImageCompressionService {
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
    await Future<void>.delayed(const Duration(milliseconds: 60));

    final inBytes = File(inputPath).lengthSync();
    final outFile = File(outputPath);
    outFile.writeAsBytesSync(List.filled(inBytes ~/ 2, 8));

    return ProcessResult(100, 0, '', '');
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late Directory tempDir;
  late SharedPreferences prefs;

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    prefs = await SharedPreferences.getInstance();

    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
          const MethodChannel('local_notifier'),
          (_) async => true,
        );
    await localNotifier.setup(appName: 'Shrinkeo test');

    tempDir = await Directory.systemTemp.createTemp('shrinkeo_pause_test_');
  });

  tearDown(() async {
    if (tempDir.existsSync()) {
      tempDir.deleteSync(recursive: true);
    }
  });

  String createTestFile(String name, int bytes) {
    final file = File('${tempDir.path}/$name');
    file.writeAsBytesSync(List.filled(bytes, 5));
    return file.path;
  }

  test('queue pauses cleanly after current item finishes, and resumes successfully', () async {
    final ffmpeg = PausableFfmpegService();
    final cubit = CompressionCubit(
      ffmpegService: ffmpeg,
      imageCompressionService: PausableImageService(),
      prefs: prefs,
    );
    addTearDown(cubit.close);

    final v1 = createTestFile('vid1.mp4', 8000);
    final v2 = createTestFile('vid2.mp4', 8000);
    final v3 = createTestFile('vid3.mp4', 8000);

    await cubit.addFiles([v1, v2, v3]);
    expect(cubit.state.videos.length, 3);
    expect(cubit.state.canStart, isTrue);

    // 1. Start compression
    final running1 = cubit.startCompression();

    // 2. Wait until vid1 is processing
    for (int i = 0; i < 50; i++) {
      if (cubit.state.isProcessing) break;
      await Future<void>.delayed(const Duration(milliseconds: 10));
    }
    expect(cubit.state.isProcessing, isTrue);

    // 3. Request Pause
    cubit.pauseCompression();
    expect(cubit.state.isPauseRequested, isTrue);

    // 4. Wait for running1 to finish pausing
    await running1;

    // 5. Verify paused state
    expect(cubit.state.phase, CompressionPhase.paused);
    expect(cubit.state.isPaused, isTrue);
    expect(cubit.state.canResume, isTrue);
    expect(cubit.state.isPauseRequested, isFalse);

    // vid1 succeeded, vid2 and vid3 are still queued
    expect(cubit.state.videos[0].status, VideoStatus.success);
    expect(cubit.state.videos[1].status, VideoStatus.queued);
    expect(cubit.state.videos[2].status, VideoStatus.queued);

    // 6. Resume compression
    final running2 = cubit.resumeCompression();
    await running2;

    // 7. Verify all items completed
    expect(cubit.state.phase, CompressionPhase.completed);
    expect(cubit.state.successCount, 3);
    for (final v in cubit.state.videos) {
      expect(v.status, VideoStatus.success);
    }
  });

  test('cancelling a paused queue transitions cleanly to idle state', () async {
    final ffmpeg = PausableFfmpegService();
    final cubit = CompressionCubit(
      ffmpegService: ffmpeg,
      imageCompressionService: PausableImageService(),
      prefs: prefs,
    );
    addTearDown(cubit.close);

    final v1 = createTestFile('p_vid1.mp4', 8000);
    final v2 = createTestFile('p_vid2.mp4', 8000);

    await cubit.addFiles([v1, v2]);

    final running = cubit.startCompression();
    for (int i = 0; i < 50; i++) {
      if (cubit.state.isProcessing) break;
      await Future<void>.delayed(const Duration(milliseconds: 10));
    }
    cubit.pauseCompression();
    await running;

    expect(cubit.state.isPaused, isTrue);

    // Cancel while paused
    await cubit.cancelCompression();
    expect(cubit.state.phase, CompressionPhase.idle);
    expect(cubit.state.isPaused, isFalse);
    expect(cubit.state.isPauseRequested, isFalse);
  });

  test('requesting pause on the final item completes normally without zombie paused state', () async {
    final ffmpeg = PausableFfmpegService();
    final cubit = CompressionCubit(
      ffmpegService: ffmpeg,
      imageCompressionService: PausableImageService(),
      prefs: prefs,
    );
    addTearDown(cubit.close);

    final v1 = createTestFile('single_vid.mp4', 8000);
    await cubit.addFiles([v1]);

    final running = cubit.startCompression();
    for (int i = 0; i < 50; i++) {
      if (cubit.state.isProcessing) break;
      await Future<void>.delayed(const Duration(milliseconds: 10));
    }
    // User requested pause during the sole/last item in the queue:
    cubit.pauseCompression();
    await running;

    // Must be COMPLETED, not paused!
    expect(cubit.state.phase, CompressionPhase.completed);
    expect(cubit.state.isPaused, isFalse);
    expect(cubit.state.canResume, isFalse);
    expect(cubit.state.isPauseRequested, isFalse);
    expect(cubit.state.successCount, 1);
  });

  testWidgets('BottomActionBar renders All Done without Resume or Stop when completed', (tester) async {
    final cubit = CompressionCubit(
      ffmpegService: PausableFfmpegService(),
      imageCompressionService: PausableImageService(),
      prefs: prefs,
    );
    addTearDown(cubit.close);

    final completedState = cubit.state.copyWith(
      phase: CompressionPhase.completed,
      videos: [
        const VideoFile(
          id: '1',
          filePath: 'done.mp4',
          fileName: 'done.mp4',
          extension: '.mp4',
          fileSizeBytes: 1000,
          status: VideoStatus.success,
          mediaType: MediaType.video,
          outputPath: 'done_out.mp4',
          outputSizeBytes: 500,
        ),
      ],
    );

    tester.view.physicalSize = const Size(1280, 800);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });

    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Scaffold(
          body: BlocProvider<CompressionCubit>.value(
            value: cubit,
            child: BottomActionBar(state: completedState),
          ),
        ),
      ),
    );
    await tester.pump();

    // Verify "All Done" label is shown
    expect(find.text(AppStrings.allDoneLabel), findsOneWidget);
    // Verify Resume, Stop All, and Paused are NOT shown
    expect(find.text(AppStrings.resumeBtn), findsNothing);
    expect(find.text(AppStrings.stopAllBtn), findsNothing);
    expect(find.text(AppStrings.pausedLabel), findsNothing);
  });
}


