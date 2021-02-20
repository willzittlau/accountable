import 'package:flutter/material.dart';

class AppTheme {

  static final ThemeData lightTheme = ThemeData(
    primaryColor: Colors.indigo,
    primarySwatch: Colors.indigo,
    accentColor: Colors.white,
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.indigo[50],
  );

  static final ThemeData darkTheme = ThemeData(
    primaryColor: Colors.indigo,
    primarySwatch: whiteSwatch, // Used for changing DateTime Picker
    accentColor: Colors.grey[600],
    //cardColor: Colors.indigo[900], //If we want to change card background
    brightness: Brightness.dark,
  );
}

const MaterialColor whiteSwatch = const MaterialColor(
  0xFFFAFAFA,
  const <int, Color>{
    50: const Color(0xFFFAFAFA),
    100: const Color(0xFFF5F5F5),
    200: const Color(0xFFEEEEEE),
    300: const Color(0xFFE0E0E0),
    400: const Color(0xFFD6D6D6),
    500: const Color(0xFFBDBDBD),
    600: const Color(0xFF9E9E9E),
    700: const Color(0xFF757575),
    800: const Color(0xFF616161),
    900: const Color(0xFF424242),
  },
);
