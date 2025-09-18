import 'dart:convert';

class GeneralGlobalInfoResponseEntity {
  int? code;
  Data? data;
  String? message;

  GeneralGlobalInfoResponseEntity({
    this.code,
    this.data,
    this.message,
  });

  factory GeneralGlobalInfoResponseEntity.fromRawJson(String str) =>
      GeneralGlobalInfoResponseEntity.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GeneralGlobalInfoResponseEntity.fromJson(Map<String, dynamic> json) => GeneralGlobalInfoResponseEntity(
        code: json["code"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "data": data?.toJson(),
        "message": message,
      };
}

class Data {
  DateTime? generatedAt;
  Overview? overview;

  Data({
    this.generatedAt,
    this.overview,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        generatedAt: json["generated_at"] == null ? null : DateTime.parse(json["generated_at"]),
        overview: json["overview"] == null ? null : Overview.fromJson(json["overview"]),
      );

  Map<String, dynamic> toJson() => {
        "generated_at": generatedAt?.toIso8601String(),
        "overview": overview?.toJson(),
      };
}

class Overview {
  int? offlineDevices;
  int? onlineDevices;
  int? physicalDevices;
  int? totalDevices;
  int? virtualDevices;

  Overview({
    this.offlineDevices,
    this.onlineDevices,
    this.physicalDevices,
    this.totalDevices,
    this.virtualDevices,
  });

  factory Overview.fromRawJson(String str) => Overview.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Overview.fromJson(Map<String, dynamic> json) => Overview(
        offlineDevices: json["offline_devices"],
        onlineDevices: json["online_devices"],
        physicalDevices: json["physical_devices"],
        totalDevices: json["total_devices"],
        virtualDevices: json["virtual_devices"],
      );

  Map<String, dynamic> toJson() => {
        "offline_devices": offlineDevices,
        "online_devices": onlineDevices,
        "physical_devices": physicalDevices,
        "total_devices": totalDevices,
        "virtual_devices": virtualDevices,
      };
}
