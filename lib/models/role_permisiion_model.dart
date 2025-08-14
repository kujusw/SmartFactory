import 'dart:convert';

class RolePermissionModel {
  String? id;
  String? role;
  String? permission;
  bool? viewOnly;
  bool? fullAccess;

  RolePermissionModel({
    this.id,
    this.role,
    this.permission,
    this.viewOnly,
    this.fullAccess,
  });

  factory RolePermissionModel.fromRawJson(String str) => RolePermissionModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RolePermissionModel.fromJson(Map<String, dynamic> json) => RolePermissionModel(
        id: json.containsKey("id") ? json["id"] : "",
        role: json.containsKey("role") ? json["role"] : "",
        permission: json.containsKey("permission") ? json["permission"] : "",
        viewOnly: json.containsKey("viewOnly") ? json["viewOnly"] : false,
        fullAccess: json.containsKey("fullAccess") ? json["fullAccess"] : false,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "role": role,
        "permission": permission,
        "viewOnly": viewOnly,
        "fullAccess": fullAccess,
      };
  RolePermissionModel.copy(RolePermissionModel from)
      : this(
          id: from.id,
          role: from.role,
          permission: from.permission,
          viewOnly: from.viewOnly,
          fullAccess: from.fullAccess,
        );

  RolePermissionModel copyWith({
    String? id,
    String? role,
    String? permission,
    bool? viewOnly,
    bool? fullAccess,
  }) {
    return RolePermissionModel(
      id: id ?? this.id,
      role: role ?? this.role,
      permission: permission ?? this.permission,
      viewOnly: viewOnly ?? this.viewOnly,
      fullAccess: fullAccess ?? this.fullAccess,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RolePermissionModel &&
        other.id == id &&
        other.role == role &&
        other.permission == permission &&
        other.viewOnly == viewOnly &&
        other.fullAccess == fullAccess;
  }
}
