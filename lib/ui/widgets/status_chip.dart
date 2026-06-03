import 'package:flutter/material.dart';

import '../../models/video_file.dart';
import '../app_colors.dart';

/// Color-coded status indicator chip for a video's processing state.
class StatusChip extends StatelessWidget {
  final VideoStatus status;

  const StatusChip({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    final (label, color, icon) = _statusConfig(status);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Animated pulsing icon for "compressing" status.
          if (status == VideoStatus.compressing)
            _PulsingIcon(icon: icon, color: color)
          else
            Icon(icon, size: 14, color: color),
          const SizedBox(width: 5),
          Text(
            label,
            style: TextStyle(
              color: color,
              fontSize: 11,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.3,
            ),
          ),
        ],
      ),
    );
  }

  (String, Color, IconData) _statusConfig(VideoStatus status) {
    return switch (status) {
      VideoStatus.queued => (
        'Queued',
        AppColors.queuedGrey,
        Icons.schedule_rounded,
      ),
      VideoStatus.probing => (
        'Analyzing',
        AppColors.infoBlue,
        Icons.analytics_rounded,
      ),
      VideoStatus.compressing => (
        'Compressing',
        AppColors.primaryAccent,
        Icons.sync_rounded,
      ),
      VideoStatus.success => (
        'Done',
        AppColors.successGreen,
        Icons.check_circle_rounded,
      ),
      VideoStatus.failed => ('Failed', AppColors.errorRed, Icons.error_rounded),
      VideoStatus.cancelled => (
        'Cancelled',
        AppColors.warningOrange,
        Icons.cancel_rounded,
      ),
    };
  }
}

/// Widget that gently pulses its icon to indicate active processing.
class _PulsingIcon extends StatefulWidget {
  final IconData icon;
  final Color color;

  const _PulsingIcon({required this.icon, required this.color});

  @override
  State<_PulsingIcon> createState() => _PulsingIconState();
}

class _PulsingIconState extends State<_PulsingIcon>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _opacity;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    )..repeat(reverse: true);

    _opacity = Tween<double>(
      begin: 0.4,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _opacity,
      builder: (context, child) {
        return Opacity(
          opacity: _opacity.value,
          child: Icon(widget.icon, size: 14, color: widget.color),
        );
      },
    );
  }
}
