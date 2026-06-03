import 'package:desktop_drop/desktop_drop.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:window_manager/window_manager.dart';

import '../../cubit/compression_cubit.dart';
import '../../cubit/compression_state.dart';
import '../../models/video_file.dart';
import '../app_theme.dart';
import '../widgets/drop_zone_widget.dart';
import '../widgets/settings_panel.dart';
import '../widgets/video_file_card.dart';

/// Main application screen with custom title bar, drop zone, video queue,
/// settings panel, and action bar.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // -- Custom Title Bar (replaces Windows title bar) --
          const _CustomTitleBar(),

          // -- Settings Panel (collapsible) --
          const SettingsPanel(),

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
// Custom Title Bar (replaces native Windows title bar)
// =============================================================================

class _CustomTitleBar extends StatelessWidget {
  const _CustomTitleBar();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onPanStart: (_) => windowManager.startDragging(),
      child: Container(
        height: 42,
        color: AppTheme.surfaceDark,
        child: Row(
          children: [
            const SizedBox(width: 14),

            // App icon
            Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    theme.colorScheme.primary,
                    theme.colorScheme.primary.withValues(alpha: 0.6),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(7),
              ),
              child: const Icon(
                Icons.compress_rounded,
                color: Colors.white,
                size: 15,
              ),
            ),
            const SizedBox(width: 10),

            // App title
            Text(
              'Shrinkeo',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w700,
                letterSpacing: -0.3,
              ),
            ),
            const SizedBox(width: 8),

            // Version badge
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: AppTheme.borderDark.withValues(alpha: 0.5),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                'v1.0.0',
                style: TextStyle(
                  color: Colors.white24,
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),

            const Spacer(),

            // Global error indicator
            BlocBuilder<CompressionCubit, CompressionState>(
              buildWhen: (prev, curr) =>
                  prev.globalError != curr.globalError,
              builder: (context, state) {
                if (state.globalError == null) return const SizedBox.shrink();
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Tooltip(
                    message: state.globalError!,
                    child: Icon(
                      Icons.warning_amber_rounded,
                      color: AppTheme.warningOrange,
                      size: 16,
                    ),
                  ),
                );
              },
            ),

            // Active config badge
            BlocBuilder<CompressionCubit, CompressionState>(
              buildWhen: (prev, curr) =>
                  prev.crfQuality != curr.crfQuality ||
                  prev.encodingPreset != curr.encodingPreset,
              builder: (context, state) {
                return Padding(
                  padding: const EdgeInsets.only(right: 6),
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(
                      color: AppTheme.borderDark.withValues(alpha: 0.4),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      'CRF ${state.crfQuality} · ${state.encodingPreset.label}',
                      style: TextStyle(
                        color: Colors.white30,
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                );
              },
            ),

            // Settings toggle
            BlocBuilder<CompressionCubit, CompressionState>(
              buildWhen: (prev, curr) =>
                  prev.isSettingsExpanded != curr.isSettingsExpanded,
              builder: (context, state) {
                return _TitleBarButton(
                  icon: Icons.tune_rounded,
                  iconColor: state.isSettingsExpanded
                      ? Theme.of(context).colorScheme.primary
                      : Colors.white54,
                  onTap: () =>
                      context.read<CompressionCubit>().toggleSettings(),
                  tooltip: 'Settings',
                );
              },
            ),

            // Divider
            Container(
              width: 1,
              height: 18,
              color: AppTheme.borderDark.withValues(alpha: 0.4),
            ),

            // Window controls
            _TitleBarButton(
              icon: Icons.remove_rounded,
              onTap: () => windowManager.minimize(),
              tooltip: 'Minimize',
            ),
            _MaximizeButton(),
            _TitleBarButton(
              icon: Icons.close_rounded,
              onTap: () => windowManager.close(),
              hoverColor: AppTheme.errorRed,
              tooltip: 'Close',
            ),
          ],
        ),
      ),
    );
  }
}

/// Maximize/restore button that reacts to window state.
class _MaximizeButton extends StatefulWidget {
  @override
  State<_MaximizeButton> createState() => _MaximizeButtonState();
}

class _MaximizeButtonState extends State<_MaximizeButton> with WindowListener {
  bool _isMaximized = false;

  @override
  void initState() {
    super.initState();
    windowManager.addListener(this);
    _checkMaximized();
  }

  @override
  void dispose() {
    windowManager.removeListener(this);
    super.dispose();
  }

  Future<void> _checkMaximized() async {
    final maximized = await windowManager.isMaximized();
    if (mounted) setState(() => _isMaximized = maximized);
  }

  @override
  void onWindowMaximize() => setState(() => _isMaximized = true);

  @override
  void onWindowUnmaximize() => setState(() => _isMaximized = false);

  @override
  Widget build(BuildContext context) {
    return _TitleBarButton(
      icon: _isMaximized
          ? Icons.filter_none_rounded
          : Icons.crop_square_rounded,
      iconSize: _isMaximized ? 13 : 15,
      onTap: () async {
        if (await windowManager.isMaximized()) {
          await windowManager.unmaximize();
        } else {
          await windowManager.maximize();
        }
      },
      tooltip: _isMaximized ? 'Restore' : 'Maximize',
    );
  }
}

/// Individual button in the custom title bar.
class _TitleBarButton extends StatefulWidget {
  final IconData icon;
  final VoidCallback onTap;
  final Color? iconColor;
  final Color? hoverColor;
  final double iconSize;
  final String? tooltip;

  const _TitleBarButton({
    required this.icon,
    required this.onTap,
    this.iconColor,
    this.hoverColor,
    this.iconSize = 15,
    this.tooltip,
  });

  @override
  State<_TitleBarButton> createState() => _TitleBarButtonState();
}

class _TitleBarButtonState extends State<_TitleBarButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final button = MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 120),
          width: 42,
          height: 42,
          color: _isHovered
              ? (widget.hoverColor ?? Colors.white).withValues(alpha:
                  widget.hoverColor != null ? 0.9 : 0.06)
              : Colors.transparent,
          child: Icon(
            widget.icon,
            size: widget.iconSize,
            color: _isHovered && widget.hoverColor != null
                ? Colors.white
                : (widget.iconColor ?? Colors.white54),
          ),
        ),
      ),
    );

    if (widget.tooltip != null) {
      return Tooltip(message: widget.tooltip!, child: button);
    }
    return button;
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
    final processing = state.videos
        .where((v) =>
            v.status == VideoStatus.compressing ||
            v.status == VideoStatus.probing)
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
        if (state.isProcessing ||
            state.phase == CompressionPhase.completed) ...[
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
        if (state.globalEta != null && state.isProcessing) ...[
          const SizedBox(width: 16),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Row(
              children: [
                Icon(Icons.access_time_rounded,
                    size: 14, color: Theme.of(context).colorScheme.primary),
                const SizedBox(width: 6),
                Text(
                  'Total ETA: ${_formatDuration(state.globalEta!)}',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ] else if (state.phase == CompressionPhase.completed && totalSavedBytes > 0) ...[
          const SizedBox(width: 16),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: AppTheme.successGreen.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Row(
              children: [
                Icon(Icons.save_alt_rounded,
                    size: 14, color: AppTheme.successGreen),
                const SizedBox(width: 6),
                Text(
                  'Total Saved: ${VideoFile.formatFileSize(totalSavedBytes)}',
                  style: const TextStyle(
                    color: AppTheme.successGreen,
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
