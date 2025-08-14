import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../common/utils/logger_manager.dart';
import '../../../http/device.dart';
import '../../../models/device_model_new.dart';

class DeviceDeleteHttpManager extends StateNotifier<DeleteDeviceResponseEntity> {
  DeviceDeleteHttpManager(super.state);
  Future<bool> deleteDevice(deviceId, token) async {
    try {
      DeleteDeviceResponseEntity result = await DeviceAPI.deleteDevice(deviceId: deviceId, token: token);
      state = result;
      return true;
    } catch (e) {
      // 如果发生错误
      LoggerManager().d("deleteDevice error: $e");
      state = DeleteDeviceResponseEntity(code: 201, message: "Delete Device failed");
      return false;
    }
  }
}
