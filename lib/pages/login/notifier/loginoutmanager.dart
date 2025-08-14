import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../http/login.dart';
import '../../../models/login_model.dart';

class LoginOutManager extends StateNotifier<LoginOutResponseEntity> {
  LoginOutManager(super.state);

  Future<bool> loginOut(String? token) async {
    try {
      LoginOutResponseEntity result = await LoginAPI.loginOut(token: token);
      state = result;
      return true;
    } catch (e) {
      // 如果发生错误
      state = LoginOutResponseEntity(code: 201, message: "LoginOut failed");
      return false;
    }
  }
}
