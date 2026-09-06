import 'package:flutter/material.dart';

/// A luxury micro-interaction wrapper providing tactile spring-scale feedback
/// on press and subtle hover responsiveness for 120 FPS desktop interactions.
class SmoothButton extends StatefulWidget {
  final Widget child;
  final VoidCallback? onTap;
  final String? tooltip;
  final bool enabled;
  final double pressScale;
  final double hoverScale;
  final Duration duration;
  final Curve curve;
  final bool enableHoverScale;
  final HitTestBehavior behavior;

  const SmoothButton({
    super.key,
    required this.child,
    this.onTap,
    this.tooltip,
    this.enabled = true,
    this.pressScale = 0.96,
    this.hoverScale = 1.02,
    this.duration = const Duration(milliseconds: 140),
    this.curve = Curves.easeOutCubic,
    this.enableHoverScale = false,
    this.behavior = HitTestBehavior.opaque,
  });

  @override
  State<SmoothButton> createState() => _SmoothButtonState();
}

class _SmoothButtonState extends State<SmoothButton> {
  bool _isPressed = false;
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final isExplicitTap = widget.onTap != null;
    final canAnimate = widget.enabled;
    final scale = canAnimate && _isPressed
        ? widget.pressScale
        : (canAnimate && _isHovered && widget.enableHoverScale ? widget.hoverScale : 1.0);

    Widget content = AnimatedScale(
      scale: scale,
      duration: widget.duration,
      curve: widget.curve,
      child: widget.child,
    );

    if (isExplicitTap) {
      content = GestureDetector(
        behavior: widget.behavior,
        onTap: widget.enabled ? widget.onTap : null,
        child: content,
      );
    }

    Widget result = MouseRegion(
      cursor: isExplicitTap && widget.enabled ? SystemMouseCursors.click : MouseCursor.defer,
      onEnter: (_) {
        if (canAnimate && !_isHovered && mounted) {
          setState(() => _isHovered = true);
        }
      },
      onExit: (_) {
        if (_isHovered && mounted) {
          setState(() => _isHovered = false);
        }
      },
      child: Listener(
        onPointerDown: (_) {
          if (canAnimate && !_isPressed && mounted) {
            setState(() => _isPressed = true);
          }
        },
        onPointerUp: (_) {
          if (_isPressed && mounted) {
            setState(() => _isPressed = false);
          }
        },
        onPointerCancel: (_) {
          if (_isPressed && mounted) {
            setState(() => _isPressed = false);
          }
        },
        child: content,
      ),
    );

    if (widget.tooltip != null && widget.tooltip!.isNotEmpty) {
      result = Tooltip(message: widget.tooltip!, child: result);
    }

    return result;
  }
}

