import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../common/styles/theme_state_notifier.dart';
import '../../common/utils/logger_manager.dart';
import '../../common/values/index.dart';

class CustomTitleTextField extends ConsumerWidget {
  final String title;
  final String hintText;
  final String initialValue;
  final bool isEnable;
  final TextInputType keyboardType;

  final Function(String) onChanged;
  const CustomTitleTextField({
    required this.title,
    required this.hintText,
    required this.initialValue,
    required this.onChanged,
    this.keyboardType = TextInputType.text,
    this.isEnable = true,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 80.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text(
              title,
              style: TextStyle(
                fontSize: Constant.textSP_18,
                color: ref.watch(colorProvider)['text'],
              ),
            ),
          ),
          Container(
            height: 30.h,
            margin: EdgeInsets.only(top: 5.h, bottom: 5.h),
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.h),
              border: Border.all(
                color: ref.watch(colorProvider)['dividerColor']!,
              ),
              shape: BoxShape.rectangle,
            ),
            child: TextField(
              enabled: isEnable,
              style: TextStyle(
                fontSize: Constant.textSP_12,
                color: ref.watch(colorProvider)['text'],
              ),
              onChanged: (value) {
                LoggerManager().d("value: $value");
                onChanged(value);
              },
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(fontSize: Constant.textSP_12, color: ref.watch(colorProvider)['text']),
                contentPadding: EdgeInsets.zero,
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.transparent,
                  ),
                ),
                disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.transparent,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.transparent,
                  ),
                ),
              ),
              controller: TextEditingController(text: initialValue),
            ),
          ),
        ],
      ),
    );
  }
}
