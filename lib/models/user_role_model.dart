import 'dart:convert';

class UserRoleResponseModel {
  final int? code;
  final List<RoleModel>? data;
  final String? message;

  UserRoleResponseModel({
    this.code,
    this.data,
    this.message,
  });

  UserRoleResponseModel copyWith({
    int? code,
    List<RoleModel>? data,
    String? message,
  }) =>
      UserRoleResponseModel(
        code: code ?? this.code,
        data: data ?? this.data,
        message: message ?? this.message,
      );

  factory UserRoleResponseModel.fromRawJson(String str) => UserRoleResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserRoleResponseModel.fromJson(Map<String, dynamic> json) => UserRoleResponseModel(
        code: json.containsKey("code") ? json["code"] : 0,
        data: json.containsKey("data") ? List<RoleModel>.from(json["data"].map((x) => RoleModel.fromJson(x))) : [],
        message: json.containsKey("message") ? json["message"] : "",
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
        "message": message,
      };
}

class RoleModel {
  final int? id;
  final String? name;
  final List<Permission>? permissions;
  bool? selected;

  RoleModel({
    this.id,
    this.name,
    this.permissions,
    this.selected,
  });

  RoleModel copyWith({
    int? id,
    String? name,
    List<Permission>? permissions,
    bool? selected,
  }) =>
      RoleModel(
        id: id ?? this.id,
        name: name ?? this.name,
        permissions: permissions ?? this.permissions,
        selected: selected ?? this.selected,
      );

  factory RoleModel.fromRawJson(String str) => RoleModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RoleModel.fromJson(Map<String, dynamic> json) => RoleModel(
        id: json.containsKey("id") ? json["id"] : 0,
        name: json.containsKey("name") ? json["name"] : "",
        permissions: json.containsKey("permissions")
            ? List<Permission>.from(json["permissions"].map((x) => Permission.fromJson(x)))
            : [],
        selected: json.containsKey("selected") ? json["selected"] : false,
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RoleModel &&
        other.id == id &&
        other.name == name &&
        other.permissions == permissions &&
        other.selected == selected;
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "permissions": permissions == null ? [] : List<dynamic>.from(permissions!.map((x) => x.toJson())),
        "selected": selected,
      };

  @override
  String toString() {
    return jsonEncode(this);
  }
}

class Permission {
  final int? id;
  final String? module;
  final String? name;

  Permission({
    this.id,
    this.module,
    this.name,
  });

  Permission copyWith({
    int? id,
    String? module,
    String? name,
  }) =>
      Permission(
        id: id ?? this.id,
        module: module ?? this.module,
        name: name ?? this.name,
      );

  factory Permission.fromRawJson(String str) => Permission.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Permission.fromJson(Map<String, dynamic> json) => Permission(
        id: json.containsKey("id") ? json["id"] : 0,
        module: json.containsKey("module") ? json["module"] : "",
        name: json.containsKey("name") ? json["name"] : "",
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Permission && other.id == id && other.module == module && other.name == name;
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "module": module,
        "name": name,
      };

  @override
  String toString() {
    return jsonEncode(this);
  }
}

class PermissionSelect {
  final String? module;
  bool? read;
  bool? write;

  PermissionSelect({
    this.module,
    this.read,
    this.write,
  });

  PermissionSelect copyWith({
    String? module,
    bool? read,
    bool? write,
  }) =>
      PermissionSelect(
        module: module ?? this.module,
        read: read ?? this.read,
        write: write ?? this.write,
      );
  factory PermissionSelect.fromRawJson(String str) => PermissionSelect.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PermissionSelect.fromJson(Map<String, dynamic> json) => PermissionSelect(
        module: json.containsKey("module") ? json["module"] : "",
        read: json.containsKey("read") ? json["read"] : false,
        write: json.containsKey("write") ? json["write"] : false,
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PermissionSelect && other.module == module && other.read == read && other.write == write;
  }

  Map<String, dynamic> toJson() => {
        "module": module,
        "read": read,
        "write": write,
      };

