import 'dart:convert';

class AuditsResponseEntity {
  final int? code;
  final Data? data;
  final String? message;

  AuditsResponseEntity({
    this.code,
    this.data,
    this.message,
  });

  AuditsResponseEntity copyWith({
    int? code,
    Data? data,
    String? message,
  }) =>
      AuditsResponseEntity(
        code: code ?? this.code,
        data: data ?? this.data,
        message: message ?? this.message,
      );

  factory AuditsResponseEntity.fromRawJson(String str) => AuditsResponseEntity.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AuditsResponseEntity.fromJson(Map<String, dynamic> json) => AuditsResponseEntity(
        code: json.containsKey("code") ? json["code"] : null,
        data: json.containsKey("data") ? Data.fromJson(json["data"]) : null,
        message: json["message"],
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
  final List<Audit>? logs;
  final int? page;
  final int? perPage;
  final int? totalPages;
  final int? totalRecords;

  Data({
    this.logs,
    this.page,
    this.perPage,
    this.totalPages,
    this.totalRecords,
  });

  Data copyWith({
    List<Audit>? logs,
    int? page,
    int? perPage,
    int? totalPages,
    int? totalRecords,
  }) =>
      Data(
        logs: logs ?? this.logs,
        page: page ?? this.page,
        perPage: perPage ?? this.perPage,
        totalPages: totalPages ?? this.totalPages,
        totalRecords: totalRecords ?? this.totalRecords,
      );

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        logs: json.containsKey("logs") ? List<Audit>.from(json["logs"].map((x) => Audit.fromJson(x))) : null,
        page: json.containsKey("page") ? json["page"] : null,
        perPage: json.containsKey("per_page") ? json["per_page"] : null,
        totalPages: json.containsKey("total_pages") ? json["total_pages"] : null,
        totalRecords: json.containsKey("total_records") ? json["total_records"] : null,
      );

  Map<String, dynamic> toJson() => {
        "logs": logs == null ? [] : List<dynamic>.from(logs!.map((x) => x.toJson())),
        "page": page,
        "per_page": perPage,
        "total_pages": totalPages,
        "total_records": totalRecords,
      };

  @override
  String toString() {
    return jsonEncode(this);
  }
}

class Audit {
  final String? action;
  final int? createdAt;
  final String? email;
  final int? id;
  final bool? isAdmin;
  final int? roleId;
  final String? roleName;
  final bool? success;
  final int? userId;
  final String? username;

  Audit({
    this.action,
    this.createdAt,
    this.email,
    this.id,
    this.isAdmin,
    this.roleId,
    this.roleName,
    this.success,
    this.userId,
    this.username,
  });

  Audit copyWith({
    String? action,
    int? createdAt,
    String? email,
    int? id,
    bool? isAdmin,
    int? roleId,
    String? roleName,
    bool? success,
    int? userId,
    String? username,
  }) =>
      Audit(
        action: action ?? this.action,
        createdAt: createdAt ?? this.createdAt,
        email: email ?? this.email,
        id: id ?? this.id,
        isAdmin: isAdmin ?? this.isAdmin,
        roleId: roleId ?? this.roleId,
        roleName: roleName ?? this.roleName,
        success: success ?? this.success,
        userId: userId ?? this.userId,
        username: username ?? this.username,
      );

  factory Audit.fromRawJson(String str) => Audit.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Audit.fromJson(Map<String, dynamic> json) => Audit(
        action: json.containsKey("action") ? json["action"] : null,
        createdAt: json.containsKey("created_at") ? json["created_at"] : null,
        email: json.containsKey("email") ? json["email"] : null,
        id: json.containsKey("id") ? json["id"] : null,
        isAdmin: json.containsKey("is_admin") ? json["is_admin"] : null,
        roleId: json.containsKey("role_id") ? json["role_id"] : null,
        roleName: json.containsKey("role_name") ? json["role_name"] : null,
        success: json.containsKey("success") ? json["success"] : null,
        userId: json.containsKey("user_id") ? json["user_id"] : null,
        username: json.containsKey("username") ? json["username"] : null,
      );

  Map<String, dynamic> toJson() => {
        "action": action,
        "created_at": createdAt,
        "email": email,
        "id": id,
        "is_admin": isAdmin,
        "role_id": roleId,
        "role_name": roleName,
        "success": success,
        "user_id": userId,
        "username": username,
      };

  @override
  String toString() {
    return jsonEncode(this);
  }
}
