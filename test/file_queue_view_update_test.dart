import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shrinkeo/cubit/compression_cubit.dart';
import 'package:shrinkeo/cubit/compression_state.dart';
import 'package:shrinkeo/l10n/app_localizations.dart';
import 'package:shrinkeo/models/file_item.dart';
import 'package:shrinkeo/models/image_progress.dart';
import 'package:shrinkeo/ui/widgets/file_queue_view.dart';
import 'package:shrinkeo/ui/widgets/status_chip.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('FileQueueView updates cards when item status and progress change', (tester) async {
    tester.view.physicalSize = const Size(1280, 800);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });

    SharedPreferences.setMockInitialValues({});
    final prefs = await SharedPreferences.getInstance();
    final cubit = CompressionCubit(prefs: prefs);
    addTearDown(cubit.close);

    const item1 = FileItem(
      id: 'item_1',
      filePath: r'C:\images\1.jpg',
      fileName: '1.jpg',
      extension: '.jpg',
      fileSizeBytes: 100000,
      mediaType: MediaType.image,
      status: VideoStatus.queued,
    );

    var state = cubit.state.copyWith(videos: [item1]);

    Widget buildQueue(CompressionState s) {
      return BlocProvider.value(
        value: cubit,
        child: MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: Scaffold(
            body: SingleChildScrollView(
              child: FileQueueView(state: s),
            ),
          ),
        ),
      );
    }

    // Initial state: Queued
    await tester.pumpWidget(buildQueue(state));
    await tester.pump(const Duration(milliseconds: 100));

    expect(find.byType(StatusChip), findsOneWidget);
    expect(find.text('Queued'), findsOneWidget);

    // Update to compressing
    final item1Compressing = item1.copyWith(
      status: VideoStatus.compressing,
      progress: 0.5,
      imageProgress: const ImageProgress(
        stage: ImageStage.encoding,
        fraction: 0.5,
      ),
    );
    state = state.copyWith(videos: [item1Compressing], phase: CompressionPhase.compressing);

    await tester.pumpWidget(buildQueue(state));
    await tester.pump(const Duration(milliseconds: 300));

    expect(find.byType(StatusChip), findsOneWidget);

    // Update to success
    final item1Success = item1.copyWith(
      status: VideoStatus.success,
      progress: 1.0,
      outputSizeBytes: 50000,
    );
    state = state.copyWith(videos: [item1Success], phase: CompressionPhase.completed);

    await tester.pumpWidget(buildQueue(state));
    await tester.pump(const Duration(milliseconds: 300));

    expect(find.text('Done'), findsOneWidget);
    expect(find.text('Queued'), findsNothing);
  });

  testWidgets('FileQueueView updates cards during rapid concurrent updates of 40 items', (tester) async {
    tester.view.physicalSize = const Size(1280, 800);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });

    SharedPreferences.setMockInitialValues({});
    final prefs = await SharedPreferences.getInstance();
    final cubit = CompressionCubit(prefs: prefs);
    addTearDown(cubit.close);

    final items = List.generate(40, (i) => FileItem(
      id: 'item_$i',
      filePath: 'C:\\images\\$i.jpg',
      fileName: '$i.jpg',
      extension: '.jpg',
      fileSizeBytes: 100000 + i * 1000,
      mediaType: MediaType.image,
      status: VideoStatus.queued,
    ));

    var state = cubit.state.copyWith(videos: items);

    Widget buildQueue(CompressionState s) {
      return BlocProvider.value(
        value: cubit,
        child: MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: Scaffold(
            body: SingleChildScrollView(
              child: FileQueueView(state: s),
            ),
          ),
        ),
      );
    }

    await tester.pumpWidget(buildQueue(state));
    await tester.pump(const Duration(milliseconds: 50));

    // Rapid successive emits without waiting for diff completion
    for (int i = 0; i < 10; i++) {
      final updatedList = List<FileItem>.from(state.videos);
      updatedList[i] = updatedList[i].copyWith(
        status: VideoStatus.compressing,
        progress: 0.5,
        imageProgress: const ImageProgress(stage: ImageStage.encoding, fraction: 0.5),
      );
      state = state.copyWith(videos: updatedList);
      await tester.pumpWidget(buildQueue(state));
      await tester.pump(const Duration(milliseconds: 5)); // rapid frame
    }

    // Now complete all 10
    for (int i = 0; i < 10; i++) {
      final updatedList = List<FileItem>.from(state.videos);
      updatedList[i] = updatedList[i].copyWith(
        status: VideoStatus.success,
        progress: 1.0,
        outputSizeBytes: 50000,
      );
      state = state.copyWith(videos: updatedList);
      await tester.pumpWidget(buildQueue(state));
      await tester.pump(const Duration(milliseconds: 5));
    }

    // Final settlement
    await tester.pump(const Duration(milliseconds: 500));

    // Check how many 'Done' chips are found
    final doneCount = find.text('Done').evaluate().length;
    expect(doneCount, 10);
  });
}
