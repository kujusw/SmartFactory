// ignore_for_file: unused_result

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../common/styles/assets.dart';
import '../../../../common/styles/theme.dart';
import '../../../../common/values/index.dart';
import '../../../../models/user_manager_model.dart';
import '../../../login/notifier/login_notifier.dart';
import '../../notifier/users_notifier.dart';
import 'userstable.dart';

class UsersTableWidget extends ConsumerWidget {
  UsersTableWidget({Key? key}) : super(key: key);
  final verticalScrollController = ScrollController();
  final horizontalScrollController = ScrollController();

  final TextEditingController searchController = TextEditingController()..text = "";
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 920.h,
      margin: EdgeInsets.only(bottom: 10.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.w),
        color: ref.watch(colorProvider)['backgroundColorWidget'],
      ),
      child: Column(
        children: [
          SizedBox(
            height: 55.h,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: 20.w),
                    child: Consumer(
                      builder: (context, ref, child) {
                        return Text(
                          "All Users",
                          style: TextStyle(
                            color: ref.watch(colorProvider)['text'],
                            fontSize: Constant.textSP_20,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: 300.w,
                        height: 35.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.w),
                          color: ref.watch(colorProvider)['backgroundColorIconButton'],
                        ),
                        child: TextField(
                          style: TextStyle(
                            fontSize: Constant.textSP_14,
                            color: ref.watch(colorProvider)['text'],
                          ),
                          onChanged: (value) {
                            ref.read(valueSearchProviderInUser.notifier).state = value;
                          },
                          controller: searchController,
                          decoration: InputDecoration(
                            hintText: "Search User",
                            hintStyle: TextStyle(fontSize: Constant.textSP_16, color: ref.watch(colorProvider)['text']),
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
                            prefixIcon: GestureDetector(
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
                            suffixIcon: GestureDetector(
                              onTap: () {
                                if (ref.read(valueSearchProviderInUser).toString().length > 0) {
                                  ref.read(valueSearchProviderInUser.notifier).state = "";
                                  searchController.clear();
                                }
                              },
                              child: ref.watch(valueSearchProviderInUser).toString().length > 0
                                  ? Icon(
                                      Icons.close,
                                      color: ref.watch(colorProvider)['text'],
                                      size: 20.h,
                                    )
                                  : Container(height: 0, width: 0),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10.w),
                      // Container(
                      //   height: 48.h,
                      //   decoration: BoxDecoration(
                      //     shape: BoxShape.circle,
                      //     color: ref.watch(colorProvider)['backgroundColorIconButton'], // 设置背景颜色
                      //   ),
                      //   child: IconButton(
                      //     icon: Icon(Icons.filter_alt_rounded, color: ref.watch(colorProvider)['text'], size: 25.h),
                      //     onPressed: () {},
                      //   ),
                      // ),
                      // SizedBox(width: 10.w),
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: ref.watch(colorProvider)['backgroundColorIconButton'], // 设置背景颜色
                        ),
                        child: IconButton(
                          icon: Icon(Icons.restart_alt_rounded, color: ref.watch(colorProvider)['text'], size: 25.h),
                          style: ButtonStyle(
                            overlayColor: WidgetStateProperty.all(
                                ref.watch(colorProvider)['accentColor']?.withValues(alpha: 0.3)),
                          ),
                          onPressed: () {
                            ref.refresh(getUsersProvider);
                          },
                        ),
                      ),
                      SizedBox(width: 10.w),
                      // Container(
                      //   height: 48.h,
                      //   decoration: BoxDecoration(
                      //     shape: BoxShape.circle,
                      //     color: ref.watch(colorProvider)['backgroundColorIconButton'], // 设置背景颜色
                      //   ),
                      //   child: IconButton(
                      //     icon: Icon(Icons.download, color: ref.watch(colorProvider)['text'], size: 25.h),
                      //     onPressed: () {},
                      //   ),
                      // ),
                      // SizedBox(
                      //   width: ref
                      //               .watch(itemsUserModelFilteredProvider)
                      //               .firstWhere((element) => element.selected == true,
                      //                   orElse: () => UserModel(selected: false))
                      //               .selected ??
                      //           false
                      //       ? 10.w
                      //       : 0,
                      // ),
                      Visibility(
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: ref.watch(colorProvider)['backgroundColorIconButton'], // 设置背景颜色
                          ),
                          child: IconButton(
                            style: ButtonStyle(
                              overlayColor: WidgetStateProperty.all(
                                  ref.watch(colorProvider)['accentColor']?.withValues(alpha: 0.3)),
                            ),
                            icon: Icon(Icons.delete, color: ref.watch(colorProvider)['red'], size: 25.h),
                            onPressed: () async {
                              bool result = await ref.read(deleteUserProvider.notifier).deleteUser(
                                  ref
                                      .watch(itemsUserModelFilteredProvider)
                                      .firstWhere((element) => element.selected == true)
                                      .id,
                                  ref.read(loginProvider).data?.token);
                              if (result) {
                                //刷新数据
                                ref.refresh(getUsersProvider);
                              } else {
                                unawaited(SmartDialog.showToast("Failed to delete user"));
                              }
                            },
                          ),
                        ),
                        visible: ref
                                .watch(itemsUserModelFilteredProvider)
                                .firstWhere((element) => element.selected == true,
                                    orElse: () => UserModel(selected: false))
                                .selected ??
                            false,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 855.h,
            child: UsersTable(),
          ),
        ],
      ),
    );
  }
}
