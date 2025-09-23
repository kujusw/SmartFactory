import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_factory/pages/users/notifier/permissionselectuimanager.dart';
import 'package:smart_factory/pages/users/notifier/roleuimanager.dart';
import '../../../http/role.dart';
import '../../../http/user.dart';
import '../../../models/user_manager_model.dart';
import '../../../models/user_role_model.dart';
import '../../login/notifier/login_notifier.dart';
// import 'userhttpmanager.dart';

part 'users_notifier.g.dart';

/// -------------------- Users --------------------

@riverpod
class IndexUsers extends _$IndexUsers {
  @override
  int build() => 0;

  void setIndex(int index) => state = index;
}

@riverpod
class ItemsUserModel extends _$ItemsUserModel {
  @override
  List<UserModel> build() => [];

  void setUsers(List<UserModel> users) => state = users;
}

@riverpod
class ItemsUserModelFiltered extends _$ItemsUserModelFiltered {
  @override
  List<UserModel> build() => [];

  void setUsers(List<UserModel> users) => state = users;
}

@riverpod
Future<List<UserModel>> getUsers(Ref ref) async {
  final users = await UserAPI.getUsers(
    path: "v1/users",
    token: ref.read(loginProvider).data?.token,
  );
  ref.read(itemsUserModelFilteredProvider.notifier).setUsers(users.data ?? []);
  ref.read(itemsUserModelProvider.notifier).setUsers(users.data ?? []);
  return users.data ?? [];
}

@riverpod
class AddUser extends _$AddUser {
  @override
  AddUserResponseEntity build() => AddUserResponseEntity(code: 0, message: "");

  Future<bool> addUser(dynamic params, String token) async {
    try {
      final result = await UserAPI.addUser(params: params, token: token);
      state = result;
      return true;
    } catch (_) {
      state = AddUserResponseEntity(code: 201, message: "Add User failed");
      return false;
    }
  }
}

@riverpod
class DeleteUser extends _$DeleteUser {
  @override
  DeleteUserResponseEntity build() => DeleteUserResponseEntity(code: 0, message: "");

  Future<bool> deleteUser(int id, String token) async {
    try {
      final result = await UserAPI.deleteUser(id: id, token: token);
      state = result;
      return true;
    } catch (_) {
      state = DeleteUserResponseEntity(code: 201, message: "Delete User failed");
      return false;
    }
  }
}

/// -------------------- Roles --------------------

@riverpod
class ItemsRoleModel extends _$ItemsRoleModel {
  @override
  List<RoleModel> build() => [];

  void setRoles(List<RoleModel> roles) => state = roles;
}

@riverpod
Future<List<RoleModel>> getRoles(Ref ref) async {
  final roles = await RoleAPI.getRoles(
    path: "v1/roles",
    token: ref.read(loginProvider).data?.token,
  );
  ref.read(roleUIManagerProvider.notifier).setRoles(roles.data ?? []);
  ref.read(itemsRoleModelProvider.notifier).setRoles(roles.data ?? []);
  return roles.data ?? [];
}

@riverpod
class AddRole extends _$AddRole {
  @override
  AddRoleResponseEntity build() => AddRoleResponseEntity(code: 0, message: "");

  Future<bool> addRole(dynamic params, String token) async {
    try {
      final result = await RoleAPI.addRole(params: params, token: token);
      state = result;
      return true;
    } catch (_) {
      state = AddRoleResponseEntity(code: 201, message: "Add Role failed");
      return false;
    }
  }
}

@riverpod
class DeleteRole extends _$DeleteRole {
  @override
  DeleteRoleResponseEntity build() => DeleteRoleResponseEntity(code: 0, message: "");

  Future<bool> deleteRole(int id, String token) async {
    try {
      final result = await RoleAPI.deleteRole(id: id, token: token);
      state = result;
      return true;
    } catch (_) {
      state = DeleteRoleResponseEntity(code: 201, message: "Delete Role failed");
      return false;
    }
  }
}

/// -------------------- Permissions --------------------

@riverpod
class PermissionList extends _$PermissionList {
  @override
  List<Permission> build() => [];

  void setPermissions(List<Permission> permissions) => state = permissions;
}

@riverpod
Future<List<PermissionSelect>> getPermissions(Ref ref) async {
  final res = await RoleAPI.getPermissions(
    path: "v1/roles/permissions",
    token: ref.read(loginProvider).data?.token,
  );

  ref.read(permissionListProvider.notifier).setPermissions(res.data);
  final permissionsSelect = handlerPermissionToPremissionSelect(res.data);
  ref.read(permissionSelectUIManagerProvider.notifier).setPermissionSelects(permissionsSelect);
  return permissionsSelect;
}

/// 数据转换逻辑保持不变
List<PermissionSelect> handlerPermissionToPremissionSelect(List<Permission> data) {
  final permissionsSelect = <PermissionSelect>[];
  for (var item in data) {
    if (permissionsSelect.where((element) => element.module == item.module).isEmpty) {
      permissionsSelect.add(PermissionSelect(module: item.module, read: false, write: false));
    }
  }

  for (var item in permissionsSelect) {
    for (var item2 in data) {
      if (item.module == item2.module) {
        item.write = false;
        item.read = false;
      }
    }
  }
  return permissionsSelect;
}

/// -------------------- 搜索值 --------------------

@riverpod
class ValueSearchInLocation extends _$ValueSearchInLocation {
  @override
  String build() => "";

  void setValue(String value) => state = value;
}

@riverpod
class ValueSearchInRole extends _$ValueSearchInRole {
  @override
  String build() => "";

  void setValue(String value) => state = value;
}

@riverpod
class ValueSearchInUser extends _$ValueSearchInUser {
  @override
  String build() => "";

  void setValue(String value) => state = value;
}

//退出登录后 清空数据
void clearUserProvider(WidgetRef ref) {
  ref.invalidate(itemsUserModelProvider);
  ref.invalidate(itemsUserModelFilteredProvider);
  ref.invalidate(itemsRoleModelProvider);
  ref.invalidate(roleUIManagerProvider);
  ref.invalidate(indexUsersProvider);
  ref.invalidate(valueSearchInLocationProvider);
  ref.invalidate(valueSearchInRoleProvider);
  ref.invalidate(valueSearchInUserProvider);
  ref.invalidate(getUsersProvider);
  ref.invalidate(getRolesProvider);
  ref.invalidate(getPermissionsProvider);
  ref.invalidate(addUserProvider);
  ref.invalidate(deleteUserProvider);
  ref.invalidate(addRoleProvider);
  ref.invalidate(deleteRoleProvider);
}
