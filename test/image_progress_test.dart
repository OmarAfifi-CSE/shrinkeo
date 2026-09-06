import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shrinkeo/l10n/app_localizations.dart';
import 'package:shrinkeo/models/image_progress.dart';
import 'package:shrinkeo/services/image_compression_service.dart';
import 'package:shrinkeo/services/image_job.dart';
import 'package:shrinkeo/ui/widgets/file_card.dart';
import 'package:shrinkeo/models/file_item.dart';

class TestProcess implements Process {
  final errors = StreamController<List<int>>();
  final output = StreamController<List<int>>();
  final completed = Completer<int>();
  bool wasKilled = false;

  void finish([int code = 0]) {
    if (completed.isCompleted) return;
    errors.close();
    output.close();
    completed.complete(code);
  }

  @override
  Stream<List<int>> get stderr => errors.stream;
  @override
  Stream<List<int>> get stdout => output.stream;
  @override
  Future<int> get exitCode => completed.future;
  @override
  int get pid => 42;
  @override
  bool kill([ProcessSignal signal = ProcessSignal.sigterm]) {
    wasKilled = true;
    finish(-1);
    return true;
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

void main() {
  test('parses encoder percentages and multi-pass reports', () {
    expect(ImageJob.parseProgress('[image.webp]:  42 %'), .42);
    expect(ImageJob.parseProgress('Pass 2/4:  50%'), .375);
    expect(ImageJob.parseProgress(' 100%'), 1);
    expect(ImageJob.parseProgress(' 101%'), isNull);
    expect(ImageJob.parseProgress('Pass 5/4: 50%'), isNull);
    expect(ImageJob.parseProgress('quality: 80; size: 1000'), isNull);
  });

  test(
    'streams split CR records before exit, monotonically below 100%',
    () async {
      final process = TestProcess();
      final updates = <ImageProgress>[];
      final job = ImageJob(
        start: (_, _) async => process,
        onStatus: updates.add,
      );
      final running = job.run('encoder', [], progress: true);
      await Future<void>.delayed(Duration.zero);
      process.errors.add(utf8.encode(' 2'));
      process.errors.add(utf8.encode('0%\r 10%\r 20%\r 100%\r'));
      await Future<void>.delayed(Duration.zero);
      expect(process.completed.isCompleted, isFalse);
      expect(updates.map((e) => e.fraction).whereType<double>(), [.2, .99]);
      process.finish();
      expect((await running).exitCode, 0);
    },
  );

  test(
    'cancellation kills the active encoder and prevents another start',
    () async {
      final process = TestProcess();
      var cancelled = false;
      var starts = 0;
      final job = ImageJob(
        isCancelled: () => cancelled,
        start: (_, _) async {
          starts++;
          return process;
        },
      );
      final running = job.run('encoder', []);
      await Future<void>.delayed(Duration.zero);
      cancelled = true;
      expect((await running).exitCode, -1);
      expect(process.wasKilled, isTrue);
      expect((await job.run('fallback', [])).exitCode, -1);
      expect(starts, 1);
    },
  );

  test(
    'target search reports attempts and best size, then saves valid output',
    () async {
      final directory = await Directory.systemTemp.createTemp(
        'image_progress_test_',
      );
      addTearDown(() => directory.delete(recursive: true));
      final source = File('${directory.path}/input.bmp')
        ..writeAsBytesSync(List.filled(5000, 1));
      final destination = '${directory.path}/output.bmp';
      final candidates = <String>[];
      final updates = <ImageProgress>[];
      final completion = <double>[];
      final service = ImageCompressionService(
        processStarter: (_, args) async {
          final process = TestProcess();
          candidates.add(args.last);
          File(args.last).writeAsBytesSync(List.filled(512, 1));
          process.finish();
          return process;
        },
      );
      final result = await service.processImage(
        inputPath: source.path,
        outputPath: destination,
        targetSizeKB: 1,
        onStatus: updates.add,
        onProgress: completion.add,
      );
      expect(result.exitCode, 0);
      expect(File(destination).lengthSync(), 512);
      expect(
        updates.where((p) => p.attempt != null).map((p) => p.attempt),
        containsAll([1, 2]),
      );
      expect(updates.any((p) => p.bestBytes == 512), isTrue);
      expect(updates.last.stage, ImageStage.saving);
      expect(updates.every((p) => p.fraction == null), isTrue);
      expect(completion, [1]);
      expect(candidates.every((path) => !File(path).existsSync()), isTrue);
    },
  );

  for (final outputBytes in [null, 0]) {
    test(
      'zero exit with $outputBytes output bytes never reports completion',
      () async {
        final directory = await Directory.systemTemp.createTemp(
          'image_invalid_test_',
        );
        addTearDown(() => directory.delete(recursive: true));
        final completed = <double>[];
        final service = ImageCompressionService(
          processStarter: (_, args) async {
            if (outputBytes != null) File(args.last).writeAsBytesSync([]);
            return TestProcess()..finish();
          },
        );
        final result = await service.processImage(
          inputPath: '${directory.path}/in.bmp',
          outputPath: '${directory.path}/out.bmp',
          onProgress: completed.add,
        );
        expect(result.exitCode, isNot(0));
        expect(completed, isEmpty);
      },
    );
  }

  for (final locale in AppLocalizations.supportedLocales) {
    testWidgets(
      'image stages render without overflow in ${locale.languageCode}',
      (tester) async {
        Future<void> pump(ImageProgress progress) => tester.pumpWidget(
          MaterialApp(
            locale: locale,
            supportedLocales: AppLocalizations.supportedLocales,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            home: Scaffold(
              body: Center(
                child: SizedBox(
                  width: 500,
                  child: VideoFileCard(
                    video: VideoFile(
                      id: 'image',
                      filePath: 'image.webp',
                      fileName: 'image.webp',
                      extension: '.webp',
                      fileSizeBytes: 1024,
                      mediaType: MediaType.image,
                      status: VideoStatus.compressing,
                      imageProgress: progress,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
        await pump(
          const ImageProgress(targetKB: 100, attempt: 3, bestBytes: 112640),
        );
        await tester.pump();
        expect(
          tester
              .widget<LinearProgressIndicator>(
                find.byType(LinearProgressIndicator),
              )
              .value,
          isNull,
        );
        expect(find.textContaining('%'), findsNothing);
        expect(tester.takeException(), isNull);
        await pump(
          const ImageProgress(stage: ImageStage.encoding, fraction: .42),
        );
        await tester.pump();
        expect(find.textContaining('42%'), findsOneWidget);
        expect(
          tester
              .widget<LinearProgressIndicator>(
                find.byType(LinearProgressIndicator),
              )
              .value,
          .42,
        );
        expect(tester.takeException(), isNull);
        await pump(const ImageProgress(stage: ImageStage.saving));
        await tester.pump();
        expect(find.textContaining('%'), findsNothing);
      },
    );
  }
}
