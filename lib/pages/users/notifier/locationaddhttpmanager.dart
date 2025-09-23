import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../common/utils/logger_manager.dart';
import '../../../http/location.dart';
import '../../../models/locationresponseentity.dart';

part 'locationaddhttpmanager.g.dart';

@Riverpod(keepAlive: true)
class Location extends _$Location {
  @override
  String build() => "";

  void set(String value) => state = value;
}

@Riverpod(keepAlive: true)
class Building extends _$Building {
  @override
  String build() => "";

  void set(String value) => state = value;
}

@Riverpod(keepAlive: true)
class Tenant extends _$Tenant {
  @override
  String build() => "";

  void set(String value) => state = value;
}

@Riverpod(keepAlive: true)
class Area extends _$Area {
  @override
  int build() => 0;

  void set(int value) => state = value;
}

/// -------------------- Locations --------------------

@riverpod
Future<AddLocationResponseEntity> addLocation(
  Ref ref,
  AddLocationModelRequestEntity params,
  String token,
) async {
  try {
    LoggerManager().d("Add Location params: $params");
    final result = await LocationAPI.addLocation(params: params, token: token);
    return result;
  } catch (e) {
    return AddLocationResponseEntity(code: 201, message: "Add Location failed");
  }
}

@riverpod
Future<DeleteLocationResponseEntity> deleteLocation(
  Ref ref,
  int id,
  String token,
) async {
  try {
    LoggerManager().d("Delete Location id: $id");
    final result = await LocationAPI.deleteLocation(id: id, token: token);
    return result;
  } catch (e) {
    return DeleteLocationResponseEntity(code: 201, message: "Delete Location failed");
  }
}

@riverpod
Future<AddLocationResponseEntity> updateLocation(
  Ref ref,
  int id,
  AddLocationModelRequestEntity params,
  String token,
) async {
  try {
    LoggerManager().d("Update Location id: $id params: $params");
    final result = await LocationAPI.updateLocation(id: id, params: params, token: token);
    return result;
  } catch (e) {
    return AddLocationResponseEntity(code: 201, message: "Update Location failed");
  }
}
