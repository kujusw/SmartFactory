import 'dart:convert';

import 'user_role_model.dart';

class LoginRequestEntity {
  String? username;
  String? password;

  LoginRequestEntity({
    this.username,
    this.password,
  });

  Map<String, dynamic> toJson() => {
        'username': username,
        'password': password,
      };

  factory LoginRequestEntity.fromJson(Map<String, dynamic> json) => LoginRequestEntity(
        username: json.containsKey('username') ? json['username'] : '',
        password: json.containsKey('password') ? json['password'] : '',
      );

  @override
  String toString() {
    return jsonEncode(this);
  }
}

class LoginResponseEntity {
  final int? code;
  final Data? data;
  final String? message;

  LoginResponseEntity({
    this.code,
    this.data,
    this.message,
  });

  LoginResponseEntity copyWith({
    int? code,
    Data? data,
    String? message,
  }) =>
      LoginResponseEntity(
        code: code ?? this.code,
        data: data ?? this.data,
        message: message ?? this.message,
      );

  factory LoginResponseEntity.fromRawJson(String str) => LoginResponseEntity.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LoginResponseEntity.fromJson(Map<String, dynamic> json) => LoginResponseEntity(
        code: json.containsKey('code') ? json["code"] : 0,
        data: json.containsKey('data')
            ? json["data"] == null
                ? null
                : Data.fromJson(json["data"])
            : null,
        message: json.containsKey('message') ? json["message"] : '',
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "data": data?.toJson(),
        "message": message,
      };

  @override
  String toString() {
    return jsonEncode(this);
  }
}

class Data {
  final String? token;
  final bool? isAdmin;
  final List<Permission>? permissions;

  Data({this.token, this.isAdmin, this.permissions});

  Data copyWith({
    bool? isAdmin,
    List<Permission>? permissions,
    String? token,
  }) =>
      Data(
        isAdmin: isAdmin ?? this.isAdmin,
        permissions: permissions ?? this.permissions,
        token: token ?? this.token,
      );

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        isAdmin: json.containsKey('is_admin') ? json["is_admin"] : false,
        permissions: json.containsKey('permissions')
            ? List<Permission>.from(json["permissions"].map((x) => Permission.fromJson(x)))
            : [],
        token: json.containsKey('token') ? json["token"] : '',
      );

  Map<String, dynamic> toJson() => {
        "is_admin": isAdmin,
        "permissions": permissions == null ? [] : List<dynamic>.from(permissions!.map((x) => x)),
        "token": token,
      };

  @override
  String toString() {
    return jsonEncode(this);
  }
}

class LoginOutResponseEntity {
  final int? code;
  final String? message;

  LoginOutResponseEntity({
    this.code,
    this.message,
  });

  LoginOutResponseEntity copyWith({
    int? code,
    String? message,
  }) =>
      LoginOutResponseEntity(
        code: code ?? this.code,
        message: message ?? this.message,
      );

  factory LoginOutResponseEntity.fromRawJson(String str) => LoginOutResponseEntity.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LoginOutResponseEntity.fromJson(Map<String, dynamic> json) => LoginOutResponseEntity(
        code: json["code"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
      };

  @override
  String toString() {
    return jsonEncode(this);
  }
}

class ResetPasswordRequestEntity {
  final String? email;

  ResetPasswordRequestEntity({
    this.email,
  });

  ResetPasswordRequestEntity copyWith({
    String? email,
  }) =>
      ResetPasswordRequestEntity(
        email: email ?? this.email,
      );

  factory ResetPasswordRequestEntity.fromRawJson(String str) => ResetPasswordRequestEntity.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ResetPasswordRequestEntity.fromJson(Map<String, dynamic> json) => ResetPasswordRequestEntity(
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
      };

  @override
  String toString() {
    return jsonEncode(this);
  }
}

class ResetPasswordResponseEntity {
  final int? code;
  final String? message;

  ResetPasswordResponseEntity({
    this.code,
    this.message,
  });

  ResetPasswordResponseEntity copyWith({
    int? code,
    String? message,
  }) =>
      ResetPasswordResponseEntity(
        code: code ?? this.code,
        message: message ?? this.message,
      );

  factory ResetPasswordResponseEntity.fromRawJson(String str) => ResetPasswordResponseEntity.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ResetPasswordResponseEntity.fromJson(Map<String, dynamic> json) => ResetPasswordResponseEntity(
        code: json.containsKey('code') ? json["code"] : 0,
        message: json.containsKey('message') ? json["message"] : '',
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
      };

  @override
  String toString() {
    return jsonEncode(this);
  }
}
