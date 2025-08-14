import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/locationresponseentity.dart';

class LocationUIManager extends StateNotifier<List<LocationModel>> {
  LocationUIManager() : super([]) {}

  void addLocation(LocationModel locationManagerModel) {
    state = [...state, locationManagerModel];
  }

  void addLocationList(List<LocationModel> locationManagerModel) {
    state = [...state, ...locationManagerModel];
  }

  void removeLocation(LocationModel locationManagerModel) {
    state = state.where((t) => t != locationManagerModel).toList();
  }

  void removeLocationList(List<LocationModel> locationManagerModel) {
    state = state.where((t) => !locationManagerModel.contains(t)).toList();
  }

  //通过id 更新
  void updateLocation(LocationModel newLocationManagerModel) {
    state = state.map((t) => t.id == newLocationManagerModel.id ? newLocationManagerModel : t).toList();
  }

  //设置集合
  void setLocations(List<LocationModel> locationManagerModels) {
    state = locationManagerModels; //这样写会有问题 hashcode一样 改变UI数据会影响到原始数据
    // state = userManagerModels.map((user) => UserManagerModel.copy(user)).toList();
  }

  //选中所有
  void selectAll(bool selected) {
    state = state
        .map((t) => LocationModel(
              id: t.id,
              name: t.name,
              selected: selected,
            ))
        .toList();
  }

  getSearchLocations(String watch) {
    return state.where((element) {
      //忽略大小写
      return element.name!.toLowerCase().contains(watch.toLowerCase());
    }).toList();
  }

  void clearLocations() {
    state = [];
  }
}
