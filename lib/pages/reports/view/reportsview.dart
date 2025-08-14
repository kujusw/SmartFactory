import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../common/styles/theme.dart';
import '../table/view/reportstablewidget.dart';

class ReportsView extends ConsumerWidget {
  const ReportsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: ref.watch(colorProvider)['backgroundColorWhole'],
      body: Container(
        width: 1820.w,
        height: 1010.h,
        padding: EdgeInsets.only(left: 10.w, right: 10.w),
        child: Container(
          height: 1000.h,
          child: Row(
            children: [
              // Expanded(
              //   flex: 1,
              //   child: ReportsViewGeneralWidget(),
              // ),
              Expanded(
                flex: 6,
                child: ReportsViewTableWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
