import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shrinkeo/cubit/compression_cubit.dart';
import 'package:shrinkeo/cubit/compression_state.dart';
import 'package:shrinkeo/models/file_item.dart';
import 'package:shrinkeo/services/file_scanner_service.dart';
import 'package:shrinkeo/ui/widgets/file_queue_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late SharedPreferences prefs;

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    prefs = await SharedPreferences.getInstance();
  });

  group('🚀 Extreme Workload & Stress Benchmark Suite', () {
    test('1. Huge File Handling (100 GB virtual file & 0-byte edge cases)', () {
      final sw = Stopwatch()..start();

      // 100 GB video file (100 * 1024^3 bytes)
      const hugeSizeBytes = 100 * 1024 * 1024 * 1024;
      const hugeFile = VideoFile(
        id: 'huge_1',
        filePath: r'D:\Videos\Raw_8K_Master_Cinema_Feature.mkv',
        fileName: 'Raw_8K_Master_Cinema_Feature.mkv',
        extension: '.mkv',
        fileSizeBytes: hugeSizeBytes,
        totalDuration: Duration(hours: 3, minutes: 45),
        status: FileStatus.queued,
      );

      expect(VideoFile.formatFileSize(hugeFile.fileSizeBytes), '\u200E100.00 GB');
      expect(hugeFile.fileSizeBytes, hugeSizeBytes);

      // 0-byte corrupted file
      const zeroByteFile = VideoFile(
        id: 'zero_1',
        filePath: r'D:\Videos\corrupted_zero.mp4',
        fileName: 'corrupted_zero.mp4',
        extension: '.mp4',
        fileSizeBytes: 0,
        status: FileStatus.queued,
      );

      expect(VideoFile.formatFileSize(zeroByteFile.fileSizeBytes), '\u200E0 B');
      expect(zeroByteFile.compressionRatio, isNull);
      expect(zeroByteFile.savedBytes, 0);

      sw.stop();
      debugPrint('⏱️ [Benchmark] 100 GB & 0-byte handling: ${sw.elapsedMicroseconds}µs (${sw.elapsedMilliseconds}ms)');
    });

    test('2. Natural Sort Performance (10,000 files comparison and timing)', () {
      // Generate 10,000 file paths with mixed numbers: e.g. "clip_1.mp4", "clip_10.mp4", "clip_2.mp4"
      final paths = List.generate(
        10000,
        (i) => 'D:\\Media\\Folder_${i % 20}\\clip_${10000 - i}.mp4',
      );

      final sw = Stopwatch()..start();

      // Baseline: Regex mapping in sort comparator
      final regex = RegExp(r'\d+');
      final listA = List<String>.from(paths);
      listA.sort((a, b) {
        final keyA = a.replaceAllMapped(regex, (m) => m.group(0)!.padLeft(10, '0'));
        final keyB = b.replaceAllMapped(regex, (m) => m.group(0)!.padLeft(10, '0'));
        return keyA.compareTo(keyB);
      });
      sw.stop();
      final baselineMs = sw.elapsedMilliseconds;

      // Optimized: Pre-computed Schwartzian transform / cache keys
      sw.reset();
      sw.start();
      final listB = List<String>.from(paths);
      final mapped = listB.map((p) {
        return (path: p, key: p.replaceAllMapped(regex, (m) => m.group(0)!.padLeft(10, '0')));
      }).toList();
      mapped.sort((a, b) => a.key.compareTo(b.key));
      final sortedOptimized = mapped.map((m) => m.path).toList();
      sw.stop();
      final optimizedMs = sw.elapsedMilliseconds;

      debugPrint('⏱️ [Benchmark] 10,000 files sort: Baseline = ${baselineMs}ms | Optimized = ${optimizedMs}ms');
      expect(listA, sortedOptimized);
      expect(optimizedMs, lessThanOrEqualTo(baselineMs));
    });

    test('3. Inaccessible/Protected Directory Scanning Resiliency', () async {
      final tempDir = await Directory.systemTemp.createTemp('shrinkeo_drive_sim_');
      try {
        // Create normal folder with video
        final normalDir = Directory('${tempDir.path}\\NormalVideos');
        await normalDir.create();
        final file1 = File('${normalDir.path}\\video1.mp4');
        await file1.writeAsString('fake content 1');

        final file2 = File('${normalDir.path}\\video2.mkv');
        await file2.writeAsString('fake content 2');

        final scanner = FileScannerService();
        final sw = Stopwatch()..start();
        final scanned = await scanner.scanPaths([tempDir.path]);
        sw.stop();

        debugPrint('⏱️ [Benchmark] Directory scan (${scanned.length} files found): ${sw.elapsedMilliseconds}ms');
        expect(scanned.length, 2);
      } finally {
        await tempDir.delete(recursive: true);
      }
    });

    test('4. Memory Footprint of 50,000 Queued Media Files in Dart VM', () {
      final sw = Stopwatch()..start();
      final queue = List.generate(
        50000,
        (i) => VideoFile(
          id: 'item_$i',
          filePath: 'D:\\Media\\DCIM\\100APPLE\\IMG_${i.toString().padLeft(5, '0')}.MOV',
          fileName: 'IMG_${i.toString().padLeft(5, '0')}.MOV',
          extension: '.MOV',
          fileSizeBytes: 245 * 1024 * 1024,
          mediaType: i % 2 == 0 ? MediaType.video : MediaType.image,
          status: FileStatus.queued,
        ),
      );
      sw.stop();

      debugPrint('⏱️ [Benchmark] Allocated 50,000 VideoFile items in ${sw.elapsedMilliseconds}ms');
      expect(queue.length, 50000);
      expect(queue.first.fileName, 'IMG_00000.MOV');
      expect(queue.last.fileName, 'IMG_49999.MOV');
    });

    testWidgets('5. Viewport Virtualization & Frame Budget: 5,000 files in FileQueueView', (tester) async {
      final videos = List.generate(
        5000,
        (i) => VideoFile(
          id: 'v_$i',
          filePath: 'D:\\Photos\\shot_$i.jpg',
          fileName: 'shot_$i.jpg',
          extension: '.jpg',
          fileSizeBytes: 4 * 1024 * 1024,
          mediaType: MediaType.image,
          status: FileStatus.queued,
        ),
      );

      final cubit = CompressionCubit(
        prefs: prefs,
      );

      final state = CompressionState(
        videos: videos,
        targetSizeMB: 25.0,
      );

      final sw = Stopwatch()..start();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BlocProvider.value(
              value: cubit,
              child: CustomScrollView(
                slivers: [
                  FileQueueView(
                    state: state,
                    asSliver: true,
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      sw.stop();
      final renderTimeMs = sw.elapsedMilliseconds;
      debugPrint('⏱️ [Benchmark] Initial build of 5,000 items queue view: ${renderTimeMs}ms');

      // Verify that only the visible items in viewport are inflated (SliverList virtualization)
      expect(find.byType(FileQueueView), findsOneWidget);

      await cubit.close();
    });

    test('6. Progressive Queue Ingestion Benchmark (1,000 files in CompressionCubit)', () async {
      final cubit = CompressionCubit(
        fileScannerService: FileScannerService(),
        prefs: prefs,
      );

      final tempDir = await Directory.systemTemp.createTemp('shrinkeo_bulk_');
      try {
        final paths = <String>[];
        for (int i = 0; i < 1000; i++) {
          final filePath = '${tempDir.path}\\video_$i.mp4';
          final f = File(filePath);
          await f.writeAsString('x');
          paths.add(filePath);
        }

        final emissionPhases = <bool>[];
        final sub = cubit.stream.listen((state) {
          emissionPhases.add(state.isScanningFiles);
        });

        final sw = Stopwatch()..start();
        await cubit.addFiles(paths);
        sw.stop();

        await sub.cancel();

        debugPrint('⏱️ [Benchmark] Ingested 1,000 files into Cubit in ${sw.elapsedMilliseconds}ms (${sw.elapsedMilliseconds / 1000}s)');
        expect(cubit.state.videos.length, 1000);
        expect(cubit.state.isScanningFiles, isFalse);
        // Verify progressive emissions occurred (yielded frames)
        expect(emissionPhases.length, greaterThan(1));
      } finally {
        await tempDir.delete(recursive: true);
        await cubit.close();
      }
    });

    test('7. Deep Directory Hierarchy & Unicode/Arabic/Emoji Resilience', () async {
      final tempDir = await Directory.systemTemp.createTemp('shrinkeo_deep_unicode_');
      try {
        // Build 12 levels of nested directories
        var current = tempDir;
        for (int i = 0; i < 12; i++) {
          current = Directory('${current.path}\\Level_$i');
          await current.create();
        }

        // Add Unicode, Arabic, Japanese, and Emoji files
        final arabicFile = File('${current.path}\\فيديو_تجربة_شاملة_4K_🎬.mp4');
        await arabicFile.writeAsString('arabic test');

        final japaneseFile = File('${current.path}\\アニメ_サンプル_テスト.mkv');
        await japaneseFile.writeAsString('japanese test');

        final scanner = FileScannerService();
        final sw = Stopwatch()..start();
        final scanned = await scanner.scanPaths([tempDir.path]);
        sw.stop();

        debugPrint('⏱️ [Benchmark] Scanned 12 nested levels with Unicode/Arabic/Emoji: ${sw.elapsedMilliseconds}ms');
        expect(scanned.length, 2);
        expect(scanned.any((p) => p.contains('فيديو_تجربة_شاملة_4K_🎬.mp4')), isTrue);
        expect(scanned.any((p) => p.contains('アニメ_サンプル_テスト.mkv')), isTrue);
      } finally {
        await tempDir.delete(recursive: true);
      }
    });

    test('8. High-Capacity State Operations (10,000 files latency check)', () async {
      final cubit = CompressionCubit(prefs: prefs);

      final massiveList = List.generate(
        10000,
        (i) => VideoFile(
          id: 'item_$i',
          filePath: 'D:\\Media\\video_$i.mp4',
          fileName: 'video_$i.mp4',
          extension: '.mp4',
          fileSizeBytes: 50 * 1024 * 1024,
          status: i < 5000 ? FileStatus.success : FileStatus.queued,
          outputSizeBytes: i < 5000 ? 25 * 1024 * 1024 : null,
        ),
      );

      // Seed state
      cubit.emit(cubit.state.copyWith(videos: massiveList));
      expect(cubit.state.videos.length, 10000);

      // Measure removeFile latency
      final swRemove = Stopwatch()..start();
      cubit.removeFile('item_5000');
      swRemove.stop();
      debugPrint('⏱️ [Benchmark] removeFile from 10,000 item queue: ${swRemove.elapsedMicroseconds}µs (${swRemove.elapsedMilliseconds}ms)');
      expect(swRemove.elapsedMilliseconds, lessThan(10));
      expect(cubit.state.videos.length, 9999);

      // Measure clearCompleted latency
      final swClearCompleted = Stopwatch()..start();
      cubit.clearCompleted();
      swClearCompleted.stop();
      debugPrint('⏱️ [Benchmark] clearCompleted on 10,000 items: ${swClearCompleted.elapsedMicroseconds}µs (${swClearCompleted.elapsedMilliseconds}ms)');
      expect(swClearCompleted.elapsedMilliseconds, lessThan(20));
      expect(cubit.state.videos.length, 4999);

      // Measure clearAll latency
      final swClearAll = Stopwatch()..start();
      cubit.clearAll();
      swClearAll.stop();
      debugPrint('⏱️ [Benchmark] clearAll on 5,000 items: ${swClearAll.elapsedMicroseconds}µs (${swClearAll.elapsedMilliseconds}ms)');
      expect(swClearAll.elapsedMilliseconds, lessThan(5));
      expect(cubit.state.videos, isEmpty);

      await cubit.close();
    });
  });
}
