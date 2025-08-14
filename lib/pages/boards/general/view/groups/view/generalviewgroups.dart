// ignore_for_file: unused_result

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../../common/styles/assets.dart';
import '../../../../../../common/styles/theme.dart';
import '../../../../../../common/values/index.dart';
import '../../../../../../core/dependencies/dependencies.dart';
import '../../../notifier/device_notifier.dart';
import 'devicelistview.dart';
import 'menudevicelistview.dart';
import 'searchdevicelistview.dart';

class GeneralViewGroups extends ConsumerWidget {
  GeneralViewGroups({Key? key}) : super(key: key);
  final TextEditingController searchController = TextEditingController()..text = "";
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 770.h,
      margin: EdgeInsets.only(top: 10.h, left: 10.w, right: 10.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 20.w, right: 20.w),
            height: 60.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.w),
              color: ref.watch(colorProvider)['backgroundColorWidget'],
            ),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    height: 40.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: ref.watch(colorProvider)['backgroundColorIconButton'], // 设置背景颜色
                    ),
                    child: Consumer(
                      builder: (BuildContext context, WidgetRef ref, Widget? child) {
                        return IconButton(
                          icon: Icon(
                            Icons.refresh,
                            color: ref.watch(colorProvider)['text'],
                            size: 20.h,
                          ),
                          style: ButtonStyle(
                            overlayColor: WidgetStateProperty.all(
                                ref.watch(colorProvider)['accentColor']?.withValues(alpha: 0.3)),
                          ),
                          onPressed: () {
                            ref.refresh(devicesProvider);
                          },
                        );
                      },
                    ),
                  ),
                ),
                Positioned(
                  right: 0.w,
                  top: 10.h,
                  bottom: 10.h,
                  child: Container(
                    width: 240.w,
                    height: 40.h,
                    padding: EdgeInsets.only(left: 10.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.h),
                      shape: BoxShape.rectangle,
                      color: ref.watch(colorProvider)['backgroundColorIconButton'],
                    ),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Consumer(
                        builder: (contextConsumer, ref, child) {
                          return TextField(
                            style: TextStyle(
                              fontSize: Constant.textSP_14,
                              color: ref.watch(colorProvider)['text'],
                            ),
                            onChanged: (value) {
                              ref.read(vualeSearchProvider.notifier).state = value;
                              //通过是否有值替换下面的列表
                            },
                            controller: searchController,
                            decoration: InputDecoration(
                              hintText: "Search Groups",
                              hintStyle:
                                  TextStyle(fontSize: Constant.textSP_14, color: ref.watch(colorProvider)['text']),
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
                                onTap: () {
                                  if (ref.read(vualeSearchProvider).toString().length > 0) {
                                    ref.read(vualeSearchProvider.notifier).state = "";
                                    searchController.clear();
                                  }
                                },
                                child: ref.watch(vualeSearchProvider).toString().length > 0
                                    ? Icon(
                                        Icons.close,
                                        color: ref.watch(colorProvider)['text'],
                                        size: 20.h,
                                      )
                                    : ColorFiltered(
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
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          //分割线
          SizedBox(height: 10.h),

          Container(
              height: 690.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.w),
                color: ref.watch(colorProvider)['backgroundColorWidget'],
              ),
              child: Column(
                children: [
                  Container(
                    height: 48.h,
                    padding: EdgeInsets.only(left: 20.w, right: 20.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ColorFiltered(
                              colorFilter: ColorFilter.mode(
                                ref.watch(colorProvider)['white']!,
                                BlendMode.srcIn,
                              ),
                              child: SvgPicture.asset(
                                AssetsImages.lightningBoltIconRemovebgPreview_2Svg,
                                height: 30.h,
                                width: 30.h,
                              ),
                            ),
                            Container(
                              color: ref.watch(colorProvider)['grey'],
                              width: 2.w,
                              margin: EdgeInsets.only(left: 20.w, right: 20.w, top: 10.h, bottom: 10.h),
                            ),
                            Text(
                              "Name",
                              style: TextStyle(
                                fontSize: Constant.textSP_14,
                                color: ref.watch(colorProvider)['text'],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              color: ref.watch(colorProvider)['grey'],
                              width: 2.w,
                              margin: EdgeInsets.only(left: 20.w, right: 20.w, top: 10.h, bottom: 10.h),
                            ),
                            ColorFiltered(
                              colorFilter: ColorFilter.mode(
                                ref.watch(colorProvider)['white']!,
                                BlendMode.srcIn,
                              ),
                              child: SvgPicture.asset(
                                AssetsImages.bellIconGraySvg,
                                height: 30.h,
                                width: 30.h,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  //分割线
                  Container(
                    color: ref.watch(colorProvider)['dividerColor'],
                    margin: EdgeInsets.only(top: 5.h, bottom: 5.h),
                    height: 2.h,
                  ),
                  Consumer(builder: (context, ref, child) {
                    return ref.watch(vualeSearchProvider).toString().length > 0
                        ? SearchDeviceListView()
                        : ref.watch(showMenuDeviceListProvider) > 0
                            ? MenuDeviceListView()
                            : DeviceListView();
                  }),

                  Consumer(builder: (context, ref, child) {
                    var result = ref.watch(vualeSearchProvider).toString().length > 0
                        ? ref.watch(itemsSearchDeviceModelInDeviceProvider) ?? []
                        : ref.watch(showMenuDeviceListProvider) > 0
                            ? ref.watch(itemsDeviceModelProvider.notifier).getSelectedDevices() ?? []
                            : ref.watch(itemsDeviceModelProvider);
                    return Container(
                      height: 30.h,
                      alignment: Alignment.bottomLeft,
                      padding: EdgeInsets.only(left: 20.w, right: 20.w),
                      child: Text(
                        result.length.toString() + " Devices",
                        style: TextStyle(
                          fontSize: Constant.textSP_14,
                          color: ref.watch(colorProvider)['text'],
                        ),
                      ),
                    );
                  }),
                ],
              )),
        ],
      ),
    );
  }
}
