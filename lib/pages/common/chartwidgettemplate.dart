import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../common/styles/theme.dart';
import '../../common/utils/board_widgets_utils.dart';
import '../../common/values/index.dart';
import '../../core/dependencies/dependencies.dart';
import '../../models/boards_tab_model.dart';
import '../../models/device_model.dart';
import '../boards/daily_sob/notifier/dailys_sob_notifier.dart';
import 'barchart.dart';

class ChartWidgetTemplate extends ConsumerWidget {
  const ChartWidgetTemplate({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MouseRegion(
      onEnter: (PointerEvent details) => () {
        // 鼠标悬停时的背景色
      },
      onExit: (PointerEvent details) => () {
        // 鼠标离开时的背景色
      },
      child: Container(
        width: ref.watch(chartWidgetWidthProvider).toDouble(),
        height: ref.watch(chartWidgetHeightProvider).toDouble(),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.h),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: ref.watch(widgetBackgroundColorProvider),
              spreadRadius: 2,
              blurRadius: 2,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              child: Container(
                height: 40,
                width: ref.read(chartWidgetWidthProvider).toDouble(),
                alignment: Alignment.center,
                child: Center(
                  child: Container(
                    padding: EdgeInsets.only(left: 20.w, right: 20.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2.h),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: ref.watch(colorProvider)['grey']!,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                    child: Text(
                      "Current- No Data in this series",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: Constant.textSP_16,
                        color: ref.watch(widgetBackgroundColorProvider) ?? ref.watch(colorProvider)['text'],
                      ),
                    ),
                  ),
                ),
              ),
            ),

            Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(
                    left: 10.w,
                  ),
                  height: 40.h,
                  width: ref.read(chartWidgetWidthProvider).toDouble(),
                  color: ref.watch(widgetBackgroundColorProvider),
                  child: Text(
                    textAlign: TextAlign.start,
                    ref.watch(widgetTitleProvider),
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: Constant.textSP_20,
                      color: ref.read(widgetFontColorProvider),
                    ),
                  ),
                ),
                BarChartWidget(BoardsChartWidgetModel(
                  deviceId: ref
                      .read(itemsDeviceModelProvider)
                      .firstWhere((element) => element.name == ref.read(thingProvider),
                          orElse: () => DeviceModel(id: ""))
                      .id,
                  chartType: ref.watch(chartTypeProvider),
                  reading: getReadingByWidgetReadingProviderInChart(ref.read(widgetReadingProvider)),
                  period: getPeriodByWidgetReadingProviderInChart(ref.read(widgetReadingProvider)),
                  width: ref.read(chartWidgetWidthProvider),
                  height: ref.read(chartWidgetHeightProvider),
                )),
              ],
            ),

            // ref.read(chartTypeProvider) == "Line" ? LineChartWidget() : BarChartWidget(BoardsChartWidgetModel()),
          ],
        ),
      ),
    );
  }
}
