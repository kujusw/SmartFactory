import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../common/utils/logger_manager.dart';
import '../../../http/device.dart';
import '../../../models/device_model_new.dart';
part 'devicedeletehttpmanager.g.dart';

@riverpod
class DeviceDeleteHttpManager extends _$DeviceDeleteHttpManager {
  @override
  DeleteDeviceResponseEntity build() {
    // 初始状态
    return DeleteDeviceResponseEntity(code: 0, message: "");
  }

  /// 删除设备
  Future<bool> deleteDevice(String deviceId, String token) async {
    try {
      final result = await DeviceAPI.deleteDevice(
        deviceId: deviceId,
        token: token,
      );
      state = result;
      return true;
    } catch (e, s) {
      LoggerManager().e("DeviceDeleteHttpManager deleteDevice error: $e stack: $s");

      state = DeleteDeviceResponseEntity(
        code: 201,
        message: "Delete Device failed",
      );
      return false;
    }
  }
}
