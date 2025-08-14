import 'dart:convert';

class RegisterRequestEntity {
  String? username;
  String? password;
  String? email;

  RegisterRequestEntity({
    this.username,
    this.password,
    this.email,
  });

  Map<String, dynamic> toJson() => {
        'username': username,
        'password': password,
        'email': email,
      };

  factory RegisterRequestEntity.fromJson(Map<String, dynamic> json) => RegisterRequestEntity(
        username: json.containsKey('username') ? json['username'] : '',
        password: json.containsKey('password') ? json['password'] : '',
        email: json.containsKey('email') ? json['email'] : '',
      );

  @override
  String toString() {
    return jsonEncode(this);
  }
}

class RegisterResponseEntity {
  final int? code;
  final String? data;
  final String? msg;

  RegisterResponseEntity({
    this.code,
    this.data,
    this.msg,
  });

  RegisterResponseEntity copyWith({
    int? code,
    String? data,
    String? msg,
  }) =>
      RegisterResponseEntity(
        code: code ?? this.code,
        data: data ?? this.data,
        msg: msg ?? this.msg,
      );

  factory RegisterResponseEntity.fromRawJson(String str) => RegisterResponseEntity.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RegisterResponseEntity.fromJson(Map<String, dynamic> json) => RegisterResponseEntity(
        code: json.containsKey('code') ? json["code"] : 0,
        data: json.containsKey('data') ? json["data"] : '',
        msg: json.containsKey('msg') ? json["msg"] : '',
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "data": data,
        "msg": msg,
      };

  @override
  String toString() {
    return jsonEncode(this);
  }
}
