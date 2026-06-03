import 'package:flutter/material.dart';

/// Central registry for all application colors.
/// Edit these values to change the color scheme across the entire app.
class AppColors {
  AppColors._();

  // ---------------------------------------------------------------------------
  // Brand Colors (Loon Bird Inspired)
  // ---------------------------------------------------------------------------
  static const Color primaryAccent = Color(0xFF2E6676); // Loon Turquoise/Teal
  static const Color primaryAccentLight = Color(0xFF68B2C4); // Lighter Teal for Dark Mode text

  // ---------------------------------------------------------------------------
  // Dark Theme Colors
  // ---------------------------------------------------------------------------
  static const Color surfaceDark = Color(0xFF141414); // Deep Black (Loon Head)
  static const Color surfaceContainerDark = Color(0xFF1A1A1A); // Slightly lighter black
  static const Color cardDark = Color(0xFF1F1F1F); // Individual cards
  static const Color borderDark = Color(0xFF4A4E52); // Slate Gray (Loon Back)

  static const Color textHighDark = Color(0xFFFFFFFF); // Pure White
  static const Color textMediumDark = Color(0xB3FFFFFF); // white70
  static const Color textLowDark = Color(0x66FFFFFF); // white40

  // ---------------------------------------------------------------------------
  // Light Theme Colors
  // ---------------------------------------------------------------------------
  static const Color surfaceLight = Color(0xFFF7F7F7); // Off-white
  static const Color surfaceContainerLight = Color(0xFFFFFFFF); // Pure White (Loon Belly)
  static const Color cardLight = Color(0xFFFFFFFF); // Individual cards
  static const Color borderLight = Color(0xFFD1D1D6); // Light Gray

  static const Color textHighLight = Color(0xFF1A1A1A); // Deep Black
  static const Color textMediumLight = Color(0xFF4A4E52); // Slate Gray
  static const Color textLowLight = Color(0xFF475569); // Slate 600 (Clear readability)

  // ---------------------------------------------------------------------------
  // Status Colors
  // ---------------------------------------------------------------------------
  static const Color successGreen = Color(0xFF10B981);
  static const Color errorRed = Color(0xFF8B0000); // Loon Red
  static const Color warningOrange = Color(0xFFF59E0B);
  static const Color infoBlue = Color(0xFF3B82F6);
  static const Color queuedGrey = Color(0xFF78909C);

  // Video File Type Colors
  static const Color typeMp4 = Color(0xFF42A5F5);
  static const Color typeMkv = Color(0xFFAB47BC);
  static const Color typeMov = Color(0xFF26C6DA);
  static const Color typeAvi = Color(0xFFFFCA28);
  static const Color typeWmv = Color(0xFFEF5350);

  // CRF Scale Colors
  static const Color crfVeryHighQuality = Color(0xFF26C6DA);
  static const Color crfUltraCompressed = Color(0xFFD32F2F);

  // UI Element Colors
  static const Color glassBackgroundDark = Color(0xFF161A23);
  
  static const Color auroraBackgroundDark = Color(0xFF000000);
  static const Color auroraOrbDark1 = Color(0xFF2E6676);
  static const Color auroraOrbDark2 = Color(0xFF064E3B);
  static const Color auroraOrbDark3 = Color(0xFF1E3A8A);
  
  static const Color auroraBackgroundLight = Color(0xFFF2F2F7);
  
  static const Color windowBackgroundDark = Color(0xFF0F1118);

  // ---------------------------------------------------------------------------
  // Background Decorations (Glassmorphism / Ambient Glow)
  // ---------------------------------------------------------------------------
  static const Decoration backgroundDecorationDark = BoxDecoration(
    color: surfaceDark,
    gradient: RadialGradient(
      center: Alignment(0.8, -0.8), // Top right glow
      radius: 1.5,
      colors: [
        Color(0xFF1E1B4B), // Deep indigo ambient light
        surfaceDark,
      ],
      stops: [0.0, 0.8],
    ),
  );

  static const Decoration backgroundDecorationLight = BoxDecoration(
    color: surfaceLight,
    gradient: RadialGradient(
      center: Alignment(0.8, -0.8), // Top right glow
      radius: 1.5,
      colors: [
        Color(0xFFE0E7FF), // Soft indigo ambient light
        Color(0xFFF8FAFC), // Very crisp white/slate background
      ],
      stops: [0.0, 0.8],
    ),
  );
}
