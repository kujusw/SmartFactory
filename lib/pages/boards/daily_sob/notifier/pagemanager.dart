import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import '../../../../models/boards_tab_model.dart';

class PageManager extends StateNotifier<List<BoardsTabModel>> {
  PageManager()
      : super([
          BoardsTabModel(name: 'General'),
        ]);

  // 添加title
  void addTab(BoardsTabModel tab) {
    //避免重复
    if (!state.contains(tab)) {
      state = [...state, tab];
    } else {
      unawaited(SmartDialog.showToast("Tab already exists"));
    }
  }

  //添加titles
  void addTabs(List<BoardsTabModel> tabs) {
    state = [...state, ...tabs];
  }

  //排序后重新设置
  void setTabs(List<BoardsTabModel> tabs) {
    state = tabs;
  }

  // 删除title
  void removeTab(BoardsTabModel tab) {
    state = state.where((t) => t.id != tab.id).toList();
  }

  // 更新title
  void updateTab(BoardsTabModel oldTab, BoardsTabModel newTab) {
    state = state.map((t) => t.id == oldTab.id ? newTab : t).toList();
  }

  // 查询title
  bool containsTab(BoardsTabModel tab) {
    return state.contains(tab);
  }

  BoardsTabModel getTab(int index) {
    return state[index];
  }

  void clearTabs() {
    state = [
      BoardsTabModel(name: 'General'),
    ];
  }
}
