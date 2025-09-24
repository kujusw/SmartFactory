import '../common/utils/logger_manager.dart';
import '../common/values/constant.dart';
import '../models/device_energy_model.dart';
import 'http.dart';

class DeviceEnergyChartAPI {
  static Future<DeviceEnergyResponseModel> getDeviceEnergys({
    String? path,
    String? token,
    DeviceEnergyRequestEntity? params,
  }) async {
    var response = await HttpUtil(url: (Constant.HOST), token: token).get(path!, queryParameters: params!.toJson());
    LoggerManager().d("getDeviceEnergys $response");
    return DeviceEnergyResponseModel.fromJson(response);
  }

  static Future<DeviceEnergyResponseModel> getDeviceEnergyCurve({
    String? path,
    String? token,
    DeviceEnergyRequestEntity? params,
  }) async {
    var response = await HttpUtil(url: (Constant.HOST), token: token).get(path!, queryParameters: params!.toJson());
    LoggerManager().d("getDeviceEnergys $response");
    return DeviceEnergyResponseModel.fromJson(response);
  }
}
