// 定义一个 StateNotifier 类，用来更新索引值
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_index_notifier.g.dart';

@riverpod
class HomeIndexState extends _$HomeIndexState {
  @override
  int build() {
    return 0; // 初始 index
  }

  void setIndex(int index) {
    state = index;
  }
}
