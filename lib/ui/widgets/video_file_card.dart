import 'package:flutter/material.dart';

import '../../models/video_file.dart';
import '../app_theme.dart';
import 'status_chip.dart';

/// Card widget displaying a single video file in the compression queue.
///
/// Shows: file icon, name, size, status, progress bar, compression result,
/// and a cancel/remove button.
class VideoFileCard extends StatelessWidget {
  final VideoFile video;
  final VoidCallback? onRemove;

  const VideoFileCard({
    super.key,
    required this.video,
    this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // -- Top row: icon, name, status, actions --
            Row(
              children: [
                // File format badge
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
                          color: Colors.white,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 3),
                      Text(
                        VideoFile.formatFileSize(video.fileSizeBytes),
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: Colors.white54,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),

                // Status chip
                StatusChip(status: video.status),
                const SizedBox(width: 10),

                // Compression result or percentage
                if (video.status == VideoStatus.compressing)
                  SizedBox(
                    width: 52,
                    child: Text(
                      '${(video.progress * 100).toStringAsFixed(0)}%',
                      textAlign: TextAlign.right,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: theme.colorScheme.primary,
                        fontFeatures: const [FontFeature.tabularFigures()],
                      ),
                    ),
                  )
                else if (video.status == VideoStatus.success &&
                    video.outputSizeBytes != null)
                  _CompressionResult(video: video)
                else
                  const SizedBox(width: 52),

                const SizedBox(width: 8),

                // Cancel/Remove button
                _ActionButton(
                  video: video,
                  onRemove: onRemove,
                ),
              ],
            ),

            // -- Progress bar (only during compression) --
            if (video.status == VideoStatus.compressing) ...[
              const SizedBox(height: 10),
              ClipRRect(
                borderRadius: BorderRadius.circular(2),
                child: TweenAnimationBuilder<double>(
                  tween: Tween<double>(begin: 0, end: video.progress),
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeOut,
                  builder: (context, value, _) {
                    return LinearProgressIndicator(
                      value: value,
                      minHeight: 4,
                      backgroundColor: AppTheme.borderDark,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        theme.colorScheme.primary,
                      ),
                    );
                  },
                ),
              ),
            ],

            // -- Error message (on failure) --
            if (video.status == VideoStatus.failed &&
                video.errorMessage != null) ...[
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: AppTheme.errorRed.withValues(alpha: 0.08),
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(
                    color: AppTheme.errorRed.withValues(alpha: 0.2),
                  ),
                ),
                child: Row(
                  children: [
                    Icon(Icons.warning_amber_rounded,
                        size: 14, color: AppTheme.errorRed.withValues(alpha: 0.7)),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        video.errorMessage!,
                        style: TextStyle(
                          color: AppTheme.errorRed.withValues(alpha: 0.8),
                          fontSize: 11,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
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
      '.mp4' => const Color(0xFF42A5F5),
      '.mkv' => const Color(0xFFAB47BC),
      '.mov' => const Color(0xFF26C6DA),
      '.avi' => const Color(0xFFFFCA28),
      '.wmv' => const Color(0xFFEF5350),
      _ => Colors.grey,
    };
  }
}

/// Displays compressed size and compression ratio badge.
class _CompressionResult extends StatelessWidget {
  final VideoFile video;

  const _CompressionResult({required this.video});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          VideoFile.formatFileSize(video.outputSizeBytes!),
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
        if (video.compressionRatio != null) ...[
          const SizedBox(width: 6),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: AppTheme.successGreen.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              video.compressionRatio!,
              style: const TextStyle(
                color: AppTheme.successGreen,
                fontSize: 11,
                fontWeight: FontWeight.w700,
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
    final isRemovable = video.status == VideoStatus.queued ||
        video.status == VideoStatus.success ||
        video.status == VideoStatus.failed ||
        video.status == VideoStatus.cancelled;

    final isProcessing = video.status == VideoStatus.compressing ||
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
            color: (isProcessing ? AppTheme.errorRed : Colors.white)
                .withValues(alpha: 0.08),
          ),
          child: Icon(
            isProcessing ? Icons.stop_rounded : Icons.close_rounded,
            size: 16,
            color: isProcessing
                ? AppTheme.errorRed.withValues(alpha: 0.8)
                : Colors.white38,
          ),
        ),
      ),
    );
  }
}
