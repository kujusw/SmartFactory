import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../http/device.dart';
import '../../../models/device_model_new.dart';

part 'updatedevicelocationhttpmanager.g.dart';

@riverpod
class UpdateDeviceLocation extends _$UpdateDeviceLocation {
  @override
  UpdateDeviceLocationResponseEntity build() {
    return UpdateDeviceLocationResponseEntity(code: 0, message: "");
  }

  Future<bool> updateDevice(
    String? id,
    UpdateDeviceLocationRequestEntity? params,
    String? token,
  ) async {
    try {
      final result = await DeviceAPI.updateDevice(id: id, params: params, token: token);
      state = result;
      return true;
    } catch (e) {
      state = UpdateDeviceLocationResponseEntity(code: 201, message: "Update Device failed");
      return false;
    }
  }
}
