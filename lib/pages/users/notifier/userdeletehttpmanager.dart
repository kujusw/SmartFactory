import '../../../http/user.dart';
import '../../../models/user_manager_model.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'userdeletehttpmanager.g.dart';

@riverpod
class UserDeleteHttpManager extends _$UserDeleteHttpManager {
  @override
  DeleteUserResponseEntity build() {
    return DeleteUserResponseEntity(code: 0, message: "");
  }

  /// 删除用户
  Future<bool> deleteUser(dynamic params, String? token) async {
    try {
      final result = await UserAPI.deleteUser(id: params, token: token);
      state = result;
      return true;
    } catch (e) {
      state = DeleteUserResponseEntity(code: 201, message: "Delete User failed");
      return false;
    }
  }
}
