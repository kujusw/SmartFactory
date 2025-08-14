import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/role_permisiion_model.dart';

class SetPermissionManager extends StateNotifier<List<RolePermissionModel>> {
  SetPermissionManager()
      : super(
          [
            RolePermissionModel(
              id: "1",
              role: "",
              permission: "Tenants",
              viewOnly: false,
              fullAccess: false,
            ),
            RolePermissionModel(
              id: "2",
              role: "",
              permission: "Locations",
              viewOnly: false,
              fullAccess: false,
            ),
            RolePermissionModel(
              id: "3",
              role: "",
              permission: "Boards",
              viewOnly: false,
              fullAccess: false,
            ),
            RolePermissionModel(
              id: "4",
              role: "",
              permission: "Devices",
              viewOnly: false,
              fullAccess: false,
            ),
            RolePermissionModel(
              id: "5",
              role: "",
              permission: "Users",
              viewOnly: false,
              fullAccess: false,
            ),
            RolePermissionModel(
              id: "6",
              role: "",
              permission: "Roles",
              viewOnly: false,
              fullAccess: false,
            ),
            RolePermissionModel(
              id: "7",
              role: "",
              permission: "Audit",
              viewOnly: false,
              fullAccess: false,
            ),
            RolePermissionModel(
              id: "8",
              role: "",
              permission: "Reports",
              viewOnly: false,
              fullAccess: false,
            ),
          ],
        );

  //更新role
  void updateRole(String role) {
    state = state.map((permissionModel) {
      permissionModel.role = role;
      return permissionModel;
    }).toList();
  }

  //更新权限
  void updatePermission(String role, String permission, bool viewOnly, bool fullAccess) {
    state = state.map((permissionModel) {
      if (permissionModel.role == role && permissionModel.permission == permission) {
        permissionModel.viewOnly = viewOnly;
        permissionModel.fullAccess = fullAccess;
      }
      return permissionModel;
    }).toList();
  }
}
