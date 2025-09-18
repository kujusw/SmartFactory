// 定义一个 StateNotifier 类，用来更新索引值
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'boards_delete_notifier.g.dart';

@riverpod
class BoardsDelete extends _$BoardsDelete {
  @override
  bool build() => false;

  void setDelete(bool value) => state = value;
}
