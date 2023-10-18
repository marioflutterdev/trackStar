import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lighMode = ThemeData(
  fontFamily: GoogleFonts.tiltNeon().fontFamily,
  useMaterial3: true,
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
  fontFamily: GoogleFonts.tiltNeon().fontFamily,
  brightness: Brightness.dark,
  useMaterial3: true,
  colorScheme: ColorScheme.dark(
    background: Colors.grey.shade800,
    primary: Colors.grey.shade700,
    secondary: Colors.grey.shade600,
    onPrimaryContainer: const Color(0xFF00c6c7),
    onSecondaryContainer: Colors.grey.shade700,
  ),
);
