import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../models/widget_model.dart';

class WidgetManager extends StateNotifier<List<WidgetModel>> {
  WidgetManager() : super([]);

  // 添加WidgetModel
  void addWidget(WidgetModel widgetModel) {
    state = [...state, widgetModel];
  }

  // 删除WidgetModel
  void removeWidget(int subWidgetId) {
    state = state.where((t) => t.subWidgetId != subWidgetId).toList();
  }

  // 更新WidgetModel
  void updateWidget(WidgetModel oldWidgetModel, WidgetModel newWidgetModel) {
    state = state.map((t) => t == oldWidgetModel ? newWidgetModel : t).toList();
  }

  //删除id相同的widget
  void clearWidgetsByTabId(int? id) {
    state = state.where((t) => t.tab!.id != id).toList();
  }
}
