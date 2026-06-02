import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Shrinkeo application theme — dark Material 3 with a teal/cyan accent.
class AppTheme {
  AppTheme._();

  // ---------------------------------------------------------------------------
  // Brand Colors
  // ---------------------------------------------------------------------------

  static const Color _seedColor = Color(0xFF00BFA5); // Teal accent
  static const Color surfaceDark = Color(0xFF0F1118);
  static const Color surfaceContainerDark = Color(0xFF171A24);
  static const Color cardDark = Color(0xFF1C1F2E);
  static const Color borderDark = Color(0xFF2A2D3E);

  // Status colors
  static const Color successGreen = Color(0xFF4CAF50);
  static const Color errorRed = Color(0xFFEF5350);
  static const Color warningOrange = Color(0xFFFF9800);
  static const Color infoBlue = Color(0xFF42A5F5);
  static const Color queuedGrey = Color(0xFF78909C);

  // ---------------------------------------------------------------------------
  // Theme Data
  // ---------------------------------------------------------------------------

  static ThemeData get darkTheme {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: _seedColor,
      brightness: Brightness.dark,
      surface: surfaceDark,
    );

    final textTheme = GoogleFonts.interTextTheme(
      ThemeData.dark().textTheme,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: surfaceDark,
      textTheme: textTheme,

      // AppBar
      appBarTheme: AppBarTheme(
        backgroundColor: surfaceDark,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        titleTextStyle: textTheme.titleLarge?.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.w700,
          fontSize: 22,
          letterSpacing: -0.5,
        ),
      ),

      // Cards
      cardTheme: CardThemeData(
        color: cardDark,
        elevation: 0,
        margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: borderDark.withValues(alpha: 0.5)),
        ),
      ),

      // Elevated Buttons
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          textStyle: textTheme.labelLarge?.copyWith(
            fontWeight: FontWeight.w600,
            letterSpacing: 0.3,
          ),
        ),
      ),

      // Outlined Buttons
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: colorScheme.primary,
          side: BorderSide(color: borderDark),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          textStyle: textTheme.labelMedium?.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
      ),

      // Text Buttons
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: colorScheme.primary,
          textStyle: textTheme.labelMedium?.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
      ),

      // Linear Progress Indicator
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: colorScheme.primary,
        linearTrackColor: borderDark,
        linearMinHeight: 4,
        borderRadius: BorderRadius.circular(2),
      ),

      // Tooltip
      tooltipTheme: TooltipThemeData(
        decoration: BoxDecoration(
          color: surfaceContainerDark,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: borderDark),
        ),
        textStyle: textTheme.bodySmall?.copyWith(color: Colors.white70),
      ),

      // Snackbar
      snackBarTheme: SnackBarThemeData(
        backgroundColor: surfaceContainerDark,
        contentTextStyle: textTheme.bodyMedium?.copyWith(color: Colors.white),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        behavior: SnackBarBehavior.floating,
      ),

      // Divider
      dividerTheme: DividerThemeData(
        color: borderDark.withValues(alpha: 0.5),
        thickness: 1,
      ),

      // Icon
      iconTheme: const IconThemeData(
        color: Colors.white70,
        size: 22,
      ),
    );
  }
}
