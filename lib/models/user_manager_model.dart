//Name Email Role Status Mobile Number Location Date Last Login

import 'dart:convert';

class UserResponseModel {
  final int? code;
  final List<UserModel>? data;
  final String? message;

  UserResponseModel({
    this.code,
    this.data,
    this.message,
  });

  UserResponseModel copyWith({
    int? code,
    List<UserModel>? data,
    String? message,
  }) =>
      UserResponseModel(
        code: code ?? this.code,
        data: data ?? this.data,
        message: message ?? this.message,
      );

  factory UserResponseModel.fromRawJson(String str) => UserResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserResponseModel.fromJson(Map<String, dynamic> json) => UserResponseModel(
        code: json["code"],
        data: json["data"] == null ? [] : List<UserModel>.from(json["data"]!.map((x) => UserModel.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
        "message": message,
      };
}

class UserModel {
  final int? createdAt;
  final String? email;
  final int? id;
  final bool? isActive;
  final bool? isAdmin;
  final bool? isVerified;
  final int? lastLogin;
  final String? username;
  final List<int>? locationIds;
  final int? roleId;
  bool? selected;

  UserModel({
    this.createdAt,
    this.email,
    this.id,
    this.isActive,
    this.isAdmin,
    this.isVerified,
    this.lastLogin,
    this.username,
    this.locationIds,
    this.roleId,
    this.selected,
  });

  UserModel copyWith({
    int? createdAt,
    String? email,
    int? id,
    bool? isActive,
    bool? isAdmin,
    bool? isVerified,
    int? lastLogin,
    String? username,
    List<int>? locationIds,
    int? roleId,
    bool? selected,
  }) =>
      UserModel(
        createdAt: createdAt ?? this.createdAt,
        email: email ?? this.email,
        id: id ?? this.id,
        isActive: isActive ?? this.isActive,
        isAdmin: isAdmin ?? this.isAdmin,
        isVerified: isVerified ?? this.isVerified,
        lastLogin: lastLogin ?? this.lastLogin,
        username: username ?? this.username,
        locationIds: locationIds ?? this.locationIds,
        roleId: roleId ?? this.roleId,
        selected: selected ?? this.selected,
      );

  factory UserModel.fromRawJson(String str) => UserModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        createdAt: json.containsKey("created_at") ? json["created_at"] : 0,
        email: json.containsKey("email") ? json["email"] : "",
        id: json.containsKey("id") ? json["id"] : 0,
        isActive: json.containsKey("is_active") ? json["is_active"] : false,
        isAdmin: json.containsKey("is_admin") ? json["is_admin"] : false,
        isVerified: json.containsKey("is_verified") ? json["is_verified"] : false,
        lastLogin: json.containsKey("last_login") ? json["last_login"] : 0,
        username: json.containsKey("username") ? json["username"] : "",
        locationIds: json.containsKey("location_ids") ? List<int>.from(json["location_ids"].map((x) => x)) : [],
        roleId: json.containsKey("role_id") ? json["role_id"] : 0,
        selected: json.containsKey("selected") ? json["selected"] : false,
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel &&
        other.createdAt == createdAt &&
        other.email == email &&
        other.id == id &&
        other.isActive == isActive &&
        other.isAdmin == isAdmin &&
        other.isVerified == isVerified &&
        other.lastLogin == lastLogin &&
        other.username == username &&
        other.locationIds == locationIds &&
        other.roleId == roleId &&
        other.selected == selected;
  }

  Map<String, dynamic> toJson() => {
        "created_at": createdAt,
        "email": email,
        "id": id,
        "is_active": isActive,
        "is_admin": isAdmin,
        "is_verified": isVerified,
        "last_login": lastLogin,
        "username": username,
        "location_ids": locationIds == null ? [] : List<dynamic>.from(locationIds!.map((x) => x)),
        "role_id": roleId,
        "selected": selected,
      };

  @override
  String toString() {
    return jsonEncode(this);
  }
}

class AddUserRequestEntity {
  final String? username;
  final String? password;
  final String? email;
  final int? roleId;
  final List<int>? locationIds;

