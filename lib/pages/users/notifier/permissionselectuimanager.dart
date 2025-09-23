import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../models/user_role_model.dart';

part 'permissionselectuimanager.g.dart';

@riverpod
class PermissionSelectUIManager extends _$PermissionSelectUIManager {
  @override
  List<PermissionSelect> build() {
    return [];
  }

  void addPermissionSelect(PermissionSelect permissionSelect) {
    state = [...state, permissionSelect];
  }

  void addPermissionSelectList(List<PermissionSelect> permissionSelects) {
    state = [...state, ...permissionSelects];
  }

  void removePermissionSelect(PermissionSelect permissionSelect) {
    state = state.where((t) => t != permissionSelect).toList();
  }

  void removePermissionSelectList(List<PermissionSelect> permissionSelects) {
    state = state.where((t) => !permissionSelects.contains(t)).toList();
  }

  /// 通过 module 更新
  void updatePermissionSelect(PermissionSelect permissionSelect) {
    state = state.map((t) => t.module == permissionSelect.module ? permissionSelect : t).toList();
  }

  /// 设置集合
  void setPermissionSelects(List<PermissionSelect> permissionSelects) {
    // 深拷贝，避免 UI 数据和原始数据共享引用
    state = permissionSelects.map((e) => e.copyWith()).toList();
  }

  /// 重置所有 read/write 为 false
  void resetPermissionSelects() {
    state = state.map((t) => t.copyWith(read: false, write: false)).toList();
  }

  void clearPermissionSelects() {
    state = [];
  }
}
