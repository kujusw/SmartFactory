import 'dart:convert';

import '../common/utils/logger_manager.dart';
import '../common/values/constant.dart';
import '../models/device_model.dart';
import '../models/device_model_new.dart';
import 'http.dart';

class DeviceAPI {
  static Future<DevicesResponseEntity> getDevices({
    String? path,
    String? token,
  }) async {
    var response = await HttpUtil(url: (Constant.HOST), token: token).get(path!);
    LoggerManager().d("getDevices response: ${jsonEncode(response)}");
    return DevicesResponseEntity.fromJson(response);
  }

  static Future<DeviceEnergyResponseEntity> getDeviceModelEnergy({
    String? path,
    String? token,
  }) async {
    try {
      var response = await HttpUtil(url: (Constant.HOST), token: token).get(path!);
      LoggerManager().d("getDeviceModelEnergy :$response");
      return DeviceEnergyResponseEntity.fromJson(response);
    } catch (e) {
      LoggerManager().e("getDeviceModelEnergy $e");
      return DeviceEnergyResponseEntity();
    }
  }

  static Future<AddDeviceResponseEntity> addDevice({
    AddDeviceModelRequestEntity? params,
    String? token,
  }) async {
    var response = await HttpUtil(url: Constant.HOST, token: token).post(
      "api/v1/devices",
      data: params?.toJson(),
    );
    LoggerManager().d("addDevice :$response");
    return AddDeviceResponseEntity.fromJson(response);
  }

  static Future<DeleteDeviceResponseEntity> deleteDevice({
    String? deviceId,
    String? token,
  }) async {
    LoggerManager().d("deleteDevice :$deviceId");
    var response = await HttpUtil(url: Constant.HOST, token: token).delete(
      "api/v1/devices/${deviceId}",
    );
    LoggerManager().d("deleteDevice :$response");
    return DeleteDeviceResponseEntity.fromJson(response);
  }

  static Future<UpdateDeviceLocationResponseEntity> updateDevice({
    String? id,
    AddDeviceModelRequestEntity? params,
    String? token,
  }) async {
    var response = await HttpUtil(url: Constant.HOST, token: token).put(
      "api/v1/devices/$id",
      data: params?.toJson(),
    );
    LoggerManager().d("updateDevice :$response");
    return UpdateDeviceLocationResponseEntity.fromJson(response);
  }
}
