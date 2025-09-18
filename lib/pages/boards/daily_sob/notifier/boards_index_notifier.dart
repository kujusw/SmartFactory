// 定义一个 StateNotifier 类，用来更新索引值
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'boards_index_notifier.g.dart';

@riverpod
class BoardsIndex extends _$BoardsIndex {
  @override
  int build() => 0;

  /// 设置索引
  void setIndex(int index) => state = index;
}
