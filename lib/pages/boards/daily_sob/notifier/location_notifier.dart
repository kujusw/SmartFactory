import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../common/utils/logger_manager.dart';
import '../../../../http/location.dart';
import '../../../../models/locationresponseentity.dart';
import '../../../login/notifier/login_notifier.dart';

part 'location_notifier.g.dart';

/// 原始数据
@riverpod
class LocationList extends _$LocationList {
  @override
  List<LocationModel> build() {
    return [];
  }

  void setLocations(List<LocationModel> locations) {
    state = [...locations]; //强制刷新 不同于 state = locations;
  }

  void clear() {
    state = [];
  }
}

/// 过滤后的数据
@riverpod
class LocationUIManager extends _$LocationUIManager {
  @override
  List<LocationModel> build() {
    return [];
  }

  void setLocations(List<LocationModel> locations) {
    state = [...locations];
  }

  void clear() {
    state = [];
  }
}

/// 获取数据
@riverpod
Future<List<LocationModel>> getLocations(Ref ref) async {
  final token = ref.read(loginProvider).data?.token;
  final locations = await LocationAPI.getLocations(path: "api/v1/locations/all", token: token);
  final list = locations.data?.locations ?? [];
  // 更新原始数据和过滤后的数据
  LoggerManager().d(" getLocations ${list.length}");
  ref.read(locationListProvider.notifier).setLocations(list);
  ref.read(locationUIManagerProvider.notifier).setLocations(list);
  return list;
}
