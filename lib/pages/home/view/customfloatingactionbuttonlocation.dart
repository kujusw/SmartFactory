import 'package:flutter/material.dart';

class CustomFloatingActionButtonLocation extends FloatingActionButtonLocation {
  final double offsetX;
  final double offsetY; // 偏移量

  const CustomFloatingActionButtonLocation(this.offsetX, this.offsetY);

  @override
  Offset getOffset(ScaffoldPrelayoutGeometry scaffoldGeometry) {
    // 获取标准的中间位置
    final Offset centerOffset = FloatingActionButtonLocation.centerFloat.getOffset(scaffoldGeometry);
    // 返回新的偏移位置，向上移动offsetY个像素
    return Offset(centerOffset.dx - offsetX, centerOffset.dy - offsetY);
  }
}
