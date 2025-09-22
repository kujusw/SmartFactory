// ignore_for_file: unused_result

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../common/styles/assets.dart';
import '../../../common/styles/theme_state_notifier.dart';
import '../../../common/utils/logger_manager.dart';
import '../../../common/values/index.dart';
import '../../../models/device_model_new.dart';
import '../../boards/general/notifier/device_notifier.dart';
import '../../common/customtitletextfield.dart';
import '../../login/notifier/login_notifier.dart';
import '../../users/notifier/locationuimanager.dart';
import '../adddevice/view/getdevicelistviewinadddevice.dart';
import '../adddevice/view/getsearchdevicelistviewinadddevice.dart';
import '../adddevice/view/locationlistview.dart';
import '../notifier/addactionview_notifer.dart';
import '../notifier/things_notifier.dart';

class ThingsViewAddActionView extends ConsumerWidget {
  final TextEditingController searchController = TextEditingController()..text = "";
  ThingsViewAddActionView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: 600.w,
      height: 1080.h,
      color: ref.watch(colorProvider)['backgroundColorRightAction'],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(left: 20.w, right: 20.w),
            height: 70.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "New Device",
                  style: TextStyle(
                    fontSize: Constant.textSP_18,
                    color: ref.watch(colorProvider)['white'],
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    unawaited(SmartDialog.dismiss(tag: "ThingsViewAddActionButton"));
                  },
                  color: ref.watch(colorProvider)['white'],
                ),
              ],
            ),
          ),
          Container(
            height: 940.h,
            padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomTitleTextField(
                    title: 'Device Name',
                    hintText: 'Enter Device Name',
                    initialValue: "",
                    onChanged: (value) {
                      ref.read(addDeviceNameProvider.notifier).set(value);
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Select Device",
                          style: TextStyle(
                            fontSize: Constant.textSP_18,
                            color: ref.watch(colorProvider)['white'],
                          ),
                        ),
                        Text(
                          ref.watch(selectedDevicesInThingsProvider).length.toString(),
                          style: TextStyle(
                            fontSize: Constant.textSP_18,
                            color: ref.watch(colorProvider)['white'],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Stack(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          height: 50.h,
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
                                  size: 30.sp,
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
                          height: 50.h,
                          padding: EdgeInsets.only(left: 10.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.h),
                            shape: BoxShape.rectangle,
                            color: ref.watch(colorProvider)['backgroundColorIconButton'],
                          ),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: TextField(
                              style: TextStyle(
                                fontSize: Constant.textSP_14,
                                color: ref.watch(colorProvider)['text'],
                              ),
                              onChanged: (value) {
                                ref.read(searchValueInThingsProvider.notifier).set(value);
                                //通过是否有值替换下面的列表
                              },
                              controller: searchController,
                              decoration: InputDecoration(
                                hintText: "Search Device",
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
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  ref.watch(searchValueInThingsProvider).toString().length > 0
                      ? SearchDeviceListViewInAddDevice(type: "NEW")
                      : DeviceListViewInAddDevice(type: "NEW"),
                  Padding(
                    padding: EdgeInsets.only(top: 15.h, bottom: 15.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Select Location",
                          style: TextStyle(
                            fontSize: Constant.textSP_18,
                            color: ref.watch(colorProvider)['white'],
                          ),
                        ),
                        Text(
                          ref.watch(selectedLocationInThingsProvider)?.name ?? "",
                          style: TextStyle(
                            fontSize: Constant.textSP_18,
                            color: ref.watch(colorProvider)['white'],
                          ),
                        ),
                      ],
                    ),
                  ),
                  ref.watch(getLocationsProvider).when(
                        data: (data) {
                          return LocationListViewInAddDevice(data);
                        },
                        loading: () => Container(
                          padding: EdgeInsets.only(left: 20.w, right: 20.w),
                          height: 200.h,
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                        error: (error, stack) {
                          LoggerManager().e("ThingsViewAddActionView error: $error");
                          return Container();
                        },
                      )
                ],
              ),
            ),
          ),
          Container(
            color: ref.watch(colorProvider)['backgroundColorWidget'],
            padding: EdgeInsets.only(left: 20.w, right: 20.w),
            height: 70.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    unawaited(SmartDialog.dismiss(tag: "ThingsViewAddActionButton"));
                  },
                  child: Text(
                    "Cancel",
                    style: TextStyle(
                      fontSize: Constant.textSP_18,
                      color: ref.watch(colorProvider)['grey'],
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () async {
                    final name = ref.read(addDeviceNameProvider);
                    if (name.isEmpty) {
                      unawaited(SmartDialog.showToast("Please enter device name"));
                      return;
                    }
                    bool result = await ref.read(addDeviceProvider.notifier).addDevice(
                        AddDeviceModelRequestEntity(
                          name: name,
                          locationId: ref.read(selectedLocationInThingsProvider)?.id,
                          associatedDeviceIds:
                              ref.read(selectedDevicesInThingsProvider).map((e) => e.id ?? "").toList(),
                        ),
                        ref.read(loginProvider).data?.token);
                    if (result) {
                      ref.refresh(devicesProvider);
                      unawaited(SmartDialog.dismiss(tag: "ThingsViewAddActionButton"));
                    }
                  },
                  style: ButtonStyle(
                    overlayColor:
                        WidgetStateProperty.all(ref.watch(colorProvider)['accentColor']?.withValues(alpha: 0.3)),
                    backgroundColor: WidgetStateProperty.all<Color>(ref.watch(colorProvider)['main']!),
                  ),
                  child: Text(
                    "Save",
                    style: TextStyle(
                      fontSize: Constant.textSP_18,
                      color: ref.watch(colorProvider)['white'],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
