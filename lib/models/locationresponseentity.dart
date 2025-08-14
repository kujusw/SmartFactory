import 'dart:convert';

class AddLocationModelRequestEntity {
  final String? name;
  final String? building;
  final String? tenant;
  final int? area;

  AddLocationModelRequestEntity({
    this.name,
    this.building,
    this.tenant,
    this.area,
  });

  AddLocationModelRequestEntity copyWith({
    String? name,
    String? building,
    String? tenant,
    int? area,
  }) =>
      AddLocationModelRequestEntity(
        name: name ?? this.name,
        building: building ?? this.building,
        tenant: tenant ?? this.tenant,
        area: area ?? this.area,
      );

  factory AddLocationModelRequestEntity.fromRawJson(String str) =>
      AddLocationModelRequestEntity.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AddLocationModelRequestEntity.fromJson(Map<String, dynamic> json) => AddLocationModelRequestEntity(
        name: json.containsKey("name") ? json["name"] : "",
        building: json.containsKey("building") ? json["building"] : "",
        tenant: json.containsKey("tenant") ? json["tenant"] : "",
        area: json.containsKey("area") ? json["area"] : 0,
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "building": building,
        "tenant": tenant,
        "area": area,
      };

  @override
  String toString() {
    return jsonEncode(this);
  }
}

class LocationModelResponseEntity {
  final int? code;
  final List<LocationModel>? data;
  final String? message;

  LocationModelResponseEntity({
    this.code,
    this.data,
    this.message,
  });

  LocationModelResponseEntity copyWith({
    int? code,
    List<LocationModel>? data,
    String? message,
  }) =>
      LocationModelResponseEntity(
        code: code ?? this.code,
        data: data ?? this.data,
        message: message ?? this.message,
      );

  factory LocationModelResponseEntity.fromRawJson(String str) => LocationModelResponseEntity.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LocationModelResponseEntity.fromJson(Map<String, dynamic> json) => LocationModelResponseEntity(
        code: json["code"],
        data: json["data"] == null ? [] : List<LocationModel>.from(json["data"]!.map((x) => LocationModel.fromJson(x))),
        message: json["message"],
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

class LocationModel {
  final int? id;
  final String? name;
  final String? building;
  final String? tenant;
  final int? area;
  bool? selected;

  LocationModel({
    this.id,
    this.name,
    this.building,
    this.tenant,
    this.area,
    this.selected = false,
  });

  LocationModel copyWith({
    int? id,
    String? name,
    String? building,
    String? tenant,
    int? area,
    bool? selected,
  }) =>
      LocationModel(
        id: id ?? this.id,
        name: name ?? this.name,
        building: building ?? this.building,
        tenant: tenant ?? this.tenant,
        area: area ?? this.area,
        selected: selected ?? this.selected,
      );

  factory LocationModel.fromRawJson(String str) => LocationModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LocationModel.fromJson(Map<String, dynamic> json) => LocationModel(
        id: json.containsKey("id") ? json["id"] : "",
        name: json.containsKey("name") ? json["name"] : "",
        building: json.containsKey("building") ? json["building"] : "",
        tenant: json.containsKey("tenant") ? json["tenant"] : "",
        area: json.containsKey("area") ? json["area"] : 0,
        selected: json.containsKey("selected") ? json["selected"] : false,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "building": building,
        "tenant": tenant,
        "area": area,
        "selected": selected,
      };

  @override
  String toString() {
    return jsonEncode(this);
  }
}

class AddLocationResponseEntity {
  final int? code;
  final Data? data;
  final String? message;

  AddLocationResponseEntity({
    this.code,
    this.data,
    this.message,
  });

  AddLocationResponseEntity copyWith({
    int? code,
    Data? data,
    String? message,
  }) =>
      AddLocationResponseEntity(
        code: code ?? this.code,
        data: data ?? this.data,
        message: message ?? this.message,
      );

  factory AddLocationResponseEntity.fromRawJson(String str) => AddLocationResponseEntity.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AddLocationResponseEntity.fromJson(Map<String, dynamic> json) => AddLocationResponseEntity(
        code: json["code"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
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
  final int? locationId;

  Data({
    this.locationId,
  });

  Data copyWith({
    int? locationId,
  }) =>
      Data(
        locationId: locationId ?? this.locationId,
      );

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        locationId: json["location_id"],
      );

  Map<String, dynamic> toJson() => {
        "location_id": locationId,
      };

  @override
  String toString() {
    return jsonEncode(this);
  }
}

class DeleteLocationResponseEntity {
  final int? code;
  final String? message;

  DeleteLocationResponseEntity({
    this.code,
    this.message,
  });

  DeleteLocationResponseEntity copyWith({
    int? code,
    String? message,
  }) =>
      DeleteLocationResponseEntity(
        code: code ?? this.code,
        message: message ?? this.message,
      );

  factory DeleteLocationResponseEntity.fromRawJson(String str) =>
      DeleteLocationResponseEntity.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DeleteLocationResponseEntity.fromJson(Map<String, dynamic> json) => DeleteLocationResponseEntity(
        code: json.containsKey("code") ? json["code"] : 0,
        message: json.containsKey("message") ? json["message"] : "",
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
      };
}
