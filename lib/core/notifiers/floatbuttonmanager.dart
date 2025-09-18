import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'floatbuttonmanager.g.dart';

@riverpod
class FloatButton extends _$FloatButton {
  @override
  String build() => "";

  /// 改变浮动按钮状态
  void change(String value) => state = value;

  /// 清空浮动按钮状态
  void clear() => state = "";
}
