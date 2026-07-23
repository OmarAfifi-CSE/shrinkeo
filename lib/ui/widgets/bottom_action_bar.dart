import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/app_strings.dart';
import '../../cubit/compression_cubit.dart';
import '../../cubit/compression_state.dart';
import '../../models/video_file.dart';
import '../app_colors.dart';
import 'dart:ui' as dart_ui;

class BottomActionBar extends StatelessWidget {
  final CompressionState state;

  const BottomActionBar({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CompressionCubit>();
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final surfaceContainer = isDark
        ? AppColors.surfaceContainerDark
        : AppColors.surfaceContainerLight;
    final borderColor = isDark ? AppColors.borderDark : AppColors.borderLight;

    return ClipRect(
      child: BackdropFilter(
        filter: dart_ui.ImageFilter.blur(sigmaX: 20, sigmaY: 20),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          decoration: BoxDecoration(
            color: surfaceContainer.withValues(alpha: isDark ? 0.6 : 0.7),
            border: Border(
              top: BorderSide(
                color: borderColor.withValues(alpha: isDark ? 0.3 : 0.6),
              ),
            ),
          ),
          child: Row(
            children: [
              // -- Queue Summary --
              _QueueSummary(state: state),

              const Spacer(),

              // -- Clear Completed button --
              if (state.successCount + state.failedCount > 0 &&
                  !state.isProcessing)
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: TextButton.icon(
                    onPressed: () => cubit.clearCompleted(),
                    icon: const Icon(Icons.cleaning_services_rounded, size: 16),
                    label: const Text(AppStrings.clearCompletedBtn),
                  ),
                ),

              // -- Clear All button --
              if (!state.isProcessing && state.videos.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: TextButton.icon(
                    onPressed: () => cubit.clearAll(),
                    icon: const Icon(Icons.delete_sweep_rounded, size: 16),
                    label: const Text(AppStrings.clearAllBtn),
                  ),
                ),

              // -- Cancel / Start button --
              if (state.isProcessing)
                ElevatedButton.icon(
                  onPressed: () => cubit.cancelCompression(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.errorRed,
                    foregroundColor: Colors.white,
                  ),
                  icon: const Icon(Icons.stop_rounded, size: 18),
                  label: const Text(AppStrings.stopAllBtn),
                )
              else if (state.canStart)
                ElevatedButton.icon(
                  onPressed: () => cubit.startCompression(),
                  icon: const Icon(Icons.play_arrow_rounded, size: 20),
                  label: const Text(AppStrings.startCompressionBtn),
                )
              else if (state.phase == CompressionPhase.completed)
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 40,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: AppColors.successGreen.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: AppColors.successGreen.withValues(alpha: 0.3),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.check_circle_rounded,
                              size: 18,
                              color: AppColors.successGreen,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              AppStrings.allDoneLabel,
                              style: theme.textTheme.labelLarge?.copyWith(
                                color: AppColors.successGreen,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (state.outputLocationMode == OutputLocationMode.unified) ...[
                      const SizedBox(width: 12),
                      SizedBox(
                        height: 40,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            if (state.outputFolderPath != null) {
                              cubit.openOutputFolder(state.outputFolderPath!);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: theme.colorScheme.primary,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          icon: const Icon(Icons.folder_open_rounded, size: 18),
                          label: const Text(AppStrings.openFolderBtn),
                        ),
                      ),
                    ],
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Displays a summary of the queue status (counts for each state).
class _QueueSummary extends StatelessWidget {
  final CompressionState state;

  const _QueueSummary({required this.state});

  @override
  Widget build(BuildContext context) {
    final total = state.videos.length;
    final success = state.successCount;
    final failed = state.failedCount;
    final processing = state.videos
        .where(
          (v) =>
              v.status == VideoStatus.compressing ||
              v.status == VideoStatus.probing,
        )
        .length;

    int totalSavedBytes = 0;
    if (state.phase == CompressionPhase.completed) {
      for (final v in state.videos) {
        if (v.status == VideoStatus.success && v.outputSizeBytes != null) {
          final saved = v.fileSizeBytes - v.outputSizeBytes!;
          if (saved > 0) totalSavedBytes += saved;
        }
      }
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.video_library_rounded,
          size: 16,
          color:
              Theme.of(context).iconTheme.color?.withValues(alpha: 0.3) ??
              Colors.grey,
        ),
        const SizedBox(width: 6),
        Text(
          '$total ${total == 1 ? AppStrings.videoSingle : AppStrings.videosPlural}',
          style: TextStyle(
            color: Theme.of(context).textTheme.bodySmall?.color,
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        ),
        if (state.isProcessing ||
            state.phase == CompressionPhase.completed) ...[
          const SizedBox(width: 12),
          _MiniCounter(
            count: success,
            color: AppColors.successGreen,
            icon: Icons.check_rounded,
          ),
          if (failed > 0) ...[
            const SizedBox(width: 8),
            _MiniCounter(
              count: failed,
              color: AppColors.errorRed,
              icon: Icons.close_rounded,
            ),
          ],
          if (processing > 0) ...[
            const SizedBox(width: 8),
            _MiniCounter(
              count: processing,
              color: Theme.of(context).colorScheme.primary,
              icon: Icons.sync_rounded,
            ),
          ],
        ],
        if (state.globalEta != null && state.isProcessing) ...[
          const SizedBox(width: 16),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Theme.of(
                context,
              ).colorScheme.primary.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.access_time_rounded,
                  size: 14,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 6),
                Text(
                  '${AppStrings.totalEtaLabel}: ${_formatDuration(state.globalEta!)}',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ] else if (state.phase == CompressionPhase.completed &&
            totalSavedBytes > 0) ...[
          const SizedBox(width: 16),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.successGreen.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.save_alt_rounded,
                  size: 14,
                  color: AppColors.successGreen,
                ),
                const SizedBox(width: 6),
                Text(
                  '${AppStrings.totalSavedLabel}: ${VideoFile.formatFileSize(totalSavedBytes)}',
                  style: const TextStyle(
                    color: AppColors.successGreen,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    if (duration.inHours > 0) {
      return "${duration.inHours}h ${twoDigitMinutes}m ${twoDigitSeconds}s";
    }
    return "${twoDigitMinutes}m ${twoDigitSeconds}s";
  }
}

/// Tiny colored count badge.
class _MiniCounter extends StatelessWidget {
  final int count;
  final Color color;
  final IconData icon;

  const _MiniCounter({
    required this.count,
    required this.color,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    Color effectiveColor = color;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    if (isDark) {
      if (color == AppColors.errorRed) {
        effectiveColor = Colors.redAccent.shade200;
      } else if (color == AppColors.warningOrange) {
        effectiveColor = Colors.orangeAccent.shade200;
      }
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 13, color: effectiveColor.withValues(alpha: 0.9)),
        const SizedBox(width: 3),
        Text(
          '$count',
          style: TextStyle(
            color: effectiveColor.withValues(alpha: 0.9),
            fontSize: 12,
            fontWeight: FontWeight.w600,
            fontFeatures: const [FontFeature.tabularFigures()],
          ),
        ),
      ],
    );
  }
}
