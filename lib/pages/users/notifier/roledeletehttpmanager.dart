import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../http/role.dart';
import '../../../models/user_role_model.dart';

class RoleDeleteHttpManager extends StateNotifier<DeleteRoleResponseEntity> {
  RoleDeleteHttpManager(super.state);

  Future<bool> deleteRole(role_id, token) async {
    try {
      DeleteRoleResponseEntity result = await RoleAPI.deleteRole(id: role_id, token: token);
      state = result;
      return true;
    } catch (e) {
      // 如果发生错误
      state = DeleteRoleResponseEntity(code: 201, message: "Delete Role failed");
      return false;
    }
  }
}
