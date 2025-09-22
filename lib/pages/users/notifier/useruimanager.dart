import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../models/user_manager_model.dart';

part 'useruimanager.g.dart';

@riverpod
class UserUIManager extends _$UserUIManager {
  @override
  List<UserModel> build() => [];

  /// 添加单个用户
  void addUser(UserModel user) {
    state = [...state, user];
  }

  /// 添加用户列表
  void addUserList(List<UserModel> users) {
    state = [...state, ...users];
  }

  /// 删除单个用户
  void removeUser(UserModel user) {
    state = state.where((u) => u != user).toList();
  }

  /// 删除用户列表
  void removeUserList(List<UserModel> users) {
    state = state.where((u) => !users.contains(u)).toList();
  }

  /// 根据 id 更新用户
  void updateUser(UserModel updatedUser) {
    state = state.map((u) => u.id == updatedUser.id ? updatedUser : u).toList();
  }

  /// 设置整个用户列表
  void setUsers(List<UserModel> users) {
    state = users;
  }

  /// 全选 / 取消选中
  void selectAll(bool selected) {
    state = state.map((u) => u.copyWith(selected: selected)).toList();
  }

  /// 根据搜索关键字过滤用户
  List<UserModel> getSearchUsers(String keyword) {
    return state.where((u) => u.username?.toLowerCase().contains(keyword.toLowerCase()) ?? false).toList();
  }

  /// 清空用户列表
  void clearUsers() {
    state = [];
  }
}
