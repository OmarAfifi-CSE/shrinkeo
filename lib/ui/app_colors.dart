import 'package:flutter/material.dart';

/// Central registry for all application colors.
/// Edit these values to change the color scheme across the entire app.
class AppColors {
  AppColors._();

  // ---------------------------------------------------------------------------
  // Brand Colors
  // ---------------------------------------------------------------------------
  static const Color primaryTeal = Color(0xFF00BFA5); // Main accent color
  static const Color surfaceDark = Color(0xFF0F1118);
  static const Color surfaceContainerDark = Color(0xFF171A24);
  static const Color cardDark = Color(0xFF1C1F2E);
  static const Color borderDark = Color(0xFF2A2D3E);

  // ---------------------------------------------------------------------------
  // Status Colors
  // ---------------------------------------------------------------------------
  static const Color successGreen = Color(0xFF4CAF50);
  static const Color errorRed = Color(0xFFEF5350);
  static const Color warningOrange = Color(0xFFFF9800);
  static const Color infoBlue = Color(0xFF42A5F5);
  static const Color queuedGrey = Color(0xFF78909C);
}
