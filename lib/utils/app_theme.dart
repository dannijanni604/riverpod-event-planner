import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: Colors.white,
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.grey[200],
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
      hintStyle: const TextStyle(color: Colors.black54),
    ),
  );
  static ThemeData darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: Colors.black,
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.grey[900],
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
      hintStyle: const TextStyle(color: Colors.white70),
    ),
  );

  static const primaryColor = Colors.deepOrangeAccent;
  static const kTextColor = Colors.white;
}
