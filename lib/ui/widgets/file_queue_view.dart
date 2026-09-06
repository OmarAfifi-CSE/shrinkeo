import '../../core/file_picker_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/app_strings.dart';
import '../../cubit/compression_cubit.dart';
import '../../cubit/compression_state.dart';
import '../../models/file_item.dart';
import 'file_card.dart';

import 'package:animated_list_plus/animated_list_plus.dart';
import 'package:animated_list_plus/transitions.dart';

class FileQueueView extends StatelessWidget {
  final CompressionState state;

  const FileQueueView({super.key, required this.state});

  Future<void> _pickMultipleFiles(CompressionCubit cubit) async {
    final paths = await FilePickerHelper.pickMultipleMediaFiles();
    if (paths.isNotEmpty) {
      cubit.addFiles(paths);
    }
  }

  Future<void> _pickFolder(CompressionCubit cubit) async {
    final path = await FilePickerHelper.pickDirectory();
    if (path != null) {
      cubit.addFiles([path]);
    }
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CompressionCubit>();

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
              key: ValueKey('trans_${video.id}'),
              sizeFraction: 0.7,
              curve: Curves.easeInOut,
              animation: animation,
              child: FileCard(
                key: ValueKey(video.id),
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
                  AppStrings.scanningFilesMsg,
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
                      onPressed: () => _pickMultipleFiles(cubit),
                      icon: const Icon(Icons.note_add_rounded, size: 16),
                      label: Text(AppStrings.addFilesBtn),
                    ),
                    const SizedBox(width: 12),
                    OutlinedButton.icon(
                      onPressed: () => _pickFolder(cubit),
                      icon: const Icon(
                        Icons.create_new_folder_rounded,
                        size: 16,
                      ),
                      label: Text(AppStrings.addFolderBtn),
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
                      AppStrings.dragDropMoreMsg,
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

/// Backward compatibility alias for [FileQueueView].
typedef VideoQueueView = FileQueueView;
