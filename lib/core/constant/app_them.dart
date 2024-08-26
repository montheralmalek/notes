import 'package:flutter/material.dart';
import 'package:notes/core/constant/app_colors.dart';

class AppThem {
  static ThemeData themeData = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      onPrimary: AppColors.onPrimary,
    ),
    scaffoldBackgroundColor: Colors.white,
    fontFamily: 'Cairo',
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        // color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      headlineMedium: TextStyle(
        // color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      headlineSmall: TextStyle(
        // color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: TextStyle(),
      bodySmall: TextStyle(),
      bodyMedium: TextStyle(),
      labelLarge: TextStyle(), //button
      labelMedium: TextStyle(),
      labelSmall: TextStyle(),
    ),
    appBarTheme: const AppBarTheme(
      foregroundColor: AppColors.onPrimary,
      color: AppColors.secondary,
    ),
    useMaterial3: true,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      shape: CircleBorder(),
      foregroundColor: AppColors.onPrimary,
      backgroundColor: AppColors.primary,
      elevation: 9,
      iconSize: 32,
    ),
  );
}
