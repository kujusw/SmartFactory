import '../common/values/constant.dart';
import '../models/user_manager_model.dart';
import 'http.dart';

class UserAPI {
  static Future<UserResponseModel> getUsers({
    String? path,
    String? token,
  }) async {
    var response = await HttpUtil(url: Constant.HOST, token: token).get(path!);
    // LoggerManager().d("UserAPI.getUsers response: ${userResponseModel.toRawJson()}");
    return UserResponseModel.fromJson(response);
  }

  static Future<AddUserResponseEntity> addUser({
    AddUserRequestEntity? params,
    String? token,
  }) async {
    var response = await HttpUtil(url: Constant.HOST, token: token).post(
      "v1/users/signup",
      data: params?.toJson(),
    );
    return AddUserResponseEntity.fromJson(response);
  }

  static Future<DeleteUserResponseEntity> deleteUser({
    int? id,
    String? token,
  }) async {
    var response = await HttpUtil(url: Constant.HOST, token: token).delete("v1/users/${id}");
    // LoggerManager().d("UserAPI.deleteUser response: $response");
    return DeleteUserResponseEntity.fromJson(response);
  }

  static Future<AddUserResponseEntity> updateUser({
    int? id,
    UpdateUserRequestEntity? params,
    String? token,
  }) async {
    var response = await HttpUtil(url: Constant.HOST, token: token).put(
      "v1/users/${id}",
      data: params?.toJson(),
    );
    return AddUserResponseEntity.fromJson(response);
  }
}
