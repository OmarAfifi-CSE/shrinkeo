import 'dart:io';

import 'package:flutter/material.dart';
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
import 'package:shrinkeo/services/file_scanner_service.dart';
import 'package:shrinkeo/services/image_compression_service.dart';
import 'package:shrinkeo/ui/widgets/smooth_button.dart';

class StubFfmpegService extends FfmpegService {
  @override
  Future<void> checkDependencies() async {}

  @override
  Future<Duration> probeDuration(String path) async => const Duration(seconds: 10);
}

class FastSuccessImageService extends ImageCompressionService {
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
    final inFile = File(inputPath);
    final outFile = File(outputPath);
    if (!outFile.parent.existsSync()) {
      outFile.parent.createSync(recursive: true);
    }
    final inBytes = inFile.existsSync() ? inFile.lengthSync() : 2000;
    outFile.writeAsBytesSync(List.filled((inBytes ~/ 2).clamp(1, inBytes), 99));
    onProgress?.call(1.0);
    return ProcessResult(101, 0, '', '');
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

    tempDir = await Directory.systemTemp.createTemp('shrinkeo_qa_edge_cases_');
  });

  tearDown(() async {
    if (tempDir.existsSync()) {
      tempDir.deleteSync(recursive: true);
    }
  });

  group('QA Comprehensive Edge Cases: File Scanner & Filtering', () {
    test('filters out non-media files and empty folders cleanly without crash', () async {
      final scanner = FileScannerService();

      // Create dummy folder structure with mixed files
      final emptySubDir = Directory('${tempDir.path}/EmptyFolder')..createSync();
      final textFile = File('${tempDir.path}/notes.txt')..writeAsStringSync('Hello');
      final docFile = File('${tempDir.path}/report.docx')..writeAsStringSync('Word doc');
      final validPng = File('${tempDir.path}/photo.png')..writeAsBytesSync([1, 2, 3]);
      final validMp4 = File('${tempDir.path}/clip.mp4')..writeAsBytesSync([4, 5, 6]);
      final upperCaseJpg = File('${tempDir.path}/UPPERCASE.JPG')..writeAsBytesSync([7, 8, 9]);

      final scanned = await scanner.scanPaths([
        emptySubDir.path,
        textFile.path,
        docFile.path,
        validPng.path,
        validMp4.path,
        upperCaseJpg.path,
        '${tempDir.path}/NonExistentFile.mov',
      ]);

      expect(scanned.length, 3);
      expect(scanned.any((p) => p.endsWith('photo.png')), isTrue);
      expect(scanned.any((p) => p.endsWith('clip.mp4')), isTrue);
      expect(scanned.any((p) => p.endsWith('UPPERCASE.JPG')), isTrue);
      expect(scanned.any((p) => p.endsWith('notes.txt')), isFalse);
    });

    test('validates all supported media extensions case-insensitively', () {
      const validExtensions = [
        '.mp4', '.MP4',
        '.mkv', '.MKV',
        '.mov', '.MOV',
        '.webm', '.WEBM',
        '.avi', '.AVI',
        '.wmv', '.WMV',
        '.png', '.PNG',
        '.jpg', '.JPG',
        '.jpeg', '.JPEG',
        '.webp', '.WEBP',
        '.avif', '.AVIF',
        '.heic', '.HEIC',
        '.bmp', '.BMP',
        '.tiff', '.TIFF',
      ];

      for (final ext in validExtensions) {
        expect(
          VideoFile.isValidMediaExtension(ext),
          isTrue,
          reason: 'Extension $ext should be valid media',
        );
      }

      const invalidExtensions = ['.exe', '.zip', '.pdf', '.txt', '.dart', '.json'];
      for (final ext in invalidExtensions) {
        expect(
          VideoFile.isValidMediaExtension(ext),
          isFalse,
          reason: 'Extension $ext should be invalid media',
        );
      }
    });
  });

  group('QA Comprehensive Edge Cases: Natural Sort & Queue Ordering', () {
    test('sorts numeric filenames naturally: 1, 2, 10, 20 instead of 1, 10, 2, 20', () async {
      final cubit = CompressionCubit(
        ffmpegService: StubFfmpegService(),
        prefs: prefs,
      );
      addTearDown(cubit.close);

      // Create unordered files: file20, file2, file1, file10
      final f20 = File('${tempDir.path}/img_20.jpg')..writeAsBytesSync([1]);
      final f2 = File('${tempDir.path}/img_2.jpg')..writeAsBytesSync([1]);
      final f1 = File('${tempDir.path}/img_1.jpg')..writeAsBytesSync([1]);
      final f10 = File('${tempDir.path}/img_10.jpg')..writeAsBytesSync([1]);

      await cubit.addFiles([f20.path, f2.path, f1.path, f10.path]);
      await Future<void>.delayed(const Duration(milliseconds: 50));

      final fileNames = cubit.state.videos.map((v) => v.fileName).toList();
      expect(fileNames, ['img_1.jpg', 'img_2.jpg', 'img_10.jpg', 'img_20.jpg']);
    });
  });

  group('QA Comprehensive Edge Cases: Pause, Cancel, and Stop Workflows', () {
    test('cancelling compression while in paused state resets phase to idle cleanly', () async {
      final cubit = CompressionCubit(
        ffmpegService: StubFfmpegService(),
        imageCompressionService: FastSuccessImageService(),
        prefs: prefs,
      );
      addTearDown(cubit.close);

      final f1 = File('${tempDir.path}/img_a.png')..writeAsBytesSync(List.filled(2000, 1));
      final f2 = File('${tempDir.path}/img_b.png')..writeAsBytesSync(List.filled(2000, 2));
      await cubit.addFiles([f1.path, f2.path]);
      await Future<void>.delayed(const Duration(milliseconds: 50));

      // Simulate pause state
      cubit.emit(
        cubit.state.copyWith(
          phase: CompressionPhase.paused,
          isPauseRequested: false,
        ),
      );

      expect(cubit.state.isPaused, isTrue);
      expect(cubit.state.canResume, isTrue);

      // Cancel while paused
      await cubit.cancelCompression();

      expect(cubit.state.phase, CompressionPhase.idle);
      expect(cubit.state.isPaused, isFalse);
      expect(cubit.state.isPauseRequested, isFalse);
    });

    test('retrySingle on failed item resets item status to queued and clears error', () async {
      final cubit = CompressionCubit(
        ffmpegService: StubFfmpegService(),
        imageCompressionService: FastSuccessImageService(),
        prefs: prefs,
      );
      addTearDown(cubit.close);

      final f1 = File('${tempDir.path}/img_fail.png')..writeAsBytesSync(List.filled(2000, 1));
      await cubit.addFiles([f1.path]);
      await Future<void>.delayed(const Duration(milliseconds: 50));

      final id = cubit.state.videos.single.id;

      // Mark as failed
      cubit.emit(
        cubit.state.copyWith(
          videos: [
            cubit.state.videos.single.copyWith(
              status: VideoStatus.failed,
              errorMessage: 'Disk full error',
            ),
          ],
          phase: CompressionPhase.completed,
        ),
      );

      expect(cubit.state.videos.single.status, VideoStatus.failed);
      expect(cubit.state.videos.single.errorMessage, isNotNull);

      // Retry single
      await cubit.retrySingle(id);

      // Should succeed with FastSuccessImageService
      expect(cubit.state.videos.single.status, VideoStatus.success);
      expect(cubit.state.videos.single.errorMessage, isNull);
    });
  });

  group('QA Comprehensive Edge Cases: Output Location Modes', () {
    test('sameAsOriginal mode writes output to original source directory', () async {
      final cubit = CompressionCubit(
        ffmpegService: StubFfmpegService(),
        imageCompressionService: FastSuccessImageService(),
        prefs: prefs,
      );
      addTearDown(cubit.close);

      final subDir = Directory('${tempDir.path}/SourceDir')..createSync();
      final file = File('${subDir.path}/pic.png')..writeAsBytesSync(List.filled(2000, 1));

      await cubit.addFiles([file.path]);
      cubit.updateOutputLocationMode(OutputLocationMode.sameAsOriginal);

      await cubit.startCompression();

      final processed = cubit.state.videos.single;
      expect(processed.status, VideoStatus.success);
      expect(processed.outputPath, isNotNull);
      expect(
        p.normalize(File(processed.outputPath!).parent.path),
        p.normalize(p.join(subDir.path, 'Shrinkeo Output')),
      );
    });
  });

  group('QA Comprehensive Edge Cases: SmoothButton Lifecycle Safety', () {
    testWidgets('SmoothButton handles rapid press, unmount, and hover without throwing', (tester) async {
      bool tapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: StatefulBuilder(
              builder: (context, setState) {
                return SmoothButton(
                  onTap: () => tapped = true,
                  enableHoverScale: true,
                  child: const Text('Click Me'),
                );
              },
            ),
          ),
        ),
      );

      // Tap down
      await tester.tap(find.text('Click Me'));
      await tester.pump(const Duration(milliseconds: 50));
      expect(tapped, isTrue);

      // Rapidly unmount widget while pointer events could still be pending
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SizedBox.shrink(),
          ),
        ),
      );
      await tester.pumpAndSettle();

      // Verified: Zero exceptions thrown during unmount/dispose
    });

    test('queueSavedBytes strictly reflects only current queue savings, completely isolated from globalSavedBytes', () {
      // 1. Queue with globalSavedBytes = 10 GB (from previous lifetime runs)
      // but active queue has 0 successful compressed items
      const v1 = VideoFile(
        id: 'v1',
        filePath: '/dummy/v1.mp4',
        fileName: 'v1.mp4',
        extension: 'mp4',
        fileSizeBytes: 10000000,
        status: VideoStatus.queued,
      );
      const v2 = VideoFile(
        id: 'v2',
        filePath: '/dummy/v2.mp4',
        fileName: 'v2.mp4',
        extension: 'mp4',
        fileSizeBytes: 20000000,
        status: VideoStatus.queued,
      );

      final stateWithLifetime = const CompressionState(
        globalSavedBytes: 10000000000, // 10 GB lifetime saved
      ).copyWith(videos: [v1, v2]);

      expect(stateWithLifetime.globalSavedBytes, 10000000000);
      expect(stateWithLifetime.queueSavedBytes, 0,
          reason: 'Active queue has no completed items; queueSavedBytes must be 0, not globalSavedBytes');
      expect(stateWithLifetime.totalSavedBytes, 0);

      // 2. Complete v1 saving 4,000,000 bytes (10 MB -> 6 MB)
      final v1Success = v1.copyWith(
        status: VideoStatus.success,
        outputSizeBytes: 6000000,
      );

      final stateAfterV1 = stateWithLifetime.copyWith(videos: [v1Success, v2]);

      expect(stateAfterV1.globalSavedBytes, 10000000000);
      expect(stateAfterV1.queueSavedBytes, 4000000,
          reason: 'Only current queue savings (4 MB) should be reported, never mixed with lifetime');
      expect(stateAfterV1.totalSavedBytes, 4000000);
    });
  });
}
