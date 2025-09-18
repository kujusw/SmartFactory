// ignore_for_file: unused_result

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:smart_factory/core/notifiers/device_state_notifier.dart';
import '../../../common/styles/theme.dart';
import '../../../common/styles/theme_state_notifier.dart';
import '../../../common/utils/logger_manager.dart';
import '../../../common/values/index.dart';
import '../../../core/dependencies/dependencies.dart';
import '../../../models/device_model.dart';
import '../../../models/device_model_new.dart';
import '../../login/notifier/login_notifier.dart';
import '../notifier/things_notifier.dart';

class ThingsViewDeviceDetailView extends ConsumerStatefulWidget {
  final DeviceModel _model;
  ThingsViewDeviceDetailView({
    Key? key,
    required DeviceModel model,
  })  : _model = model,
        super(key: key);
  @override
  ThingsViewDeviceDetailViewState createState() => ThingsViewDeviceDetailViewState();
}

class ThingsViewDeviceDetailViewState extends ConsumerState<ThingsViewDeviceDetailView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 600.w,
      height: 1080.h,
      color: ref.watch(colorProvider)['backgroundColorRightAction'],
      child: Row(
        children: [
          Container(
            width: 600.w,
            height: 1080.h,
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
                        ref.watch(deviceManagerProvider.notifier).getDeviceById(widget._model.id ?? "0")?.name ?? "",
                        style: TextStyle(
                          fontSize: Constant.textSP_18,
                          color: ref.watch(colorProvider)['white'],
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.close),
                        onPressed: () {
                          unawaited(SmartDialog.dismiss(tag: "ThingsViewDeviceDetail"));
                        },
                        color: ref.watch(colorProvider)['white'],
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 940.h,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        child: TabBar(
                          labelPadding: EdgeInsets.only(left: 0.0, right: 0.0, top: 10.h, bottom: 10.h),
                          controller: _tabController,
                          indicator: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Colors.blue, // 下划线颜色
                                width: 2.0.h, // 下划线宽度
                              ),
                            ),
                          ),
                          // indicatorPadding: EdgeInsets.only(bottom: 10.h),
                          tabs: [
                            Text(
                              "Overview",
                              style: TextStyle(fontSize: Constant.textSP_18, color: ref.watch(colorProvider)['white']),
                            ),
                            Text(
                              "Properties",
                              style: TextStyle(fontSize: Constant.textSP_18, color: ref.watch(colorProvider)['white']),
                            ),
                            Text(
                              "Location",
                              style: TextStyle(fontSize: Constant.textSP_18, color: ref.watch(colorProvider)['white']),
                            ),
                          ],
                        ),
                      ),
                    ],
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
                          unawaited(SmartDialog.dismiss(tag: "ThingsViewDeviceDetail"));
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
                        onPressed: () async {},
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
          ),
        ],
      ),
    );
  }
}