  AddUserRequestEntity({this.username, this.password, this.email, this.roleId, this.locationIds});

  AddUserRequestEntity copyWith({
    String? username,
    String? password,
    String? email,
    int? roleId,
    List<int>? locationIds,
  }) =>
      AddUserRequestEntity(
        username: username ?? this.username,
        password: password ?? this.password,
        email: email ?? this.email,
        roleId: roleId ?? this.roleId,
        locationIds: locationIds ?? this.locationIds,
      );

  factory AddUserRequestEntity.fromRawJson(String str) => AddUserRequestEntity.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AddUserRequestEntity.fromJson(Map<String, dynamic> json) => AddUserRequestEntity(
        username: json.containsKey("username") ? json["username"] : "",
        password: json.containsKey("password") ? json["password"] : "",
        email: json.containsKey("email") ? json["email"] : "",
        roleId: json.containsKey("role_id") ? json["role_id"] : 0,
        locationIds: json.containsKey("role_id")
            ? json["location_ids"] == null
                ? []
                : List<int>.from(json["location_ids"]!.map((x) => x))
            : [],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
        "email": email,
        "role_id": roleId,
        "location_ids": locationIds == null ? [] : List<dynamic>.from(locationIds!.map((x) => x)),
      };
}

class AddUserResponseEntity {
  final int? code;
  final String? message;

  AddUserResponseEntity({
    this.code,
    this.message,
  });

  AddUserResponseEntity copyWith({
    int? code,
    String? message,
  }) =>
      AddUserResponseEntity(
        code: code ?? this.code,
        message: message ?? this.message,
      );

  factory AddUserResponseEntity.fromRawJson(String str) => AddUserResponseEntity.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AddUserResponseEntity.fromJson(Map<String, dynamic> json) => AddUserResponseEntity(
        code: json.containsKey("code") ? json["code"] : 0,
        message: json.containsKey("message") ? json["message"] : "",
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
      };
}

class DeleteUserResponseEntity {
  final int? code;
  final String? message;

  DeleteUserResponseEntity({
    this.code,
    this.message,
  });

  DeleteUserResponseEntity copyWith({
    int? code,
    String? message,
  }) =>
      DeleteUserResponseEntity(
        code: code ?? this.code,
        message: message ?? this.message,
      );

  factory DeleteUserResponseEntity.fromRawJson(String str) => DeleteUserResponseEntity.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DeleteUserResponseEntity.fromJson(Map<String, dynamic> json) => DeleteUserResponseEntity(
        code: json.containsKey("code") ? json["code"] : 0,
        message: json.containsKey("message") ? json["message"] : "",
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
      };
}

class UpdateUserRequestEntity {
  final String? username;
  final int? roleId;
  final List<int>? locationIds;

  UpdateUserRequestEntity({
    this.username,
    this.roleId,
    this.locationIds,
  });

  UpdateUserRequestEntity copyWith({
    String? username,
    int? roleId,
    List<int>? locationIds,
  }) =>
      UpdateUserRequestEntity(
        username: username ?? this.username,
        roleId: roleId ?? this.roleId,
        locationIds: locationIds ?? this.locationIds,
      );

  factory UpdateUserRequestEntity.fromRawJson(String str) => UpdateUserRequestEntity.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UpdateUserRequestEntity.fromJson(Map<String, dynamic> json) => UpdateUserRequestEntity(
        username: json.containsKey("username") ? json["username"] : "",
        roleId: json.containsKey("role_id") ? json["role_id"] : 0,
        locationIds: json.containsKey("location_ids") ? List<int>.from(json["location_ids"].map((x) => x)) : [],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "role_id": roleId,
        "location_ids": locationIds == null ? [] : List<dynamic>.from(locationIds!.map((x) => x)),
      };
}
