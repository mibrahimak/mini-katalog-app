import 'package:flutter/material.dart';

class AppColors {
  // Light theme colors
  static const Color tintColorLight = Color(0xFF2f95dc);
  static const Color textLight = Color(0xFF000000);
  static const Color backgroundLight = Color(0xFFffffff);
  static const Color tabIconDefaultLight = Color(0xFFcccccc);
  static const Color tabIconSelectedLight = Color(0xFF2f95dc);

  // Dark theme colors
  static const Color tintColorDark = Color(0xFFffffff);
  static const Color textDark = Color(0xFFffffff);
  static const Color backgroundDark = Color(0xFF000000);
  static const Color tabIconDefaultDark = Color(0xFFcccccc);
  static const Color tabIconSelectedDark = Color(0xFFffffff);

  // Shared colors
  static const Color divider = Color(0xFFeeeeee);
  static const Color shadow = Color(0x1a000000);
  static const Color success = Color(0xFF4caf50);
  static const Color error = Color(0xFFf44336);
  static const Color warning = Color(0xFFff9800);
  static const Color cardBackground = Color(0xFFf5f5f5);
}

// Theme data
ThemeData createLightTheme() {
  return ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    colorScheme: ColorScheme.light(
      primary: AppColors.tintColorLight,
      secondary: AppColors.tintColorLight,
      surface: AppColors.backgroundLight,
    ),
    scaffoldBackgroundColor: AppColors.backgroundLight,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.backgroundLight,
      foregroundColor: AppColors.textLight,
      elevation: 0,
      centerTitle: true,
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: AppColors.textLight,
      ),
      displayMedium: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: AppColors.textLight,
      ),
      headlineSmall: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: AppColors.textLight,
      ),
      bodyLarge: TextStyle(fontSize: 16, color: AppColors.textLight),
      bodyMedium: TextStyle(fontSize: 14, color: AppColors.textLight),
      labelMedium: TextStyle(
        fontSize: 12,
        color: AppColors.tabIconDefaultLight,
      ),
    ),
    cardTheme: CardThemeData(
      color: Colors.white,
      elevation: 4,
      shadowColor: AppColors.shadow,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  );
}

ThemeData createDarkTheme() {
  return ThemeData(
    brightness: Brightness.dark,
    useMaterial3: true,
    colorScheme: ColorScheme.dark(
      primary: AppColors.tintColorDark,
      secondary: AppColors.tintColorDark,
      surface: AppColors.backgroundDark,
    ),
    scaffoldBackgroundColor: AppColors.backgroundDark,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.backgroundDark,
      foregroundColor: AppColors.textDark,
      elevation: 0,
      centerTitle: true,
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: AppColors.textDark,
      ),
      displayMedium: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: AppColors.textDark,
      ),
      headlineSmall: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: AppColors.textDark,
      ),
      bodyLarge: TextStyle(fontSize: 16, color: AppColors.textDark),
      bodyMedium: TextStyle(fontSize: 14, color: AppColors.textDark),
      labelMedium: TextStyle(fontSize: 12, color: AppColors.tabIconDefaultDark),
    ),
    cardTheme: CardThemeData(
      color: Color(0xFF2a2a2a),
      elevation: 4,
      shadowColor: AppColors.shadow,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  );
}
