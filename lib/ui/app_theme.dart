import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

/// Shrinkeo application theme — dark Material 3 with a teal/cyan accent.
class AppTheme {
  AppTheme._();

  // ---------------------------------------------------------------------------
  // Theme Data
  // ---------------------------------------------------------------------------

  static ThemeData get darkTheme {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: AppColors.primaryAccent,
      brightness: Brightness.dark,
      surface: AppColors.surfaceDark,
      primary: AppColors.primaryAccent,
      onPrimary: Colors.white,
    );

    // Precise typography for Dark Mode
    final baseTextTheme = GoogleFonts.interTextTheme(ThemeData.dark().textTheme);
    final textTheme = baseTextTheme.copyWith(
      titleLarge: baseTextTheme.titleLarge?.copyWith(color: AppColors.textHighDark, fontWeight: FontWeight.w700),
      titleMedium: baseTextTheme.titleMedium?.copyWith(color: AppColors.textHighDark, fontWeight: FontWeight.w600),
      titleSmall: baseTextTheme.titleSmall?.copyWith(color: AppColors.textHighDark, fontWeight: FontWeight.w600),
      bodyLarge: baseTextTheme.bodyLarge?.copyWith(color: AppColors.textMediumDark),
      bodyMedium: baseTextTheme.bodyMedium?.copyWith(color: AppColors.textMediumDark),
      bodySmall: baseTextTheme.bodySmall?.copyWith(color: AppColors.textLowDark),
      labelLarge: baseTextTheme.labelLarge?.copyWith(color: AppColors.textHighDark),
      labelMedium: baseTextTheme.labelMedium?.copyWith(color: AppColors.textMediumDark),
    );

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: AppColors.surfaceDark,
      textTheme: textTheme,

      // AppBar
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.surfaceDark,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        titleTextStyle: textTheme.titleLarge?.copyWith(
          fontSize: 22,
          letterSpacing: -0.5,
        ),
      ),

      // Cards
      cardTheme: CardThemeData(
        color: AppColors.cardDark,
        elevation: 0, // No shadow in dark mode, rely on border
        margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: const BorderSide(color: AppColors.borderDark),
        ),
      ),

      // Elevated Buttons
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          textStyle: textTheme.labelLarge?.copyWith(
            fontWeight: FontWeight.w600,
            letterSpacing: 0.3,
          ),
        ),
      ),

      // Outlined Buttons
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.primaryAccentLight,
          side: const BorderSide(color: AppColors.borderDark),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          textStyle: textTheme.labelMedium?.copyWith(fontWeight: FontWeight.w500),
        ),
      ),

      // Text Buttons
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.primaryAccentLight,
          textStyle: textTheme.labelMedium?.copyWith(fontWeight: FontWeight.w500),
        ),
      ),

      // Linear Progress Indicator
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: AppColors.primaryAccentLight,
        linearTrackColor: AppColors.borderDark,
        linearMinHeight: 4,
        borderRadius: BorderRadius.circular(2),
      ),

      // Tooltip
      tooltipTheme: TooltipThemeData(
        decoration: BoxDecoration(
          color: AppColors.surfaceContainerDark,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.borderDark),
        ),
        textStyle: textTheme.bodySmall,
      ),

      // Snackbar
      snackBarTheme: SnackBarThemeData(
        backgroundColor: AppColors.surfaceContainerDark,
        contentTextStyle: textTheme.bodyMedium,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        behavior: SnackBarBehavior.floating,
      ),

      // Divider
      dividerTheme: const DividerThemeData(
        color: AppColors.borderDark,
        thickness: 1,
      ),

      // Icon
      iconTheme: const IconThemeData(color: AppColors.textMediumDark, size: 22),
    );
  }

  static ThemeData get lightTheme {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: AppColors.primaryAccent,
      brightness: Brightness.light,
      surface: AppColors.surfaceLight,
      primary: AppColors.primaryAccent,
      onPrimary: Colors.white,
    );

    // Precise typography for Light Mode
    final baseTextTheme = GoogleFonts.interTextTheme(ThemeData.light().textTheme);
    final textTheme = baseTextTheme.copyWith(
      titleLarge: baseTextTheme.titleLarge?.copyWith(color: AppColors.textHighLight, fontWeight: FontWeight.w700),
      titleMedium: baseTextTheme.titleMedium?.copyWith(color: AppColors.textHighLight, fontWeight: FontWeight.w600),
      titleSmall: baseTextTheme.titleSmall?.copyWith(color: AppColors.textHighLight, fontWeight: FontWeight.w600),
      bodyLarge: baseTextTheme.bodyLarge?.copyWith(color: AppColors.textMediumLight),
      bodyMedium: baseTextTheme.bodyMedium?.copyWith(color: AppColors.textMediumLight),
      bodySmall: baseTextTheme.bodySmall?.copyWith(color: AppColors.textLowLight),
      labelLarge: baseTextTheme.labelLarge?.copyWith(color: AppColors.textHighLight),
      labelMedium: baseTextTheme.labelMedium?.copyWith(color: AppColors.textMediumLight),
    );

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: AppColors.surfaceLight,
      textTheme: textTheme,

      // AppBar
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.surfaceLight,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        titleTextStyle: textTheme.titleLarge?.copyWith(
          fontSize: 22,
          letterSpacing: -0.5,
        ),
      ),

      // Cards
      cardTheme: CardThemeData(
        color: AppColors.cardLight,
        elevation: 3, // Subtle floating shadow for light mode
        shadowColor: Colors.black.withValues(alpha: 0.05),
        margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: const BorderSide(color: AppColors.borderLight),
        ),
      ),

      // Elevated Buttons
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          elevation: 2,
          shadowColor: colorScheme.primary.withValues(alpha: 0.3),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
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
          side: const BorderSide(color: AppColors.borderLight),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          textStyle: textTheme.labelMedium?.copyWith(fontWeight: FontWeight.w500),
        ),
      ),

      // Text Buttons
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: colorScheme.primary,
          textStyle: textTheme.labelMedium?.copyWith(fontWeight: FontWeight.w500),
        ),
      ),

      // Linear Progress Indicator
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: colorScheme.primary,
        linearTrackColor: AppColors.borderLight,
        linearMinHeight: 4,
        borderRadius: BorderRadius.circular(2),
      ),

      // Tooltip (keep dark for contrast)
      tooltipTheme: TooltipThemeData(
        decoration: BoxDecoration(
          color: AppColors.surfaceContainerDark,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.borderDark),
        ),
        textStyle: GoogleFonts.inter(color: AppColors.textMediumDark, fontSize: 12),
      ),

      // Snackbar (keep dark for contrast)
      snackBarTheme: SnackBarThemeData(
        backgroundColor: AppColors.surfaceContainerDark,
        contentTextStyle: GoogleFonts.inter(color: AppColors.textMediumDark),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        behavior: SnackBarBehavior.floating,
      ),

      // Divider
      dividerTheme: const DividerThemeData(
        color: AppColors.borderLight,
        thickness: 1,
      ),

      // Icon
      iconTheme: const IconThemeData(color: AppColors.textMediumLight, size: 22),
    );
  }
}
