import 'dart:convert';

import 'package:intl/intl.dart';

class LogEntity {
  String? time;
  String? log;
  String? type;

  LogEntity({
    String? time,
    this.log,
    this.type,
  }) : time = time ?? DateFormat('MM-dd HH:mm:ss sss').format(DateTime.now());

  factory LogEntity.fromRawJson(String str) => LogEntity.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LogEntity.fromJson(Map<String, dynamic> json) => LogEntity(
        time: json["time"],
        log: json["log"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "time": time,
        "log": log,
        "type": type,
      };
}
