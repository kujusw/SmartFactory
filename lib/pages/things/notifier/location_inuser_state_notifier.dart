import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../models/locationresponseentity.dart';

part 'location_inuser_state_notifier.g.dart';

@riverpod
class LocationSelectInUserState extends _$LocationSelectInUserState {
  @override
  List<LocationModel> build() {
    return [];
  }

  /// 添加 Location
  void addLocation(LocationModel locationModel) {
    if ((locationModel.id ?? 0) <= 0) return;
    state = [...state, locationModel];
  }

  /// 删除 Location
  void removeLocation(LocationModel locationModel) {
    state = state.where((element) => element != locationModel).toList();
  }

  /// 清空所有 Location
  void clear() {
    state = [];
  }
}
