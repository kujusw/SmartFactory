import '../common/values/constant.dart';
import '../models/login_model.dart';
import 'http.dart';

class LoginAPI {
  static Future<LoginResponseEntity> login({
    LoginRequestEntity? params,
  }) async {
    var response = await HttpUtil(url: Constant.HOST).post(
      'v1/users/login',
      data: params?.toJson(),
    );
    return LoginResponseEntity.fromJson(response);
  }

  static Future<LoginOutResponseEntity> loginOut({
    String? token,
  }) async {
    var response = await HttpUtil(url: Constant.HOST, token: token).post(
      'v1/users/logout',
      data: null,
    );
    return LoginOutResponseEntity.fromJson(response);
  }
}
