import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../common/utils/logger_manager.dart';
import '../../../http/resetpassword.dart';
import '../../../models/login_model.dart';

class ResetPasswordManager extends StateNotifier<ResetPasswordResponseEntity> {
  ResetPasswordManager(super.state);

  Future<void> resetPassword(ResetPasswordRequestEntity params) async {
    try {
      LoggerManager().d("重置密码 email:" + params.toRawJson());
      ResetPasswordResponseEntity result = await ResetPasswordAPI.resetPassword(params: params);
      LoggerManager().d("重置密码结果:" + result.toString());
      state = result;
    } catch (e) {
      // 如果发生错误
      LoggerManager().e("重置密码失败:" + e.toString());

      state = ResetPasswordResponseEntity(code: 201, message: "Reset failed");
    }
  }
}