  @override
  String toString() {
    return jsonEncode(this);
  }
}

class PermissionsResponseEntity {
  final int? code;
  final List<Permission>? data;
  final String? message;

  PermissionsResponseEntity({
    this.code,
    this.data,
    this.message,
  });

  PermissionsResponseEntity copyWith({
    int? code,
    List<Permission>? data,
    String? message,
  }) =>
      PermissionsResponseEntity(
        code: code ?? this.code,
        data: data ?? this.data,
        message: message ?? this.message,
      );

  factory PermissionsResponseEntity.fromRawJson(String str) => PermissionsResponseEntity.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PermissionsResponseEntity.fromJson(Map<String, dynamic> json) => PermissionsResponseEntity(
        code: json.containsKey("code") ? json["code"] : 0,
        data: json.containsKey("data") ? List<Permission>.from(json["data"].map((x) => Permission.fromJson(x))) : [],
        message: json.containsKey("message") ? json["message"] : "",
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
        "message": message,
      };
}

class AddRoleRequestEntity {
  final String? name;
  final List<int>? permissionIds;

  AddRoleRequestEntity({
    this.name,
    this.permissionIds,
  });

  AddRoleRequestEntity copyWith({
    String? name,
    List<int>? permissionIds,
  }) =>
      AddRoleRequestEntity(
        name: name ?? this.name,
        permissionIds: permissionIds ?? this.permissionIds,
      );

  factory AddRoleRequestEntity.fromRawJson(String str) => AddRoleRequestEntity.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AddRoleRequestEntity.fromJson(Map<String, dynamic> json) => AddRoleRequestEntity(
        name: json.containsKey("name") ? json["name"] : "",
        permissionIds: json.containsKey("permission_ids") ? List<int>.from(json["permission_ids"].map((x) => x)) : [],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "permission_ids": permissionIds == null ? [] : List<dynamic>.from(permissionIds!.map((x) => x)),
      };
}

class AddRoleResponseEntity {
  final int? code;
  final RoleId? data;
  final String? message;

  AddRoleResponseEntity({
    this.code,
    this.data,
    this.message,
  });

  AddRoleResponseEntity copyWith({
    int? code,
    RoleId? data,
    String? message,
  }) =>
      AddRoleResponseEntity(
        code: code ?? this.code,
        data: data ?? this.data,
        message: message ?? this.message,
      );

  factory AddRoleResponseEntity.fromRawJson(String str) => AddRoleResponseEntity.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AddRoleResponseEntity.fromJson(Map<String, dynamic> json) => AddRoleResponseEntity(
        code: json.containsKey("code") ? json["code"] : 0,
        data: json.containsKey("data") ? RoleId.fromJson(json["data"]) : RoleId(),
        message: json.containsKey("message") ? json["message"] : "",
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "data": data?.toJson(),
        "message": message,
      };
}

class RoleId {
  final int? roleId;

  RoleId({
    this.roleId,
  });

  RoleId copyWith({
    int? roleId,
  }) =>
      RoleId(
        roleId: roleId ?? this.roleId,
      );

  factory RoleId.fromRawJson(String str) => RoleId.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RoleId.fromJson(Map<String, dynamic> json) => RoleId(
        roleId: json["role_id"],
      );

  Map<String, dynamic> toJson() => {
        "role_id": roleId,
      };
}

class DeleteRoleResponseEntity {
  final int? code;
  final String? message;

  DeleteRoleResponseEntity({
    this.code,
    this.message,
  });

  DeleteRoleResponseEntity copyWith({
    int? code,
    String? message,
  }) =>
      DeleteRoleResponseEntity(
        code: code ?? this.code,
        message: message ?? this.message,
      );

  factory DeleteRoleResponseEntity.fromRawJson(String str) => DeleteRoleResponseEntity.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DeleteRoleResponseEntity.fromJson(Map<String, dynamic> json) => DeleteRoleResponseEntity(
        code: json.containsKey("code") ? json["code"] : 0,
        message: json.containsKey("message") ? json["message"] : "",
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
      };
}
