import 'package:flutter/material.dart';

class AppThemeData {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    );

  static final ThemeData darkTheme = ThemeData(brightness: Brightness.dark,
  scaffoldBackgroundColor: Colors.black,
  );
}
