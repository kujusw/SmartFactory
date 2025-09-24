import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:graphic/graphic.dart';

class LineChartWidget extends StatelessWidget {
  final List<String> labels;
  final List<double> values;
  final double yMax;

  const LineChartWidget({
    Key? key,
    required this.labels,
    required this.values,
    required this.yMax,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (labels.isEmpty || values.isEmpty) {
      return const Center(child: Text("No data"));
    }

    final data = List.generate(labels.length, (i) {
      return {
        'time': labels[i],
        'power': values[i],
      };
    });

    return Chart(
      data: data,
      variables: {
        'time': Variable(
          accessor: (Map map) => map['time'] as String,
        ),
        'power': Variable(
          accessor: (Map map) => map['power'] as double,
          scale: LinearScale(min: 0, max: yMax, formatter: (v) => '${v.toInt()} kWW'),
        ),
      },
      marks: [
        LineMark(
          shape: ShapeEncode(value: BasicLineShape(smooth: true)),
        )
      ],
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
