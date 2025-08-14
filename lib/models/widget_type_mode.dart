import 'dart:convert';

class WidgetTypeModel {
  String? id;
  String? name;
  String? type;

  WidgetTypeModel({
    this.id,
    this.name,
    this.type,
  });

  factory WidgetTypeModel.fromRawJson(String str) => WidgetTypeModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory WidgetTypeModel.fromJson(Map<String, dynamic> json) => WidgetTypeModel(
        id: json["id"],
        name: json["name"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "type": type,
      };

  @override
  String toString() {
    return jsonEncode(this);
  }
}
