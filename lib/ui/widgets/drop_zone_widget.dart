import 'dart:ui' as dart_ui;
import '../../core/file_picker_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/app_strings.dart';
import '../../cubit/compression_cubit.dart';
import '../app_colors.dart';

/// Animated drop zone for dragging and dropping video files and folders.
///
/// Provides alternative buttons for manual file/folder selection.
class DropZoneWidget extends StatelessWidget {
  final bool isHovering;
  final bool isScanningFiles;

  const DropZoneWidget({
    super.key,
    required this.isHovering,
    required this.isScanningFiles,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CompressionCubit>();
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final surfaceContainer = isDark
        ? AppColors.surfaceContainerDark
        : AppColors.surfaceContainerLight;
    final borderColor = isDark ? AppColors.borderDark : AppColors.borderLight;

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
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
                        color: theme.colorScheme.primary.withValues(
                          alpha: 0.15,
                        ),
                        blurRadius: 20,
                        spreadRadius: 2,
                      ),
                    ]
                  : [],
            ),
            child: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 32),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 72,
                        height: 72,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: theme.colorScheme.primary.withValues(
                            alpha: isHovering ? 0.15 : 0.08,
                          ),
                        ),
                        child: isScanningFiles
                            ? SizedBox(
                                width: 32,
                                height: 32,
                                child: CupertinoActivityIndicator(
                                  radius: 16,
                                  color: theme.colorScheme.primary,
                                ),
                              )
                            : Icon(
                                CupertinoIcons.cloud_upload,
                                size: 36,
                                color: isHovering
                                    ? theme.colorScheme.primary
                                    : theme.textTheme.bodySmall?.color ??
                                          Colors.white38,
                              ),
                      ),
                      const SizedBox(height: 18),

                      // Instructional text
                      Text(
                        isScanningFiles
                            ? AppStrings.scanningFilesMsg
                            : isHovering
                            ? AppStrings.releaseToAddVideosMsg
                            : AppStrings.dragDropHereMsg,
                        style: TextStyle(
                          color: isHovering
                              ? theme.colorScheme.primary
                              : theme.textTheme.bodySmall?.color ??
                                    Colors.white54,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        AppStrings.supportedFormatsMsg,
                        style: TextStyle(
                          color:
                              theme.textTheme.bodySmall?.color ??
                              Colors.white24,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 24),

                      if (!isScanningFiles) ...[
                        // Manual pick buttons
                        Wrap(
                          spacing: 10,
                          runSpacing: 8,
                          alignment: WrapAlignment.center,
                          children: [
                            _PickButton(
                              icon: Icons.file_copy_rounded,
                              label: AppStrings.selectFilesBtn,
                              onTap: () => _pickMultipleFiles(cubit),
                            ),
                            _PickButton(
                              icon: Icons.folder_rounded,
                              label: AppStrings.selectFolderBtn,
                              onTap: () => _pickFolder(cubit),
                            ),
                          ],
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Opens native file picker for multiple video & image files.
  Future<void> _pickMultipleFiles(CompressionCubit cubit) async {
    final paths = await FilePickerHelper.pickMultipleMediaFiles();
    if (paths.isNotEmpty) {
      cubit.addFiles(paths);
    }
  }

  /// Opens native folder picker and scans for video files.
  Future<void> _pickFolder(CompressionCubit cubit) async {
    final path = await FilePickerHelper.pickDirectory();
    if (path != null) {
      cubit.addFiles([path]);
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
