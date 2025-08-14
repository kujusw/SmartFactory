import 'dart:convert';

class ReportsResponseEntity {
  final int? code;
  final List<ReportModel>? data;
  final String? message;

  ReportsResponseEntity({
    this.code,
    this.data,
    this.message,
  });

  ReportsResponseEntity copyWith({
    int? code,
    List<ReportModel>? data,
    String? message,
  }) =>
      ReportsResponseEntity(
        code: code ?? this.code,
        data: data ?? this.data,
        message: message ?? this.message,
      );

  factory ReportsResponseEntity.fromRawJson(String str) => ReportsResponseEntity.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ReportsResponseEntity.fromJson(Map<String, dynamic> json) => ReportsResponseEntity(
        code: json.containsKey("code") ? json["code"] : 0,
        data: json.containsKey("data") ? List<ReportModel>.from(json["data"].map((x) => ReportModel.fromJson(x))) : [],
        message: json.containsKey("message") ? json["message"] : "",
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
        "message": message,
      };

  @override
  String toString() {
    return jsonEncode(this);
  }
}

class ReportModel {
  final int? createdAt;
  final int? id;
  final String? name;
  final String? type;
  bool? selected;

  ReportModel({
    this.createdAt,
    this.id,
    this.name,
    this.type,
    this.selected,
  });

  ReportModel copyWith({
    int? createdAt,
    int? id,
    String? name,
    String? type,
    bool? selected,
  }) =>
      ReportModel(
        createdAt: createdAt ?? this.createdAt,
        id: id ?? this.id,
        name: name ?? this.name,
        type: type ?? this.type,
        selected: selected ?? this.selected,
      );

  factory ReportModel.fromRawJson(String str) => ReportModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ReportModel.fromJson(Map<String, dynamic> json) => ReportModel(
        createdAt: json.containsKey("created_at") ? json["created_at"] : "",
        id: json.containsKey("id") ? json["id"] : "",
        name: json.containsKey("name") ? json["name"] : "",
        type: json.containsKey("type") ? json["type"] : "",
        selected: json.containsKey("selected") ? json["selected"] : false,
      );

  Map<String, dynamic> toJson() => {
        "created_at": createdAt,
        "id": id,
        "name": name,
        "type": type,
        "selected": selected,
      };
  @override
  String toString() {
    return jsonEncode(this);
  }
}
