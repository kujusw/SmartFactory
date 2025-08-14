import 'dart:convert';

import 'package:intl/intl.dart';

class GeneralGlobalInfoModel {
  String? time;
  String? value;
  String? type;
  String? name;

  GeneralGlobalInfoModel({
    String? time,
    this.type,
    this.value,
    this.name,
  }) : time = time ?? DateFormat('MM-dd HH:mm:ss sss').format(DateTime.now());

  factory GeneralGlobalInfoModel.fromRawJson(String str) => GeneralGlobalInfoModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GeneralGlobalInfoModel.fromJson(Map<String, dynamic> json) => GeneralGlobalInfoModel(
        time: json["time"],
        value: json["value"],
        type: json["type"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "time": time,
        "value": value,
        "type": type,
        "name": name,
      };
}
