import 'dart:convert';

class DevicesResponseEntity {
  int? code;
  List<DeviceModel>? data;
  String? message;

  DevicesResponseEntity({
    this.code,
    this.data,
    this.message,
  });

  factory DevicesResponseEntity.fromRawJson(String str) => DevicesResponseEntity.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DevicesResponseEntity.fromJson(Map<String, dynamic> json) => DevicesResponseEntity(
        code: json["code"],
        data: json["data"] == null ? [] : List<DeviceModel>.from(json["data"]!.map((x) => DeviceModel.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
        "message": message,
      };
}

class DeviceModel {
  String? applicationId;
  String? applicationName;
  int? associatedDeviceCount;
  List<DeviceModel>? associatedDevices;
  String? createdAt;
  dynamic devAddr;
  String? deviceName;
  int? deviceStatus;
  String? deviceType;
  String? firstSeen;
  String? id;
  dynamic ipsoVersion;
  String? lastSeen;
  int? locationId;
  String? updatedAt;
  num? warningRedThreshold;
  num? warningYellowThreshold;

  //UI
  bool? selected; //在设备列表中是否选中
  bool? selectedInAddDevice; //在添加设备中是否选中
  bool? selectedInMenu; //在设备三级菜单中是否选中

  DeviceModel({
    this.applicationId,
    this.applicationName,
    this.associatedDeviceCount,
    this.associatedDevices,
    this.createdAt,
    this.devAddr,
    this.deviceName,
    this.deviceStatus,
    this.deviceType,
    this.firstSeen,
    this.id,
    this.ipsoVersion,
    this.lastSeen,
    this.locationId,
    this.updatedAt,
    this.warningRedThreshold,
    this.warningYellowThreshold,
    this.selected,
    this.selectedInAddDevice,
    this.selectedInMenu,
  });

  factory DeviceModel.fromRawJson(String str) => DeviceModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DeviceModel.fromJson(Map<String, dynamic> json) => DeviceModel(
        applicationId: json["application_id"],
        applicationName: json["application_name"],
        associatedDeviceCount: json["associated_device_count"],
        associatedDevices: json["associated_devices"] == null
            ? []
            : List<DeviceModel>.from(json["associated_devices"]!.map((x) => DeviceModel.fromJson(x))),
        createdAt: json["created_at"],
        devAddr: json["dev_addr"],
        deviceName: json["device_name"],
        deviceStatus: json["device_status"],
        deviceType: json["device_type"],
        firstSeen: json["first_seen"],
        id: json["id"],
        ipsoVersion: json["ipso_version"],
        lastSeen: json["last_seen"],
        locationId: json["location_id"],
        updatedAt: json["updated_at"],
        warningRedThreshold: json["warning_red_threshold"],
        warningYellowThreshold: json["warning_yellow_threshold"],
        selected: json["selected"],
        selectedInAddDevice: json["selected_in_add_device"],
        selectedInMenu: json["selected_in_menu"],
      );

  Map<String, dynamic> toJson() => {
        "application_id": applicationId,
        "application_name": applicationName,
        "associated_device_count": associatedDeviceCount,
        "associated_devices":
            associatedDevices == null ? [] : List<dynamic>.from(associatedDevices!.map((x) => x.toJson())),
        "created_at": createdAt,
        "dev_addr": devAddr,
        "device_name": deviceName,
        "device_status": deviceStatus,
        "device_type": deviceType,
        "first_seen": firstSeen,
        "id": id,
        "ipso_version": ipsoVersion,
        "last_seen": lastSeen,
        "location_id": locationId,
        "updated_at": updatedAt,
        "warning_red_threshold": warningRedThreshold,
        "warning_yellow_threshold": warningYellowThreshold,
        "selected": selected,
        "selected_in_add_device": selectedInAddDevice,
        "selected_in_menu": selectedInMenu,
      };

  DeviceModel copyWith({
    String? applicationId,
    String? applicationName,
    int? associatedDeviceCount,
    List<DeviceModel>? associatedDevices,
    String? createdAt,
    dynamic devAddr,
    String? deviceName,
    int? deviceStatus,
    String? deviceType,
    String? firstSeen,
    String? id,
    dynamic ipsoVersion,
    String? lastSeen,
    int? locationId,
    String? updatedAt,
    num? warningRedThreshold,
    num? warningYellowThreshold,
    bool? selected,
    bool? selectedInAddDevice,
    bool? selectedInMenu,
  }) =>
      DeviceModel(
        applicationId: applicationId ?? this.applicationId,
        applicationName: applicationName ?? this.applicationName,
        associatedDeviceCount: associatedDeviceCount ?? this.associatedDeviceCount,
        associatedDevices: associatedDevices ?? this.associatedDevices,
        createdAt: createdAt ?? this.createdAt,
        devAddr: devAddr ?? this.devAddr,
        deviceName: deviceName ?? this.deviceName,
        deviceStatus: deviceStatus ?? this.deviceStatus,
        deviceType: deviceType ?? this.deviceType,
        firstSeen: firstSeen ?? this.firstSeen,
        id: id ?? this.id,
        ipsoVersion: ipsoVersion ?? this.ipsoVersion,
        lastSeen: lastSeen ?? this.lastSeen,
        locationId: locationId ?? this.locationId,
        updatedAt: updatedAt ?? this.updatedAt,
        warningRedThreshold: warningRedThreshold ?? this.warningRedThreshold,
        warningYellowThreshold: warningYellowThreshold ?? this.warningYellowThreshold,
        selected: selected ?? this.selected,
        selectedInAddDevice: selectedInAddDevice ?? this.selectedInAddDevice,
        selectedInMenu: selectedInMenu ?? this.selectedInMenu,
      );
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
