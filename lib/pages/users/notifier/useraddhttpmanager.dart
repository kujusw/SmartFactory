import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../http/user.dart';
import '../../../models/user_manager_model.dart';

part 'useraddhttpmanager.g.dart';

@riverpod
class UserAddLocation extends _$UserAddLocation {
  @override
  String build() => "";

  void set(String value) => state = value;
}

@riverpod
class UserAddRole extends _$UserAddRole {
  @override
  String build() => "";

  void set(String value) => state = value;
}

@riverpod
class UserAddPassword extends _$UserAddPassword {
  @override
  String build() => "";

  void set(String value) => state = value;
}

@riverpod
class UserAddPasswordValid extends _$UserAddPasswordValid {
  @override
  bool build() => true;

  void set(bool value) => state = value;
}

@riverpod
class UserAddEmail extends _$UserAddEmail {
  @override
  String build() => "";

  void set(String value) => state = value;
}

@riverpod
class UserAddEmailValid extends _$UserAddEmailValid {
  @override
  bool build() => true;

  void set(bool value) => state = value;
}

@riverpod
class UserAddName extends _$UserAddName {
  @override
  String build() => "";

  void set(String value) => state = value;
}

@riverpod
class UserAddHttpManager extends _$UserAddHttpManager {
  @override
  AddUserResponseEntity build() {
    // 初始化为空对象
    return AddUserResponseEntity(code: 0, message: "");
  }

  /// 新增用户
  Future<bool> addUser(dynamic params, String? token) async {
    try {
      final result = await UserAPI.addUser(params: params, token: token);
      state = result;
      return true;
    } catch (e) {
      state = AddUserResponseEntity(code: 201, message: "Add User failed");
      return false;
    }
  }

  /// 更新用户
  Future<bool> updateUser(dynamic id, dynamic params, String? token) async {
    try {
      final result = await UserAPI.updateUser(id: id, params: params, token: token);
      state = result;
      return true;
    } catch (e) {
      state = AddUserResponseEntity(code: 201, message: "Update User failed");
      return false;
    }
  }
}
