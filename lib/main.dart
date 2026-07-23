import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_notifier/local_notifier.dart';
import 'package:window_manager/window_manager.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'l10n/app_localizations.dart';
import 'core/app_strings.dart';
import 'core/language_helper.dart';

import 'cubit/compression_cubit.dart';
import 'cubit/compression_state.dart';
import 'services/desktop_integration_service.dart';
import 'ui/app_colors.dart';
import 'ui/app_theme.dart';
import 'ui/screens/home_screen.dart';
import 'services/remote_config_service.dart';

import 'package:shared_preferences/shared_preferences.dart';

void main(List<String> args) async {
  // Check for single instance immediately on Windows
  bool isPrimary = await DesktopIntegrationService.handleSingleInstance(args);
  if (!isPrimary) return; // Kill the process before it loads anything

  WidgetsFlutterBinding.ensureInitialized();

  // Load preferences before running the app.
  final prefs = await SharedPreferences.getInstance();

  // Initialize window_manager for custom title bar.
  await windowManager.ensureInitialized();

  // Initialize local_notifier for desktop notifications.
  await localNotifier.setup(
    appName: 'Shrinkeo',
    shortcutPolicy: ShortcutPolicy.ignore,
  );

  const windowOptions = WindowOptions(
    size: Size(1080, 720),
    minimumSize: Size(800, 533),
    center: true,
    titleBarStyle: TitleBarStyle.hidden,
    title: 'Shrinkeo',
    backgroundColor: AppColors.windowBackgroundDark,
  );

  await windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.setPreventClose(true);
    await windowManager.center();
    await windowManager.show();
    await windowManager.focus();
  });

  runApp(ShrinkeoApp(prefs: prefs));

  // Run the update check in the background. 
  // If an update is required, it will swap the screen without blocking startup.
  RemoteConfigService.checkBlockState().then((state) {
    if (state.isBlocked) {
      globalBlockState.value = state;
    }
  });

  // Add initial args if any
  if (args.isNotEmpty && Platform.isWindows) {
    Future.delayed(const Duration(milliseconds: 500), () {
      DesktopIntegrationService.addInitialArgs(args);
    });
  }
}

/// Root application widget for Shrinkeo.
class ShrinkeoApp extends StatelessWidget {
  final SharedPreferences prefs;

  const ShrinkeoApp({super.key, required this.prefs});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CompressionCubit(prefs: prefs),
      child: BlocBuilder<CompressionCubit, CompressionState>(
        buildWhen: (previous, current) =>
            previous.themeMode != current.themeMode ||
            previous.languageCode != current.languageCode,
        builder: (context, state) {
          return MaterialApp(
            title: 'Shrinkeo',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: state.themeMode,
            locale: Locale(state.languageCode),
            builder: (context, child) {
              AppStrings.setContext(context);
              return child!;
            },
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: LanguageHelper.supportedLocales,
            home: const HomeScreen(),
          );
        },
      ),
    );
  }
}
