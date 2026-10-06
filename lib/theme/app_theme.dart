import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryGreen = Color(0xFF006633); // TANESCO green
  static const Color accentYellow = Color(0xFFFFCC00); // bright yellow
  static const Color darkGreen = Color(0xFF004d26);
  static const Color lightYellow = Color(0xFFFFE55C);
  
  static ThemeData lightTheme = ThemeData(
    primaryColor: primaryGreen,
    colorScheme: const ColorScheme.light(
      primary: primaryGreen,
      secondary: accentYellow,
      tertiary: lightYellow,
    ),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: primaryGreen,
      foregroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryGreen,
        foregroundColor: Colors.white,
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.grey.shade50,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppTheme.primaryGreen, width: 2),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      titleMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
      bodyLarge: TextStyle(fontSize: 16),
      bodyMedium: TextStyle(fontSize: 14),
    ),
  );
}
