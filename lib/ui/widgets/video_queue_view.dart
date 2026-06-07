import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/compression_cubit.dart';
import '../../cubit/compression_state.dart';
import '../../models/video_file.dart';
import 'video_file_card.dart';

import 'package:animated_list_plus/animated_list_plus.dart';
import 'package:animated_list_plus/transitions.dart';

class VideoQueueView extends StatelessWidget {
  final CompressionState state;

  const VideoQueueView({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CompressionCubit>();

    Future<void> pickMultipleFiles() async {
      try {
        final result = await FilePicker.pickFiles(
          allowMultiple: true,
          type: FileType.custom,
          allowedExtensions: ['mp4', 'mkv', 'mov', 'avi', 'wmv'],
        );
        if (result != null && result.files.isNotEmpty) {
          final paths = result.files
              .where((f) => f.path != null)
              .map((f) => f.path!)
              .toList();
          cubit.addFiles(paths);
        }
      } catch (_) {}
    }

    Future<void> pickFolder() async {
      try {
        final result = await FilePicker.getDirectoryPath();
        if (result != null) {
          cubit.addFiles([result]);
        }
      } catch (_) {}
    }

    return Column(
      children: [
        ImplicitlyAnimatedList<VideoFile>(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(24, 16, 24, 16),
          items: state.videos,
          areItemsTheSame: (a, b) => a.id == b.id,
          itemBuilder: (context, animation, video, index) {
            return SizeFadeTransition(
              sizeFraction: 0.7,
              curve: Curves.easeInOut,
              animation: animation,
              child: VideoFileCard(
                video: video,
                onRemove: () => cubit.cancelSingle(video.id),
              ),
            );
          },
        ),
        if (state.isScanningFiles)
          Padding(
            padding: const EdgeInsets.only(bottom: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 16,
                  height: 16,
                  child: CupertinoActivityIndicator(
                    radius: 8,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  'Scanning files... This may take a moment.',
                  style: TextStyle(
                    color: Theme.of(context).textTheme.bodySmall?.color,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
        if (!state.isScanningFiles && !state.isProcessing)
          Padding(
            padding: const EdgeInsets.only(bottom: 24.0, left: 24, right: 24),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OutlinedButton.icon(
                      onPressed: pickMultipleFiles,
                      icon: const Icon(Icons.note_add_rounded, size: 16),
                      label: const Text('Add Files'),
                    ),
                    const SizedBox(width: 12),
                    OutlinedButton.icon(
                      onPressed: pickFolder,
                      icon: const Icon(
                        Icons.create_new_folder_rounded,
                        size: 16,
                      ),
                      label: const Text('Add Folder'),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.mouse_outlined,
                      size: 14,
                      color: Theme.of(
                        context,
                      ).textTheme.bodySmall?.color?.withValues(alpha: 0.7),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      'Or drag & drop more videos anywhere',
                      style: TextStyle(
                        color: Theme.of(
                          context,
                        ).textTheme.bodySmall?.color?.withValues(alpha: 0.7),
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
      ],
    );
  }
}
