import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import '../../../common/styles/assets.dart';
import '../../../common/styles/theme_state_notifier.dart';
import '../../../common/values/index.dart';
import '../../../core/dependencies/dependencies.dart';
import '../../../models/login_model.dart';
import '../../login/notifier/login_notifier.dart';
import 'userlogininfopopup.dart';

class Header extends ConsumerWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<LoginOutResponseEntity?>(loginOutProvider, (previous, next) async {
      if (next?.code == 100001) {
        //延迟300ms跳转，等待退出登录接口返回
        await Future.delayed(Duration(milliseconds: 300));
        context.go('/login');
      }
    });
    return Container(
      height: 70.h,
      margin: EdgeInsets.fromLTRB(15.w, 15.h, 15.w, 15.h),
      child: Center(
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(left: 20.w),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  ref.watch(indexHomeProvider) == 0
                      ? "Boards"
                      : ref.watch(indexHomeProvider) == 1
                          ? "Devices"
                          : ref.watch(indexHomeProvider) == 2
                              ? "Charts"
                              : ref.watch(indexHomeProvider) == 3
                                  ? "Users"
                                  : ref.watch(indexHomeProvider) == 4
                                      ? "Audit"
                                      : ref.watch(indexHomeProvider) == 5
                                          ? "Settings"
                                          : "Boards",
                  style: TextStyle(
                    fontSize: Constant.textSP_24,
                    // fontSize: Theme.of(context).textTheme.titleMedium?.fontSize,
                    color: ref.watch(colorProvider)['white'],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(right: 20.w),
              child: Align(
                alignment: Alignment.centerRight,
                child: CircleAvatar(
                  radius: 25.w,
                  backgroundColor: ref.watch(colorProvider)['accentColor'],
                  child: TextButton(
                    onPressed: () {
                      unawaited(SmartDialog.showAttach(
                        targetContext: context,
                        usePenetrate: false,
                        alignment: Alignment.bottomRight,
                        maskColor: Colors.transparent,
                        clickMaskDismiss: true,
                        keepSingle: true,
                        tag: "UserLoginInfoPopup",
                        builder: (_) => UserLoginInfoPopup(),
                      ));
                    },
                    style: ButtonStyle(
                      padding: WidgetStateProperty.all(EdgeInsets.zero),
                    ),
                    child: Text(
                      ref.watch(loginUserNameProvider).length > 3
                          ? ref.watch(loginUserNameProvider).substring(0, 3)
                          : ref.watch(loginUserNameProvider).length > 0
                              ? ref.watch(loginUserNameProvider)
                              : "User",
                      style: TextStyle(
                        fontSize: Constant.textSP_20,
                        // fontSize: Theme.of(context).textTheme.titleMedium?.fontSize,
                        color: ref.watch(colorProvider)['white'],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              right: 100.w,
              height: 50.h,
              child: Container(
                width: 280.w,
                margin: EdgeInsets.only(top: 5.h, bottom: 5.h),
                padding: EdgeInsets.only(left: 20.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.h),
                  color: ref.watch(colorProvider)['backgroundColorWidget'],
                ),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Center(
                    child: TextField(
                      style: TextStyle(
                        fontSize: Constant.textSP_16,
                        color: ref.watch(colorProvider)['text'],
                      ),
                      onChanged: (value) {},
                      decoration: InputDecoration(
                        hintText: 'What are you looking for?',
                        hintStyle: TextStyle(
                            letterSpacing: -0.9, fontSize: Constant.textSP_16, color: ref.watch(colorProvider)['text']),
                        contentPadding: EdgeInsets.only(top: 0, bottom: 0),
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
                          onTap: () {},
                          child: ColorFiltered(
                            colorFilter: ColorFilter.mode(
                              ref.watch(colorProvider)['white']!,
                              BlendMode.srcIn,
                            ),
                            child: SvgPicture.asset(
                              AssetsImages.searchIconSvg,
                              height: 20.h,
                              width: 20.h,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
