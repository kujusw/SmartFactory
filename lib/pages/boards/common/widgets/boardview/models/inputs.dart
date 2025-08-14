import 'package:flutter/material.dart';

class BoardListsData {
  final List<Widget> items;
  Color? backgroundColor;
  double width;
  BoardListsData({
    required this.items,
    this.backgroundColor = const Color.fromARGB(
      255,
      247,
      248,
      252,
    ),
    this.width = 300,
  });
}

class ScrollConfig {
  double offset;
  Duration duration;
  Curve curve;

  ScrollConfig({
    required this.offset,
    required this.duration,
    required this.curve,
  });
}
