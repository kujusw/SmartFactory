import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.blue,
  // checkboxTheme: CheckboxThemeData(
  //   fillColor: WidgetStateProperty.resolveWith((states) {
  //     if (states.contains(WidgetState.selected)) {
  //       return Colors.blue;
  //     }
  //     return Colors.grey;
  //   }),
  // ),

  // Define other properties for the light theme.
);

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.blue,
  // checkboxTheme: CheckboxThemeData(
  //   fillColor: WidgetStateProperty.resolveWith((states) {
  //     if (states.contains(WidgetState.selected)) {
  //       return Color.fromARGB(150, 39, 154, 241);
  //     }
  //     return Colors.grey;
  //   }),
  // ),
  // Define other properties for the dark theme.
);

final lightColors = {
  "white": const Color.fromARGB(255, 0, 0, 0),
  "backgroundColorWhole": const Color.fromARGB(255, 247, 247, 255),

  "backgroundColorWidget": const Color.fromARGB(255, 255, 255, 255),

  "backgroundColorIconButton": const Color.fromARGB(255, 247, 247, 255),

  "backgroundColorSideMenu": const Color.fromARGB(255, 0, 0, 0),

  "backgroundColorRightAction": const Color.fromARGB(255, 247, 247, 255),

  "whiteTranslucent": const Color.fromARGB(50, 255, 255, 255),

  "black": Color.fromARGB(255, 255, 255, 255),

  "grey": Color.fromARGB(255, 158, 158, 158),

  "dividerColor": Color.fromARGB(255, 236, 236, 236),

  /// 主文本 灰色
  "text": Color.fromARGB(255, 0, 0, 0),
  "text_grey": const Color.fromARGB(255, 94, 94, 94),

  "appbar": const Color.fromARGB(255, 0, 0, 0),
  "popupMenuBackgroundg": const Color.fromARGB(255, 255, 255, 255),

  /// 主控件-背景 蓝色
  "main": const Color.fromARGB(255, 255, 255, 255),
  // static Color accentColor = const Color.fromARGB(255, 41, 103, 255);
  "accentColor": const Color.fromARGB(150, 39, 154, 241),

  "tabBar": const Color.fromARGB(255, 208, 208, 208),

  /// tabCellSeparator 单元格底部分隔条 颜色
  "tabCellSeparator": const Color.fromARGB(255, 230, 230, 231),

  "red": const Color.fromARGB(255, 255, 0, 0),
  "green": const Color.fromARGB(255, 0, 255, 0),
  "orange": const Color.fromARGB(255, 255, 152, 0),
  "blue": const Color.fromARGB(255, 33, 150, 243),
  "amber": const Color.fromARGB(255, 255, 193, 7),
  //透明
  "transparent": const Color(0x00000000),

  /// 灯亮的暖黄色
  "warmYellow": const Color.fromARGB(100, 230, 180, 0),
  "warmYellowLight": const Color.fromARGB(98, 246, 194, 4),
};

final darkColors = {
  "white": const Color.fromARGB(255, 255, 255, 255),
  "backgroundColorWhole": const Color.fromARGB(255, 4, 47, 91),

  "backgroundColorWidget": const Color.fromARGB(255, 5, 30, 55),

  "backgroundColorIconButton": const Color.fromARGB(255, 39, 60, 83),
  "backgroundColorSideMenu": const Color.fromARGB(255, 10, 0, 30),

  "backgroundColorRightAction": const Color.fromARGB(255, 10, 0, 30),
  "whiteTranslucent": const Color.fromARGB(50, 255, 255, 255),

  "black": Color.fromARGB(255, 0, 0, 0),

  "grey": Color.fromARGB(255, 158, 158, 158),

  "dividerColor": Color.fromARGB(255, 236, 236, 236),

  /// 主文本 灰色
  "text": Color.fromARGB(255, 247, 247, 255),
  "text_grey": const Color.fromARGB(255, 94, 94, 94),

  "appbar": const Color.fromARGB(255, 255, 255, 255),
  "popupMenuBackgroundg": const Color.fromARGB(255, 245, 244, 249),

  /// 主控件-背景 蓝色
  "main": const Color.fromARGB(255, 49, 62, 75),
  // static Color accentColor = const Color.fromARGB(255, 41, 103, 255);
  "accentColor": const Color.fromARGB(255, 78, 211, 135),

  "tabBar": const Color.fromARGB(255, 208, 208, 208),

  /// tabCellSeparator 单元格底部分隔条 颜色
  "tabCellSeparator": const Color.fromARGB(255, 230, 230, 231),

  "red": const Color.fromARGB(255, 255, 0, 0),
  "green": const Color.fromARGB(255, 0, 255, 0),
  "orange": const Color.fromARGB(255, 255, 152, 0),
  "blue": const Color.fromARGB(255, 33, 150, 243),
  "amber": const Color.fromARGB(255, 255, 193, 7),
  //透明
  "transparent": const Color(0x00000000),

  /// 灯亮的暖黄色
  "warmYellow": const Color.fromARGB(100, 230, 180, 0),
  "warmYellowLight": const Color.fromARGB(98, 246, 194, 4),
};

final darkThemeProvider = StateProvider.autoDispose<bool>((ref) => false);

final colorProvider = StateProvider.autoDispose<Map<String, Color>>((ref) {
  if (ref.watch(darkThemeProvider)) {
    return darkColors;
  } else {
    return lightColors;
  }
});
