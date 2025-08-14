import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../models/boards_tab_model.dart';

class ChartWidgetManager extends StateNotifier<List<BoardsChartWidgetModel>> {
  ChartWidgetManager() : super([]);

  void addChartWidget(BoardsChartWidgetModel chartWidgetModel) {
    state = [...state, chartWidgetModel];
  }

  //通过id删除widget
  void removeChartWidget(int id) {
    state = state.where((t) => t.id != id).toList();
  }

  void updateChartWidget(BoardsChartWidgetModel newChartWidgetModel) {
    state = state.map((t) {
      if (t.id == newChartWidgetModel.id) {
        return newChartWidgetModel;
      }
      return t;
    }).toList();
  }

  void updateChartWidgetXY(int? id, int? position_x, int? position_y) {
    state = state.map((t) {
      if (t.id == id) {
        return t.copyWith(position_x: position_x, position_y: position_y);
      }
      return t;
    }).toList();
  }

  bool containsChartWidget(BoardsChartWidgetModel chartWidgetModel) {
    return state.contains(chartWidgetModel);
  }

  BoardsChartWidgetModel getChartWidget(int index) {
    return state[index];
  }

  //设置所有widget
  void setWidgets(List<BoardsChartWidgetModel> widgets) {
    state = widgets;
  }

  //删除id相同的widget
  void clearWidgetsByTabId(int? id) {
    state = state.where((t) => t.boardId != id).toList();
  }

  //删除所有widget
  void clearWidgets() {
    state = [];
  }
}
