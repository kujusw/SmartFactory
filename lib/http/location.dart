import 'dart:convert';

import '../common/utils/logger_manager.dart';
import '../common/values/constant.dart';
import '../models/locationresponseentity.dart';
import 'http.dart';

class LocationAPI {
  static Future<LocationModelResponseEntity> getLocations({
    String? path,
    String? token,
  }) async {
    var response = await HttpUtil(url: (Constant.HOST), token: token).get(path!);
    LoggerManager().d("LocationAPI.getLocations response: ${jsonEncode(response)}");
    return LocationModelResponseEntity.fromJson(response);
  }

  static Future<String> getDeviceModel({
    String? path,
  }) async {
    var response = await HttpUtil(url: (Constant.HOST)).get(path!);
    return response.toString();
  }

  static Future<AddLocationResponseEntity> addLocation({
    AddLocationModelRequestEntity? params,
    String? token,
  }) async {
    var response = await HttpUtil(url: Constant.HOST, token: token).post(
      "v1/locations",
      data: params?.toJson(),
    );
    return AddLocationResponseEntity.fromJson(response);
  }

  static Future<AddLocationResponseEntity> updateLocation({
    int? id,
    AddLocationModelRequestEntity? params,
    String? token,
  }) async {
    var response = await HttpUtil(url: Constant.HOST, token: token).put(
      "v1/locations/${id}",
      data: params?.toJson(),
    );
    return AddLocationResponseEntity.fromJson(response);
  }

  static Future<DeleteLocationResponseEntity> deleteLocation({
    int? id,
    String? token,
  }) async {
    var response = await HttpUtil(url: Constant.HOST, token: token).delete("v1/locations/${id}");
    LoggerManager().d("LocationAPI.deleteLocation response: $response");
    return DeleteLocationResponseEntity.fromJson(response);
  }
}
