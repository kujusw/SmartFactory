import '../common/values/constant.dart';
import '../models/user_role_model.dart';
import 'http.dart';

class RoleAPI {
  static Future<UserRoleResponseModel> getRoles({
    String? path,
    String? token,
  }) async {
    var response = await HttpUtil(url: Constant.HOST, token: token).get(path!);
    // LoggerManager().d("RoleAPI.getRoles response: $response");
    return UserRoleResponseModel.fromJson(response);
  }

  static getPermissions({required String path, String? token}) async {
    var response = await HttpUtil(url: Constant.HOST, token: token).get(path);
    // LoggerManager().d("RoleAPI.getPermissions response: $response");
    return PermissionsResponseEntity.fromJson(response);
  }

  static Future<AddRoleResponseEntity> addRole({
    AddRoleRequestEntity? params,
    String? token,
  }) async {
    var response = await HttpUtil(url: Constant.HOST, token: token).post(
      "v1/roles",
      data: params?.toJson(),
    );
    return AddRoleResponseEntity.fromJson(response);
  }

  static Future<AddRoleResponseEntity> updateRole({
    int? id,
    AddRoleRequestEntity? params,
    String? token,
  }) async {
    var response = await HttpUtil(url: Constant.HOST, token: token).put(
      "v1/roles/${id}",
      data: params?.toJson(),
    );
    return AddRoleResponseEntity.fromJson(response);
  }

  static Future<DeleteRoleResponseEntity> deleteRole({
    int? id,
    String? token,
  }) async {
    var response = await HttpUtil(url: Constant.HOST, token: token).delete("v1/roles/${id}");
    // LoggerManager().d("RoleAPI.deleteRole response: $response");
    return DeleteRoleResponseEntity.fromJson(response);
  }
}
