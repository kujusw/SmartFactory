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
                        ChartSeriesModel(
                          data: [1000.5, 1200.3, 1500.8, 1800.2, 2000.1, 800.2, 900.5, 1100.1, 1300.7, 1600.4],
                          name: "预测功耗",
                          color: Colors.green,
                        ),
                        ChartSeriesModel(
                          data: [800.2, 900.5, 1100.1, 1300.7, 1600.4, 1000.5, 1200.3, 1500.8, 1800.2, 2000.1],
                          name: "目标功耗",
                          color: Colors.purple,
                        ),
                      ],
                      // 设置警戒线
                      redAlertValue: 2500.0, // 红色警戒线在25kW
                      yellowAlertValue: 2000.0, // 黄色警戒线在20kW
                    );
                  }),
                ],
              ),
            )
          : Container(),
    );
  }
}
