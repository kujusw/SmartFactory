import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'theme.dart';

part 'theme_state_notifier.g.dart';

/// 是否启用深色模式
@riverpod
class DarkTheme extends _$DarkTheme {
  @override
  bool build() => false;

  void toggle() => state = !state;

  void set(bool value) => state = value;
}

/// 颜色主题
@riverpod
Map<String, Color> color(Ref ref) {
  final isDark = ref.watch(darkThemeProvider);
  return isDark ? darkColors : lightColors;
}
