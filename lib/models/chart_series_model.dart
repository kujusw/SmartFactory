import 'package:flutter/material.dart';

class ChartSeriesModel {
  final List<double> data;
  final String name;
  final Color color;

  ChartSeriesModel({
    required this.data,
    required this.name,
    required this.color,
  });

  // 从 JSON 创建
  factory ChartSeriesModel.fromJson(Map<String, dynamic> json) {
    return ChartSeriesModel(
      data: List<double>.from(json['data']),
      name: json['name'],
      color: Color(json['color']),
    );
  }

  // 转换为 JSON
  Map<String, dynamic> toJson() {
    return {
      'data': data,
      'name': name,
      'color': color,
    };
  }
}
