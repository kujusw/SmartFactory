import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../common/styles/theme_state_notifier.dart';
import '../table/view/thingstablewidget.dart';

class ThingsView extends ConsumerWidget {
  const ThingsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: ref.watch(colorProvider)['backgroundColorWhole'],
      body: Container(
        width: 1820.w,
        height: 1010.h,
        padding: EdgeInsets.only(left: 10.w, right: 10.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10.w), bottomRight: Radius.circular(10.w)),
        ),
        child: Container(
          height: 1000.h,
          child: Row(
            children: [
              Expanded(
                flex: 6,
                child: ThingsViewTableWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
