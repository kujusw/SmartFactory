import 'package:riverpod_annotation/riverpod_annotation.dart';

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
    state = locations;
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
    state = locations;
  }

  void clear() {
    state = [];
  }
}

/// 获取数据
@riverpod
Future<List<LocationModel>> getLocations(Ref ref) async {
  final token = ref.read(loginProvider).data?.token;
  final locations = await LocationAPI.getLocations(path: "v1/locations", token: token);

  final list = locations.data ?? [];

  // 更新原始数据和过滤后的数据
  ref.read(locationListProvider.notifier).setLocations(list);
  ref.read(locationUIManagerProvider.notifier).setLocations(list);

  return list;
}
