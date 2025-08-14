import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/values/index.dart';

class SiderSelector extends StatelessWidget {
  final double value;
  final double min;
  final double max;
  final int divisions;

  final ValueChanged<double> onChanged;

  const SiderSelector({
    Key? key,
    required this.value,
    required this.min,
    required this.max,
    required this.onChanged,
    required this.divisions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Slider(
          value: value,
          min: min,
          max: max,
          label: value.round().toString(),
          divisions: divisions,
          onChanged: onChanged,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('$min', style: TextStyle(fontSize: Constant.textSP_16)),
              Text('$max', style: TextStyle(fontSize: Constant.textSP_16)),
            ],
          ),
        ),
      ],
    );
  }
}
