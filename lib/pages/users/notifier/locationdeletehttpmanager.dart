import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../http/location.dart';
import '../../../models/locationresponseentity.dart';

part 'locationdeletehttpmanager.g.dart';

@riverpod
class LocationDeleteHttpManager extends _$LocationDeleteHttpManager {
  @override
  DeleteLocationResponseEntity build() {
    return DeleteLocationResponseEntity(code: 0, message: "");
  }

  Future<bool> deleteLocation(int id, String token) async {
    try {
      final result = await LocationAPI.deleteLocation(id: id, token: token);
      state = result;
      return true;
    } catch (e) {
      state = DeleteLocationResponseEntity(code: 201, message: "Delete Location failed");
      return false;
    }
  }
}
