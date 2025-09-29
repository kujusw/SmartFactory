import 'dart:convert';

class GeneralDeviceInfoModel {
  String? id; //设备id
  String? value; //设备值
  String? state; //设备状态
  String? name; //设备名称
  String? type; //设备类型
  String? time; //设备添加时间
  String? uiType;

  GeneralDeviceInfoModel({
    this.id,
    this.value,
    this.name,
    this.type,
    this.state,
    this.time,
    this.uiType,
  });
  GeneralDeviceInfoModel copyWith({
    String? id,
    String? value,
    String? name,
    String? type,
    String? state,
    String? time,
    String? uiType,
  }) {
    return GeneralDeviceInfoModel(
      id: id ?? this.id,
      value: value ?? this.value,
      name: name ?? this.name,
      type: type ?? this.type,
      state: state ?? this.state,
      time: time ?? this.time,
      uiType: uiType ?? this.uiType,
    );
  }

  GeneralDeviceInfoModel.copy(GeneralDeviceInfoModel from)
      : this(
          id: from.id,
          value: from.value,
          name: from.name,
          type: from.type,
          state: from.state,
          time: from.time,
          uiType: from.uiType,
        );

  factory GeneralDeviceInfoModel.fromRawJson(String str) => GeneralDeviceInfoModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GeneralDeviceInfoModel.fromJson(Map<String, dynamic> json) => GeneralDeviceInfoModel(
        id: json["id"],
        value: json["value"],
        name: json["name"],
        type: json["type"],
        state: json["state"],
        time: json["time"],
        uiType: json["uiType"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "value": value,
        "name": name,
        "type": type,
        "state": state,
        "time": time,
        "uiType": uiType,
      };

  @override
  String toString() {
    return jsonEncode(this);
  }
}
