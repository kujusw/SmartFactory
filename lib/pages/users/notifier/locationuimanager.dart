import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../common/utils/logger_manager.dart';
import '../../../http/location.dart';
import '../../../models/locationresponseentity.dart';
import '../../login/notifier/login_notifier.dart';

part 'locationuimanager.g.dart';

@riverpod
class LocationUIManager extends _$LocationUIManager {
  @override
  List<LocationModel> build() {
    return [];
  }

  void addLocation(LocationModel location) {
    state = [...state, location];
  }

  void addLocationList(List<LocationModel> locations) {
    state = [...state, ...locations];
  }

  void removeLocation(LocationModel location) {
    state = state.where((t) => t != location).toList();
  }

  void removeLocationList(List<LocationModel> locations) {
    state = state.where((t) => !locations.contains(t)).toList();
  }

  /// 通过 id 更新
  void updateLocation(LocationModel newLocation) {
    state = state.map((t) => t.id == newLocation.id ? newLocation : t).toList();
  }

  /// 设置集合
  void setLocations(List<LocationModel> locations) {
    // ⚠️ 这里如果直接赋值，UI 的数据引用会和原始数据共享内存
    // 建议深拷贝，避免 hashcode 相同导致 UI 被联动修改
    state = locations.map((e) => e.copyWith()).toList();
  }

  /// 选中所有
  void selectAll(bool selected) {
    state = state.map((t) => t.copyWith(selected: selected)).toList();
  }

  //获取名字通过id
  String getLocationNameById(int id) {
    final location = state.firstWhere((element) => element.id == id, orElse: () => LocationModel());
    return location.name ?? "";
  }

  /// 搜索
  List<LocationModel> getSearchLocations(String keyword) {
    return state.where((element) {
      return element.name?.toLowerCase().contains(keyword.toLowerCase()) ?? false;
    }).toList();
  }

  /// 清空
  void clearLocations() {
    state = [];
  }
}

@riverpod
Future<List<LocationModel>> getLocations(Ref ref) async {
  final token = ref.read(loginProvider).data?.token;
  final locations = await LocationAPI.getLocations(path: "api/v1/locations/all", token: token);
  final list = locations.data?.locations ?? [];
  // 更新原始数据和过滤后的数据
  LoggerManager().d(" getLocations ${list.length}");
  ref.read(locationUIManagerProvider.notifier).setLocations(list);
  return list;
}
