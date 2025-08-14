import 'package:flutter/material.dart';

class VerticalRadioGroup extends StatefulWidget {
  final List<String> options;
  final int selected;
  final Function(int?) onChanged;

  const VerticalRadioGroup({
    super.key,
    required this.options,
    required this.selected,
    required this.onChanged,
  });

  @override
  _VerticalRadioGroupState createState() => _VerticalRadioGroupState();
}

class _VerticalRadioGroupState extends State<VerticalRadioGroup> {
  void handleRadioValueChange(int? index) {
    widget.onChanged(index);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List<Widget>.generate(widget.options.length, (index) {
        return RadioListTile<int>(
          title: Text(widget.options[index]),
          value: index,
          groupValue: widget.selected,
          onChanged: handleRadioValueChange,
        );
      }),
    );
  }
}
