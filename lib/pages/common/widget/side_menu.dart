import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../common/styles/assets.dart';
import '../../../common/styles/theme_state_notifier.dart';
import '../../../common/values/index.dart';
import '../../../core/dependencies/dependencies.dart';
import '../../../core/notifiers/floatbuttonmanager.dart';
import '../../../models/user_role_model.dart';
import '../../login/notifier/login_notifier.dart';

class SideMenu extends ConsumerWidget {
  final TextEditingController urlController = TextEditingController()..text = "";
  SideMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Drawer(
      backgroundColor: ref.watch(colorProvider)['backgroundColorSideMenu'],
      child: Stack(
        children: [
          ScrollConfiguration(
            behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
            child: ListView(
              children: [
                Container(
                  height: 70.h,
                  margin: EdgeInsets.fromLTRB(10.w, 15.h, 10.w, 15.h),
                  child: Image.asset(
                    AssetsImages.logoPng,
                    fit: BoxFit.contain,
                  ),
                ),
                DrawerListTile(
                  title: "Boards",
                  iconSrc: AssetsImages.dashboardIconRemovebgPreviewSvg,
                  isSelected: ref.read(indexHomeProvider) == 0,
                  press: () {
                    //重置 fab
                    ref.read(indexHomeProvider.notifier).setIndex(0);
                  },
                ),
                DrawerListTile(
                  title: "Devices",
                  iconSrc: AssetsImages.thingsIconSvg,
                  isSelected: ref.read(indexHomeProvider) == 1,
                  press: () {
                    //重置 fab
                    ref.read(indexHomeProvider.notifier).setIndex(1);
                  },
                ),
                // Visibility(
                //   child: DrawerListTile(
                //     title: "Users",
                //     iconSrc: AssetsImages.usersIconSvg,
                //     isSelected: ref.read(indexHomeProvider) == 2,
                //     press: () {
                //       //重置 fab
                //       ref.invalidate(floatButtonProvider);
                //       ref.read(indexHomeProvider.notifier).setIndex(2);
                //     },
                //   ),
                //   visible: ref
                //               .read(loginProvider)
                //               .data
                //               ?.permissions
                //               ?.firstWhere(
                //                 (permission) => permission.module == "Users",
                //                 orElse: () => Permission(),
                //               )
                //               .name ==
                //           "read" ||
                //       ref
                //               .read(loginProvider)
                //               .data
                //               ?.permissions
                //               ?.firstWhere(
                //                 (permission) => permission.module == "Users",
                //                 orElse: () => Permission(),
                //               )
                //               .name ==
                //           "write" ||
                //       (ref.read(loginProvider).data?.isAdmin ?? false),
                // ),
                DrawerListTile(
                  title: "Users",
                  iconSrc: AssetsImages.usersIconSvg,
                  isSelected: ref.read(indexHomeProvider) == 2,
                  press: () {
                    //重置 fab
                    ref.invalidate(floatButtonProvider);
                    ref.read(indexHomeProvider.notifier).setIndex(2);
                  },
                ),
                DrawerListTile(
                  title: "Settings",
                  iconSrc: AssetsImages.settingsIconSvg,
                  isSelected: ref.read(indexHomeProvider) == 3,
                  press: () {
                    ref.read(indexHomeProvider.notifier).setIndex(3);
                  },
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0.h,
            child: Container(
              padding: EdgeInsets.fromLTRB(10.w, 10.h, 10.w, 10.h),
              child: Row(
                children: [
                  Text(
                    "Powered by \nKUJU",
                    style: TextStyle(
                      fontSize: Constant.textSP_12,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Positioned(
          //   bottom: 15.h,
          //   child: Container(
          //     width: 100.w,
          //     height: 70.h,
          //     child: Image.asset(
          //       AssetsImages.logoPng,
          //       fit: BoxFit.contain,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}

class DrawerListTile extends ConsumerWidget {
  const DrawerListTile({
    super.key,
    required this.title,
    required this.iconSrc,
    required this.press,
    this.isSelected = false,
  });

  final String title, iconSrc;
  final VoidCallback press;
  final bool isSelected;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextButton(
      onPressed: press,
      style: ButtonStyle(
        minimumSize: WidgetStateProperty.all(Size(0, 0)), // 去除最小尺寸
        padding: WidgetStateProperty.all(EdgeInsets.zero), // 去除内边距
        shape: WidgetStateProperty.all(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0.w),
        )),
        backgroundColor: WidgetStateProperty.resolveWith<Color>(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.hovered)) {
              return ref.watch(colorProvider)['backgroundColorSideMenu']!.withValues(alpha: 0.3); // 鼠标悬停时的颜色
            }
            // 默认状态下的颜色
            return ref.watch(colorProvider)['transparent']!;
          },
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? ref.watch(colorProvider)['accentColor']?.withValues(alpha: 0.8) : Colors.black,
          shape: BoxShape.rectangle,
        ),
        padding: EdgeInsets.only(top: 8.h, bottom: 8.h),
        child: Stack(
          children: [
            Center(
              child: Column(
                children: [
                  ColorFiltered(
                    colorFilter: ColorFilter.mode(
                      Colors.white, // 要应用的颜色
                      BlendMode.srcIn,
                    ),
                    child: SvgPicture.asset(iconSrc, height: 30.h, width: 30.h),
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    title,
                    //单行显示,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: Constant.textSP_16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
