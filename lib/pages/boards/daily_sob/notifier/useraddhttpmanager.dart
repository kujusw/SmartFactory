import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../http/user.dart';
import '../../../../models/user_manager_model.dart';

class UserAddHttpManager extends StateNotifier<AddUserResponseEntity> {
  UserAddHttpManager(super.state);
  Future<bool> addUser(params, token) async {
    try {
      AddUserResponseEntity result = await UserAPI.addUser(params: params, token: token);
      state = result;
      return true;
    } catch (e) {
      // 如果发生错误
      state = AddUserResponseEntity(code: 201, message: "Add User failed");
      return false;
    }
  }
}
