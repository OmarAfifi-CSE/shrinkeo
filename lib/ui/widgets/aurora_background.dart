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
              // Base background color
              Container(
                color: isDark
                    ? AppColors.auroraBackgroundDark
                    : AppColors.auroraBackgroundLight,
              ),

              // Glowing Orbs (Loon Iridescence)
              if (isDark) ...[
                // Top Right: Iridescent Teal
                Positioned(
                  top: -200,
                  right: -100,
                  child: _buildOrb(
                    AppColors.auroraOrbDark1.withValues(alpha: 0.3),
                    500,
                  ),
                ),
                // Bottom Left: Deep Emerald
                Positioned(
                  bottom: -150,
                  left: -150,
                  child: _buildOrb(
                    AppColors.auroraOrbDark2.withValues(alpha: 0.25),
                    600,
                  ),
                ),
                // Center: Midnight Blue Highlight
                Positioned(
                  top: 250,
                  left: 200,
                  child: _buildOrb(
                    AppColors.auroraOrbDark3.withValues(alpha: 0.2),
                    400,
                  ),
                ),
              ] else ...[
                // Top Right: Iridescent Teal
                Positioned(
                  top: -150,
                  right: -100,
                  child: _buildOrb(
                    AppColors.auroraOrbDark1.withValues(alpha: 0.2),
                    600,
                  ),
                ),
                // Bottom Left: Deep Emerald
                Positioned(
                  bottom: -200,
                  left: -150,
                  child: _buildOrb(
                    AppColors.auroraOrbDark2.withValues(alpha: 0.15),
                    500,
                  ),
                ),
                // Center: Midnight Blue Highlight
                Positioned(
                  top: 150,
                  right: 200,
                  child: _buildOrb(
                    AppColors.auroraOrbDark3.withValues(alpha: 0.1),
                    700,
                  ),
                ),
              ],

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

  Widget _buildOrb(Color color, double size) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }
}
