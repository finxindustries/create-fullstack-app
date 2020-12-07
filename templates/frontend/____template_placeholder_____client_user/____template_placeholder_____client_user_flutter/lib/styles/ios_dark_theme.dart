import 'package:flutter/cupertino.dart';

const Brightness _brightness = Brightness.dark;
const String _fontFamily = '.SF UI Display';

// colors
const CupertinoDynamicColor _primaryColorCupertino = CupertinoColors.systemRed;
final Color _primaryContrastingColor = CupertinoColors.systemGrey6.color;
const CupertinoDynamicColor _fontPrimaryColorCupertino = CupertinoColors.label;
final Color _scaffoldBackgroundColor =
    CupertinoColors.systemBackground.darkColor;

final CupertinoThemeData iosDarkTheme = CupertinoThemeData(
  brightness: _brightness,
  textTheme: const CupertinoTextThemeData(
    primaryColor: _fontPrimaryColorCupertino,
    textStyle: TextStyle(
      fontFamily: _fontFamily,
    ),
  ),
  scaffoldBackgroundColor: _scaffoldBackgroundColor,
  primaryColor: _primaryColorCupertino,
  primaryContrastingColor: _primaryContrastingColor,
);
