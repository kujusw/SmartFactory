import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../http/role.dart';
import '../../../models/user_role_model.dart';

part 'roledeletehttpmanager.g.dart';

@riverpod
class RoleDeleteHttpManager extends _$RoleDeleteHttpManager {
  @override
  DeleteRoleResponseEntity build() {
    return DeleteRoleResponseEntity(code: 0, message: "");
  }

  /// 删除角色
  Future<bool> deleteRole(roleId, token) async {
    try {
      final result = await RoleAPI.deleteRole(id: roleId, token: token);
      state = result;
      return true;
    } catch (e) {
      state = DeleteRoleResponseEntity(code: 201, message: "Delete Role failed");
      return false;
    }
  }
}
