import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/compression_cubit.dart';
import '../../cubit/compression_state.dart';
import '../widgets/bottom_action_bar.dart';
import '../widgets/custom_title_bar.dart';
import '../widgets/drop_zone_widget.dart';
import '../widgets/settings_panel.dart';
import '../widgets/video_queue_view.dart';

/// The main interface of the Shrinkeo application.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Column(
        children: [
          // 1. Custom Title Bar
          const CustomTitleBar(),

          // 2. Settings Panel (collapsible)
          const SettingsPanel(),

          // 3. Main Content Area
          Expanded(
            child: BlocBuilder<CompressionCubit, CompressionState>(
              builder: (context, state) {
                if (state.videos.isEmpty) {
                  // Empty state drag & drop zone
                  return DropZoneWidget(
                    isHovering: state.isDragHovering,
                    onHover: (hovering) => context
                        .read<CompressionCubit>()
                        .setDragHovering(hovering),
                    onFilesDropped: (paths) =>
                        context.read<CompressionCubit>().addFiles(paths),
                  );
                }

                // List of queued/processing videos
                return VideoQueueView(state: state);
              },
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
    );
  }
}
