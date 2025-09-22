import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../models/user_role_model.dart';

part 'roleuimanager.g.dart';

@riverpod
class RoleUIManager extends _$RoleUIManager {
  @override
  List<RoleModel> build() {
    return [];
  }

  /// 添加单个角色
  void addRole(RoleModel roleModel) {
    state = [...state, roleModel];
  }

  /// 添加多个角色
  void addRoleList(List<RoleModel> roleList) {
    state = [...state, ...roleList];
  }

  /// 删除单个角色
  void removeRole(RoleModel roleModel) {
    state = state.where((t) => t != roleModel).toList();
  }

  /// 删除多个角色
  void removeRoleList(List<RoleModel> roleList) {
    state = state.where((t) => !roleList.contains(t)).toList();
  }

  /// 更新角色
  void updateRole(RoleModel updatedRole) {
    state = state.map((t) => t.id == updatedRole.id ? updatedRole : t).toList();
  }

  /// 设置整个角色列表
  void setRoles(List<RoleModel> roleList) {
    state = roleList;
  }

  /// 选中或取消选中所有角色
  void selectAll(bool selected) {
    state = state.map((t) => RoleModel(id: t.id, name: t.name, selected: selected)).toList();
  }

  /// 根据搜索文本过滤角色
  List<RoleModel> getSearchRoles(String query) {
    return state.where((element) => element.name!.toLowerCase().contains(query.toLowerCase())).toList();
  }

  /// 清空角色列表
  void clearRoles() {
    state = [];
  }
}
