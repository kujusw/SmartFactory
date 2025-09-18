import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../common/utils/board_widgets_utils.dart';
import '../../../../http/boardstab.dart';
import '../../../../http/device.dart';
import '../../../../http/device_energy_chart.dart';
import '../../../../models/boards_tab_model.dart';
import '../../../../models/device_energy_model.dart';
import '../../../../models/device_model.dart';
import '../../../login/notifier/login_notifier.dart';

part 'dailys_sob_notifier.g.dart';

/// ==================== Simple StateProviders ====================
/// 字体大小
@riverpod
class WidgetFontSize extends _$WidgetFontSize {
  @override
  int build() => 20;

  void setSize(int size) => state = size;
}

/// 字体颜色
@riverpod
class WidgetFontColor extends _$WidgetFontColor {
  @override
  Color build() => Colors.white;

  void setColor(Color color) => state = color;
}

/// 背景颜色
@riverpod
class WidgetBackgroundColor extends _$WidgetBackgroundColor {
  @override
  Color build() => Colors.red;

  void setColor(Color color) => state = color;
}

/// LastReadings Widget 宽度
@riverpod
class LastReadingsWidgetWidth extends _$LastReadingsWidgetWidth {
  @override
  int build() => 400;

  void setWidth(int width) => state = width;
}

/// Chart Widget 宽度
@riverpod
class ChartWidgetWidth extends _$ChartWidgetWidth {
  @override
  int build() => 600;

  void setWidth(int width) => state = width;
}

/// LastReadings Widget 高度
@riverpod
class LastReadingsWidgetHeight extends _$LastReadingsWidgetHeight {
  @override
  int build() => 200;

  void setHeight(int height) => state = height;
}

/// Chart Widget 高度
@riverpod
class ChartWidgetHeight extends _$ChartWidgetHeight {
  @override
  int build() => 400;

  void setHeight(int height) => state = height;
}

/// Widget 标题
@riverpod
class WidgetTitle extends _$WidgetTitle {
  @override
  String build() => "Title";

  void setTitle(String title) => state = title;
}

/// Widget 状态
@riverpod
class WidgetStatus extends _$WidgetStatus {
  @override
  String build() => "38kWh";

  void setStatus(String status) => state = status;
}

/// Widget 描述
@riverpod
class WidgetDescription extends _$WidgetDescription {
  @override
  String build() => "Description";

  void setDescription(String desc) => state = desc;
}

/// 是否显示连接状态
@riverpod
class WidgetIsShowConnectedStatus extends _$WidgetIsShowConnectedStatus {
  @override
  bool build() => false;

  void setShow(bool show) => state = show;
}

/// Chart 类型
@riverpod
class ChartType extends _$ChartType {
  @override
  String build() => "Line";

  void setType(String type) => state = type;
}

/// Widget Reading
@riverpod
class WidgetReading extends _$WidgetReading {
  @override
  String build() => "Reading";

  void setReading(String reading) => state = reading;
}

/// Thing 选择的设备名字
@riverpod
class Thing extends _$Thing {
  @override
  String build() => "";

  void setThing(String name) => state = name;
}

/// 选中的 Widget
@riverpod
class SelectedWidget extends _$SelectedWidget {
  @override
  BoardsChartWidgetModel? build() => null;

  void setWidget(BoardsChartWidgetModel? widget) => state = widget;
}

/// ==================== PageManager (StateNotifier) ====================

@riverpod
class Page extends _$Page {
  @override
  List<BoardsTabModel> build() => [];

  void clearTabs() => state = [];

  void addTabs(List<BoardsTabModel> tabs) => state = [...state, ...tabs];
}

/// ==================== ChartWidgetManager ====================

@riverpod
class ChartWidget extends _$ChartWidget {
  @override
  List<BoardsChartWidgetModel> build() => [];

  void add(BoardsChartWidgetModel widget) => state = [...state, widget];

  void removeById(int id) => state = state.where((t) => t.id != id).toList();

  void update(BoardsChartWidgetModel widget) => state = state.map((t) => t.id == widget.id ? widget : t).toList();

  void updateXY(int? id, int? positionX, int? positionY) {
    state = state.map((t) {
      if (t.id == id) return t.copyWith(position_x: positionX, position_y: positionY);
      return t;
    }).toList();
  }

  void setWidgets(List<BoardsChartWidgetModel> widgets) => state = widgets;

  void clearWidgets() => state = [];
}

/// ==================== BoardsTab HTTP ====================

@riverpod
class BoardsTabAdd extends _$BoardsTabAdd {
  @override
  AddBoardsTabResponseEntity build() => AddBoardsTabResponseEntity(code: 0, message: "");

  Future<bool> add(AddBoardsTabRequestEntity? params, String? token) async {
    try {
      final result = await BoardsTabAPI.addBoardsTab(params: params, token: token);
      state = result;
      return true;
    } catch (e) {
      state = AddBoardsTabResponseEntity(code: 201, message: "Add User failed");
      return false;
    }
  }
}

