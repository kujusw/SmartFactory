import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../http/role.dart';
import '../../../models/user_role_model.dart';

class RoleAddHttpManager extends StateNotifier<AddRoleResponseEntity> {
  RoleAddHttpManager(super.state);
  Future<bool> addRole(params, token) async {
    try {
      AddRoleResponseEntity result = await RoleAPI.addRole(params: params, token: token);
      state = result;
      return true;
    } catch (e) {
      // 如果发生错误
      state = AddRoleResponseEntity(code: 201, message: "Add User failed");
      return false;
    }
  }

  Future<bool> updateRole(id, params, token) async {
    try {
      AddRoleResponseEntity result = await RoleAPI.updateRole(id: id, params: params, token: token);
      state = result;
      return true;
    } catch (e) {
      // 如果发生错误
      state = AddRoleResponseEntity(code: 201, message: "Add User failed");
      return false;
    }
  }
}
