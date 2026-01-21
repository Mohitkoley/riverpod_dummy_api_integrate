import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static final TextTheme _textTheme = GoogleFonts.poppinsTextTheme();

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF6750A4),
        brightness: Brightness.light,
      ),
      textTheme: _textTheme.copyWith(
        displayLarge: _textTheme.displayLarge?.copyWith(
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
        titleMedium: _textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.w600,
          color: Colors.black87,
        ),
        bodyMedium: _textTheme.bodyMedium?.copyWith(color: Colors.black54),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: _textTheme.headlineSmall?.copyWith(
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      // Removed CardTheme customization to avoid type issues with newer Flutter versions
    );
  }
}
