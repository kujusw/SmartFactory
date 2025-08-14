// 定义一个 StateNotifier 类，用来更新索引值
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BoardsIndexState extends StateNotifier<int> {
  BoardsIndexState() : super(0);

  void setIndex(int index) {
    state = index;
  }
}
