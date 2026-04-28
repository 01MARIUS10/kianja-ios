import 'package:flutter/material.dart';
import 'package:kianja/core/themes/mode/dark_mode.dart';
import 'package:kianja/core/themes/mode/light_mode.dart';

abstract class AppTheme {
  static ThemeData get lightTheme => LightMode.theme;
  static ThemeData get darkTheme => DarkMode.theme;
}
