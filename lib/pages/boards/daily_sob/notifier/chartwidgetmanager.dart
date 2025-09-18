import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../models/boards_tab_model.dart';
part 'chartwidgetmanager.g.dart';

@riverpod
class ChartWidget extends _$ChartWidget {
  @override
  List<BoardsChartWidgetModel> build() => [];

  /// 添加 widget
  void add(BoardsChartWidgetModel widget) {
    state = [...state, widget];
  }

  /// 通过 id 删除 widget
  void removeById(int id) {
    state = state.where((t) => t.id != id).toList();
  }

  /// 更新整个 widget
  void update(BoardsChartWidgetModel newWidget) {
    state = state.map((t) => t.id == newWidget.id ? newWidget : t).toList();
  }

  /// 更新 widget 的坐标
  void updateXY(int? id, int? positionX, int? positionY) {
    state = state.map((t) {
      if (t.id == id) {
        return t.copyWith(position_x: positionX, position_y: positionY);
      }
      return t;
    }).toList();
  }

  /// 判断是否包含 widget
  bool contains(BoardsChartWidgetModel widget) => state.contains(widget);

  /// 获取指定索引的 widget
  BoardsChartWidgetModel getAt(int index) => state[index];

  /// 设置所有 widgets
  void setWidgets(List<BoardsChartWidgetModel> widgets) {
    state = widgets;
  }

  /// 删除指定 tabId 下的 widgets
  void clearByTabId(int? id) {
    state = state.where((t) => t.boardId != id).toList();
  }

  /// 删除所有 widgets
  void clearAll() => state = [];
}
