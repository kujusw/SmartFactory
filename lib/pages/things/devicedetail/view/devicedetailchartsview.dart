import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:smart_factory/models/device_model.dart';
import 'package:smart_factory/pages/things/notifier/device_detail_chart_notifier.dart';
import '../../../../models/chart_series_model.dart';
import '../../../boards/daily_sob/customdropdown.dart';
import '../../../login/notifier/loginmanager.dart';
import '../../notifier/energy_curve_provider.dart';
import 'custom_date_range_picker.dart';
import 'energy_curve_chart.dart';

class DeviceDetailChartsView extends ConsumerWidget {
  final DeviceModel? _model;
  final BuildContext buildContext;

  const DeviceDetailChartsView(this._model, {Key? key, required this.buildContext}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: EdgeInsets.only(left: 20.w, right: 20.w),
      child: _model != null
          ? SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomDropdown(
                        alignment: Alignment.centerRight,
                        title: "Day",
                        width: 320.w,
                        value: ref.watch(chartDataTypeProvider),
                        list: ['day', 'week', 'month', 'year'],
                        onSelected: (value) {
                          ref.read(chartDataTypeProvider.notifier).set(value ?? "day");
                          unawaited(SmartDialog.dismiss(tag: "SelectPopupPage"));
                        },
                      ),
                      //根据选择的时间类型，设置时间范围
                      const SizedBox(width: 12),

                      // 动态开始结束时间选择
                      CustomDateRangePicker(
                        buildContext: buildContext,
                        onResult: (picked) {
                          if (picked != null) {
                            ref.read(chartDataStartProvider.notifier).set(picked.start.toString());
                            ref.read(chartDataEndProvider.notifier).set(picked.end.toString());
                          } else {
                            ref.read(chartDataStartProvider.notifier).set("");
                            ref.read(chartDataEndProvider.notifier).set("");
                          }
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  LayoutBuilder(builder: (context, constraints) {
                    return EnergyCurveChart(
                      width: constraints.maxWidth,
                      params: EnergyCurveRequest(
                        deviceId: _model?.id ?? "",
                        token: ref.read(loginProvider).data?.token ?? "",
                        period: ref.watch(chartDataTypeProvider),
                        start: ref.watch(chartDataStartProvider) ?? "",
                        end: ref.watch(chartDataEndProvider) ?? "",
                      ),
                      // 添加额外的曲线数据
                      additionalSeries: [
                        for (DeviceModel item in _model?.associatedDevices ?? [])
                          if (item.deviceType == "virtual")
                            ...() {
                              // 为虚拟设备获取能耗数据
                              final virtualDeviceParams = EnergyCurveRequest(
                                deviceId: item.id ?? "",
                                token: ref.read(loginProvider).data?.token ?? "",
                                period: ref.watch(chartDataTypeProvider),
                                start: ref.watch(chartDataStartProvider) ?? "",
                                end: ref.watch(chartDataEndProvider) ?? "",
                              );

                              final asyncData = ref.watch(energyCurveProvider(virtualDeviceParams));
                              return asyncData.when(
                                data: (energyCurve) {
                                  // 提取功率数据
                                  final powerData =
                                      energyCurve.data?.points?.map((point) => point.power ?? 0.0).toList() ?? [];
                                  return [
                                    ChartSeriesModel(
                                      data: powerData,
                                      name: item.deviceName ?? "虚拟设备",
                                      color: Colors.orange, // 可以根据需要设置不同颜色
                                    )
                                  ];
                                },
                                loading: () => <ChartSeriesModel>[], // 加载中返回空列表
                                error: (err, _) => <ChartSeriesModel>[], // 错误时返回空列表
                              );
                            }(),
                      ],
                      // 设置警戒线
                      redAlertValue: _model?.warningRedThreshold?.toDouble() ?? 0, // 红色警戒线在25kW
                      yellowAlertValue: _model?.warningYellowThreshold?.toDouble() ?? 0, // 黄色警戒线在20kW
                    );
                  }),
                ],
              ),
            )
          : Container(),
    );
  }
}
