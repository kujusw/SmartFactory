import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../common/utils/logger_manager.dart';
import '../../../http/device.dart';
import '../../../models/device_model_new.dart';

part 'deviceaddhttpmanager.g.dart';

@riverpod
class DeviceAddHttpManager extends _$DeviceAddHttpManager {
  @override
  AddDeviceResponseEntity build() {
    // 初始状态
    return AddDeviceResponseEntity(code: 0, message: "");
  }

  /// 添加设备
  Future<bool> addDevice(dynamic params, String token) async {
    try {
      final result = await DeviceAPI.addDevice(params: params, token: token);
      state = result;
      return true;
    } catch (e, s) {
      // 打印日志
      LoggerManager().e("DeviceAddHttpManager addDevice error: $e $s");

      state = AddDeviceResponseEntity(
        code: 201,
        message: "Add Device failed",
      );
      return false;
    }
  }
}
