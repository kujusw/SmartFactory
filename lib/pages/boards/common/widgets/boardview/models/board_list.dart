import 'package:flutter/material.dart';
import 'item_state.dart';

class BoardList {
  BuildContext? context;
  double? x;
  double? y;
  double? height;
  double? width;
  Widget? child;
  Color? backgroundColor;
  VoidCallback? setState;
  List<ListItem> items = [];
  TextEditingController nameController = TextEditingController();
  ScrollController scrollController;

  // String title;
  BoardList({
    required this.items,
    this.context,
    this.height,
    this.width,
    this.setState,
    this.x,
    this.child,
    this.backgroundColor = const Color.fromARGB(
      255,
      247,
      248,
      252,
    ),
    this.y,
    required this.scrollController,
  });
}
