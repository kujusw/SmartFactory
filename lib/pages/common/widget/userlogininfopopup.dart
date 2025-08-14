import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import '../../../common/styles/theme.dart';
import '../../../common/values/index.dart';
import '../../audit/notifier/audit_notifier.dart';
import '../../boards/daily_sob/notifier/dailys_sob_notifier.dart';
import '../../login/notifier/login_notifier.dart';
import '../../reports/notifier/reports_notifier.dart';
import '../../things/notifier/things_notifier.dart';
import '../../users/notifier/users_notifier.dart';

class UserLoginInfoPopup extends ConsumerWidget {
  UserLoginInfoPopup({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: 400.w,
      padding: EdgeInsets.only(top: 10.h, left: 10.w, right: 10.w, bottom: 10.h),
      margin: EdgeInsets.only(right: 20.w),
      decoration: BoxDecoration(
        color: ref.watch(colorProvider)['main'],
        borderRadius: BorderRadius.circular(10.w),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          //登录信息
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.only(left: 5.w),
                height: 40.h,
                child: Text(
                  "Login User:",
                  style: TextStyle(
                    color: ref.watch(colorProvider)['white'],
                    fontSize: Constant.textSP_16,
                  ),
                ),
              ),
              Container(
                height: 40.h,
                padding: EdgeInsets.only(right: 5.w),
                child: Consumer(
                  builder: (context, ref, child) {
                    return Text(
                      ref.watch(loginUserName),
                      style: TextStyle(
                        color: ref.watch(colorProvider)['accentColor'],
                        fontSize: Constant.textSP_20,
                      ),
                    );
                  },
                ),
              )
            ],
          ),
          //登录时间
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.only(left: 5.w),
                height: 40.h,
                child: Text(
                  "Login Time:",
                  style: TextStyle(
                    color: ref.watch(colorProvider)['white'],
                    fontSize: Constant.textSP_16,
                  ),
                ),
              ),
              Container(
                height: 40.h,
                padding: EdgeInsets.only(right: 5.w),
                child: Consumer(
                  builder: (context, ref, child) {
                    return Text(
                      ref.watch(loginTime),
                      style: TextStyle(
                        color: ref.watch(colorProvider)['accentColor'],
                        fontSize: Constant.textSP_16,
                      ),
                    );
                  },
                ),
              )
            ],
          ),
          //退出按钮
          Container(
            margin: EdgeInsets.only(top: 10.h, bottom: 10.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(25.r)),
              color: ref.watch(colorProvider)['accentColor'],
            ),
            child: Consumer(
              builder: (context, ref, child) {
                return TextButton(
                  onPressed: () async {
                    bool result = await ref.read(loginOutProvider.notifier).loginOut(
                          ref.read(loginProvider).data?.token,
                        );
                    if (result) {
                      //数据清空
                      ref.invalidate(loginProvider);
                      ref.invalidate(loginTime);
                      ref.invalidate(loginUserName);
                      clearUserProvider(ref);
                      clearThingsProvider(ref);
                      clearBoardsProvider(ref);
                      clearReportsProvider(ref);
                      clearAuditProvider(ref);

                      unawaited(SmartDialog.dismiss(tag: "UserLoginInfoPopup"));
                    }
                  },
                  child: Text(
                    "Logout",
                    style: TextStyle(
                      color: ref.watch(colorProvider)['white'],
                      fontSize: Constant.textSP_16,
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
