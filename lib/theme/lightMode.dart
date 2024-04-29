import 'package:flutter/material.dart';

class LightMode {
  ThemeData lightMode = ThemeData(
      colorScheme: ColorScheme.light(
    primary: Colors.deepPurple,
    secondary: Colors.deepPurpleAccent,
    surface: Colors.green.shade50,
    background: Colors.green.shade50,
    error: Colors.red,
    onPrimary: Color.fromARGB(255, 255, 255, 255),
    onSecondary: Colors.white,
    onSurface: Colors.deepPurple,
    onBackground: Colors.black,
    onError: Colors.white,
  ));
}
