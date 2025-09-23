// ignore_for_file: unused_result

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../common/styles/assets.dart';
import '../../../../common/styles/theme_state_notifier.dart';
import '../../../../common/values/index.dart';
import '../../../../core/notifiers/device_state_notifier.dart';
import '../../../../models/device_model.dart';
import '../../../boards/general/notifier/device_notifier.dart';
import '../../../login/notifier/login_notifier.dart';
import '../../notifier/things_notifier.dart';
import 'thingstable.dart';

class ThingsViewTableWidget extends ConsumerWidget {
  ThingsViewTableWidget({Key? key}) : super(key: key);
  final verticalScrollController = ScrollController();
  final horizontalScrollController = ScrollController();
  final TextEditingController searchController = TextEditingController()..text = "";
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 1000.h,
      margin: EdgeInsets.only(top: 10.h, left: 10.w, bottom: 10.h),
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
                    child: Text(
                      ref.watch(selectedGroupProvider),
                      style: TextStyle(
                        color: ref.watch(colorProvider)['text'],
                        fontSize: Constant.textSP_20,
                      ),
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
                            fontSize: Constant.textSP_16,
                            color: ref.watch(colorProvider)['text'],
                          ),
                          onChanged: (value) {
                            ref.read(searchValueInThingsProvider.notifier).set(value);
                          },
                          controller: searchController,
                          decoration: InputDecoration(
                            hintText: "Search Devices",
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
                                if (ref.read(searchValueInThingsProvider).toString().length > 0) {
                                  ref.read(searchValueInThingsProvider.notifier).set("");
                                  searchController.clear();
                                }
                              },
                              child: ref.watch(searchValueInThingsProvider).toString().length > 0
                                  ? Icon(
                                      Icons.close,
                                      color: ref.watch(colorProvider)['text'],
                                      size: 20.sp,
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
                      //     icon: Icon(
                      //       Icons.filter_alt_rounded,
                      //       color: ref.watch(colorProvider)['white'],
                      //       size: 25.h,
                      //     ),
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
                          icon: Icon(
                            Icons.restart_alt_rounded,
                            color: ref.watch(colorProvider)['white'],
                            size: 25.h,
                          ),
                          style: ButtonStyle(
                            overlayColor: WidgetStateProperty.all(
                                ref.watch(colorProvider)['accentColor']?.withValues(alpha: 0.3)),
                          ),
                          onPressed: () {
                            ref.refresh(devicesProvider);
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
                      //     icon: Icon(
                      //       Icons.download,
                      //       color: ref.watch(colorProvider)['white'],
                      //       size: 25.h,
                      //     ),
                      //     onPressed: () {},
                      //   ),
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
                              final result = await ref.read(deleteDeviceProvider(
                                ref.watch(deviceManagerProvider).firstWhere((element) => element.selected == true).id ??
                                    "",
                                ref.read(loginProvider).data?.token ?? "",
                              ).future); // 传入token;
                              // 关键：判断ref是否还活着
                              if (result.code == 100001 && context.mounted) {
                                ref.refresh(devicesProvider);
                                unawaited(SmartDialog.dismiss(tag: "ThingsViewAddActionButton"));
                                // 清空 keeplive 为true的
                              } else {
                                unawaited(SmartDialog.showToast("Failed to delete device"));
                              }
                            },
                          ),
                        ),
                        visible: ref
                                .watch(deviceManagerProvider)
                                .firstWhere((element) => element.selected == true,
                                    orElse: () => DeviceModel(selected: false))
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
            height: 925.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.w),
              color: ref.watch(colorProvider)['backgroundColorWidget'],
            ),
            child: ThingsTable(),
          ),
        ],
      ),
    );
  }
}
