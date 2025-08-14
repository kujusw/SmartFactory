import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../http/device.dart';
import '../../../models/device_model_new.dart';

class UpdateDeviceLocationHttpManager extends StateNotifier<UpdateDeviceLocationResponseEntity> {
  UpdateDeviceLocationHttpManager(super.state);
  Future<bool> updateDevice(
    String? id,
    UpdateDeviceLocationRequestEntity? params,
    String? token,
  ) async {
    try {
      UpdateDeviceLocationResponseEntity result = await DeviceAPI.updateDevice(id: id, params: params, token: token);
      state = result;
      return true;
    } catch (e) {
      // 如果发生错误
      state = UpdateDeviceLocationResponseEntity(code: 201, message: "Update Device failed");
      return false;
    }
  }
}
