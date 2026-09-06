import 'package:flutter/material.dart';

import '../../l10n/app_localizations.dart';
import '../../models/image_progress.dart';
import '../../models/file_item.dart';

/// Reports encoder work within the current stage, never an invented overall ETA.
class ImageProgressView extends StatelessWidget {
  final ImageProgress progress;

  const ImageProgressView({super.key, required this.progress});

  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context)!;
    final label = switch (progress.stage) {
      ImageStage.preparing => strings.imagePreparing,
      ImageStage.encoding => strings.imageEncoding,
      ImageStage.saving => strings.imageSaving,
    };
    final fraction = progress.fraction?.clamp(0.0, 0.99);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 10),
        Text(
          fraction == null ? label : '$label · ${(fraction * 100).round()}%',
          style: Theme.of(context).textTheme.bodySmall,
        ),
        const SizedBox(height: 6),
        RepaintBoundary(
          child: LinearProgressIndicator(
            value: fraction,
            minHeight: 4,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        if (progress.targetKB != null) ...[
          const SizedBox(height: 6),
          DefaultTextStyle(
            style: Theme.of(context).textTheme.bodySmall!,
            child: Wrap(
              spacing: 12,
              runSpacing: 4,
              children: [
                Text(
                  strings.imageTargetProgress(
                    VideoFile.formatFileSize(
                      (progress.targetKB! * 1024).round(),
                    ),
                  ),
                ),
                if (progress.attempt != null)
                  Text(strings.imageAttempt(progress.attempt!)),
                if (progress.bestBytes != null)
                  Text(
                    strings.imageBestResult(
                      VideoFile.formatFileSize(progress.bestBytes!),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ],
    );
  }
}
