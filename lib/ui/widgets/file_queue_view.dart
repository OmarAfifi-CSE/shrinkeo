import '../../core/file_picker_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/app_strings.dart';
import '../../cubit/compression_cubit.dart';
import '../../cubit/compression_state.dart';
import '../../models/file_item.dart';
import 'file_card.dart';
import 'smooth_button.dart';

/// Renders the list of files in the compression queue.
///
/// When [asSliver] is `true`, renders as high-performance [SliverMainAxisGroup]
/// with virtualized [SliverList.builder] for 120 FPS buttery-smooth scrolling.
/// When [asSliver] is `false`, renders as standard box [Column] for backward
/// compatibility with non-sliver contexts and widget tests.
class FileQueueView extends StatelessWidget {
  final CompressionState state;
  final bool asSliver;

  const FileQueueView({
    super.key,
    required this.state,
    this.asSliver = false,
  });

  static Future<void> pickMultipleFiles(CompressionCubit cubit) async {
    final paths = await FilePickerHelper.pickMultipleMediaFiles();
    if (paths.isNotEmpty) {
      cubit.addFiles(paths);
    }
  }

  static Future<void> pickFolder(CompressionCubit cubit) async {
    final path = await FilePickerHelper.pickDirectory();
    if (path != null) {
      cubit.addFiles([path]);
    }
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CompressionCubit>();
    final idToIndex = <String, int>{
      for (int i = 0; i < state.videos.length; i++) state.videos[i].id: i,
    };

    if (asSliver) {
      return SliverMainAxisGroup(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(24, 16, 24, 4),
            sliver: SliverList.builder(
              itemCount: state.videos.length,
              findChildIndexCallback: (Key key) {
                if (key is ValueKey<String>) {
                  return idToIndex[key.value];
                }
                return null;
              },
              itemBuilder: (context, index) {
                final video = state.videos[index];
                return _FileQueueItem(
                  key: ValueKey(video.id),
                  video: video,
                  index: index,
                  cubit: cubit,
                );
              },
            ),
          ),
          if (state.isScanningFiles ||
              (!state.isScanningFiles && !state.isProcessing))
            SliverToBoxAdapter(
              child: _FileQueueFooter(state: state),
            ),
        ],
      );
    }

    return Column(
      children: [
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(24, 16, 24, 4),
          itemCount: state.videos.length,
          findChildIndexCallback: (Key key) {
            if (key is ValueKey<String>) {
              return idToIndex[key.value];
            }
            return null;
          },
          itemBuilder: (context, index) {
            final video = state.videos[index];
            return _FileQueueItem(
              key: ValueKey(video.id),
              video: video,
              index: index,
              cubit: cubit,
            );
          },
        ),
        _FileQueueFooter(state: state),
      ],
    );
  }
}

class _FileQueueItem extends StatelessWidget {
  final VideoFile video;
  final int index;
  final CompressionCubit cubit;

  const _FileQueueItem({
    super.key,
    required this.video,
    required this.index,
    required this.cubit,
  });

  @override
  Widget build(BuildContext context) {
    return BlocSelector<CompressionCubit, CompressionState, VideoFile>(
      selector: (state) {
        if (index < state.videos.length && state.videos[index].id == video.id) {
          return state.videos[index];
        }
        for (int i = 0; i < state.videos.length; i++) {
          if (state.videos[i].id == video.id) return state.videos[i];
        }
        return video;
      },
      builder: (context, selectedVideo) {
        return FileCard(
          key: ValueKey(selectedVideo.id),
          video: selectedVideo,
          onRemove: () => cubit.cancelSingle(selectedVideo.id),
        );
      },
    );
  }
}

class _FileQueueFooter extends StatelessWidget {
  final CompressionState state;

  const _FileQueueFooter({required this.state});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CompressionCubit>();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
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
                    SmoothButton(
                      enableHoverScale: true,
                      child: OutlinedButton.icon(
                        onPressed: () => FileQueueView.pickMultipleFiles(cubit),
                        icon: const Icon(Icons.note_add_rounded, size: 16),
                        label: Text(AppStrings.addFilesBtn),
                      ),
                    ),
                    const SizedBox(width: 12),
                    SmoothButton(
                      enableHoverScale: true,
                      child: OutlinedButton.icon(
                        onPressed: () => FileQueueView.pickFolder(cubit),
                        icon: const Icon(
                          Icons.create_new_folder_rounded,
                          size: 16,
                        ),
                        label: Text(AppStrings.addFolderBtn),
                      ),
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
