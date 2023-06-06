import 'package:flutter/material.dart';

class globalTheme {
  static bool isDrak = false;
  static Color mySeedColor = Color.fromARGB(255, 67, 205, 67);

  static ThemeData get() {
    return ThemeData(
      colorSchemeSeed: mySeedColor,
      useMaterial3: true,
      fontFamily: 'Switzer',
      brightness: (isDrak ? Brightness.dark : Brightness.light),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(fontSize: 17.0),
        labelLarge: TextStyle(fontSize: 20.0),
        titleLarge: TextStyle(fontSize: 35.0),
      ),
    );
  }

  static ColorScheme getCS() {
    return ThemeData(
      colorSchemeSeed: mySeedColor,
      useMaterial3: true,
      fontFamily: 'Switzer',
      brightness: (isDrak ? Brightness.dark : Brightness.light),
    ).colorScheme;
  }
}
