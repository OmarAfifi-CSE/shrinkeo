import 'dart:async';
import 'package:desktop_drop/desktop_drop.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:ui' as dart_ui;

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

/// The main interface of the Shrinkeo application.
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  StreamSubscription? _externalFilesSubscription;

  @override
  void initState() {
    super.initState();
    // Check for updates when the home screen loads
    WidgetsBinding.instance.addPostFrameCallback((_) {
      UpdateService.checkForUpdates(context);
    });

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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: DropTarget(
        onDragEntered: (_) => context.read<CompressionCubit>().setDragHovering(true),
        onDragExited: (_) => context.read<CompressionCubit>().setDragHovering(false),
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

                  // 2 & 3. Settings Panel & Main Content Area (Scrollable together)
                  Expanded(
                    child: CustomScrollView(
                      slivers: [
                        const SliverToBoxAdapter(
                          child: SettingsPanel(),
                        ),
                        BlocBuilder<CompressionCubit, CompressionState>(
                          builder: (context, state) {
                            if (state.videos.isEmpty) {
                              // Empty state drag & drop zone
                              return SliverFillRemaining(
                                hasScrollBody: false,
                                child: DropZoneWidget(
                                  isHovering: state.isDragHovering,
                                  isScanningFiles: state.isScanningFiles,
                                ),
                              );
                            }

                            // List of queued/processing videos
                            return SliverToBoxAdapter(
                              child: VideoQueueView(state: state),
                            );
                          },
                        ),
                      ],
                    ),
                  ),

                  // 4. Bottom Action Bar
                  BlocBuilder<CompressionCubit, CompressionState>(
                    builder: (context, state) {
                      if (state.videos.isEmpty) return const SizedBox.shrink();
                      return BottomActionBar(state: state);
                    },
                  ),
                ],
              ),
            ),
            
            // Global Drag Overlay
            BlocBuilder<CompressionCubit, CompressionState>(
              buildWhen: (prev, curr) => prev.isDragHovering != curr.isDragHovering,
              builder: (context, state) {
                final theme = Theme.of(context);
                return IgnorePointer(
                  ignoring: !state.isDragHovering,
                  child: AnimatedOpacity(
                    opacity: state.isDragHovering ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 250),
                    child: BackdropFilter(
                      filter: dart_ui.ImageFilter.blur(sigmaX: 24, sigmaY: 24),
                      child: Container(
                        color: theme.colorScheme.surface.withValues(alpha: 0.2),
                        child: Center(
                          child: Container(
                            margin: const EdgeInsets.all(40),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              border: Border.all(
                                color: theme.colorScheme.primary.withValues(alpha: 0.3),
                                width: 1.5,
                              ),
                              color: theme.colorScheme.primary.withValues(alpha: 0.03),
                            ),
                            child: Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    CupertinoIcons.tray_arrow_down,
                                    size: 80,
                                    color: theme.colorScheme.primary.withValues(alpha: 0.8),
                                  ),
                                  const SizedBox(height: 32),
                                  Text(
                                    'Release to Shrink',
                                    style: theme.textTheme.headlineMedium?.copyWith(
                                      fontWeight: FontWeight.w300,
                                      color: theme.colorScheme.onSurface,
                                      letterSpacing: 1.2,
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  Text(
                                    'Your files will be added to the queue.',
                                    style: theme.textTheme.bodyLarge?.copyWith(
                                      color: theme.textTheme.bodySmall?.color,
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
    );
  }
}
