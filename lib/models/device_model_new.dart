import 'dart:convert';

class AddDeviceModelRequestEntity {
  String? deviceName;
  int? locationId;
  num? warningYellowThreshold;
  num? warningRedThreshold;
  List<String>? associatedDeviceIds;

  AddDeviceModelRequestEntity({
    this.deviceName,
    this.locationId,
    this.warningYellowThreshold,
    this.warningRedThreshold,
    this.associatedDeviceIds,
  });

  factory AddDeviceModelRequestEntity.fromRawJson(String str) => AddDeviceModelRequestEntity.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AddDeviceModelRequestEntity.fromJson(Map<String, dynamic> json) => AddDeviceModelRequestEntity(
        deviceName: json["device_name"],
        locationId: json["location_id"],
        warningYellowThreshold: json["warning_yellow_threshold"],
        warningRedThreshold: json["warning_red_threshold"],
        associatedDeviceIds: json["associated_device_ids"] == null
            ? []
            : List<String>.from(json["associated_device_ids"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "device_name": deviceName,
        "location_id": locationId,
        "warning_yellow_threshold": warningYellowThreshold,
        "warning_red_threshold": warningRedThreshold,
        "associated_device_ids":
            associatedDeviceIds == null ? [] : List<dynamic>.from(associatedDeviceIds!.map((x) => x)),
      };

  @override
  String toString() {
    return jsonEncode(this);
  }
}

class AddDeviceResponseEntity {
  final int? code;
  final DeviceModelNew? data;
  final String? message;

  AddDeviceResponseEntity({
    this.code,
    this.data,
    this.message,
  });

  AddDeviceResponseEntity copyWith({
    int? code,
    DeviceModelNew? data,
    String? message,
  }) =>
      AddDeviceResponseEntity(
        code: code ?? this.code,
        data: data ?? this.data,
        message: message ?? this.message,
      );

  factory AddDeviceResponseEntity.fromRawJson(String str) => AddDeviceResponseEntity.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AddDeviceResponseEntity.fromJson(Map<String, dynamic> json) => AddDeviceResponseEntity(
        code: json["code"],
        data: json["data"] == null ? null : DeviceModelNew.fromJson(json["data"]),
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

class DeviceModelNew {
  final List<String>? associatedDeviceIds;
  final String? id;
  final bool? isOnline;
  final String? location;
  final int? locationId;
  final String? name;
  final String? type;

  DeviceModelNew({
    this.associatedDeviceIds,
    this.id,
    this.isOnline,
    this.location,
    this.locationId,
    this.name,
    this.type,
  });

  DeviceModelNew copyWith({
    List<String>? associatedDeviceIds,
    String? id,
    bool? isOnline,
    String? location,
    int? locationId,
    String? name,
    String? type,
  }) =>
      DeviceModelNew(
        associatedDeviceIds: associatedDeviceIds ?? this.associatedDeviceIds,
        id: id ?? this.id,
        isOnline: isOnline ?? this.isOnline,
        location: location ?? this.location,
        locationId: locationId ?? this.locationId,
        name: name ?? this.name,
        type: type ?? this.type,
      );

  factory DeviceModelNew.fromRawJson(String str) => DeviceModelNew.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DeviceModelNew.fromJson(Map<String, dynamic> json) => DeviceModelNew(
        associatedDeviceIds: json["associated_device_ids"] == null
            ? []
            : List<String>.from(json["associated_device_ids"]!.map((x) => x)),
        id: json["id"],
        isOnline: json["is_online"],
        location: json["location"],
        locationId: json["location_id"],
        name: json["name"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "associated_device_ids":
            associatedDeviceIds == null ? [] : List<dynamic>.from(associatedDeviceIds!.map((x) => x)),
        "id": id,
        "is_online": isOnline,
        "location": location,
        "location_id": locationId,
        "name": name,
        "type": type,
      };

  @override
  String toString() {
    return jsonEncode(this);
  }
}

class UpdateDeviceLocationRequestEntity {
  final String? name;
  final int? locationId;
  final List<String>? associatedDeviceIds;

  UpdateDeviceLocationRequestEntity({
    this.name,
    this.locationId,
    this.associatedDeviceIds,
  });

  UpdateDeviceLocationRequestEntity copyWith({
    String? name,
    int? locationId,
    List<String>? associatedDeviceIds,
  }) =>
      UpdateDeviceLocationRequestEntity(
        name: name ?? this.name,
        locationId: locationId ?? this.locationId,
        associatedDeviceIds: associatedDeviceIds ?? this.associatedDeviceIds,
      );

  factory UpdateDeviceLocationRequestEntity.fromRawJson(String str) =>
      UpdateDeviceLocationRequestEntity.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UpdateDeviceLocationRequestEntity.fromJson(Map<String, dynamic> json) => UpdateDeviceLocationRequestEntity(
        name: json.containsKey("name") ? json["name"] : "",
        locationId: json.containsKey("location_id") ? json["location_id"] : 0,
        associatedDeviceIds: json.containsKey("associated_device_ids")
            ? List<String>.from(json["associated_device_ids"]!.map((x) => x))
            : [],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "location_id": locationId,
        "associated_device_ids":
            associatedDeviceIds == null ? [] : List<dynamic>.from(associatedDeviceIds!.map((x) => x)),
      };
}

class UpdateDeviceLocationResponseEntity {
  final int? code;
  final UpdateDeviceLocation? data;
  final String? message;

  UpdateDeviceLocationResponseEntity({
    this.code,
    this.data,
    this.message,
  });

  UpdateDeviceLocationResponseEntity copyWith({
    int? code,
    UpdateDeviceLocation? data,
    String? message,
  }) =>
      UpdateDeviceLocationResponseEntity(
        code: code ?? this.code,
        data: data ?? this.data,
        message: message ?? this.message,
      );

  factory UpdateDeviceLocationResponseEntity.fromRawJson(String str) =>
      UpdateDeviceLocationResponseEntity.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UpdateDeviceLocationResponseEntity.fromJson(Map<String, dynamic> json) => UpdateDeviceLocationResponseEntity(
        code: json.containsKey("code") ? json["code"] : 0,
        data: json.containsKey("data") ? UpdateDeviceLocation.fromJson(json["data"]) : null,
        message: json.containsKey("message") ? json["message"] : "",
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "data": data?.toJson(),
        "message": message,
      };
}

class UpdateDeviceLocation {
  final String? id;
  final bool? isOnline;
  final int? locationId;
  final String? name;
  final String? type;

  UpdateDeviceLocation({
    this.id,
    this.isOnline,
    this.locationId,
    this.name,
    this.type,
  });

  UpdateDeviceLocation copyWith({
    String? id,
    bool? isOnline,
    int? locationId,
    String? name,
    String? type,
  }) =>
      UpdateDeviceLocation(
        id: id ?? this.id,
        isOnline: isOnline ?? this.isOnline,
        locationId: locationId ?? this.locationId,
        name: name ?? this.name,
        type: type ?? this.type,
      );

  factory UpdateDeviceLocation.fromRawJson(String str) => UpdateDeviceLocation.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UpdateDeviceLocation.fromJson(Map<String, dynamic> json) => UpdateDeviceLocation(
        id: json.containsKey("id") ? json["id"] : "",
        isOnline: json.containsKey("is_online") ? json["is_online"] : false,
        locationId: json.containsKey("location_id") ? json["location_id"] : 0,
        name: json.containsKey("name") ? json["name"] : "",
        type: json.containsKey("type") ? json["type"] : "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "is_online": isOnline,
        "location_id": locationId,
        "name": name,
        "type": type,
      };
}

class DeleteDeviceResponseEntity {
  final int? code;
  final String? message;

  DeleteDeviceResponseEntity({
    this.code,
    this.message,
  });

  DeleteDeviceResponseEntity copyWith({
    int? code,
    String? message,
  }) =>
      DeleteDeviceResponseEntity(
        code: code ?? this.code,
        message: message ?? this.message,
      );

  factory DeleteDeviceResponseEntity.fromRawJson(String str) => DeleteDeviceResponseEntity.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DeleteDeviceResponseEntity.fromJson(Map<String, dynamic> json) => DeleteDeviceResponseEntity(
        code: json.containsKey("code") ? json["code"] : 0,
        message: json.containsKey("message") ? json["message"] : "",
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
      };
}
