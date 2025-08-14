import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../http/user.dart';
import '../../../models/user_manager_model.dart';

class UserDeleteHttpManager extends StateNotifier<DeleteUserResponseEntity> {
  UserDeleteHttpManager(super.state);
  Future<bool> deleteUser(params, token) async {
    try {
      DeleteUserResponseEntity result = await UserAPI.deleteUser(id: params, token: token);
      state = result;
      return true;
    } catch (e) {
      // 如果发生错误
      state = DeleteUserResponseEntity(code: 201, message: "Delete User failed");
      return false;
    }
  }
}
