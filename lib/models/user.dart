// 注册请求
import 'dart:convert';

import '../common/utils/logger_manager.dart';

class UserRegisterRequestEntity {
  String email;
  String password;

  UserRegisterRequestEntity({
    required this.email,
    required this.password,
  });
  String toRawJson() => json.encode(toJson());
  factory UserRegisterRequestEntity.fromJson(Map<String, dynamic> json) => UserRegisterRequestEntity(
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
      };
}

// 登录请求
class UserLoginRequestEntity {
  String username;
  String password;
  String appName;
  int platformType;
  int userType;

  UserLoginRequestEntity({
    required this.username,
    required this.password,
    required this.appName,
    required this.platformType,
    required this.userType,
  });

  factory UserLoginRequestEntity.fromJson(Map<String, dynamic> json) => UserLoginRequestEntity(
        username: json["username"],
        password: json["password"],
        appName: json["appName"],
        platformType: json["platformType"],
        userType: json["userType"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
        "appName": appName,
        "platformType": platformType,
        "userType": userType,
      };
  String toRawJson() => json.encode(toJson());
}

// 登录返回

UserLoginResponseEntity userLoginResponseEntityFromJson(String str) =>
    UserLoginResponseEntity.fromJson(json.decode(str));

String userLoginResponseEntityToJson(UserLoginResponseEntity data) => json.encode(data.toJson());

class UserLoginResponseEntity {
  UserLoginResponseEntity({
    this.code,
    this.msg,
    this.result,
    this.info,
  });

  String? code;
  String? msg;
  String? result;
  Info? info;

  factory UserLoginResponseEntity.fromJson(Map<String, dynamic> json) {
    LoggerManager().d(json.toString());
    Info? infoResult;
    int? intValue = int.tryParse(json["result"]);
    if (intValue == null || intValue != 1) {
      infoResult = null;
    } else {
      infoResult = Info.fromJson(json["info"]);
    }
    LoggerManager().d(infoResult.toString());
    return UserLoginResponseEntity(
      code: json["code"],
      msg: json["msg"],
      result: json["result"],
      info: infoResult,
    );
  }

  Map<String, dynamic> toJson() => {
        "code": code,
        "msg": msg,
        "result": result,
        "info": info?.toJson(),
      };

  String toRawJson() => json.encode(toJson());
}

class Info {
  Info({
    this.userId,
    this.nickname,
    this.role,
    this.token,
    this.account,
    this.password,
  });

  String? userId;
  String? nickname;
  String? role;
  String? token;
  String? account;
  String? password;

  factory Info.fromJson(Map<String, dynamic> json) => Info(
        userId: json["userId"],
        nickname: json["nickname"],
        role: json["role"],
        token: json["token"],
        account: json["account"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "nickname": nickname,
        "role": role,
        "token": token,
        "account": account,
        "password": password,
      };

  String toRawJson() => json.encode(toJson());
}
