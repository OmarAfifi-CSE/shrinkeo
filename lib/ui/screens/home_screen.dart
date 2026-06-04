import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../services/desktop_integration_service.dart';

import '../../cubit/compression_cubit.dart';
import '../../cubit/compression_state.dart';
import '../../services/update_service.dart';
import '../widgets/aurora_background.dart';
import '../widgets/bottom_action_bar.dart';
import '../widgets/custom_title_bar.dart';
import '../widgets/drop_zone_widget.dart';
import '../widgets/settings_panel.dart';
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
      body: AuroraBackground(
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
                            onHover: (hovering) => context
                                .read<CompressionCubit>()
                                .setDragHovering(hovering),
                            onFilesDropped: (paths) =>
                                context.read<CompressionCubit>().addFiles(paths),
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
    );
  }
}
