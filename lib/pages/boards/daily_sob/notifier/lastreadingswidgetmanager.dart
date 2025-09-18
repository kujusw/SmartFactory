import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../models/boards_tab_model.dart';

part 'lastreadingswidgetmanager.g.dart';

@riverpod
class LastReadingsWidget extends _$LastReadingsWidget {
  @override
  List<BoardsChartWidgetModel> build() => [];

  /// 添加 Widget
  void add(BoardsChartWidgetModel widget) {
    state = [...state, widget];
  }

  /// 删除 Widget
  void remove(BoardsChartWidgetModel widget) {
    state = state.where((t) => t != widget).toList();
  }

  /// 更新 Widget
  void update(BoardsChartWidgetModel oldWidget, BoardsChartWidgetModel newWidget) {
    state = state.map((t) => t == oldWidget ? newWidget : t).toList();
  }

  /// 查询 Widget 是否存在
  bool contains(BoardsChartWidgetModel widget) {
    return state.contains(widget);
  }

  /// 获取指定索引的 Widget
  BoardsChartWidgetModel getWidget(int index) {
    return state[index];
  }

  /// 设置所有 Widget
  void setWidgets(List<BoardsChartWidgetModel> widgets) {
    state = widgets;
  }

  /// 清空所有 Widget
  void clear() {
    state = [];
  }
}
