import 'package:flutter/cupertino.dart';

const Brightness _brightness = Brightness.light;
const String _fontFamily = '.SF UI Display';

// colors
const CupertinoDynamicColor _primaryColorCupertino = CupertinoColors.systemRed;
final Color _primaryContrastingColor = CupertinoColors.systemGrey6.color;
const CupertinoDynamicColor _fontPrimaryColorCupertino = CupertinoColors.label;
final Color _scaffoldBackgroundColor =
    CupertinoColors.secondarySystemBackground.color;

final CupertinoThemeData iosLightTheme = CupertinoThemeData(
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
