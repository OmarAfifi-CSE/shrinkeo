import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:local_notifier/local_notifier.dart';
import 'package:shrinkeo/cubit/compression_cubit.dart';
import 'package:shrinkeo/cubit/compression_state.dart';
import 'package:shrinkeo/l10n/app_localizations.dart';
import 'package:shrinkeo/models/video_file.dart';
import 'package:shrinkeo/services/ffmpeg_service.dart';
import 'package:shrinkeo/services/image_compression_service.dart';
import 'package:shrinkeo/ui/widgets/bottom_action_bar.dart';

import 'image_progress_test.dart' show TestProcess;

class ReadyFfmpeg extends FfmpegService {
  @override
  Future<void> checkDependencies() async {}
}

class SlowExitProcess extends TestProcess {
  @override
  bool kill([ProcessSignal signal = ProcessSignal.sigterm]) {
    wasKilled = true;
    // Keep the exit pending to reproduce the interval after clicking Stop.
    return true;
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
          const MethodChannel('local_notifier'),
          (_) async => true,
        );
    await localNotifier.setup(appName: 'Shrinkeo test');
  });

  for (final cancelAll in [false, true]) {
    test(
      'cancel ${cancelAll ? 'all' : 'single'} keeps images cancelled and removes partial output',
      () async {
        final directory = await Directory.systemTemp.createTemp(
          'image_queue_test_',
        );
        addTearDown(() => directory.delete(recursive: true));
        final source = File('${directory.path}/input.bmp')
          ..writeAsBytesSync(List.filled(4096, 1));
        final process = SlowExitProcess();
        final started = Completer<void>();
        var starts = 0;
        late String output;
        final cubit = CompressionCubit(
          prefs: await SharedPreferences.getInstance(),
          ffmpegService: ReadyFfmpeg(),
          imageCompressionService: ImageCompressionService(
            processStarter: (_, args) async {
              starts++;
              output = args.last;
              File(output).writeAsBytesSync([1, 2, 3]);
              started.complete();
              return process;
            },
          ),
        );
        addTearDown(cubit.close);
        await cubit.addFiles([source.path]);
        if (cancelAll) {
          final next = File('${directory.path}/next.bmp')
            ..writeAsBytesSync([1, 2]);
          await cubit.addFiles([next.path]);
        }
        final running = cubit.startCompression();
        await started.future;
        expect(cubit.state.videos.first.progress, 0);
        expect(cubit.state.videos.first.imageProgress, isNotNull);
        if (cancelAll) {
          await cubit.cancelCompression();
          await cubit
              .startCompression(); // Previous process is still winding down.
        } else {
          await cubit.cancelSingle(cubit.state.videos.single.id);
        }
        await Future<void>.delayed(const Duration(milliseconds: 150));
        expect(process.wasKilled, isTrue);
        process.finish(-1);
        await running;
        expect(process.wasKilled, isTrue);
        expect(starts, 1);
        expect(cubit.state.videos.first.status, VideoStatus.cancelled);
        expect(cubit.state.successCount, 0);
        expect(File(output).existsSync(), isFalse);
        expect(source.existsSync(), isTrue);
      },
    );
  }

  for (final locale in AppLocalizations.supportedLocales) {
    testWidgets('mixed queue summary fits ${locale.languageCode}', (
      tester,
    ) async {
      final cubit = CompressionCubit(
        prefs: await SharedPreferences.getInstance(),
      );
      addTearDown(cubit.close);
      final state = cubit.state.copyWith(
        phase: CompressionPhase.compressing,
        globalEta: const Duration(hours: 2),
        videos: [
          const VideoFile(
            id: 'image',
            filePath: 'image.png',
            fileName: 'image.png',
            extension: '.png',
            fileSizeBytes: 500000,
            mediaType: MediaType.image,
            status: VideoStatus.success,
            outputSizeBytes: 100000,
          ),
          const VideoFile(
            id: 'video',
            filePath: 'video.mp4',
            fileName: 'video.mp4',
            extension: '.mp4',
            fileSizeBytes: 1000000,
            status: VideoStatus.compressing,
          ),
        ],
      );
      await tester.pumpWidget(
        BlocProvider.value(
          value: cubit,
          child: MaterialApp(
            locale: locale,
            supportedLocales: AppLocalizations.supportedLocales,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            home: Scaffold(body: BottomActionBar(state: state)),
          ),
        ),
      );
      await tester.pump();
      final strings = AppLocalizations.of(
        tester.element(find.byType(BottomActionBar)),
      )!;
      expect(find.text(strings.queueCompleted(1, 2)), findsOneWidget);
      expect(find.byIcon(Icons.video_library_rounded), findsOneWidget);
      expect(find.byIcon(Icons.access_time_rounded), findsNothing);
      expect(find.byIcon(Icons.save_alt_rounded), findsOneWidget);
      expect(tester.takeException(), isNull);
    });
  }
}
