import 'package:desktop_drop/desktop_drop.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/compression_cubit.dart';
import '../../cubit/compression_state.dart';
import '../../models/video_file.dart';
import '../app_theme.dart';
import '../widgets/drop_zone_widget.dart';
import '../widgets/video_file_card.dart';

/// Main application screen with drop zone, video queue, and action bar.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // -- Top Bar --
          _TopBar(),
          const Divider(height: 1),

          // -- Main Content --
          Expanded(
            child: BlocBuilder<CompressionCubit, CompressionState>(
              builder: (context, state) {
                if (state.videos.isEmpty) {
                  // Empty state → show full drop zone.
                  return const Padding(
                    padding: EdgeInsets.all(24),
                    child: DropZoneWidget(),
                  );
                }

                // Has videos → show queue with drop target overlay.
                return _VideoQueueView(state: state);
              },
            ),
          ),

          // -- Bottom Action Bar --
          BlocBuilder<CompressionCubit, CompressionState>(
            builder: (context, state) {
              if (state.videos.isEmpty) return const SizedBox.shrink();
              return _BottomActionBar(state: state);
            },
          ),
        ],
      ),
    );
  }
}

// =============================================================================
// Top Bar
// =============================================================================

class _TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
      color: AppTheme.surfaceDark,
      child: Row(
        children: [
          // App icon
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primary,
                  Theme.of(context).colorScheme.primary.withValues(alpha: 0.6),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(9),
            ),
            child: const Icon(
              Icons.compress_rounded,
              color: Colors.white,
              size: 20,
            ),
          ),
          const SizedBox(width: 12),

          // App title
          Text(
            'Shrinkeo',
            style: Theme.of(context).appBarTheme.titleTextStyle,
          ),
          const SizedBox(width: 10),

          // Version badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
            decoration: BoxDecoration(
              color: AppTheme.borderDark.withValues(alpha: 0.5),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              'v1.0.0',
              style: TextStyle(
                color: Colors.white30,
                fontSize: 11,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          const Spacer(),

          // Global error indicator (if any)
          BlocBuilder<CompressionCubit, CompressionState>(
            buildWhen: (prev, curr) =>
                prev.globalError != curr.globalError,
            builder: (context, state) {
              if (state.globalError == null) return const SizedBox.shrink();
              return Tooltip(
                message: state.globalError!,
                child: Icon(
                  Icons.warning_amber_rounded,
                  color: AppTheme.warningOrange,
                  size: 20,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

// =============================================================================
// Video Queue View (with DropTarget wrapping)
// =============================================================================

class _VideoQueueView extends StatelessWidget {
  final CompressionState state;

  const _VideoQueueView({required this.state});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CompressionCubit>();

    return DropTarget(
      onDragEntered: (_) => cubit.setDragHovering(true),
      onDragExited: (_) => cubit.setDragHovering(false),
      onDragDone: (details) {
        cubit.setDragHovering(false);
        final paths = details.files.map((f) => f.path).toList();
        cubit.addFiles(paths);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          border: state.isDragHovering
              ? Border.all(
                  color: Theme.of(context)
                      .colorScheme
                      .primary
                      .withValues(alpha: 0.4),
                  width: 2,
                )
              : null,
        ),
        child: ListView.builder(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
          itemCount: state.videos.length,
          itemBuilder: (context, index) {
            final video = state.videos[index];
            return VideoFileCard(
              key: ValueKey(video.id),
              video: video,
              onRemove: () => cubit.cancelSingle(video.id),
            );
          },
        ),
      ),
    );
  }
}

// =============================================================================
// Bottom Action Bar
// =============================================================================

class _BottomActionBar extends StatelessWidget {
  final CompressionState state;

  const _BottomActionBar({required this.state});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CompressionCubit>();
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
      decoration: BoxDecoration(
        color: AppTheme.surfaceContainerDark,
        border: Border(
          top: BorderSide(
            color: AppTheme.borderDark.withValues(alpha: 0.5),
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
                label: const Text('Clear Completed'),
              ),
            ),

          // -- Clear All button --
          if (!state.isProcessing && state.videos.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: TextButton.icon(
                onPressed: () => cubit.clearAll(),
                icon: const Icon(Icons.delete_sweep_rounded, size: 16),
                label: const Text('Clear All'),
              ),
            ),

          // -- Cancel / Start button --
          if (state.isProcessing)
            ElevatedButton.icon(
              onPressed: () => cubit.cancelCompression(),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.errorRed,
                foregroundColor: Colors.white,
              ),
              icon: const Icon(Icons.stop_rounded, size: 18),
              label: const Text('Stop All'),
            )
          else if (state.canStart)
            ElevatedButton.icon(
              onPressed: () => cubit.startCompression(),
              icon: const Icon(Icons.play_arrow_rounded, size: 20),
              label: const Text('Start Compression'),
            )
          else if (state.phase == CompressionPhase.completed)
            Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                color: AppTheme.successGreen.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: AppTheme.successGreen.withValues(alpha: 0.3),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.check_circle_rounded,
                      size: 18, color: AppTheme.successGreen),
                  const SizedBox(width: 8),
                  Text(
                    'All Done!',
                    style: theme.textTheme.labelLarge?.copyWith(
                      color: AppTheme.successGreen,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
        ],
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
    final processing =
        state.videos.where((v) => v.status == VideoStatus.compressing || v.status == VideoStatus.probing).length;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.video_library_rounded,
            size: 16, color: Colors.white30),
        const SizedBox(width: 6),
        Text(
          '$total video${total == 1 ? '' : 's'}',
          style: TextStyle(
            color: Colors.white54,
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        ),
        if (state.isProcessing || state.phase == CompressionPhase.completed) ...[
          const SizedBox(width: 12),
          _MiniCounter(
            count: success,
            color: AppTheme.successGreen,
            icon: Icons.check_rounded,
          ),
          if (failed > 0) ...[
            const SizedBox(width: 8),
            _MiniCounter(
              count: failed,
              color: AppTheme.errorRed,
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
      ],
    );
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
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 13, color: color.withValues(alpha: 0.8)),
        const SizedBox(width: 3),
        Text(
          '$count',
          style: TextStyle(
            color: color.withValues(alpha: 0.8),
            fontSize: 12,
            fontWeight: FontWeight.w600,
            fontFeatures: const [FontFeature.tabularFigures()],
          ),
        ),
      ],
    );
  }
}
