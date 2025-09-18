import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../common/styles/theme.dart';
import '../../common/styles/theme_state_notifier.dart';
import '../../common/values/index.dart';

class StarredTextFieldSelected extends ConsumerWidget {
  final String title;
  final String initialValue;
  final bool isEnable;
  final bool starShow;
  final double width;
  final double titleSize;
  final Function(String) onChanged;
  final Function() suffixIconOnTap;

  const StarredTextFieldSelected({
    required this.title,
    required this.initialValue,
    required this.onChanged,
    this.isEnable = true,
    this.starShow = true,
    this.titleSize = 18,
    this.width = double.infinity,
    required this.suffixIconOnTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 80.h,
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Visibility(
                visible: starShow,
                child: Icon(
                  Icons.star,
                  size: 10.w,
                  color: Colors.red,
                ),
              ),
              SizedBox(
                width: 4.w,
              ),
              Text(
                title,
                style: TextStyle(
                  fontSize: titleSize.sp,
                  color: ref.watch(colorProvider)['text'],
                ),
              ),
            ],
          ),
          Container(
            height: 30.h,
            padding: EdgeInsets.only(left: 10.w),
            margin: EdgeInsets.only(top: 5.h, bottom: 15.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.h),
              border: Border.all(
                color: ref.watch(colorProvider)['dividerColor']!,
              ),
            ),
            child: TextField(
              readOnly: !isEnable,
              style: TextStyle(
                fontSize: Constant.textSP_12,
                color: ref.watch(colorProvider)['text'],
              ),
              onChanged: onChanged,
              decoration: InputDecoration(
                hintText: title,
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
                suffixIcon: GestureDetector(
                  onTap: suffixIconOnTap,
                  child: Icon(
                    Icons.search,
                    size: 15.h,
                    color: ref.watch(colorProvider)['text'],
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
