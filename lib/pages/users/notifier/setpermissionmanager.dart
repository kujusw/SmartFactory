import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../models/role_permisiion_model.dart';

part 'setpermissionmanager.g.dart';

@riverpod
class SetPermissionManager extends _$SetPermissionManager {
  @override
  List<RolePermissionModel> build() {
    return [
      RolePermissionModel(id: "1", role: "", permission: "Tenants", viewOnly: false, fullAccess: false),
      RolePermissionModel(id: "2", role: "", permission: "Locations", viewOnly: false, fullAccess: false),
      RolePermissionModel(id: "3", role: "", permission: "Boards", viewOnly: false, fullAccess: false),
      RolePermissionModel(id: "4", role: "", permission: "Devices", viewOnly: false, fullAccess: false),
      RolePermissionModel(id: "5", role: "", permission: "Users", viewOnly: false, fullAccess: false),
      RolePermissionModel(id: "6", role: "", permission: "Roles", viewOnly: false, fullAccess: false),
      RolePermissionModel(id: "7", role: "", permission: "Audit", viewOnly: false, fullAccess: false),
      RolePermissionModel(id: "8", role: "", permission: "Reports", viewOnly: false, fullAccess: false),
    ];
  }

  /// 更新所有角色名
  void updateRole(String role) {
    state = state.map((permissionModel) => permissionModel.copyWith(role: role)).toList();
  }

  /// 更新单个权限
  void updatePermission({
    required String role,
    required String permission,
    required bool viewOnly,
    required bool fullAccess,
  }) {
    state = state.map((permissionModel) {
      if (permissionModel.role == role && permissionModel.permission == permission) {
        return permissionModel.copyWith(viewOnly: viewOnly, fullAccess: fullAccess);
      }
      return permissionModel;
    }).toList();
  }

  /// 重置所有权限
  void resetPermissions() {
    state = state.map((permissionModel) {
      return permissionModel.copyWith(viewOnly: false, fullAccess: false);
    }).toList();
  }
}
