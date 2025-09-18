import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../common/utils/logger_manager.dart';
import '../../../http/login.dart';
import '../../../http/register.dart';
import '../../../http/resetpassword.dart';
import '../../../models/login_model.dart';
import '../../../models/register_model.dart';

part 'login_notifier.g.dart';

// 登录模式
@riverpod
class Signin extends _$Signin {
  @override
  String build() => "SIGNIN";

  void set(String value) => state = value;
}

// 用户名
@riverpod
class LoginUserName extends _$LoginUserName {
  @override
  String build() => "";

  void set(String value) => state = value;
}

// 登录时间
@riverpod
class LoginTime extends _$LoginTime {
  @override
  String build() => "";

  void set(String value) => state = value;
}

// 密码是否可见
@riverpod
class ObscureText extends _$ObscureText {
  @override
  bool build() => true;

  void toggle() => state = !state;
  void set(bool value) => state = value;
}

// 登录提示
@riverpod
class LoginTips extends _$LoginTips {
  @override
  String build() => "";

  void set(String value) => state = value;
}

// 登录
@riverpod
class Login extends _$Login {
  @override
  LoginResponseEntity build() => LoginResponseEntity(code: 0, message: "");

  Future<bool> login(LoginRequestEntity? params) async {
    try {
      final result = await LoginAPI.login(params: params);
      state = result;
      return true;
    } catch (e) {
      LoggerManager().e("Login error: $e");
      state = LoginResponseEntity(code: 201, message: "Login failed");
      return false;
    }
  }
}

// 注册
@riverpod
class Register extends _$Register {
  @override
  RegisterResponseEntity build() => RegisterResponseEntity(code: 0, msg: "");

  Future<void> register(RegisterRequestEntity? params) async {
    try {
      final result = await RegisterAPI.register(params: params);
      LoggerManager().d("注册结果: $result");
      state = result;
    } catch (e) {
      LoggerManager().e("注册失败: $e");
      state = RegisterResponseEntity(code: 201, msg: "Register failed");
    }
  }
}

// 重置密码（命名保持以匹配原来的 resetPasswordrProvider）
@riverpod
class ResetPasswordr extends _$ResetPasswordr {
  @override
  ResetPasswordResponseEntity build() => ResetPasswordResponseEntity(code: 0, message: "");

  Future<void> resetPassword(ResetPasswordRequestEntity params) async {
    try {
      LoggerManager().d("重置密码 email: ${params.toRawJson()}");
      final result = await ResetPasswordAPI.resetPassword(params: params);
      LoggerManager().d("重置密码结果: $result");
      state = result;
    } catch (e) {
      LoggerManager().e("重置密码失败: $e");
      state = ResetPasswordResponseEntity(code: 201, message: "Reset failed");
    }
  }
}

// 退出登录
@riverpod
class LoginOut extends _$LoginOut {
  @override
  LoginOutResponseEntity build() => LoginOutResponseEntity(code: 0, message: "");

  Future<bool> loginOut(String? token) async {
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
