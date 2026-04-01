import 'package:flutter/material.dart';

enum AppMode {
  light(ThemeMode.light),
  dark(ThemeMode.dark),
  system(ThemeMode.system);

  const AppMode(this.mode);
  final ThemeMode mode;

  ThemeMode get themeMode => mode;
}
