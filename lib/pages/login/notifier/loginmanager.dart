import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../common/utils/logger_manager.dart';
import '../../../http/login.dart';
import '../../../models/login_model.dart';

part 'loginmanager.g.dart';

@riverpod
class Login extends _$Login {
  @override
  LoginResponseEntity build() {
    // 初始状态可以根据需求设置
    return LoginResponseEntity(code: 0, message: "");
  }

  /// 登录方法
  Future<bool> login(LoginRequestEntity? params) async {
    try {
      final result = await LoginAPI.login(params: params);
      state = result;
      return true;
    } catch (e) {
      LoggerManager().e("Login login error: $e");
      state = LoginResponseEntity(code: 201, message: "Login failed");
      return false;
    }
  }
}
