import 'package:flutter/material.dart';

/// Central registry for all application colors.
/// Edit these values to change the color scheme across the entire app.
class AppColors {
  AppColors._();

  // ---------------------------------------------------------------------------
  // Brand Colors
  // ---------------------------------------------------------------------------
  static const Color primaryAccent = Color(0xFF6366F1); // Luxurious Indigo Accent

  // ---------------------------------------------------------------------------
  // Dark Theme Colors
  // ---------------------------------------------------------------------------
  static const Color surfaceDark = Color(0xFF090A0F); // Deepest background
  static const Color surfaceContainerDark = Color(0xFF11141C); // Elevated panels
  static const Color cardDark = Color(0xFF161A23); // Individual cards
  static const Color borderDark = Color(0xFF222736); // Subtle borders

  static const Color textHighDark = Color(0xFFFFFFFF);
  static const Color textMediumDark = Color(0xB3FFFFFF); // white70
  static const Color textLowDark = Color(0x66FFFFFF); // white40

  // ---------------------------------------------------------------------------
  // Light Theme Colors
  // ---------------------------------------------------------------------------
  static const Color surfaceLight = Color(0xFFF4F7F9); // Cool off-white background
  static const Color surfaceContainerLight = Color(0xFFFFFFFF); // Elevated panels
  static const Color cardLight = Color(0xFFFFFFFF); // Individual cards
  static const Color borderLight = Color(0xFFE5E9F0); // Very soft borders

  static const Color textHighLight = Color(0xFF0F172A); // Slate 900
  static const Color textMediumLight = Color(0xFF334155); // Slate 700 (High contrast)
  static const Color textLowLight = Color(0xFF475569); // Slate 600 (Clear readability)

  // ---------------------------------------------------------------------------
  // Status Colors
  // ---------------------------------------------------------------------------
  static const Color successGreen = Color(0xFF4CAF50);
  static const Color errorRed = Color(0xFFEF5350);
  static const Color warningOrange = Color(0xFFFF9800);
  static const Color infoBlue = Color(0xFF42A5F5);
  static const Color queuedGrey = Color(0xFF78909C);
}
