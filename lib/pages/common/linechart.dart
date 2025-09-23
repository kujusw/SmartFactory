import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:graphic/graphic.dart';
import 'package:quiver/iterables.dart';

import '../../models/test_data_provider.dart';

class LineChartWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, left: 20, right: 20),
      height: 200,
      child: Chart(
        data: zip(lineSectionsData).toList(),
        variables: {
          'time': Variable(
            accessor: (List datum) => datum[0] as String,
            scale: OrdinalScale(inflate: true, tickCount: 6),
          ),
          'value': Variable(
            accessor: (List datum) => datum[1] as num,
            scale: LinearScale(
              max: 800,
              min: 0,
              formatter: (v) => '${v.toInt()} kWW',
            ),
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
      ),
    );
  }
}
