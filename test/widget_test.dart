import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:shrinkeo/core/app_strings.dart';
import 'package:shrinkeo/main.dart';

/// Boot & interaction smoke test for the real application widget tree.
///
/// - Outbound HTTP is blocked so the startup update check fails fast and
///   silently (exactly like an offline machine).
/// - The window_manager method channel is mocked so the custom title bar and
///   maximize button behave deterministically in the test environment.
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() {
    // Deterministic window state for the custom title bar.
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(const MethodChannel('window_manager'),
            (call) async {
      switch (call.method) {
        case 'isMaximized':
          return false;
        case 'isMinimized':
          return false;
        case 'isVisible':
          return true;
        default:
          return null;
      }
    });

    // Fail fast on any network access.
    HttpOverrides.global = _NoNetworkOverrides();
  });

  tearDownAll(() {
    HttpOverrides.global = null;
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(const MethodChannel('window_manager'), null);
  });

  testWidgets('App boots, expands settings and navigates all tabs',
      (tester) async {
    SharedPreferences.setMockInitialValues({});
    final prefs = await SharedPreferences.getInstance();

    tester.view.physicalSize = const Size(1280, 800);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });

    await tester.pumpWidget(ShrinkeoApp(prefs: prefs));
    await tester.pumpAndSettle();

    // App boots with the drop zone visible.
    expect(find.text('Shrinkeo'), findsOneWidget);
    expect(find.text(AppStrings.dragDropHereMsg), findsOneWidget);

    // Expand the settings panel from the title bar.
    await tester.tap(find.byTooltip(AppStrings.settingsTooltip));
    await tester.pumpAndSettle();

    final tabs = tester.widgetList<Tab>(find.byType(Tab)).toList();
    expect(tabs.length, 5, reason: 'settings panel exposes five tabs');

    // Walk every tab to prove each renders without crashing.
    for (var i = 0; i < tabs.length; i++) {
      await tester.tap(find.byType(Tab).at(i));
      await tester.pumpAndSettle();
      expect(find.byType(TabBar), findsOneWidget);
    }

    // Switch to target size mode in the Image tab to expose the KB input.
    await tester.tap(find.text(AppStrings.imageTargetSizeModeLabel));
    await tester.pumpAndSettle();
    expect(find.text('KB'), findsOneWidget);

    // Collapse again via the title bar toggle.
    await tester.tap(find.byTooltip(AppStrings.settingsTooltip));
    await tester.pumpAndSettle();
    expect(find.byType(TabBar), findsNothing);
  });
}

/// Overrides that reject every outbound HTTP request immediately.
class _NoNetworkOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    throw const SocketException('Network disabled for tests');
  }
}
