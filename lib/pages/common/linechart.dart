import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:graphic/graphic.dart';

import '../../models/chart_series_model.dart';

class LineChartWidget extends StatelessWidget {
  final List<String> labels;
  final List<double> values;
  final double yMax;
  // 重构后的参数：使用单一的 additionalSeries 参数
  final List<ChartSeriesModel>? additionalSeries;
  // 新增警戒线参数
  final double? redAlertLine;
  final double? yellowAlertLine;

  const LineChartWidget({
    Key? key,
    required this.labels,
    required this.values,
    required this.yMax,
    this.additionalSeries,
    this.redAlertLine,
    this.yellowAlertLine,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (labels.isEmpty || values.isEmpty) {
      return const Center(child: Text("No data"));
    }

    // 构建数据
    List<Map<String, dynamic>> data;

    if (additionalSeries != null && additionalSeries!.isNotEmpty) {
      // 多条曲线数据
      data = List.generate(labels.length, (i) {
        Map<String, dynamic> point = {'time': labels[i]};

        // 添加第一条曲线（原始数据）
        point['series0'] = i < values.length ? values[i] : 0.0;

        // 添加其他曲线数据
        for (int j = 0; j < additionalSeries!.length; j++) {
          point['series${j + 1}'] = i < additionalSeries![j].data.length ? additionalSeries![j].data[i] : 0.0;
        }

        return point;
      });
    } else {
      // 单条曲线数据
      data = List.generate(labels.length, (i) {
        return {
          'time': labels[i],
          'power': values[i],
        };
      });
    }

    // 构建变量定义
    Map<String, Variable> variables = {
      'time': Variable(
        accessor: (map) => map['time'] as String,
      ),
    };

    // 构建标记
    List<Mark> marks = [];

    if (additionalSeries != null && additionalSeries!.isNotEmpty) {
      // 多条曲线的变量和标记
      variables['series0'] = Variable(
        accessor: (map) => map['series0'] as num,
        scale: LinearScale(min: 0, max: yMax, formatter: (v) => '${v.toInt()} kW'),
      );

      marks.add(LineMark(
        shape: ShapeEncode(value: BasicLineShape(smooth: true)),
        color: ColorEncode(value: Colors.blue), // 主曲线保持蓝色
        position: Varset('time') * Varset('series0'),
      ));

      for (int i = 0; i < additionalSeries!.length; i++) {
        String seriesKey = 'series${i + 1}';
        variables[seriesKey] = Variable(
          accessor: (map) => map[seriesKey] as num,
          scale: LinearScale(min: 0, max: yMax, formatter: (v) => '${v.toInt()} kW'),
        );

        marks.add(LineMark(
          shape: ShapeEncode(value: BasicLineShape(smooth: true)),
          color: ColorEncode(value: additionalSeries![i].color),
          position: Varset('time') * Varset(seriesKey),
        ));
      }
    } else {
      // 单条曲线
      variables['power'] = Variable(
        accessor: (map) => map['power'] as num,
        scale: LinearScale(min: 0, max: yMax, formatter: (v) => '${v.toInt()} kW'),
      );

      marks.add(LineMark(
        shape: ShapeEncode(value: BasicLineShape(smooth: true)),
        color: ColorEncode(value: Colors.blue),
      ));
    }

    // 添加警戒线
    if (redAlertLine != null) {
      variables['redAlert'] = Variable(
        accessor: (map) => map['redAlert'] as num,
        scale: LinearScale(min: 0, max: yMax),
      );

      marks.add(LineMark(
        shape: ShapeEncode(value: BasicLineShape(dash: [5, 5])),
        color: ColorEncode(value: Colors.red),
        position: Varset('time') * Varset('redAlert'),
      ));

      // 合并警戒线数据
      for (int i = 0; i < data.length; i++) {
        data[i]['redAlert'] = redAlertLine;
      }
    }

    if (yellowAlertLine != null) {
      variables['yellowAlert'] = Variable(
        accessor: (map) => map['yellowAlert'] as num,
        scale: LinearScale(min: 0, max: yMax),
      );

      marks.add(LineMark(
        shape: ShapeEncode(value: BasicLineShape(dash: [10, 5])),
        color: ColorEncode(value: Colors.orange),
        position: Varset('time') * Varset('yellowAlert'),
      ));

      // 合并警戒线数据
      for (int i = 0; i < data.length; i++) {
        data[i]['yellowAlert'] = yellowAlertLine;
      }
    }

    return Chart(
      data: data,
      variables: variables,
      marks: marks,
      axes: [
        Defaults.horizontalAxis,
        Defaults.verticalAxis,
      ],
      selections: {
        'tooltipMouse': PointSelection(on: {
          GestureType.hover,
        }, devices: {
          PointerDeviceKind.mouse
        }, dim: Dim.x),
        'tooltipTouch': PointSelection(
            on: {GestureType.scaleUpdate, GestureType.tapDown, GestureType.longPressMoveUpdate},
            devices: {PointerDeviceKind.touch},
            dim: Dim.x),
      },
      tooltip: TooltipGuide(
        followPointer: [true, true],
        align: Alignment.topLeft,
      ),
      crosshair: CrosshairGuide(
        followPointer: [false, true],
      ),
    );
  }
}
