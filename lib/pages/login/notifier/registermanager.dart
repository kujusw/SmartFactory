import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../common/utils/logger_manager.dart';
import '../../../http/register.dart';
import '../../../models/register_model.dart';

class RegisterManager extends StateNotifier<RegisterResponseEntity> {
  RegisterManager(super.state);

  Future<void> register(params) async {
    try {
      // 假设注册成功
      RegisterResponseEntity result = await RegisterAPI.register(params: params);
      LoggerManager().d("注册结果:" + result.toString());
      state = result;
    } catch (e) {
      // 如果发生错误
      LoggerManager().e("注册失败:" + e.toString());
      state = RegisterResponseEntity(code: 201, msg: "Register failed");
    }
  }
}
