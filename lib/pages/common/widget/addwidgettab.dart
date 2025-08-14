// ignore_for_file: unused_result

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import '../../../common/styles/theme.dart';
import '../../../common/utils/logger_manager.dart';
import '../../../common/values/index.dart';
import '../../../models/boards_tab_model.dart';
import '../../boards/daily_sob/notifier/dailys_sob_notifier.dart';
import '../../login/notifier/login_notifier.dart';
import '../../things/adddevice/view/locationlistview.dart';
import '../../things/notifier/things_notifier.dart';
import '../../users/notifier/users_notifier.dart';
import 'rounded_loading_button.dart';

class AddWidgetTab extends ConsumerWidget {
  AddWidgetTab({super.key});
  final RoundedLoadingButtonController _btnController = RoundedLoadingButtonController();
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //输入框
    return Container(
      width: 400.w,
      padding: EdgeInsets.only(top: 10.h, left: 10.w, right: 10.w, bottom: 10.h),
      margin: EdgeInsets.only(right: 20.w),
      decoration: BoxDecoration(
        color: ref.watch(colorProvider)['main'],
        borderRadius: BorderRadius.circular(10.w),
      ),
      child: Column(
        children: [
          Container(
            height: 50.h,
            padding: EdgeInsets.only(left: 10.w),
            margin: EdgeInsets.only(top: 5.h, bottom: 15.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.h),
              border: Border.all(
                color: ref.watch(colorProvider)['dividerColor']!,
              ),
            ),
            child: TextField(
              style: TextStyle(
                fontSize: Constant.textSP_20,
                color: ref.watch(colorProvider)['white'],
              ),
              cursorColor: ref.watch(colorProvider)['accentColor'],
              decoration: InputDecoration(
                hintText: "Add widget tab",
                hintStyle: TextStyle(fontSize: Constant.textSP_20, color: ref.watch(colorProvider)['white']),
                contentPadding: EdgeInsets.zero,
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
              ),
              controller: _controller,
            ),
          ),
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
                  ref.watch(selectedLocationProviderInThings)?.name ?? "",
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
                  LoggerManager().e("AddWidgetTab error: $error");
                  return Container();
                },
              ),
          SizedBox(height: 10.h),
          RoundedLoadingButton(
            height: 48.h,
            loaderSize: 60.w,
            width: 240.w,
            color: ref.watch(colorProvider)['accentColor'],
            successColor: Colors.green,
            controller: _btnController,
            onPressed: () async {
              if (_controller.text.trim().isEmpty) {
                _btnController.reset();
                unawaited(SmartDialog.showToast("Please enter a name"));
              } else if (ref.watch(selectedLocationProviderInThings)?.name == "") {
                _btnController.reset();
                unawaited(SmartDialog.showToast("Please select a location"));
              } else {
                bool result = await ref.read(addBoardsTabProvider.notifier).addBoardsTab(
                    AddBoardsTabRequestEntity(
                      name: _controller.text.trim(),
                      locationId: ref.read(selectedLocationProviderInThings)?.id,
                    ),
                    ref.read(loginProvider).data?.token);

                if (result) {
                  _btnController.success();
                  ref.refresh(getBoardsTabsProvider);
                  Timer(Duration(seconds: 2), () {
                    unawaited(SmartDialog.dismiss(tag: "AddWidgetTab"));
                  });
                } else {
                  _btnController.error();
                  Timer(Duration(seconds: 1), () {
                    _btnController.reset();
                  });
                }
              }
            },
            valueColor: Colors.white,
            borderRadius: 20.w,
            child:
                Text("Add", style: TextStyle(color: ref.watch(colorProvider)['white'], fontSize: Constant.textSP_20)),
          ),
        ],
      ),
    );
  }
}
