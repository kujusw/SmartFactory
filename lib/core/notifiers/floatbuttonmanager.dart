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

@riverpod
class FloatButtonRestore extends _$FloatButtonRestore {
  @override
  bool build() {
    final floatButtonState = ref.watch(floatButtonProvider);

    return floatButtonState == "BoardsViewAdd" ||
        floatButtonState == "ThingsViewAdd" ||
        floatButtonState == "ThingsViewEdit" ||
        floatButtonState == "UsersViewAdd" ||
        floatButtonState == "UsersViewEdit";
  }

  /// 如果后续需要手动刷新，可以加一个方法
  void refresh() {
    state = build();
  }
}
