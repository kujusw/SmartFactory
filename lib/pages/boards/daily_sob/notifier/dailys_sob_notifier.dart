import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../common/utils/board_widgets_utils.dart';
import '../../../../http/boardstab.dart';
import '../../../../http/device.dart';
import '../../../../http/device_energy_chart.dart';
import '../../../../models/boards_tab_model.dart';
import '../../../../models/device_energy_model.dart';
import '../../../../models/device_model.dart';
import '../../../login/notifier/login_notifier.dart';
import 'boards_index_notifier.dart';
import 'boardstabaddhttpmanager.dart';
import 'boardstabdeletehttpmanager.dart';
import 'boardswidgetaddhttpmanager.dart';
import 'boardswidgetdeletehttpmanager.dart';
import 'chartwidgetmanager.dart';
import 'pagemanager.dart';

//字体大小选择值
final widgetFontSizeProvider = StateProvider.autoDispose<int>((ref) => 20);
//字体颜色选择值
final widgetFontColorProvider = StateProvider.autoDispose<Color>((ref) => Colors.white);
//背景颜色选择值
final widgetBackgroundColorProvider = StateProvider.autoDispose<Color>((ref) => Colors.red);

//widget 宽度
final lastreadingsWidgetWidthProvider = StateProvider.autoDispose<int>((ref) => 400);
final chartWidgetWidthProvider = StateProvider.autoDispose<int>((ref) => 600);

//widget 高度
final lastreadingsWidgetHeightProvider = StateProvider.autoDispose<int>((ref) => 200);
final chartWidgetHeightProvider = StateProvider.autoDispose<int>((ref) => 400);

//widget title
final widgetTitleProvider = StateProvider.autoDispose<String>((ref) => "Title");
//widget status
final widgetStatusProvider = StateProvider.autoDispose<String>((ref) => "38kWh");
//widget description
final widgetDescriptionProvider = StateProvider.autoDispose<String>((ref) => "Description");
//widget 是否显示连接状态
final widgetIsShowConnectedStatusProvider = StateProvider.autoDispose<bool>((ref) => false);
// chart 类型
final chartTypeProvider = StateProvider.autoDispose<String>((ref) => "Line");
// chart 数据
final widgetReadingProvider = StateProvider.autoDispose<String>((ref) => "Reading");
// thing 选择的设备名字
final thingProvider = StateProvider.autoDispose<String>((ref) => "");
//页面管理
final pageProvider = StateNotifierProvider<PageManager, List<BoardsTabModel>>((ref) {
  return PageManager();
});

Future<List<BoardsTabModel>> getBoardsTabs(FutureProviderRef<List<BoardsTabModel>> ref) async {
  var boards = await BoardsTabAPI.getBoardsTabs(path: "v1/boards", token: ref.read(loginProvider).data?.token);
  //pageProvider 刷新
  ref.read(pageProvider.notifier).clearTabs();
  ref.read(pageProvider.notifier).addTabs(boards.data ?? []);
  return boards.data ?? [];
}

final getBoardsTabsProvider = FutureProvider<List<BoardsTabModel>>((ref) async {
  return getBoardsTabs(ref);
});

final addBoardsTabProvider = StateNotifierProvider<BoardsTabAddHttpManager, AddBoardsTabResponseEntity>((ref) {
  return BoardsTabAddHttpManager(AddBoardsTabResponseEntity(code: 0, message: ""));
});

final deleteBoardsTabProvider = StateNotifierProvider<BoardsTabDeleteHttpManager, DeleteBoardsTabResponseEntity>((ref) {
  return BoardsTabDeleteHttpManager(DeleteBoardsTabResponseEntity(code: 0, message: ""));
});

final indexBoardsProvider = StateNotifierProvider<BoardsIndexState, int>((ref) {
  return BoardsIndexState();
});

final chartWidgetsProvider = StateNotifierProvider<ChartWidgetManager, List<BoardsChartWidgetModel>>(
  (ref) {
    return ChartWidgetManager();
  },
);

final deviceEnergysProvider = FutureProvider.family<List<DeviceEnergy>, BoardsChartWidgetModel>((ref, parameter) async {
  return getDeviceEnergys(ref, parameter: parameter);
});

Future<List<DeviceEnergy>> getDeviceEnergys(FutureProviderRef<List<DeviceEnergy>> ref,
    {required BoardsChartWidgetModel parameter}) async {
  var period = parameter.period;
  var type = getEnergyRequestType(parameter);
  if (parameter.deviceId == null || parameter.deviceId == "" || period == null) {
    return [];
  }
  var deviceEnergys = await DeviceEnergyChartAPI.getDeviceEnergys(
      token: ref.read(loginProvider).data?.token,
      path: "v1/energy/${parameter.deviceId}/${type}",
      params: DeviceEnergyRequestEntity(period: period));
  return deviceEnergys.data ?? [];
}

