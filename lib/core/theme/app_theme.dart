import 'package:flutter/material.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.blue,
    appBarTheme: const AppBarTheme(color: Colors.blueAccent),
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.grey,
    appBarTheme: const AppBarTheme(color: Colors.grey),
  );
}