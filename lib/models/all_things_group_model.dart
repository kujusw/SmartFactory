import 'dart:convert';

class AllThingsGroupsModel {
  String? id;
  String? name;
  String? description;
  String? createdAt;
  String? updatedAt;

  AllThingsGroupsModel({
    this.id,
    this.name,
    this.description,
    this.createdAt,
    this.updatedAt,
  });

  factory AllThingsGroupsModel.fromRawJson(String str) => AllThingsGroupsModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AllThingsGroupsModel.fromJson(Map<String, dynamic> json) => AllThingsGroupsModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
      };
}
