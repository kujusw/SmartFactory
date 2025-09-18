import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../common/styles/theme_state_notifier.dart';

class CustomToastWidget extends ConsumerWidget {
  const CustomToastWidget({Key? key, required this.msg}) : super(key: key);

  final String msg;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.w),
        color: ref.watch(colorProvider)['accentColor']?.withValues(alpha: 0.8),
      ),
      margin: EdgeInsets.only(bottom: 70.h),
      child: Text(msg, style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.bold, color: Colors.white)),
    );
  }
}
