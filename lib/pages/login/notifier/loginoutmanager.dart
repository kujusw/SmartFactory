import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../http/login.dart';
import '../../../models/login_model.dart';

part 'loginoutmanager.g.dart';

@riverpod
class LoginOut extends _$LoginOut {
  @override
  LoginOutResponseEntity build() {
    // 初始状态可以根据需求设置
    return LoginOutResponseEntity(code: 0, message: "");
  }

  /// 退出登录
  Future<bool> logout(String? token) async {
    try {
      final result = await LoginAPI.loginOut(token: token);
      state = result;
      return true;
    } catch (e) {
      state = LoginOutResponseEntity(code: 201, message: "LoginOut failed");
      return false;
    }
  }
}
