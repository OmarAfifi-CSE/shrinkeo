import 'dart:io';

import 'package:flutter/material.dart';

import '../../models/video_file.dart';
import '../app_colors.dart';
import 'status_chip.dart';

import 'glass_container.dart';

/// Card widget displaying a single video file in the compression queue.
///
/// Shows: file icon, name, size, status, progress bar, compression result,
/// and a cancel/remove button.
class VideoFileCard extends StatelessWidget {
  final VideoFile video;
  final VoidCallback? onRemove;

  const VideoFileCard({super.key, required this.video, this.onRemove});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: GlassContainer(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // -- Top row: icon, name, status, actions --
            Row(
              children: [
                // File format badge or Thumbnail
                if (video.thumbnailPath != null &&
                    File(video.thumbnailPath!).existsSync())
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: theme.brightness == Brightness.dark
                            ? Colors.white.withValues(alpha: 0.1)
                            : Colors.black.withValues(alpha: 0.08),
                        width: 0.5,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: theme.brightness == Brightness.dark
                              ? Colors.white.withValues(alpha: 0.25)
                              : Colors.black.withValues(alpha: 0.25),
                          blurRadius: 8,
                          spreadRadius: 1,
                        ),
                      ],
                      image: DecorationImage(
                        image: FileImage(File(video.thumbnailPath!)),
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                else
                  _FormatBadge(extension: video.extension),
                const SizedBox(width: 12),

                // File name & size
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        video.fileName,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: theme.textTheme.bodyMedium?.color,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 3),
                      Text(
                        VideoFile.formatFileSize(video.fileSizeBytes),
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.textTheme.bodySmall?.color,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),

                // Status chip
                StatusChip(status: video.status),
                const SizedBox(width: 10),

                if (video.status == VideoStatus.compressing)
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        if (video.eta != null) ...[
                          Text(
                            _formatDuration(video.eta!),
                            style: TextStyle(
                              color: theme.textTheme.bodySmall?.color,
                              fontSize: 11,
                            ),
                          ),
                          const SizedBox(width: 8),
                        ],
                        SizedBox(
                          width: 42,
                          child: Text(
                            '${(video.progress * 100).toStringAsFixed(0)}%',
                            textAlign: TextAlign.right,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w700,
                              color: theme.colorScheme.primary,
                              fontFeatures: const [
                                FontFeature.tabularFigures(),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                else if (video.status == VideoStatus.success &&
                    video.outputSizeBytes != null)
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [_CompressionResult(video: video)],
                    ),
                  )
                else
                  const SizedBox(width: 52),

                const SizedBox(width: 8),

                // Cancel/Remove button
                _ActionButton(video: video, onRemove: onRemove),
              ],
            ),

            // -- Progress bar (only during compression) --
            if (video.status == VideoStatus.compressing) ...[
              const SizedBox(height: 10),
              TweenAnimationBuilder<double>(
                tween: Tween<double>(begin: 0, end: video.progress),
                duration: const Duration(milliseconds: 500),
                curve: Curves.linear,
                builder: (context, value, _) {
                  return LinearProgressIndicator(
                    value: value,
                    minHeight: 4,
                    borderRadius: BorderRadius.circular(2),
                    backgroundColor: theme.brightness == Brightness.dark
                        ? AppColors.borderDark
                        : AppColors.borderLight,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      theme.colorScheme.primary.withValues(alpha: 0.9),
                    ),
                  );
                },
              ),
            ],

            // -- Error message (on failure) --
            if (video.status == VideoStatus.failed &&
                video.errorMessage != null) ...[
              const SizedBox(height: 8),
              Builder(
                builder: (context) {
                  final isDark =
                      Theme.of(context).brightness == Brightness.dark;
                  final errorColor = isDark
                      ? Colors.redAccent.shade100
                      : AppColors.errorRed.withValues(alpha: 0.9);
                  final bgColor = isDark
                      ? Colors.redAccent.withValues(alpha: 0.1)
                      : AppColors.errorRed.withValues(alpha: 0.08);
                  final borderColor = isDark
                      ? Colors.redAccent.withValues(alpha: 0.25)
                      : AppColors.errorRed.withValues(alpha: 0.2);

                  return Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: bgColor,
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: borderColor),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.warning_amber_rounded,
                          size: 16,
                          color: errorColor,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            video.errorMessage!,
                            style: TextStyle(
                              color: errorColor,
                              fontSize: 12,
                              height: 1.2,
                            ),
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ],
        ),
      ),
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

