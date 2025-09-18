import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../models/widget_model.dart';

part 'widgetmanager.g.dart';

@riverpod
class WidgetManager extends _$WidgetManager {
  @override
  List<WidgetModel> build() => [];

  /// 添加 Widget
  void addWidget(WidgetModel widgetModel) {
    state = [...state, widgetModel];
  }

  /// 删除 Widget，通过 subWidgetId
  void removeWidget(int subWidgetId) {
    state = state.where((t) => t.subWidgetId != subWidgetId).toList();
  }

  /// 更新 Widget
  void updateWidget(WidgetModel oldWidgetModel, WidgetModel newWidgetModel) {
    state = state.map((t) => t == oldWidgetModel ? newWidgetModel : t).toList();
  }

  /// 删除 tabId 相同的 Widget
  void clearWidgetsByTabId(int? tabId) {
    state = state.where((t) => t.tab?.id != tabId).toList();
  }

  /// 清空所有 Widget
  void clearAll() {
    state = [];
  }
}
