import 'package:desktop_drop/desktop_drop.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/compression_cubit.dart';
import '../../cubit/compression_state.dart';
import 'video_file_card.dart';

class VideoQueueView extends StatelessWidget {
  final CompressionState state;

  const VideoQueueView({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CompressionCubit>();

    return DropTarget(
      onDragEntered: (_) => cubit.setDragHovering(true),
      onDragExited: (_) => cubit.setDragHovering(false),
      onDragDone: (details) {
        cubit.setDragHovering(false);
        final paths = details.files.map((f) => f.path).toList();
        cubit.addFiles(paths);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          border: state.isDragHovering
              ? Border.all(
                  color: Theme.of(
                    context,
                  ).colorScheme.primary.withValues(alpha: 0.4),
                  width: 2,
                )
              : null,
        ),
        child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
          itemCount: state.videos.length,
          itemBuilder: (context, index) {
            final video = state.videos[index];
            return VideoFileCard(
              key: ValueKey(video.id),
              video: video,
              onRemove: () => cubit.cancelSingle(video.id),
            );
          },
        ),
      ),
    );
  }
}
