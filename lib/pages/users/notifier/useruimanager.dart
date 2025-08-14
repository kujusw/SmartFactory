import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../models/user_manager_model.dart';

class UserUIManager extends StateNotifier<List<UserModel>> {
  UserUIManager() : super([]) {}

  void addUser(UserModel userManagerModel) {
    state = [...state, userManagerModel];
  }

  void addUserList(List<UserModel> userManagerModel) {
    state = [...state, ...userManagerModel];
  }

  void removeUser(UserModel userManagerModel) {
    state = state.where((t) => t != userManagerModel).toList();
  }

  void removeUserList(List<UserModel> userManagerModel) {
    state = state.where((t) => !userManagerModel.contains(t)).toList();
  }

  //通过id 更新
  void updateUser(UserModel newUserManagerModel) {
    state = state.map((t) => t.id == newUserManagerModel.id ? newUserManagerModel : t).toList();
  }

  //设置集合
  void setUsers(List<UserModel> userModels) {
    state = userModels; //这样写会有问题 hashcode一样 改变UI数据会影响到原始数据
    // state = userManagerModels.map((user) => UserManagerModel.copy(user)).toList();
  }

  //选中所有
  void selectAll(bool selected) {
    state = state
        .map((t) => UserModel(
              id: t.id,
              username: t.username,
              email: t.email,
              isAdmin: t.isAdmin,
              isVerified: t.isVerified,
              isActive: t.isActive,
              createdAt: t.createdAt,
              lastLogin: t.lastLogin,
              selected: selected,
            ))
        .toList();
  }

  getSearchUsers(String watch) {
    return state.where((element) {
      //忽略大小写
      return element.username!.toLowerCase().contains(watch.toLowerCase());
    }).toList();
  }

  void clearUsers() {
    state = [];
  }
}
