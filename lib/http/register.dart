import '../common/utils/logger_manager.dart';
import '../common/values/constant.dart';
import '../models/register_model.dart';
import 'http.dart';

class RegisterAPI {
  static Future<RegisterResponseEntity> register({
    RegisterRequestEntity? params,
  }) async {
    LoggerManager().d("获取注册参数:" + params.toString());
    Map<String, dynamic> response = await HttpUtil(url: Constant.HOST).post(
      'signup',
      data: params?.toJson(),
    );
    RegisterResponseEntity result = RegisterResponseEntity.fromJson(response);
    return result;
  }
}
