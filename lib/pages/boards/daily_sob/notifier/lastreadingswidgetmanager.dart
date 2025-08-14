import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../models/boards_tab_model.dart';

class LastReadingsWidgetManager extends StateNotifier<List<BoardsChartWidgetModel>> {
  LastReadingsWidgetManager() : super([]);

  // 添加LastReadingsWidgetModel
  void addLastReadingsWidget(BoardsChartWidgetModel lastReadingsWidgetModel) {
    state = [...state, lastReadingsWidgetModel];
  }

  // 删除LastReadingsWidgetModel
  void removeLastReadingsWidget(BoardsChartWidgetModel lastReadingsWidgetModel) {
    state = state.where((t) => t != lastReadingsWidgetModel).toList();
  }

  // 更新LastReadingsWidgetModel
  void updateLastReadingsWidget(
      BoardsChartWidgetModel oldLastReadingsWidgetModel, BoardsChartWidgetModel newLastReadingsWidgetModel) {
    state = state.map((t) => t == oldLastReadingsWidgetModel ? newLastReadingsWidgetModel : t).toList();
  }

  // 查询LastReadingsWidgetModel
  bool containsLastReadingsWidget(BoardsChartWidgetModel lastReadingsWidgetModel) {
    return state.contains(lastReadingsWidgetModel);
  }

  BoardsChartWidgetModel getLastReadingsWidget(int index) {
    return state[index];
  }
}
