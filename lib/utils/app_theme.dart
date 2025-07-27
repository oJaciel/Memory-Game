import 'package:flutter/material.dart';

class AppTheme {
  final ThemeData appTheme = ThemeData(
  useMaterial3: true,
  colorScheme: const ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFF08D9D6),
    onPrimary: Colors.black,
    secondary: Color(0xFFFF2E63),
    onSecondary: Colors.white,
    surface: Color(0xFF2D2D2D),
    onSurface: Color(0xFFEAEAEA),
    error: Colors.redAccent,
    onError: Colors.white,
  ),
  scaffoldBackgroundColor: const Color(0xFF252A34),
  cardColor: const Color(0xFF2D2D2D),
  textTheme: const TextTheme(
    bodyMedium: TextStyle(color: Color(0xFFEAEAEA)),
    bodyLarge: TextStyle(color: Color(0xFFEAEAEA)),
    titleLarge: TextStyle(color: Colors.white),
  ),
);

}