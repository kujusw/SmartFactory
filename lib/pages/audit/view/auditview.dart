import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/styles/theme.dart';
import 'audittabview.dart';

class AuditView extends ConsumerWidget {
  const AuditView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: ref.watch(colorProvider)['backgroundColorWhole'],
      body: Container(
        width: 1820.w,
        height: 1010.h,
        padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 10.h, bottom: 10.h),
        child: AuditTableWidget(),
      ),
    );
  }
}
