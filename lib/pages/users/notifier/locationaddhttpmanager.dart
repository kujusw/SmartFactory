import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../http/location.dart';
import '../../../models/locationresponseentity.dart';

part 'locationaddhttpmanager.g.dart';

@riverpod
class Location extends _$Location {
  @override
  String build() => "";

  void set(String value) => state = value;
}

@riverpod
class Building extends _$Building {
  @override
  String build() => "";

  void set(String value) => state = value;
}

@riverpod
class Tenant extends _$Tenant {
  @override
  String build() => "";

  void set(String value) => state = value;
}

@riverpod
class Area extends _$Area {
  @override
  int build() => 0;

  void set(int value) => state = value;
}

@riverpod
class LocationAddHttpManager extends _$LocationAddHttpManager {
  @override
  AddLocationResponseEntity build() {
    // 初始值
    return AddLocationResponseEntity(code: 0, message: "");
  }

  Future<bool> addLocation(dynamic params, String? token) async {
    try {
      final result = await LocationAPI.addLocation(params: params, token: token);
      state = result;
      return true;
    } catch (e) {
      state = AddLocationResponseEntity(code: 201, message: "Add Location failed");
      return false;
    }
  }

  Future<bool> updateLocation(int? id, dynamic params, String? token) async {
    try {
      final result = await LocationAPI.updateLocation(id: id, params: params, token: token);
      state = result;
      return true;
    } catch (e) {
      state = AddLocationResponseEntity(code: 201, message: "Update Location failed");
      return false;
    }
  }
}
