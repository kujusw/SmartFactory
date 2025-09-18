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
  int? code;
  DeviceEnergyModel? data;
  String? message;

  DeviceEnergyResponseEntity({
    this.code,
    this.data,
    this.message,
  });

  factory DeviceEnergyResponseEntity.fromRawJson(String str) => DeviceEnergyResponseEntity.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DeviceEnergyResponseEntity.fromJson(Map<String, dynamic> json) => DeviceEnergyResponseEntity(
        code: json["code"],
        data: json["data"] == null ? null : DeviceEnergyModel.fromJson(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "data": data?.toJson(),
        "message": message,
      };
}

class DeviceEnergyModel {
  num? current;
  num? energy;
  num? power;
  num? powerFactor;
  String? timestamp;
  num? totalCurrent;
  num? totalPower;
  num? voltage;
  List<Warning>? warnings;

  DeviceEnergyModel({
    this.current,
    this.energy,
    this.power,
    this.powerFactor,
    this.timestamp,
    this.totalCurrent,
    this.totalPower,
    this.voltage,
    this.warnings,
  });

  factory DeviceEnergyModel.fromRawJson(String str) => DeviceEnergyModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DeviceEnergyModel.fromJson(Map<String, dynamic> json) => DeviceEnergyModel(
        current: json["current"],
        energy: json["energy"],
        power: json["power"],
        powerFactor: json["power_factor"],
        timestamp: json["timestamp"],
        totalCurrent: json["total_current"],
        totalPower: json["total_power"],
        voltage: json["voltage"],
        warnings: json["warnings"] == null ? [] : List<Warning>.from(json["warnings"]!.map((x) => Warning.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "current": current,
        "energy": energy,
        "power": power,
        "power_factor": powerFactor,
        "timestamp": timestamp,
        "total_current": totalCurrent,
        "total_power": totalPower,
        "voltage": voltage,
        "warnings": warnings == null ? [] : List<dynamic>.from(warnings!.map((x) => x.toJson())),
      };
}

class Warning {
  num? currentValue;
  num? exceededBy;
  String? level;
  String? message;
  num? threshold;
  String? type;

  Warning({
    this.currentValue,
    this.exceededBy,
    this.level,
    this.message,
    this.threshold,
    this.type,
  });

  factory Warning.fromRawJson(String str) => Warning.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Warning.fromJson(Map<String, dynamic> json) => Warning(
        currentValue: json["current_value"],
        exceededBy: json["exceeded_by"],
        level: json["level"],
        message: json["message"],
        threshold: json["threshold"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "current_value": currentValue,
        "exceeded_by": exceededBy,
        "level": level,
        "message": message,
        "threshold": threshold,
        "type": type,
      };
}
