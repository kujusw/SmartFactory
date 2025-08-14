import 'dart:convert';

class DevicesResponseEntity {
  final int? code;
  final List<DeviceModel>? data;
  final String? message;

  DevicesResponseEntity({
    this.code,
    this.data,
    this.message,
  });

  DevicesResponseEntity copyWith({
    int? code,
    List<DeviceModel>? data,
    String? message,
  }) =>
      DevicesResponseEntity(
        code: code ?? this.code,
        data: data ?? this.data,
        message: message ?? this.message,
      );

  factory DevicesResponseEntity.fromRawJson(String str) => DevicesResponseEntity.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DevicesResponseEntity.fromJson(Map<String, dynamic> json) => DevicesResponseEntity(
        code: json.containsKey("code") ? json["code"] : 0,
        data: json.containsKey("data") ? List<DeviceModel>.from(json["data"].map((x) => DeviceModel.fromJson(x))) : [],
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

class DeviceModel {
  final String? id;
  final bool? isOnline;
  String? location;
  int? locationId;
  String? name;
  final String? type;
  bool? selected; //在设备列表中是否选中
  bool? selectedInAddDevice; //在添加设备中是否选中
  List<String>? associatedDeviceIds;
  bool? selectedInMenu; //在设备三级菜单中是否选中

  DeviceModel({
    this.id,
    this.isOnline,
    this.location,
    this.locationId,
    this.name,
    this.type,
    this.selected,
    this.selectedInAddDevice,
    this.associatedDeviceIds,
    this.selectedInMenu,
  });

  DeviceModel copyWith({
    String? id,
    bool? isOnline,
    String? location,
    int? locationId,
    String? name,
    String? type,
    bool? selected,
    bool? selectedInAddDevice,
    List<String>? associatedDeviceIds,
    bool? selectedInMenu,
  }) =>
      DeviceModel(
        id: id ?? this.id,
        isOnline: isOnline ?? this.isOnline,
        location: location ?? this.location,
        locationId: locationId ?? this.locationId,
        name: name ?? this.name,
        type: type ?? this.type,
        selected: selected ?? this.selected,
        selectedInAddDevice: selectedInAddDevice ?? this.selectedInAddDevice,
        associatedDeviceIds: associatedDeviceIds ?? this.associatedDeviceIds,
        selectedInMenu: selectedInMenu ?? this.selectedInMenu,
      );

  factory DeviceModel.fromRawJson(String str) => DeviceModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DeviceModel.fromJson(Map<String, dynamic> json) => DeviceModel(
        id: json.containsKey("id") ? json["id"] : "",
        isOnline: json.containsKey("is_online") ? json["is_online"] : false,
        location: json.containsKey("location") ? json["location"] : "",
        locationId: json.containsKey("location_id") ? json["location_id"] : 0,
        name: json.containsKey("name") ? json["name"] : "",
        type: json.containsKey("type") ? json["type"] : "",
        associatedDeviceIds: json.containsKey("associated_device_ids")
            ? List<String>.from(json["associated_device_ids"].map((x) => x))
            : [],
        selected: json.containsKey("selected") ? json["selected"] : false,
        selectedInAddDevice: json.containsKey("selectedInAddDevice") ? json["selectedInAddDevice"] : false,
        selectedInMenu: json.containsKey("selectedInMenu") ? json["selectedInMenu"] : false,
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is DeviceModel &&
        other.id == id &&
        other.isOnline == isOnline &&
        other.location == location &&
        other.locationId == locationId &&
        other.name == name &&
        other.type == type &&
        other.selected == selected &&
        other.selectedInAddDevice == selectedInAddDevice &&
        other.associatedDeviceIds == associatedDeviceIds &&
        other.selectedInMenu == selectedInMenu;
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "is_online": isOnline,
        "location": location,
        "location_id": locationId,
        "name": name,
        "type": type,
        "associated_device_ids":
            associatedDeviceIds == null ? [] : List<dynamic>.from(associatedDeviceIds!.map((x) => x)),
        "selected": selected,
        "selectedInAddDevice": selectedInAddDevice,
        "selectedInMenu": selectedInMenu,
      };
  @override
  String toString() {
    return jsonEncode(this);
  }
}

class DeviceEnergyResponseEntity {
  final int? code;
  final DeviceEnergyModel? data;
  final String? message;

  DeviceEnergyResponseEntity({
    this.code,
    this.data,
    this.message,
  });

  DeviceEnergyResponseEntity copyWith({
    int? code,
    DeviceEnergyModel? data,
    String? message,
  }) =>
      DeviceEnergyResponseEntity(
        code: code ?? this.code,
        data: data ?? this.data,
        message: message ?? this.message,
      );

  factory DeviceEnergyResponseEntity.fromRawJson(String str) => DeviceEnergyResponseEntity.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DeviceEnergyResponseEntity.fromJson(Map<String, dynamic> json) => DeviceEnergyResponseEntity(
        code: json.containsKey("code") ? json["code"] : 0,
        data: json.containsKey("data") ? DeviceEnergyModel.fromJson(json["data"]) : DeviceEnergyModel(),
        message: json.containsKey("message") ? json["message"] : "",
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

class DeviceEnergyModel {
  final double? current;
  final String? id;
  final double? energy;
  final double? energyDaily;
  final double? energyHourly;
  final double? energyMonthly;
  final double? energyWeekly;
  final double? energyWeeklyDiff;
  final int? energyDailyTimestamp;
  final int? energyHourlyTimestamp;
  final int? energyMonthlyTimestamp;
  final int? energyWeeklyTimestamp;
  final double? power;
  final int? timestamp;

  DeviceEnergyModel({
    this.current,
    this.id,
    this.energy,
    this.energyDaily,
    this.energyHourly,
    this.energyMonthly,
    this.energyWeekly,
    this.energyWeeklyDiff,
    this.energyDailyTimestamp,
    this.energyHourlyTimestamp,
    this.energyMonthlyTimestamp,
    this.energyWeeklyTimestamp,
    this.power,
    this.timestamp,
  });

  DeviceEnergyModel copyWith({
    double? current,
    String? id,
    double? energy,
    double? energyDaily,
    double? energyHourly,
    double? energyMonthly,
    double? energyWeekly,
    double? energyWeeklyDiff,
    int? energyDailyTimestamp,
    int? energyHourlyTimestamp,
    int? energyMonthlyTimestamp,
    int? energyWeeklyTimestamp,
    double? power,
    int? timestamp,
  }) =>
      DeviceEnergyModel(
        current: current ?? this.current,
        id: id ?? this.id,
        energy: energy ?? this.energy,
        energyDaily: energyDaily ?? this.energyDaily,
        energyHourly: energyHourly ?? this.energyHourly,
        energyMonthly: energyMonthly ?? this.energyMonthly,
        energyWeekly: energyWeekly ?? this.energyWeekly,
        energyWeeklyDiff: energyWeeklyDiff ?? this.energyWeeklyDiff,
        energyDailyTimestamp: energyDailyTimestamp ?? this.energyDailyTimestamp,
        energyHourlyTimestamp: energyHourlyTimestamp ?? this.energyHourlyTimestamp,
        energyMonthlyTimestamp: energyMonthlyTimestamp ?? this.energyMonthlyTimestamp,
        energyWeeklyTimestamp: energyWeeklyTimestamp ?? this.energyWeeklyTimestamp,
        power: power ?? this.power,
        timestamp: timestamp ?? this.timestamp,
      );

  factory DeviceEnergyModel.fromRawJson(String str) => DeviceEnergyModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());
  //兼容服务器传递过来的数据类型
  factory DeviceEnergyModel.fromJson(Map<String, dynamic> json) => DeviceEnergyModel(
        current: json.containsKey("current") ? json["current"] : 0.0,
        id: json.containsKey("id") ? json["id"] : "",
        energy: json.containsKey("energy")
            ? (json['energy'] is double)
                ? json['energy']
                : (json['energy'] as num).toDouble()
            : 0.0,
        energyDaily: json.containsKey("energy_daily")
            ? (json['energy_daily'] is double)
                ? json['energy_daily']
                : (json['energy_daily'] as num).toDouble()
            : 0.0,
        energyHourly: json.containsKey("energy_hourly")
            ? (json['energy_hourly'] is double)
                ? json['energy_hourly']
                : (json['energy_hourly'] as num).toDouble()
            : 0.0,
        energyMonthly: json.containsKey("energy_monthly")
            ? (json['energy_monthly'] is double)
                ? json['energy_monthly']
                : (json['energy_monthly'] as num).toDouble()
            : 0.0,
        energyWeekly: json.containsKey("energy_weekly")
            ? (json['energy_weekly'] is double)
                ? json['energy_weekly']
                : (json['energy_weekly'] as num).toDouble()
            : 0.0,
        energyWeeklyDiff: json.containsKey("energy_weekly_diff")
            ? (json['energy_weekly_diff'] is double)
                ? json['energy_weekly_diff']
                : (json['energy_weekly_diff'] as num).toDouble()
            : 0.0,
        energyDailyTimestamp: json.containsKey("energy_daily_timestamp") ? json["energy_daily_timestamp"] : 0,
        energyHourlyTimestamp: json.containsKey("energy_hourly_timestamp") ? json["energy_hourly_timestamp"] : 0,
        energyMonthlyTimestamp: json.containsKey("energy_monthly_timestamp") ? json["energy_monthly_timestamp"] : 0,
        energyWeeklyTimestamp: json.containsKey("energy_weekly_timestamp") ? json["energy_weekly_timestamp"] : 0,
        power: json.containsKey("power")
            ? (json['power'] is double)
                ? json['power']
                : (json['power'] as num).toDouble()
            : 0.0,
        timestamp: json.containsKey("timestamp") ? json["timestamp"] : 0,
      );

  Map<String, dynamic> toJson() => {
        "current": current,
        "id": id,
        "energy": energy,
        "energy_daily": energyDaily,
        "energy_hourly": energyHourly,
        "energy_monthly": energyMonthly,
        "energy_weekly": energyWeekly,
        "energy_weekly_diff": energyWeeklyDiff,
        "energy_daily_timestamp": energyDailyTimestamp,
        "energy_hourly_timestamp": energyHourlyTimestamp,
        "energy_monthly_timestamp": energyMonthlyTimestamp,
        "energy_weekly_timestamp": energyWeeklyTimestamp,
        "power": power,
        "timestamp": timestamp,
      };

  @override
  String toString() {
    return jsonEncode(this);
  }
}
