import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/styles/theme_state_notifier.dart';

enum CheckboxState {
  checked,
  unchecked,
  indeterminate,
}

class TriStateCheckbox extends StatefulWidget {
  final CheckboxState value;
  final ValueChanged<CheckboxState> onChanged;

  TriStateCheckbox({required this.value, required this.onChanged});

  @override
  _TriStateCheckboxState createState() => _TriStateCheckboxState();
}

class _TriStateCheckboxState extends State<TriStateCheckbox> {
  @override
  Widget build(BuildContext context) {
    IconData iconData;
    switch (widget.value) {
      case CheckboxState.checked:
        iconData = Icons.check_box;
        break;
      case CheckboxState.indeterminate:
        iconData = Icons.indeterminate_check_box;
        break;
      case CheckboxState.unchecked:
        iconData = Icons.check_box_outline_blank;
        break;
    }

    return Consumer(builder: (context, ref, child) {
      return IconButton(
        icon: Icon(
          iconData,
          color: ref.watch(colorProvider)['white'],
          size: 32.h,
        ),
        style: ButtonStyle(
          minimumSize: WidgetStateProperty.all(Size(0, 0)),
          padding: WidgetStateProperty.all(EdgeInsets.zero),
        ),
        onPressed: () {
          CheckboxState newValue;
          switch (widget.value) {
            case CheckboxState.checked:
              newValue = CheckboxState.unchecked;
              break;
            case CheckboxState.indeterminate:
              newValue = CheckboxState.checked;
              break;
            case CheckboxState.unchecked:
              newValue = CheckboxState.checked;
          }
          widget.onChanged(newValue);
        },
      );
    });
  }
}
