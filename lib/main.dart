import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_notifier/local_notifier.dart';
import 'package:window_manager/window_manager.dart';

import 'cubit/compression_cubit.dart';
import 'cubit/compression_state.dart';
import 'ui/app_theme.dart';
import 'ui/screens/home_screen.dart';

/// Current application version — update this with each release.
const String appVersion = '1.0.0';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize window_manager for custom title bar.
  await windowManager.ensureInitialized();

  // Initialize local_notifier for desktop notifications.
  await localNotifier.setup(
    appName: 'Shrinkeo',
    shortcutPolicy: ShortcutPolicy.requireCreate,
  );

  const windowOptions = WindowOptions(
    size: Size(960, 680),
    minimumSize: Size(720, 500),
    center: true,
    titleBarStyle: TitleBarStyle.hidden,
    title: 'Shrinkeo',
    backgroundColor: Color(0xFF0F1118), // Match AppTheme.surfaceDark
  );

  await windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });

  runApp(const ShrinkeoApp());
}

/// Root application widget for Shrinkeo.
class ShrinkeoApp extends StatelessWidget {
  const ShrinkeoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CompressionCubit(),
      child: BlocBuilder<CompressionCubit, CompressionState>(
        buildWhen: (previous, current) => previous.themeMode != current.themeMode,
        builder: (context, state) {
          return MaterialApp(
            title: 'Shrinkeo',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: state.themeMode,
            home: const HomeScreen(),
          );
        },
      ),
    );
  }
}
