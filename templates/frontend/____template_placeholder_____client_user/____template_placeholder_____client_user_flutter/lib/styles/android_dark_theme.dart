import 'package:flutter/material.dart';

const Brightness _brightness = Brightness.dark;
const String _fontFamily = 'Roboto';

// colors
const MaterialColor _primarySwatch = Colors.blue;
const Color _primaryColor = Colors.cyanAccent;
final Color _accentColor = Colors.green[400];

final ThemeData androidDarkTheme = ThemeData(
  brightness: _brightness,
  fontFamily: _fontFamily,
  primarySwatch: _primarySwatch,
  primaryColor: _primaryColor,
  accentColor: _accentColor,
);
