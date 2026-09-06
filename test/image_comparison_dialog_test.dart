import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:shrinkeo/models/file_item.dart';
import 'package:shrinkeo/ui/widgets/image_comparison_dialog.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late Directory tempDir;
  late File origFile;
  late File compFile;

  setUp(() async {
    tempDir = await Directory.systemTemp.createTemp('image_comp_dialog_test_');
    origFile = File('${tempDir.path}/original.png')
      ..writeAsBytesSync(List.filled(5000, 1));
    compFile = File('${tempDir.path}/compressed.png')
      ..writeAsBytesSync(List.filled(1000, 2));
  });

  tearDown(() async {
    if (tempDir.existsSync()) {
      tempDir.deleteSync(recursive: true);
    }
  });

  testWidgets('ImageComparisonDialog renders header, badges, and split slider', (
    tester,
  ) async {
    final video = VideoFile(
      id: 'img_test_1',
      filePath: origFile.path,
      fileName: 'original.png',
      extension: '.png',
      fileSizeBytes: 5000,
      mediaType: MediaType.image,
      status: VideoStatus.success,
      outputPath: compFile.path,
      outputSizeBytes: 1000,
    );

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Builder(
            builder: (context) {
              return ElevatedButton(
                onPressed: () => ImageComparisonDialog.show(context, video),
                child: const Text('Open Comparison'),
              );
            },
          ),
        ),
      ),
    );

    // Tap to open dialog
    await tester.tap(find.text('Open Comparison'));
    await tester.pumpAndSettle();

    // Verify dialog elements exist
    expect(find.byType(ImageComparisonDialog), findsOneWidget);
    expect(find.text('original.png'), findsOneWidget);
    expect(find.text('-80%'), findsOneWidget); // (5000 - 1000) / 5000 = 80%

    // Drag the slider horizontally
    final gestureDetectorFinder = find.byType(GestureDetector);
    expect(gestureDetectorFinder, findsWidgets);

    // Drag across the comparison area
    await tester.drag(find.byType(ImageComparisonDialog), const Offset(60, 0));
    await tester.pump();

    // Verify close button pops dialog
    final closeBtnFinder = find.byIcon(Icons.close_rounded);
    expect(closeBtnFinder, findsOneWidget);
    await tester.tap(closeBtnFinder);
    await tester.pumpAndSettle();

    expect(find.byType(ImageComparisonDialog), findsNothing);
  });

  testWidgets('ImageComparisonDialog renders missing files message when files are deleted', (
    tester,
  ) async {
    final video = VideoFile(
      id: 'img_test_missing',
      filePath: '${tempDir.path}/non_existent_original.png',
      fileName: 'missing.png',
      extension: '.png',
      fileSizeBytes: 5000,
      mediaType: MediaType.image,
      status: VideoStatus.success,
      outputPath: '${tempDir.path}/non_existent_compressed.png',
      outputSizeBytes: 1000,
    );

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Builder(
            builder: (context) {
              return ElevatedButton(
                onPressed: () => ImageComparisonDialog.show(context, video),
                child: const Text('Open Comparison'),
              );
            },
          ),
        ),
      ),
    );

    await tester.tap(find.text('Open Comparison'));
    await tester.pumpAndSettle();

    expect(find.byType(ImageComparisonDialog), findsOneWidget);
    expect(find.byIcon(Icons.broken_image_rounded), findsOneWidget);
  });
}
