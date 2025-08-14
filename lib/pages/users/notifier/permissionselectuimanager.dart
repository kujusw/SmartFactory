import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/user_role_model.dart';

class PermissionSelectUIManager extends StateNotifier<List<PermissionSelect>> {
  PermissionSelectUIManager() : super([]) {}

  void addPermissionSelect(PermissionSelect permissionSelect) {
    state = [...state, permissionSelect];
  }

  void addPermissionSelectList(List<PermissionSelect> permissionSelect) {
    state = [...state, ...permissionSelect];
  }

  void removePermissionSelect(PermissionSelect permissionSelect) {
    state = state.where((t) => t != permissionSelect).toList();
  }

  void removePermissionSelectList(List<PermissionSelect> permissionSelect) {
    state = state.where((t) => !permissionSelect.contains(t)).toList();
  }

  //通过id 更新
  void updatePermissionSelect(PermissionSelect permissionSelect) {
    state = state.map((t) => t.module == permissionSelect.module ? permissionSelect : t).toList();
  }

  //设置集合
  void setPermissionSelects(List<PermissionSelect> permissionSelects) {
    state = permissionSelects; //这样写会有问题 hashcode一样 改变UI数据会影响到原始数据
    // state = userManagerModels.map((user) => UserManagerModel.copy(user)).toList();
  }

  //重置选择 read write 为false
  void resetPermissionSelects() {
    state = state
        .map((t) => PermissionSelect(
              module: t.module,
              read: false,
              write: false,
            ))
        .toList();
  }

  void clearPermissionSelects() {
    state = [];
  }
}
