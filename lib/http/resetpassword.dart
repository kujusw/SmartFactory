import '../common/utils/logger_manager.dart';
import '../common/values/constant.dart';
import '../models/login_model.dart';
import 'http.dart';

class ResetPasswordAPI {
  static Future<ResetPasswordResponseEntity> resetPassword({
    ResetPasswordRequestEntity? params,
  }) async {
    var response = await HttpUtil(url: Constant.HOST).post(
      'v1/users/password-reset-request',
      data: params?.toJson(),
    );
    LoggerManager().d(response);
    return ResetPasswordResponseEntity.fromJson(response);
  }
}
