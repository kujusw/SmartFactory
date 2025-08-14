import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../common/utils/logger_manager.dart';
import '../../../http/login.dart';
import '../../../models/login_model.dart';

class LoginManager extends StateNotifier<LoginResponseEntity> {
  LoginManager(super.state);

  Future<bool> login(params) async {
    try {
      LoginResponseEntity result = await LoginAPI.login(params: params);
      state = result;
      return true;
    } catch (e) {
      // 如果发生错误
      LoggerManager().e("LoginManager login error: $e");
      state = LoginResponseEntity(code: 201, message: "Login failed");
      return false;
    }
  }
}
