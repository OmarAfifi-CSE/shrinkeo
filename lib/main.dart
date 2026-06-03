import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_notifier/local_notifier.dart';
import 'package:window_manager/window_manager.dart';

import 'cubit/compression_cubit.dart';
import 'cubit/compression_state.dart';
import 'ui/app_colors.dart';
import 'ui/app_theme.dart';
import 'ui/screens/home_screen.dart';

import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Load preferences before running the app.
  final prefs = await SharedPreferences.getInstance();

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
    backgroundColor: AppColors.windowBackgroundDark,
  );

  await windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });

  runApp(ShrinkeoApp(prefs: prefs));
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
            previous.themeMode != current.themeMode,
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
