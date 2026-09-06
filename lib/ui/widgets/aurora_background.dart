import 'dart:ui';
import 'package:flutter/material.dart';

import '../app_colors.dart';
class AuroraBackground extends StatelessWidget {
  final Widget child;

  const AuroraBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Stack(
      children: [
        // Isolated GPU raster layer for the heavy 100px aurora blur
        RepaintBoundary(
          child: Stack(
            children: [
              // Base background color with smooth crossfade
              Positioned.fill(
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 350),
                  curve: Curves.easeInOutCubic,
                  color: isDark
                      ? AppColors.auroraBackgroundDark
                      : AppColors.auroraBackgroundLight,
                ),
              ),

              // Glowing Orbs with continuous animated morphing
              AnimatedPositioned(
                duration: const Duration(milliseconds: 350),
                curve: Curves.easeInOutCubic,
                top: isDark ? -200 : -150,
                right: -100,
                child: _buildAnimatedOrb(
                  isDark
                      ? AppColors.auroraOrbDark1.withValues(alpha: 0.3)
                      : AppColors.auroraOrbDark1.withValues(alpha: 0.2),
                  isDark ? 500 : 600,
                ),
              ),
              AnimatedPositioned(
                duration: const Duration(milliseconds: 350),
                curve: Curves.easeInOutCubic,
                bottom: isDark ? -150 : -200,
                left: -150,
                child: _buildAnimatedOrb(
                  isDark
                      ? AppColors.auroraOrbDark2.withValues(alpha: 0.25)
                      : AppColors.auroraOrbDark2.withValues(alpha: 0.15),
                  isDark ? 600 : 500,
                ),
              ),
              AnimatedPositioned(
                duration: const Duration(milliseconds: 350),
                curve: Curves.easeInOutCubic,
                top: isDark ? 250 : 150,
                left: isDark ? 200 : 300,
                child: _buildAnimatedOrb(
                  isDark
                      ? AppColors.auroraOrbDark3.withValues(alpha: 0.2)
                      : AppColors.auroraOrbDark3.withValues(alpha: 0.1),
                  isDark ? 400 : 650,
                ),
              ),

              // Heavy Blur Filter to blend the orbs into an Aurora
              Positioned.fill(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
                  child: const SizedBox.expand(),
                ),
              ),
            ],
          ),
        ),

        // Foreground content
        Positioned.fill(child: child),
      ],
    );
  }

  Widget _buildAnimatedOrb(Color color, double size) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 350),
      curve: Curves.easeInOutCubic,
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }
}
