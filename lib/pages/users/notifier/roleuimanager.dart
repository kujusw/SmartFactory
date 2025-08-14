import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../models/user_role_model.dart';

class RoleUIManager extends StateNotifier<List<RoleModel>> {
  RoleUIManager() : super([]) {}

  void addRole(RoleModel roleModel) {
    state = [...state, roleModel];
  }

  void addRoleList(List<RoleModel> roleModel) {
    state = [...state, ...roleModel];
  }

  void removeRole(RoleModel roleModel) {
    state = state.where((t) => t != roleModel).toList();
  }

  void removeRoleList(List<RoleModel> roleModel) {
    state = state.where((t) => !roleModel.contains(t)).toList();
  }

  //通过id 更新
  void updateRole(RoleModel newRoleModel) {
    state = state.map((t) => t.id == newRoleModel.id ? newRoleModel : t).toList();
  }

  //设置集合
  void setRoles(List<RoleModel> roleModels) {
    state = roleModels; //这样写会有问题 hashcode一样 改变UI数据会影响到原始数据
    // state = roleManagerModels.map((role) => RoleManagerModel.copy(role)).toList();
  }

  //选中所有
  void selectAll(bool selected) {
    state = state
        .map((t) => RoleModel(
              id: t.id,
              name: t.name,
              selected: selected,
            ))
        .toList();
  }

  getSearchRoles(String watch) {
    return state.where((element) {
      //忽略大小写
      return element.name!.toLowerCase().contains(watch.toLowerCase());
    }).toList();
  }

  void clearRoles() {
    state = [];
  }
}
