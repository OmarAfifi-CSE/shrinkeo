import 'dart:ui';
import 'package:flutter/material.dart';

import '../app_colors.dart';

class GlassContainer extends StatelessWidget {
  final Widget child;
  final double borderRadius;
  final EdgeInsetsGeometry padding;
  final bool isHovering;

  const GlassContainer({
    super.key,
    required this.child,
    this.borderRadius = 12.0,
    this.padding = const EdgeInsets.all(20.0),
    this.isHovering = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final backgroundColor = isDark
        ? AppColors.glassBackgroundDark.withValues(alpha: 0.4)
        : Colors.white.withValues(alpha: 0.7);

    final borderColor = isDark
        ? AppColors.borderDark.withValues(alpha: 0.3)
        : AppColors.borderLight.withValues(alpha: 0.8);

    final hoverGlow = isHovering
        ? [
            BoxShadow(
              color: theme.colorScheme.primary.withValues(alpha: 0.15),
              blurRadius: 20,
              spreadRadius: 2,
            )
          ]
        : <BoxShadow>[];

    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: padding,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(borderRadius),
            border: Border.all(color: borderColor, width: 1.5),
            boxShadow: hoverGlow,
          ),
          child: child,
        ),
      ),
    );
  }
}
