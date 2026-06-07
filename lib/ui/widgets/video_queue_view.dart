import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
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
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(24, 16, 24, 16),
          itemCount: state.videos.length,
          itemBuilder: (context, index) {
            final video = state.videos[index];
            return _EntryAnimator(
              key: ValueKey(video.id),
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
            child: Row(
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
                  icon: const Icon(Icons.create_new_folder_rounded, size: 16),
                  label: const Text('Add Folder'),
                ),
              ],
            ),
          ),
      ],
    );
  }
}

/// A simple entry animator for newly added queue items.
class _EntryAnimator extends StatefulWidget {
  final Widget child;

  const _EntryAnimator({super.key, required this.child});

  @override
  State<_EntryAnimator> createState() => _EntryAnimatorState();
}

class _EntryAnimatorState extends State<_EntryAnimator> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fade;
  late Animation<Offset> _slide;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _fade = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    );
    _slide = Tween<Offset>(
      begin: const Offset(0, 0.1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCubic,
    ));
    
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fade,
      child: SlideTransition(
        position: _slide,
        child: widget.child,
      ),
    );
  }
}
