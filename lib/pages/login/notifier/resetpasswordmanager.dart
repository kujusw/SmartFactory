import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../common/utils/logger_manager.dart';
import '../../../http/resetpassword.dart';
import '../../../models/login_model.dart';

part 'resetpasswordmanager.g.dart';

@riverpod
class ResetPassword extends _$ResetPassword {
  @override
  ResetPasswordResponseEntity build() {
    // 初始状态
    return ResetPasswordResponseEntity(code: 0, message: "");
  }

  /// 重置密码方法
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
