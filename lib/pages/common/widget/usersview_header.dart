// ignore_for_file: unused_result

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../common/utils/screenutil.dart';
import '../../../common/styles/theme.dart';
import '../../../common/values/index.dart';
import '../../users/notifier/users_notifier.dart';

class UsersViewHeader extends ConsumerWidget {
  const UsersViewHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 60.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: ref.watch(colorProvider)['transparent'],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 1440.w,
            child: Consumer(
              builder: (_, WidgetRef ref, __) {
                return ScrollConfiguration(
                  behavior: const MaterialScrollBehavior()
                      .copyWith(scrollbars: false, dragDevices: KJScreenUtil.kTouchLikeDeviceTypes),
                  child: Consumer(
                    builder: (_, WidgetRef ref, __) {
                      return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(children: [
                          BoardsTab(
                            title: "Users",
                            press: () {
                              ref.read(indexUsersProvider.notifier).setIndex(0);
                            },
                            isSelected: ref.watch(indexUsersProvider) == 0,
                          ),
                          BoardsTab(
                            title: "Roles",
                            press: () {
                              ref.read(indexUsersProvider.notifier).setIndex(1);
                            },
                            isSelected: ref.watch(indexUsersProvider) == 1,
                          ),
                          BoardsTab(
                            title: "Locations",
                            press: () {
                              ref.read(indexUsersProvider.notifier).setIndex(2);
                            },
                            isSelected: ref.watch(indexUsersProvider) == 2,
                          ),
                        ]),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class BoardsTab extends ConsumerWidget {
  const BoardsTab({
    super.key,
    required this.title,
    required this.press,
    this.isSelected = false,
  });

  final String title;
  final VoidCallback press;
  final bool isSelected;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextButton(
      onPressed: press,
      style: ButtonStyle(
        minimumSize: WidgetStateProperty.all(Size(0, 0)),
        padding: WidgetStateProperty.all(EdgeInsets.zero),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.r),
          ),
        ),
        backgroundColor: WidgetStateProperty.resolveWith<Color>(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.hovered)) {
              return ref.watch(colorProvider)['accentColor']!.withValues(alpha: 0.3); // 鼠标悬停时的颜色
            }
            // 默认状态下的颜色
            return ref.watch(colorProvider)['backgroundColorWidget']!;
          },
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? ref.watch(colorProvider)['accentColor']?.withValues(alpha: 0.8) : Colors.transparent,
          borderRadius: BorderRadius.circular(10.0.w),
          shape: BoxShape.rectangle,
        ),
        padding: EdgeInsets.only(left: 18.w, right: 18.w, top: 8.h, bottom: 8.h),
        child: Stack(
          children: [
            Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: 200.w,
                ),
                child: Text(
                  title,
                  //单行显示,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: Constant.textSP_16,
                    color: isSelected ? ref.watch(colorProvider)['white'] : ref.watch(colorProvider)['text'],
                    fontWeight: FontWeight.bold,
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