Future<List<BoardsChartWidgetModel>> getBoardsWidgets(FutureProviderRef<List<BoardsChartWidgetModel>> ref,
    {required int boradId}) async {
  var boards = await BoardsTabAPI.getBoardsWidgets(
      path: "v1/boards//${boradId}/widgets", token: ref.read(loginProvider).data?.token);
  ref.read(chartWidgetsProvider.notifier).clearWidgets();
  ref.read(chartWidgetsProvider.notifier).setWidgets(boards.data ?? []);

  return boards.data ?? [];
}

final getBoardsWidgetsProvider = FutureProvider.family<List<BoardsChartWidgetModel>, int>((ref, boradId) async {
  return getBoardsWidgets(ref, boradId: boradId);
});

final addBoardsWidgetProvider = StateNotifierProvider<BoardsWidgetAddHttpManager, AddBoardsWidgetResponseEntity>((ref) {
  return BoardsWidgetAddHttpManager(AddBoardsWidgetResponseEntity(code: 0, message: ""));
});

final updateBoardsWidgetProvider =
    StateNotifierProvider<BoardsWidgetAddHttpManager, AddBoardsWidgetResponseEntity>((ref) {
  return BoardsWidgetAddHttpManager(AddBoardsWidgetResponseEntity(code: 0, message: ""));
});

final deleteBoardsWidgetProvider =
    StateNotifierProvider<BoardsWidgetDeleteHttpManager, DeleteBoardsWidgetResponseEntity>((ref) {
  return BoardsWidgetDeleteHttpManager(DeleteBoardsWidgetResponseEntity(code: 0, message: ""));
});
//选中编辑的widget
final selectedWidgetProvider = StateProvider.autoDispose<BoardsChartWidgetModel?>((ref) => null);

Future<DeviceEnergyResponseEntity> getLastReadingsWidgetStatus(FutureProviderRef<DeviceEnergyResponseEntity> ref,
    {required BoardsChartWidgetModel boardsChartWidgetModel}) async {
  DeviceEnergyResponseEntity deviceEnergyResponseEntity = await DeviceAPI.getDeviceModelEnergy(
      path: "v1/energy/${boardsChartWidgetModel.deviceId}", token: ref.read(loginProvider).data?.token);
  return deviceEnergyResponseEntity;
}

final getLastReadingsWidgetStatusProvider =
    FutureProvider.family<DeviceEnergyResponseEntity, BoardsChartWidgetModel>((ref, boardsChartWidgetModel) async {
  return getLastReadingsWidgetStatus(ref, boardsChartWidgetModel: boardsChartWidgetModel);
});

//退出登录后 清空数据
void clearBoardsProvider(WidgetRef ref) {
  ref.invalidate(pageProvider);
  ref.invalidate(getBoardsTabsProvider);
  ref.invalidate(getBoardsWidgetsProvider);
  ref.invalidate(deviceEnergysProvider);
  ref.invalidate(getLastReadingsWidgetStatusProvider);
  ref.invalidate(addBoardsTabProvider);
  ref.invalidate(deleteBoardsTabProvider);
  ref.invalidate(addBoardsWidgetProvider);
  ref.invalidate(updateBoardsWidgetProvider);
  ref.invalidate(deleteBoardsWidgetProvider);
  ref.invalidate(selectedWidgetProvider);
  ref.invalidate(indexBoardsProvider);
  ref.invalidate(chartWidgetsProvider);
  ref.invalidate(widgetFontSizeProvider);
  ref.invalidate(widgetFontColorProvider);
  ref.invalidate(widgetBackgroundColorProvider);
  ref.invalidate(lastreadingsWidgetWidthProvider);
  ref.invalidate(chartWidgetWidthProvider);
  ref.invalidate(lastreadingsWidgetHeightProvider);
  ref.invalidate(chartWidgetHeightProvider);
  ref.invalidate(widgetTitleProvider);
  ref.invalidate(widgetStatusProvider);
  ref.invalidate(widgetDescriptionProvider);
  ref.invalidate(widgetIsShowConnectedStatusProvider);
  ref.invalidate(chartTypeProvider);
  ref.invalidate(widgetReadingProvider);
  ref.invalidate(thingProvider);
}
