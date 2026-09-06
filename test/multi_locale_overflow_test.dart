import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:shrinkeo/cubit/compression_cubit.dart';
import 'package:shrinkeo/core/language_helper.dart';
import 'package:shrinkeo/l10n/app_localizations.dart';
import 'package:shrinkeo/models/file_item.dart';
import 'package:shrinkeo/ui/widgets/bottom_action_bar.dart';
import 'package:shrinkeo/ui/widgets/language_panel.dart';
import 'package:shrinkeo/ui/widgets/settings/settings_panel.dart';
import 'package:shrinkeo/ui/widgets/file_queue_view.dart';

/// Multi-locale overflow & rendering proof: pumps the full composite UI
/// (language panel + settings tabs + queue + bottom bar) under
/// locales x resolutions and asserts ZERO RenderFlex overflow errors.
///
/// Intentionally composes the production widgets directly over a plain
/// MaterialApp — identical widgets under test, but without GoogleFonts
/// runtime fetching and window_manager plugin calls that cannot run in a
/// widget-test environment.
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const locales = ['en', 'ar', 'de', 'ru', 'zh', 'hi', 'ja'];
  const sizes = [
    Size(1024, 768), // minimum supported window
    Size(1280, 800), // common laptop
    Size(1920, 1080), // full HD desktop
  ];

  final overflowErrors = <String>[];
  void Function(FlutterErrorDetails)? originalOnError;

  setUpAll(() {
    originalOnError = FlutterError.onError;
    FlutterError.onError = (details) {
      final text = details.toString();
      if (text.contains('RenderFlex') || text.contains('overflowed')) {
        overflowErrors.add('$text\n---');
      } else {
        // Surface unrelated errors normally (they should fail the test).
        originalOnError?.call(details);
      }
    };
  });

  tearDownAll(() {
    FlutterError.onError = originalOnError;
  });

  Future<CompressionCubit> pumpComposite(
    WidgetTester tester, {
    required String locale,
    Size size = const Size(1280, 800),
    bool expandSettings = false,
    bool expandLanguage = false,
    List<VideoFile> queue = const [],
    bool settle = true,
  }) async {
    SharedPreferences.setMockInitialValues({'languageCode': locale});
    final prefs = await SharedPreferences.getInstance();
    final cubit = CompressionCubit(prefs: prefs);
    if (expandSettings) cubit.toggleSettings();
    if (expandLanguage) cubit.toggleLanguageSection();

    final state =
        queue.isEmpty ? cubit.state : cubit.state.copyWith(videos: queue);

    tester.view.physicalSize = size;
    tester.view.devicePixelRatio = 1.0;

    await tester.pumpWidget(
      BlocProvider.value(
        value: cubit,
        child: MaterialApp(
          locale: Locale(locale),
          supportedLocales: LanguageHelper.supportedLocales,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          home: Scaffold(
            body: Column(
              children: [
                Expanded(
                  child: CustomScrollView(
                    slivers: [
                      const SliverToBoxAdapter(child: LanguagePanel()),
                      const SliverToBoxAdapter(child: SettingsPanel()),
                      SliverToBoxAdapter(child: VideoQueueView(state: state)),
                    ],
                  ),
                ),
                BottomActionBar(state: state),
              ],
            ),
          ),
        ),
      ),
    );
    if (settle) {
      await tester.pumpAndSettle();
    } else {
      // Pulsing icons animate forever; settle manually instead.
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 400));
    }
    return cubit;
  }

  void expectNoOverflow(String scenario) {
    expect(
      overflowErrors,
      isEmpty,
      reason: 'RenderFlex overflow in [$scenario]:\n${overflowErrors.join()}',
    );
    overflowErrors.clear();
  }

  void resetView(WidgetTester tester) {
    tester.view.resetPhysicalSize();
    tester.view.resetDevicePixelRatio();
  }

  testWidgets('RTL locales resolve an rtl Directionality', (tester) async {
    await pumpComposite(tester, locale: 'ar');
    expect(
      Directionality.of(tester.element(find.byType(Scaffold).first)),
      TextDirection.rtl,
    );
    resetView(tester);
  });

  for (final locale in locales) {
    for (final size in sizes) {
      testWidgets(
        'no overflow: $locale @ ${size.width.toInt()}x${size.height.toInt()} '
        '(idle UI + all 5 settings tabs)',
        (tester) async {
          await pumpComposite(
            tester,
            locale: locale,
            size: size,
            expandSettings: true,
          );
          expectNoOverflow('$locale idle+expanded @ $size');

          // Walk all 5 settings tabs and re-check layout on each.
          final tabCount = tester.widgetList<Tab>(find.byType(Tab)).length;
          expect(tabCount, 5, reason: 'settings panel should expose 5 tabs');
          for (var i = 0; i < tabCount; i++) {
            await tester.tap(find.byType(Tab).at(i));
            await tester.pumpAndSettle();
            expectNoOverflow('$locale settings tab $i @ $size');
          }
          resetView(tester);
        },
        timeout: const Timeout(Duration(minutes: 3)),
      );
    }
  }

  for (final locale in const ['en', 'ar', 'de']) {
    testWidgets(
      'no overflow with a populated queue: $locale',
      (tester) async {
        const videos = <VideoFile>[
          VideoFile(
            id: 'v1',
            filePath: r'C:\videos\interview-final-cut.mp4',
            fileName: 'interview-final-cut.mp4',
            extension: '.mp4',
            fileSizeBytes: 734003200,
            status: VideoStatus.success,
            progress: 1.0,
            outputSizeBytes: 419430400,
          ),
          VideoFile(
            id: 'v2',
            filePath: r'C:\videos\family-reunion-4k.mkv',
            fileName: 'family-reunion-4k.mkv',
            extension: '.mkv',
            fileSizeBytes: 2147483648,
            status: VideoStatus.compressing,
            progress: 0.42,
          ),
          VideoFile(
            id: 'v3',
            filePath: r'C:\videos\lecture-recording-very-long-name.mov',
            fileName: 'lecture-recording-very-long-name.mov',
            extension: '.mov',
            fileSizeBytes: 1048576000,
            status: VideoStatus.failed,
            errorMessage: 'FFmpeg failed with exit code 1',
          ),
        ];

        await pumpComposite(
          tester,
          locale: locale,
          size: const Size(1024, 768),
          queue: videos,
          settle: false, // compressing card pulses forever by design
        );
        expectNoOverflow('$locale populated queue @ 1024x768');
        resetView(tester);
      },
      timeout: const Timeout(Duration(minutes: 2)),
    );
  }
}
