import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../common/styles/theme.dart';
import '../../../../../../common/styles/theme_state_notifier.dart';
import '../../../../../../common/values/index.dart';

class GeneralViewAlarms extends ConsumerWidget {
  const GeneralViewAlarms({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 770.h,
      padding: EdgeInsets.only(top: 10.h),
      child: Column(
        children: <Widget>[
          Container(
            height: 60.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.w),
              color: ref.watch(colorProvider)['backgroundColorWidget'],
            ),
            child: Center(
              child: Text(
                "Alarms",
                style: TextStyle(
                  fontSize: Constant.textSP_18,
                  color: ref.watch(colorProvider)['text'],
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),

          //分割线
          SizedBox(height: 10.h),
          Container(
            height: 690.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.w),
              color: ref.watch(colorProvider)['backgroundColorWidget'],
            ),
            child: Center(),
          ),
        ],
      ),
    );
  }
}
