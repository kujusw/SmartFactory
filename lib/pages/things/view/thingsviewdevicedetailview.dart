// ignore_for_file: unused_result

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:smart_factory/core/notifiers/device_state_notifier.dart';
import '../../../common/styles/theme_state_notifier.dart';
import '../../../common/values/index.dart';
import '../../../models/device_model.dart';
import '../../../models/device_model_new.dart';
import '../../boards/general/notifier/device_notifier.dart';
import '../../login/notifier/login_notifier.dart';
import '../devicedetail/view/devicedetailchartsview.dart';
import '../devicedetail/view/devicedetaillocationview.dart';
import '../devicedetail/view/devicedetailoverviewview.dart';
import '../devicedetail/view/devicedetailpropertiesview.dart';
import '../notifier/addactionview_notifer.dart';
import '../notifier/things_notifier.dart';

class ThingsViewDeviceDetailView extends ConsumerStatefulWidget {
  final DeviceModel _model;
  final BuildContext buildContext;
  ThingsViewDeviceDetailView({
    Key? key,
    required DeviceModel model,
    required BuildContext buildContext,
  })  : _model = model,
        buildContext = buildContext,
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
    _tabController = TabController(vsync: this, length: 4);
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
                        ref.watch(deviceManagerProvider.notifier).getDeviceById(widget._model.id ?? "0")?.deviceName ??
                            "",
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
                              "Chart",
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
                      Expanded(
                        child: TabBarView(
                          controller: _tabController,
                          children: [
                            DeviceDetailOverviewView(),
                            DeviceDetailChartsView(widget._model, buildContext: widget.buildContext),
                            DeviceDetailPropertiesView(widget._model),
                            DeviceDetailLocationView(widget._model),
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
                        onPressed: () async {
                          //如果是location页面，需要刷新更新location
                          if (_tabController.index == 3) {
                            final location = ref.read(selectedLocationInThingsProvider);
                            if (location == null) {
                              unawaited(SmartDialog.showToast("Please select location"));
                              return;
                            }
                            if (location.id != widget._model.locationId) {
                              final result = await ref.read(updateDeviceProvider(
                                      //warningYellowThreshold warning_red_threshold 为空可以不传
                                      widget._model.id ?? "",
                                      AddDeviceModelRequestEntity(
                                        deviceName: ref.read(updateDeviceNameProvider),
                                        locationId: ref.read(selectedLocationInThingsProvider)?.id,
                                        associatedDeviceIds:
                                            ref.read(selectedDevicesInThingsProvider).map((e) => e.id ?? "").toList(),
                                        //warning_yellow_threshold
                                        warningYellowThreshold: ref.read(updateDeviceWarningYellowThresholdProvider),
                                        //warning_red_threshold
                                        warningRedThreshold: ref.read(updateDeviceWarningRedThresholdProvider),
                                      ),
                                      ref.read(loginProvider).data?.token ?? "")
                                  .future); // 传入token;
                              // 关键：判断ref是否还活着
                              if (result.code == 100001 && context.mounted) {
                                ref.refresh(devicesProvider);
                                widget._model.locationId = ref.read(selectedLocationInThingsProvider)?.id;
                                unawaited(SmartDialog.dismiss(tag: "ThingsViewDeviceDetail"));
                              }
                            }
                          } else if (_tabController.index == 2) {
                            //如果是properties页面，虚拟点关联设备中不能有虚拟点
                            if (widget._model.associatedDevices?.any((element) => element.deviceType == "virtual") ==
                                true) {
                              unawaited(
                                  SmartDialog.showToast("Virtual points cannot be associated with virtual points"));
                              return;
                            }

                            final result = await ref.read(updateDeviceProvider(
                                    //warningYellowThreshold warning_red_threshold 为空可以不传
                                    widget._model.id ?? "",
                                    AddDeviceModelRequestEntity(
                                      deviceName: ref.read(updateDeviceNameProvider),
                                      locationId: ref.read(selectedLocationInThingsProvider)?.id,
                                      associatedDeviceIds:
                                          ref.read(selectedDevicesInThingsProvider).map((e) => e.id ?? "").toList(),
                                      //warning_yellow_threshold
                                      warningYellowThreshold: ref.read(updateDeviceWarningYellowThresholdProvider),
                                      //warning_red_threshold
                                      warningRedThreshold: ref.read(updateDeviceWarningRedThresholdProvider),
                                    ),
                                    ref.read(loginProvider).data?.token ?? "")
                                .future); // 传入token;
                            // 关键：判断ref是否还活着
                            if (result.code == 100001 && context.mounted) {
                              ref.refresh(devicesProvider);
                              widget._model.deviceName = ref.read(updateDeviceNameProvider);
                              widget._model.associatedDevices = ref.read(selectedDevicesInThingsProvider);
                              unawaited(SmartDialog.dismiss(tag: "ThingsViewDeviceDetail"));
                            }
                          } else {
                            unawaited(SmartDialog.showToast("TODO"));
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
          ),
        ],
      ),
    );
  }
}
