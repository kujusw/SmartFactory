import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../http/location.dart';
import '../../../models/locationresponseentity.dart';

class LocationDeleteHttpManager extends StateNotifier<DeleteLocationResponseEntity> {
  LocationDeleteHttpManager(super.state);
  Future<bool> deleteLocation(params, token) async {
    try {
      DeleteLocationResponseEntity result = await LocationAPI.deleteLocation(id: params, token: token);
      state = result;
      return true;
    } catch (e) {
      // 如果发生错误
      state = DeleteLocationResponseEntity(code: 201, message: "Delete Location failed");
      return false;
    }
  }
}