@riverpod
class BoardsTabDelete extends _$BoardsTabDelete {
  @override
  DeleteBoardsTabResponseEntity build() => DeleteBoardsTabResponseEntity(code: 0, message: "");

  Future<bool> delete(dynamic id, String? token) async {
    try {
      final result = await BoardsTabAPI.deleteBoardsTab(id: id, token: token);
      state = result;
      return true;
    } catch (e) {
      state = DeleteBoardsTabResponseEntity(code: 201, message: "Delete User failed");
      return false;
    }
  }
}

@riverpod
class BoardsIndex extends _$BoardsIndex {
  @override
  int build() => 0;

  void setIndex(int index) => state = index;
}

/// ==================== BoardsWidget HTTP ====================

@riverpod
class BoardsWidgetAdd extends _$BoardsWidgetAdd {
  @override
  AddBoardsWidgetResponseEntity build() => AddBoardsWidgetResponseEntity(code: 0, message: "");

  Future<AddBoardsWidgetResponseEntity> add(BoardsChartWidgetModel? params, String? token) async {
    try {
      final result = await BoardsTabAPI.addBoardsWidget(params: params, token: token);
      state = result;
      return result;
    } catch (e) {
      state = AddBoardsWidgetResponseEntity(code: 201, message: "Add Widget failed");
      return AddBoardsWidgetResponseEntity();
    }
  }

  Future<AddBoardsWidgetResponseEntity> edit(BoardsChartWidgetModel? params, String? token) async {
    try {
      final result = await BoardsTabAPI.editBoardsWidget(params: params, token: token);
      state = result;
      return result;
    } catch (e) {
      state = AddBoardsWidgetResponseEntity(code: 201, message: "Edit Widget failed");
      return AddBoardsWidgetResponseEntity();
    }
  }
}

@riverpod
class BoardsWidgetDelete extends _$BoardsWidgetDelete {
  @override
  DeleteBoardsWidgetResponseEntity build() => DeleteBoardsWidgetResponseEntity(code: 0, message: "");

  Future<bool> delete(dynamic id, String? token) async {
    try {
      final result = await BoardsTabAPI.deleteBoardsWidget(id: id, token: token);
      state = result;
      return true;
    } catch (e) {
      state = DeleteBoardsWidgetResponseEntity(code: 201, message: "Delete Widget failed");
      return false;
    }
  }
}

/// ==================== FutureProviders ====================

@riverpod
Future<List<DeviceEnergy>> deviceEnergys(Ref ref, BoardsChartWidgetModel parameter) async {
  final period = parameter.period;
  final type = getEnergyRequestType(parameter);

  if (parameter.deviceId == null || parameter.deviceId!.isEmpty || period == null) return [];

  final deviceEnergys = await DeviceEnergyChartAPI.getDeviceEnergys(
    token: ref.read(loginProvider).data?.token,
    path: "v1/energy/${parameter.deviceId}/$type",
    params: DeviceEnergyRequestEntity(period: period),
  );

  return deviceEnergys.data ?? [];
}

@riverpod
Future<DeviceEnergyResponseEntity> lastReadingsWidgetStatus(
    Ref ref, BoardsChartWidgetModel boardsChartWidgetModel) async {
  final response = await DeviceAPI.getDeviceModelEnergy(
    path: "v1/energy/${boardsChartWidgetModel.deviceId}",
    token: ref.read(loginProvider).data?.token,
  );
  return response;
}

//退出登录后 清空数据
void clearBoardsProvider(WidgetRef ref) {
  ref.invalidate(pageProvider);
  ref.invalidate(deviceEnergysProvider);
  ref.invalidate(lastReadingsWidgetStatusProvider);
  ref.invalidate(boardsTabAddProvider);
  ref.invalidate(boardsTabDeleteProvider);
  ref.invalidate(boardsWidgetAddProvider);
  ref.invalidate(boardsWidgetDeleteProvider);
  ref.invalidate(selectedWidgetProvider);
  ref.invalidate(boardsIndexProvider);
  ref.invalidate(chartWidgetProvider);
  ref.invalidate(widgetFontSizeProvider);
  ref.invalidate(widgetFontColorProvider);
  ref.invalidate(widgetBackgroundColorProvider);
  ref.invalidate(lastReadingsWidgetHeightProvider);
  ref.invalidate(chartWidgetWidthProvider);
  ref.invalidate(lastReadingsWidgetWidthProvider);
  ref.invalidate(chartWidgetHeightProvider);
  ref.invalidate(widgetTitleProvider);
  ref.invalidate(widgetStatusProvider);
  ref.invalidate(widgetDescriptionProvider);
  ref.invalidate(widgetIsShowConnectedStatusProvider);
  ref.invalidate(chartTypeProvider);
  ref.invalidate(widgetReadingProvider);
  ref.invalidate(thingProvider);
}
