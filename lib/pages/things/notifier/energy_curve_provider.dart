import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../common/utils/logger_manager.dart';
import '../../../common/values/constant.dart';
import '../../../http/http.dart';

class EnergyCurveResponse {
  int? code;
  EnergyCurve? data;
  String? message;

  EnergyCurveResponse({
    this.code,
    this.data,
    this.message,
  });

  factory EnergyCurveResponse.fromRawJson(String str) => EnergyCurveResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory EnergyCurveResponse.fromJson(Map<String, dynamic> json) => EnergyCurveResponse(
        code: json["code"],
        data: json["data"] == null ? null : EnergyCurve.fromJson(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "data": data?.toJson(),
        "message": message,
      };
}

class EnergyCurve {
  String? bucket;
  String? deviceId;
  String? end;
  String? period;
  List<EnergyPoint>? points;
  String? start;

  EnergyCurve({
    this.bucket,
    this.deviceId,
    this.end,
    this.period,
    this.points,
    this.start,
  });

  factory EnergyCurve.fromRawJson(String str) => EnergyCurve.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory EnergyCurve.fromJson(Map<String, dynamic> json) => EnergyCurve(
        bucket: json["bucket"],
        deviceId: json["device_id"],
        end: json["end"],
        period: json["period"],
        points:
            json["points"] == null ? [] : List<EnergyPoint>.from(json["points"]!.map((x) => EnergyPoint.fromJson(x))),
        start: json["start"],
      );

  Map<String, dynamic> toJson() => {
        "bucket": bucket,
        "device_id": deviceId,
        "end": end,
        "period": period,
        "points": points == null ? [] : List<dynamic>.from(points!.map((x) => x.toJson())),
        "start": start,
      };
}

class EnergyPoint {
  double? power;
  DateTime? timestamp;

  EnergyPoint({
    this.power,
    this.timestamp,
  });

  factory EnergyPoint.fromRawJson(String str) => EnergyPoint.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory EnergyPoint.fromJson(Map<String, dynamic> json) => EnergyPoint(
        power: json["power"]?.toDouble(),
        timestamp: json["timestamp"] != null ? DateTime.parse(json["timestamp"]).toLocal() : null,
      );

  Map<String, dynamic> toJson() => {
        "power": power,
        "timestamp": timestamp?.toUtc().toIso8601String(),
      };
}

class EnergyCurveRequest {
  final String deviceId;
  final String period;
  final String token;
  final String start;
  final String end;

  EnergyCurveRequest({
    required this.deviceId,
    required this.period,
    required this.token,
    required this.start,
    required this.end,
  });

  Map<String, String> toJson() {
    return {
      "device_id": deviceId,
      "period": period,
      "token": token,
      "start": start,
      "end": end,
    };
  }

  factory EnergyCurveRequest.fromRawJson(String str) => EnergyCurveRequest.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());
  factory EnergyCurveRequest.fromJson(Map<String, dynamic> json) {
    return EnergyCurveRequest(
      deviceId: json['device_id'] as String,
      period: json['period'] as String,
      token: json['token'] as String,
      start: json['start'] as String,
      end: json['end'] as String,
    );
  }

  @override
  String toString() {
    return toRawJson();
  }
}

/// ----------------------------
/// Riverpod Provider
/// ----------------------------
final energyCurveProvider = FutureProvider.family<EnergyCurveResponse, EnergyCurveRequest>((ref, params) async {
  var response = await HttpUtil(url: (Constant.HOST), token: params.token)
      .get("api/v1/energy/curve", queryParameters: params.toJson());
  LoggerManager().d("energyCurveProvider response: ${json.encode(response)}");
  return EnergyCurveResponse.fromJson(response);
});

/// ----------------------------
/// 数据转换工具
/// ----------------------------

// period 自动格式化
String formatLabel(DateTime dt, String period) {
  // 确保统一用本地时间
  final localDt = dt.toLocal();
  switch (period) {
    case "day":
      return "${localDt.hour.toString().padLeft(2, '0')}:${localDt.minute.toString().padLeft(2, '0')}";
    case "week":
      const weekdays = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];
      return weekdays[localDt.weekday - 1];
    case "month":
      return localDt.day.toString().padLeft(2, '0');
    case "year":
      const months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
      return months[localDt.month - 1];
    default:
      return localDt.toIso8601String();
  }
}

List<List<dynamic>> buildLineSections(EnergyCurveResponse data) {
  final times = <String>[];
  final values = <double>[];

  for (final point in data.data?.points ?? []) {
    times.add(formatLabel(point.timestamp, data.data?.period ?? "day"));
    values.add(point.power);
  }

  return [times, values];
}

/// 获取纵轴最大值 (向上取整到最近的100)
double getYAxisMax(List<double> values) {
  if (values.isEmpty) return 100;
  final maxVal = values.reduce((a, b) => a > b ? a : b);
  return ((maxVal / 100).ceil() * 100).toDouble();
}
