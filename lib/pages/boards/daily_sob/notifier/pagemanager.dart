import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../models/boards_tab_model.dart';

part 'pagemanager.g.dart';

/// ==================== Page 管理 ====================
@riverpod
class Page extends _$Page {
  @override
  List<BoardsTabModel> build() => [
        BoardsTabModel(name: 'General'),
      ];

  /// 添加单个 tab
  void addTab(BoardsTabModel tab) {
    if (!state.contains(tab)) {
      state = [...state, tab];
    } else {
      // 避免重复
      unawaited(SmartDialog.showToast("Tab already exists"));
    }
  }

  /// 添加多个 tabs
  void addTabs(List<BoardsTabModel> tabs) {
    state = [...state, ...tabs];
  }

  /// 设置 tabs（排序或替换）
  void setTabs(List<BoardsTabModel> tabs) {
    state = tabs;
  }

  /// 删除 tab
  void removeTab(BoardsTabModel tab) {
    state = state.where((t) => t.id != tab.id).toList();
  }

  /// 更新 tab
  void updateTab(BoardsTabModel oldTab, BoardsTabModel newTab) {
    state = state.map((t) => t.id == oldTab.id ? newTab : t).toList();
  }

  /// 查询 tab 是否存在
  bool containsTab(BoardsTabModel tab) => state.contains(tab);

  /// 获取指定 index 的 tab
  BoardsTabModel getTab(int index) => state[index];

  /// 清空 tabs 并恢复默认
  void clearTabs() {
    state = [
      BoardsTabModel(name: 'General'),
    ];
  }
}