/// Color-coded badge showing the file's video format.
class _FormatBadge extends StatelessWidget {
  final String extension;

  const _FormatBadge({required this.extension});

  @override
  Widget build(BuildContext context) {
    final color = _colorForExtension(extension);

    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: color.withValues(alpha: 0.25)),
      ),
      child: Center(
        child: Text(
          extension.replaceFirst('.', '').toUpperCase(),
          style: TextStyle(
            color: color,
            fontSize: 11,
            fontWeight: FontWeight.w800,
            letterSpacing: 0.5,
          ),
        ),
      ),
    );
  }

  Color _colorForExtension(String ext) {
    return switch (ext.toLowerCase()) {
      '.mp4' => AppColors.typeMp4,
      '.mkv' => AppColors.typeMkv,
      '.mov' => AppColors.typeMov,
      '.avi' => AppColors.typeAvi,
      '.wmv' => AppColors.typeWmv,
      _ => AppColors.queuedGrey,
    };
  }
}

/// Displays compressed size and compression ratio badge.
class _CompressionResult extends StatelessWidget {
  final VideoFile video;

  const _CompressionResult({required this.video});

  @override
  Widget build(BuildContext context) {
    final savedBytes = video.fileSizeBytes - video.outputSizeBytes!;
    final percent = video.fileSizeBytes > 0
        ? (savedBytes / video.fileSizeBytes * 100).toStringAsFixed(0)
        : '0';
    final savedText = savedBytes > 0 ? 'Saved $percent%' : 'Larger';

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '${VideoFile.formatFileSize(video.fileSizeBytes)} ➔ ${VideoFile.formatFileSize(video.outputSizeBytes!)}',
          style: TextStyle(
            color: Theme.of(context).textTheme.bodyMedium?.color,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
        if (savedBytes > 0) ...[
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.successGreen.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              savedText,
              style: const TextStyle(
                color: AppColors.successGreen,
                fontSize: 11,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ],
      ],
    );
  }
}

/// Cancel (while processing) or Remove (while idle) button.
class _ActionButton extends StatelessWidget {
  final VideoFile video;
  final VoidCallback? onRemove;

  const _ActionButton({required this.video, this.onRemove});

  @override
  Widget build(BuildContext context) {
    final isRemovable =
        video.status == VideoStatus.queued ||
        video.status == VideoStatus.success ||
        video.status == VideoStatus.failed ||
        video.status == VideoStatus.cancelled;

    final isProcessing =
        video.status == VideoStatus.compressing ||
        video.status == VideoStatus.probing;

    if (!isRemovable && !isProcessing) return const SizedBox.shrink();

    return Tooltip(
      message: isProcessing ? 'Cancel' : 'Remove',
      child: InkWell(
        onTap: onRemove,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color:
                (isProcessing
                        ? AppColors.errorRed
                        : Theme.of(context).iconTheme.color ?? Colors.grey)
                    .withValues(alpha: 0.08),
          ),
          child: Icon(
            isProcessing ? Icons.stop_rounded : Icons.close_rounded,
            size: 16,
            color: isProcessing
                ? AppColors.errorRed.withValues(alpha: 0.8)
                : Theme.of(context).textTheme.bodySmall?.color,
          ),
        ),
      ),
    );
  }
}
