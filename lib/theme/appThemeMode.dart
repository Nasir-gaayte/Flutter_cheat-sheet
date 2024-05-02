import 'package:flutter/material.dart';

class AppThemeMode with ChangeNotifier {
  ThemeData _themMode = lightMode;

  ThemeData get themeMode => _themMode;
  set themMode(ThemeData themeMode) {
    _themMode = themeMode;
    notifyListeners();
  }

  getThemeMode() {
    if (themeMode == lightMode) {
      return darkMode;
    } else {
      return lightMode;
    }
  }
}

ThemeData lightMode = ThemeData(
    colorScheme: ColorScheme.light(
  primary: Color.fromARGB(255, 141, 94, 221),
  secondary: Colors.deepPurpleAccent,
  background: Colors.green.shade50,
));

ThemeData darkMode = ThemeData(
    colorScheme: ColorScheme.dark(
  primary: Color.fromARGB(255, 191, 191, 194),
  secondary: Color.fromARGB(255, 117, 83, 204),
  background: Colors.black,
));
