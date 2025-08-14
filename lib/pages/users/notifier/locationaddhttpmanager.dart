import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../http/location.dart';
import '../../../models/locationresponseentity.dart';

class LocationAddHttpManager extends StateNotifier<AddLocationResponseEntity> {
  LocationAddHttpManager(super.state);
  Future<bool> addLocation(params, token) async {
    try {
      AddLocationResponseEntity result = await LocationAPI.addLocation(params: params, token: token);
      state = result;
      return true;
    } catch (e) {
      // 如果发生错误
      state = AddLocationResponseEntity(code: 201, message: "Add Location failed");
      return false;
    }
  }

  Future<bool> updateLocation(id, params, token) async {
    try {
      AddLocationResponseEntity result = await LocationAPI.updateLocation(id: id, params: params, token: token);
      state = result;
      return true;
    } catch (e) {
      // 如果发生错误
      state = AddLocationResponseEntity(code: 201, message: "Add Location failed");
      return false;
    }
  }
}
