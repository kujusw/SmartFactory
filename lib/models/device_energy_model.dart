import 'dart:convert';

class DeviceEnergyRequestEntity {
  final String? period;
  DeviceEnergyRequestEntity({
    this.period,
  });

  DeviceEnergyRequestEntity copyWith({
    String? period,
  }) =>
      DeviceEnergyRequestEntity(
        period: period ?? this.period,
      );

  factory DeviceEnergyRequestEntity.fromRawJson(String str) => DeviceEnergyRequestEntity.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DeviceEnergyRequestEntity.fromJson(Map<String, dynamic> json) => DeviceEnergyRequestEntity(
        period: json["period"],
      );

  Map<String, dynamic> toJson() => {
        "period": period,
      };
}

class DeviceEnergyResponseModel {
  final int? code;
  final List<DeviceEnergy>? data;
  final String? message;

  DeviceEnergyResponseModel({
    this.code,
    this.data,
    this.message,
  });

  DeviceEnergyResponseModel copyWith({
    int? code,
    List<DeviceEnergy>? data,
    String? message,
  }) =>
      DeviceEnergyResponseModel(
        code: code ?? this.code,
        data: data ?? this.data,
        message: message ?? this.message,
      );

  factory DeviceEnergyResponseModel.fromRawJson(String str) => DeviceEnergyResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DeviceEnergyResponseModel.fromJson(Map<String, dynamic> json) => DeviceEnergyResponseModel(
        code: json["code"],
        data: json["data"] == null ? [] : List<DeviceEnergy>.from(json["data"]!.map((x) => DeviceEnergy.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
        "message": message,
      };
}

class DeviceEnergy {
  final double? energy;
  final int? min;
  final int? timestamp;
  String? timestampString;

  DeviceEnergy({
    this.energy,
    this.min,
    this.timestamp,
    this.timestampString,
  });

  DeviceEnergy copyWith({
    double? energy,
    int? min,
    int? timestamp,
    String? timestampString,
  }) =>
      DeviceEnergy(
        energy: energy ?? this.energy,
        min: min ?? this.min,
        timestamp: timestamp ?? this.timestamp,
        timestampString: timestampString ?? this.timestampString,
      );

  factory DeviceEnergy.fromRawJson(String str) => DeviceEnergy.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DeviceEnergy.fromJson(Map<String, dynamic> json) => DeviceEnergy(
        energy: json.containsKey("energy") ? json["energy"] : 0,
        timestamp: json.containsKey("timestamp") ? json["timestamp"] : 0,
        min: json.containsKey("min") ? json["min"] : 0,
        timestampString: "",
      );

  Map<String, dynamic> toJson() => {
        "energy": energy,
        "timestamp": timestamp,
        "min": min,
        "timestampString": timestampString,
      };

  @override
  String toString() {
    return jsonEncode(this);
  }
}
