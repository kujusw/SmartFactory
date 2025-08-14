import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/locationresponseentity.dart';

class LocationSelectInUserState extends StateNotifier<List<LocationModel>> {
  LocationSelectInUserState() : super([]);

  LocationSelectInUserState addLocation(LocationModel locationModel) {
    if ((locationModel.id ?? 0) <= 0) return this;
    state = [...state, locationModel];
    return this;
  }

  LocationSelectInUserState removeLocation(LocationModel locationModel) {
    state = state.where((element) => element != locationModel).toList();
    return this;
  }
}
