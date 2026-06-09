import 'dart:async';
import 'dart:io';
import 'package:desktop_drop/desktop_drop.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:ui' as dart_ui;

import 'package:window_manager/window_manager.dart';

import '../../services/desktop_integration_service.dart';

import '../../cubit/compression_cubit.dart';
import '../../cubit/compression_state.dart';
import '../../services/update_service.dart';
import '../widgets/aurora_background.dart';
import '../widgets/bottom_action_bar.dart';
import '../widgets/custom_title_bar.dart';
import '../widgets/drop_zone_widget.dart';
import '../widgets/settings/settings_panel.dart';
import '../widgets/video_queue_view.dart';
import '../widgets/update_dialog.dart';
import '../app_colors.dart';
import '../../services/remote_config_service.dart';

/// The main interface of the Shrinkeo application.
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();

  /// Handles the app close logic directly to bypass window_manager delays
  static Future<void> handleAppClose(BuildContext context) async {
    final cubit = context.read<CompressionCubit>();
    if (cubit.state.phase == CompressionPhase.compressing ||
        cubit.state.phase == CompressionPhase.probing) {
      await showGeneralDialog<void>(
        context: context,
        barrierColor: Colors.black.withValues(alpha: 0.6),
        barrierDismissible: false,
        barrierLabel: 'Close Dialog',
        transitionDuration: const Duration(milliseconds: 300),
        pageBuilder: (context, animation, secondaryAnimation) {
          bool isClosing = false;
          return StatefulBuilder(
            builder: (context, setState) {
              final isDark = Theme.of(context).brightness == Brightness.dark;

              return PopScope(
                canPop: !isClosing,
                child: Dialog(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  insetPadding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 24,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: BackdropFilter(
                      filter: dart_ui.ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                      child: Container(
                        width: 400,
                        padding: const EdgeInsets.all(32),
                        decoration: BoxDecoration(
                          color: isDark
                              ? AppColors.surfaceContainerDark.withValues(
                                  alpha: 0.85,
                                )
                              : AppColors.surfaceContainerLight.withValues(
                                  alpha: 0.85,
                                ),
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(
                            color: isDark
                                ? Colors.white.withValues(alpha: 0.1)
                                : Colors.black.withValues(alpha: 0.05),
                            width: 1,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.2),
                              blurRadius: 30,
                              offset: const Offset(0, 15),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // Alert Icon
                            Container(
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: AppColors.errorRed.withValues(
                                  alpha: 0.15,
                                ),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.warning_rounded,
                                color: AppColors.errorRed,
                                size: 36,
                              ),
                            ),
                            const SizedBox(height: 24),
                            // Title
                            Text(
                              'Compression in Progress',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w800,
                                letterSpacing: -0.5,
                                color: isDark
                                    ? AppColors.textHighDark
                                    : AppColors.textHighLight,
                              ),
                            ),
                            const SizedBox(height: 12),
                            // Description
                            Text(
                              'Are you sure you want to close Shrinkeo?\nThis will cancel all current compressions and you might lose your progress.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 14,
                                height: 1.6,
                                color: isDark
                                    ? AppColors.textMediumDark
                                    : AppColors.textMediumLight,
                              ),
                            ),
                            const SizedBox(height: 32),
                            // Buttons
                            Row(
                              children: [
                                Expanded(
                                  child: TextButton(
                                    onPressed: isClosing
                                        ? null
                                        : () => Navigator.of(context).pop(),
                                    style: TextButton.styleFrom(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 18,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(14),
                                      ),
                                      foregroundColor: isDark
                                          ? AppColors.textMediumDark
                                          : AppColors.textMediumLight,
                                      backgroundColor: isDark
                                          ? Colors.white.withValues(alpha: 0.05)
                                          : Colors.black.withValues(
                                              alpha: 0.03,
                                            ),
                                    ),
                                    child: const Text(
                                      'Keep Compressing',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: isClosing
                                        ? null
                                        : () async {
                                            setState(() {
                                              isClosing = true;
                                            });
                                            await cubit.cancelCompression();
                                            exit(0);
                                          },
                                    style: ElevatedButton.styleFrom(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 18,
                                      ),
                                      backgroundColor: AppColors.errorRed,
                                      foregroundColor: Colors.white,
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(14),
                                      ),
                                    ),
                                    child: isClosing
                                        ? const SizedBox(
                                            width: 20,
                                            height: 20,
                                            child: CircularProgressIndicator(
                                              color: Colors.white,
                                              strokeWidth: 2,
                                            ),
                                          )
                                        : const Text(
                                            'Close App',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 14,
                                            ),
                                          ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
        transitionBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: CurvedAnimation(parent: animation, curve: Curves.linear),
            child: ScaleTransition(
              scale: Tween<double>(begin: 0.95, end: 1.0).animate(
                CurvedAnimation(parent: animation, curve: Curves.linear),
              ),
              child: child,
            ),
          );
        },
      );
    } else {
      exit(0);
    }
  }
}

class _HomeScreenState extends State<HomeScreen> with WindowListener {
  StreamSubscription? _externalFilesSubscription;

  @override
  void initState() {
    super.initState();
    // Determine if this is a Microsoft Store build.
    // Use: flutter build windows --dart-define=STORE_RELEASE=true
    const bool isStoreRelease = bool.fromEnvironment('STORE_RELEASE', defaultValue: false);

    if (!isStoreRelease) {
      // Check for updates when the home screen loads (GitHub users only)
      WidgetsBinding.instance.addPostFrameCallback((_) {
        UpdateService.checkForUpdates(context);
      });
    }

    windowManager.addListener(this);

    _externalFilesSubscription = DesktopIntegrationService.fileStream.listen((
      paths,
    ) {
      if (mounted) {
        context.read<CompressionCubit>().addFiles(paths);
      }
    });
  }

  @override
  void dispose() {
    _externalFilesSubscription?.cancel();
    windowManager.removeListener(this);
    super.dispose();
  }

  @override
  void onWindowClose() async {
    if (!mounted) return;
    HomeScreen.handleAppClose(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CompressionCubit, CompressionState>(
      listenWhen: (previous, current) =>
          current.fallbackWarningMessage != null &&
          current.fallbackWarningMessage != previous.fallbackWarningMessage,
      listener: (context, state) {
        if (state.fallbackWarningMessage != null) {
          final theme = Theme.of(context);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Row(
                children: [
                  Icon(
                    Icons.warning_amber_rounded,
                    color: theme.colorScheme.onError,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      state.fallbackWarningMessage!,
                      style: TextStyle(color: theme.colorScheme.onError),
                    ),
                  ),
                ],
              ),
              backgroundColor: theme.colorScheme.error,
              behavior: SnackBarBehavior.floating,
              margin: const EdgeInsets.all(16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              duration: const Duration(seconds: 3),
            ),
          );
        }
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: DropTarget(
          onDragEntered: (_) =>
              context.read<CompressionCubit>().setDragHovering(true),
          onDragExited: (_) =>
              context.read<CompressionCubit>().setDragHovering(false),
          onDragDone: (details) {
            context.read<CompressionCubit>().setDragHovering(false);
            final paths = details.files.map((f) => f.path).toList();
            context.read<CompressionCubit>().addFiles(paths);
          },
          child: Stack(
            children: [
              AuroraBackground(
                child: Column(
                  children: [
                    // 1. Custom Title Bar
                    const CustomTitleBar(),

                    // 2 & 3. Main Content Area & Bottom Action Bar
                    Expanded(
                      child: ValueListenableBuilder<AppBlockState?>(
                        valueListenable: globalBlockState,
                        builder: (context, blockState, _) {
                          if (blockState != null && blockState.isBlocked) {
                            return Center(
                              child: UpdateDialog(
                                isMandatory: true,
                                blockState: blockState,
                                whatsNew: blockState.message,
                              ),
                            );
                          }
                          
                          return Column(
                            children: [
                              Expanded(
                                child: CustomScrollView(
                                  slivers: [
                                    const SliverToBoxAdapter(child: SettingsPanel()),
                                    BlocBuilder<CompressionCubit, CompressionState>(
                                      builder: (context, state) {
                                        if (state.videos.isEmpty) {
                                          return SliverFillRemaining(
                                            hasScrollBody: false,
                                            child: DropZoneWidget(
                                              isHovering: state.isDragHovering,
                                              isScanningFiles: state.isScanningFiles,
                                            ),
                                          );
                                        }
                                        return SliverToBoxAdapter(
                                          child: VideoQueueView(state: state),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              BlocBuilder<CompressionCubit, CompressionState>(
                                builder: (context, state) {
                                  if (state.videos.isEmpty) {
                                    return const SizedBox.shrink();
                                  }
                                  return BottomActionBar(state: state);
                                },
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),

              // Global Drag Overlay
              BlocBuilder<CompressionCubit, CompressionState>(
                buildWhen: (prev, curr) =>
                    prev.isDragHovering != curr.isDragHovering,
                builder: (context, state) {
                  final theme = Theme.of(context);
                  return IgnorePointer(
                    ignoring: !state.isDragHovering,
                    child: AnimatedOpacity(
                      opacity: state.isDragHovering ? 1.0 : 0.0,
                      duration: const Duration(milliseconds: 250),
                      child: BackdropFilter(
                        filter: dart_ui.ImageFilter.blur(
                          sigmaX: 24,
                          sigmaY: 24,
                        ),
                        child: Container(
                          color: theme.colorScheme.surface.withValues(
                            alpha: 0.2,
                          ),
                          child: Center(
                            child: Container(
                              margin: const EdgeInsets.all(40),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                border: Border.all(
                                  color: theme.colorScheme.primary.withValues(
                                    alpha: 0.3,
                                  ),
                                  width: 1.5,
                                ),
                                color: theme.colorScheme.primary.withValues(
                                  alpha: 0.03,
                                ),
                              ),
                              child: Center(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      CupertinoIcons.tray_arrow_down,
                                      size: 80,
                                      color: theme.colorScheme.primary
                                          .withValues(alpha: 0.8),
                                    ),
                                    const SizedBox(height: 32),
                                    Text(
                                      'Release to Shrink',
                                      style: theme.textTheme.headlineMedium
                                          ?.copyWith(
                                            fontWeight: FontWeight.w300,
                                            color: theme.colorScheme.onSurface,
                                            letterSpacing: 1.2,
                                          ),
                                    ),
                                    const SizedBox(height: 12),
                                    Text(
                                      'Your files will be added to the queue.',
                                      style: theme.textTheme.bodyLarge
                                          ?.copyWith(
                                            color: theme
                                                .textTheme
                                                .bodySmall
                                                ?.color,
                                            fontWeight: FontWeight.w400,
                                            letterSpacing: 0.5,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
