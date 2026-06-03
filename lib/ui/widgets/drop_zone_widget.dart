import 'dart:ui' as dart_ui;
import 'package:desktop_drop/desktop_drop.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/compression_cubit.dart';
import '../app_colors.dart';

/// Animated drop zone for dragging and dropping video files and folders.
///
/// Provides alternative buttons for manual file/folder selection.
class DropZoneWidget extends StatelessWidget {
  final bool isHovering;
  final ValueChanged<bool> onHover;
  final ValueChanged<List<String>> onFilesDropped;

  const DropZoneWidget({
    super.key,
    required this.isHovering,
    required this.onHover,
    required this.onFilesDropped,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CompressionCubit>();
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    
    final surfaceContainer = isDark ? AppColors.surfaceContainerDark : AppColors.surfaceContainerLight;
    final borderColor = isDark ? AppColors.borderDark : AppColors.borderLight;

    return DropTarget(
      onDragEntered: (_) => onHover(true),
      onDragExited: (_) => onHover(false),
      onDragDone: (details) {
        onHover(false);
        final paths = details.files.map((f) => f.path).toList();
        onFilesDropped(paths);
      },
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: BackdropFilter(
            filter: dart_ui.ImageFilter.blur(sigmaX: 20, sigmaY: 20),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeOut,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: isHovering
                    ? theme.colorScheme.primary.withValues(alpha: 0.08)
                    : surfaceContainer.withValues(alpha: 0.4),
                border: Border.all(
                  color: isHovering
                      ? theme.colorScheme.primary.withValues(alpha: 0.6)
                      : borderColor.withValues(alpha: 0.4),
                  width: isHovering ? 2 : 1.5,
                ),
                boxShadow: isHovering
                    ? [
                        BoxShadow(
                          color: theme.colorScheme.primary.withValues(alpha: 0.15),
                          blurRadius: 20,
                          spreadRadius: 2,
                        )
                      ]
                    : [],
              ),
              child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Animated icon
              AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                transform: Matrix4.translationValues(0, isHovering ? -8 : 0, 0),
                child: Container(
                  width: 72,
                  height: 72,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).colorScheme.primary.withValues(
                      alpha: isHovering ? 0.15 : 0.08,
                    ),
                  ),
                  child: Icon(
                    Icons.cloud_upload_rounded,
                    size: 32,
                    color: isHovering
                        ? theme.colorScheme.primary
                        : theme.textTheme.bodySmall?.color ?? Colors.white38,
                  ),
                ),
              ),
              const SizedBox(height: 18),

              // Instructional text
              Text(
                isHovering
                    ? 'Release to add videos'
                    : 'Drag & drop video files or folders here',
                style: TextStyle(
                  color: isHovering
                      ? theme.colorScheme.primary
                      : theme.textTheme.bodySmall?.color ?? Colors.white54,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                'Supports MP4, MKV, MOV, AVI, WMV',
                style: TextStyle(
                  color: theme.textTheme.bodySmall?.color ?? Colors.white24,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 24),

              // Manual pick buttons
              Wrap(
                spacing: 10,
                runSpacing: 8,
                alignment: WrapAlignment.center,
                children: [
                  _PickButton(
                    icon: Icons.file_copy_rounded,
                    label: 'Select Files',
                    onTap: () => _pickMultipleFiles(cubit),
                  ),
                  _PickButton(
                    icon: Icons.folder_rounded,
                    label: 'Select Folder',
                    onTap: () => _pickFolder(cubit),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  ),
),
);
}

  /// Opens native file picker for multiple video files.
  Future<void> _pickMultipleFiles(CompressionCubit cubit) async {
    try {
      final result = await FilePicker.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['mp4', 'mkv', 'mov', 'avi', 'wmv'],
        allowMultiple: true,
      );

      if (result != null && result.files.isNotEmpty) {
        final paths = result.files
            .where((f) => f.path != null)
            .map((f) => f.path!)
            .toList();
        cubit.addFiles(paths);
      }
    } catch (_) {
      // Silently ignore picker errors.
    }
  }

  /// Opens native folder picker and scans for video files.
  Future<void> _pickFolder(CompressionCubit cubit) async {
    try {
      final result = await FilePicker.getDirectoryPath();

      if (result != null) {
        cubit.addFiles([result]);
      }
    } catch (_) {
      // Silently ignore picker errors.
    }
  }
}

/// Small outlined button for manual file/folder picking.
class _PickButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _PickButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: onTap,
      icon: Icon(icon, size: 16),
      label: Text(label),
    );
  }
}
