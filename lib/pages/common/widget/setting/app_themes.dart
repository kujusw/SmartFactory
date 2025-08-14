import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppThemes {
  static final lightTheme = ThemeData.light().copyWith();

  static final darkTheme = ThemeData.dark().copyWith();

  static Brightness calculateBrightness(BuildContext context) {
    final cupertinoBrightness = CupertinoTheme.of(context).brightness ?? MediaQuery.of(context).platformBrightness;
    return cupertinoBrightness;
  }

  static bool isLight(BuildContext context) {
    return calculateBrightness(context) == Brightness.light;
  }
}
