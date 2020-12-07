import 'package:flutter/material.dart';

const Brightness _brightness = Brightness.light;
const String _fontFamily = 'Roboto';

// colors
const MaterialColor _primarySwatch = Colors.cyan;
const Color _primaryColor = Colors.cyanAccent;
final Color _accentColor = Colors.green[400];

final ThemeData androidLightTheme = ThemeData(
  brightness: _brightness,
  fontFamily: _fontFamily,
  primarySwatch: _primarySwatch,
  primaryColor: _primaryColor,
  accentColor: _accentColor,
);
