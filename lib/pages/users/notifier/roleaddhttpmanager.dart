import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../http/role.dart';
import '../../../models/user_role_model.dart';

part 'roleaddhttpmanager.g.dart';

@riverpod
class AddRoleName extends _$AddRoleName {
  @override
  String build() => "";

  void set(String value) => state = value;
}

@riverpod
class RoleAddHttpManager extends _$RoleAddHttpManager {
  @override
  AddRoleResponseEntity build() {
    return AddRoleResponseEntity(code: 0, message: "");
  }

  /// 添加角色
  Future<bool> addRole(params, token) async {
    try {
      final result = await RoleAPI.addRole(params: params, token: token);
      state = result;
      return true;
    } catch (e) {
      state = AddRoleResponseEntity(code: 201, message: "Add Role failed");
      return false;
    }
  }

  /// 更新角色
  Future<bool> updateRole(id, params, token) async {
    try {
      final result = await RoleAPI.updateRole(id: id, params: params, token: token);
      state = result;
      return true;
    } catch (e) {
      state = AddRoleResponseEntity(code: 201, message: "Update Role failed");
      return false;
    }
  }
}
