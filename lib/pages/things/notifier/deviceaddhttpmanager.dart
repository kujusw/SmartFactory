import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../http/device.dart';
import '../../../models/device_model_new.dart';

class DeviceAddHttpManager extends StateNotifier<AddDeviceResponseEntity> {
  DeviceAddHttpManager(super.state);
  Future<bool> addDevice(params, token) async {
    try {
      AddDeviceResponseEntity result = await DeviceAPI.addDevice(params: params, token: token);
      state = result;
      return true;
    } catch (e) {
      // 如果发生错误
      state = AddDeviceResponseEntity(code: 201, message: "Add Device failed");
      return false;
    }
  }
}
