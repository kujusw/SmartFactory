import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../common/utils/logger_manager.dart';
import '../../../http/register.dart';
import '../../../models/register_model.dart';

part 'registermanager.g.dart';

@riverpod
class ObscureText extends _$ObscureText {
  @override
  bool build() => true;

  void toggle() => state = !state;
  void set(bool value) => state = value;
}

// 登录提示
@riverpod
class RegisterTips extends _$RegisterTips {
  @override
  String build() => "";

  void set(String value) => state = value;
}

@riverpod
class Register extends _$Register {
  @override
  RegisterResponseEntity build() {
    // 初始状态可以根据需求设置
    return RegisterResponseEntity(code: 0, msg: "");
  }

  /// 注册方法
  Future<void> register(RegisterRequestEntity params) async {
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
