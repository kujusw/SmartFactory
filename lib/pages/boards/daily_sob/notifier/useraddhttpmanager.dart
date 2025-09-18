import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../http/user.dart';
import '../../../../models/user_manager_model.dart';
part 'useraddhttpmanager.g.dart';

@riverpod
class UserAddHttp extends _$UserAddHttp {
  @override
  AddUserResponseEntity build() => AddUserResponseEntity(code: 0, message: "");

  /// 添加用户
  Future<bool> addUser(dynamic params, String? token) async {
    try {
      final result = await UserAPI.addUser(params: params, token: token);
      state = result;
      return true;
    } catch (e) {
      state = AddUserResponseEntity(code: 201, message: "Add User failed");
      return false;
    }
  }
}
