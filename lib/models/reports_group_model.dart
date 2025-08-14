import 'dart:convert';

class ReportsGroupsModel {
  String? id;
  String? name;
  String? value;
  String? description;
  String? createdAt;
  String? updatedAt;
  bool selected;

  ReportsGroupsModel({
    this.id,
    this.name,
    this.value,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.selected = false,
  });

  factory ReportsGroupsModel.fromRawJson(String str) => ReportsGroupsModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ReportsGroupsModel.fromJson(Map<String, dynamic> json) => ReportsGroupsModel(
        id: json.containsKey("id") ? json["id"] : "",
        name: json.containsKey("name") ? json["name"] : "",
        value: json.containsKey("value") ? json["value"] : "",
        description: json.containsKey("description") ? json["description"] : "",
        createdAt: json.containsKey("createdAt") ? json["createdAt"] : "",
        updatedAt: json.containsKey("updatedAt") ? json["updatedAt"] : "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "value": value,
        "description": description,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
      };
}
