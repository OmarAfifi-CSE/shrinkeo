import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:local_notifier/local_notifier.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:shrinkeo/cubit/compression_cubit.dart';
import 'package:shrinkeo/models/file_item.dart';
import 'package:shrinkeo/models/image_progress.dart';
import 'package:shrinkeo/services/ffmpeg_service.dart';
import 'package:shrinkeo/services/image_compression_service.dart';

class MockFfmpegService extends FfmpegService {
  @override
  Future<void> checkDependencies() async {}

  @override
  Future<Duration> probeDuration(String path) async => const Duration(seconds: 5);
}

class MockImageService extends ImageCompressionService {
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
    final targetDir = Directory(outFile.parent.path);
    if (!targetDir.existsSync()) {
      targetDir.createSync(recursive: true);
    }
    outFile.writeAsBytesSync(List.filled((inBytes ~/ 2).clamp(1, inBytes), 42));
    onProgress?.call(1.0);
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

    tempDir = await Directory.systemTemp.createTemp('shrinkeo_folder_test_');
  });

  tearDown(() async {
    if (tempDir.existsSync()) {
      tempDir.deleteSync(recursive: true);
    }
  });

  test('nested subfolder images resolve common root and preserve subfolder structure in Shrinkeo Output', () async {
    final albumDir = Directory('${tempDir.path}/App-Clothes');
    final beautyDir = Directory('${albumDir.path}/Beauty');
    final womenDir = Directory('${albumDir.path}/Women');
    beautyDir.createSync(recursive: true);
    womenDir.createSync(recursive: true);

    final f1 = File('${beautyDir.path}/pic1.png')..writeAsBytesSync(List.filled(2000, 1));
    final f2 = File('${womenDir.path}/pic2.png')..writeAsBytesSync(List.filled(3000, 2));

    final cubit = CompressionCubit(
      ffmpegService: MockFfmpegService(),
      imageCompressionService: MockImageService(),
      prefs: prefs,
    );
    addTearDown(cubit.close);

    await cubit.addFiles([f1.path, f2.path]);
    expect(cubit.state.videos.length, 2);

    await cubit.startCompression();

    // 1. Root unified output folder must be created directly inside App-Clothes:
    final expectedRoot = '${albumDir.path}/Shrinkeo Output';
    expect(normalizePath(cubit.state.outputFolderPath!), normalizePath(expectedRoot));
    expect(Directory(expectedRoot).existsSync(), isTrue);

    // 2. Relative subfolders Beauty and Women must be preserved:
    final expectedBeautyOut = File('$expectedRoot/Beauty/pic1.png');
    final expectedWomenOut = File('$expectedRoot/Women/pic2.png');

    expect(expectedBeautyOut.existsSync(), isTrue, reason: 'Beauty/pic1.png should exist');
    expect(expectedWomenOut.existsSync(), isTrue, reason: 'Women/pic2.png should exist');

    // 3. Status of all items should be success
    for (final v in cubit.state.videos) {
      expect(v.status, VideoStatus.success);
      expect(v.outputSizeBytes, isNotNull);
      expect(v.outputSizeBytes! < v.fileSizeBytes, isTrue);
    }
  });

  test('adding new batch when idle resets stale outputFolderPath', () async {
    final albumA = Directory('${tempDir.path}/AlbumA')..createSync(recursive: true);
    final albumB = Directory('${tempDir.path}/AlbumB')..createSync(recursive: true);

    final fA = File('${albumA.path}/a.png')..writeAsBytesSync(List.filled(1000, 1));
    final fB = File('${albumB.path}/b.png')..writeAsBytesSync(List.filled(1000, 2));

    final cubit = CompressionCubit(
      ffmpegService: MockFfmpegService(),
      imageCompressionService: MockImageService(),
      prefs: prefs,
    );
    addTearDown(cubit.close);

    // First batch in AlbumA
    await cubit.addFiles([fA.path]);
    await cubit.startCompression();
    expect(cubit.state.outputFolderPath, contains('AlbumA'));

    // Clear completed and add AlbumB
    cubit.clearCompleted();
    expect(cubit.state.outputFolderPath, isNull);

    await cubit.addFiles([fB.path]);
    await cubit.startCompression();
    expect(cubit.state.outputFolderPath, contains('AlbumB'));
  });
}

String normalizePath(String path) => path.replaceAll(r'\', '/');
