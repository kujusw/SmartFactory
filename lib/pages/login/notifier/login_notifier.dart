import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../models/login_model.dart';
import '../../../models/register_model.dart';
import 'loginmanager.dart';
import 'loginoutmanager.dart';
import 'registermanager.dart';
import 'resetpasswordmanager.dart';

final signinProvider = StateProvider((ref) => "SIGNIN");

final registerProvider = StateNotifierProvider<RegisterManager, RegisterResponseEntity>((ref) {
  return RegisterManager(RegisterResponseEntity(code: 0, msg: ""));
});

final loginProvider = StateNotifierProvider<LoginManager, LoginResponseEntity>((ref) {
  return LoginManager(LoginResponseEntity(code: 0, message: ""));
});

final resetPasswordrProvider = StateNotifierProvider<ResetPasswordManager, ResetPasswordResponseEntity>((ref) {
  return ResetPasswordManager(ResetPasswordResponseEntity(code: 0, message: ""));
});

final loginUserName = StateProvider((ref) => "");
//登录时间
final loginTime = StateProvider((ref) => "");

final loginOutProvider = StateNotifierProvider<LoginOutManager, LoginOutResponseEntity>((ref) {
  return LoginOutManager(LoginOutResponseEntity(code: 0, message: ""));
});
