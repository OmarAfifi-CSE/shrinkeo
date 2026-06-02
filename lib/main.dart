import 'dart:developer' as dev;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/compression_cubit.dart';
import 'services/update_service.dart';
import 'ui/app_theme.dart';
import 'ui/screens/home_screen.dart';

/// Current application version — update this with each release.
const String appVersion = '1.0.0';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ShrinkeoApp());
}

/// Root application widget for Shrinkeo.
class ShrinkeoApp extends StatelessWidget {
  const ShrinkeoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CompressionCubit(),
      child: MaterialApp(
        title: 'Shrinkeo',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.darkTheme,
        home: const _AppShell(),
      ),
    );
  }
}

/// App shell that handles startup tasks (update check) and hosts the HomeScreen.
class _AppShell extends StatefulWidget {
  const _AppShell();

  @override
  State<_AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<_AppShell> {
  final UpdateService _updateService = UpdateService();

  @override
  void initState() {
    super.initState();
    _checkForUpdates();
  }

  @override
  void dispose() {
    _updateService.dispose();
    super.dispose();
  }

  /// Runs the startup update check.
  Future<void> _checkForUpdates() async {
    try {
      final updateInfo = await _updateService.checkForAppUpdate(appVersion);

      if (updateInfo != null && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Update available: v${updateInfo.latestVersion}',
            ),
            action: SnackBarAction(
              label: 'Details',
              onPressed: () {
                // TODO: Open download URL or show update dialog.
                dev.log(
                  'Update URL: ${updateInfo.downloadUrl}',
                  name: 'UpdateCheck',
                );
              },
            ),
            duration: const Duration(seconds: 8),
          ),
        );
      }
    } catch (e) {
      dev.log('Startup update check failed: $e', name: 'UpdateCheck');
    }
  }

  @override
  Widget build(BuildContext context) {
    return const HomeScreen();
  }
}
