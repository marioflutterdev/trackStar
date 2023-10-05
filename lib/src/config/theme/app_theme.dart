import 'package:flutter/material.dart';

ThemeData lighMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    background: Colors.white,
    primary: Colors.grey.shade300,
    secondary: Colors.grey.shade300,
    onPrimaryContainer: const Color(0xff00ffff),
    onSecondaryContainer: Colors.grey.shade300,
  ),
);
ThemeData dartMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    background: Colors.grey.shade800,
    primary: Colors.grey.shade700,
    secondary: Colors.grey.shade600,
    onPrimaryContainer: const Color(0xFF00c6c7),
    onSecondaryContainer: Colors.grey.shade700,
  ),
);