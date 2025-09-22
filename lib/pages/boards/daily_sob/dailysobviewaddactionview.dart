import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import '../../../common/styles/theme_state_notifier.dart';
import '../../../common/utils/logger_manager.dart';
import '../../../common/utils/screenutil.dart';
import '../../../common/values/index.dart';
import '../../../models/test_data_provider.dart';
import '../common/widgets/widgettypeitem.dart';

class DailySOBViewAddActionView extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: 600.w,
      height: 1080.h,
      color: ref.watch(colorProvider)['backgroundColorRightAction'],
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 20.w, right: 20.w),
            height: 70.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Add Widget",
                  style: TextStyle(
                    fontSize: Constant.textSP_18,
                    color: ref.watch(colorProvider)['white'],
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    unawaited(SmartDialog.dismiss(tag: "DailySOBViewAddActionButton"));
                  },
                  color: ref.watch(colorProvider)['white'],
                ),
              ],
            ),
          ),
          Container(
            height: 600.h,
            child: ScrollConfiguration(
              behavior: const MaterialScrollBehavior()
                  .copyWith(scrollbars: false, dragDevices: KJScreenUtil.kTouchLikeDeviceTypes),
              child: CustomScrollView(
                slivers: [
                  SliverGrid(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4, // 每行三个项目
                      mainAxisSpacing: 0.0.h, // 主轴方向的间距
                      crossAxisSpacing: 5.0.w, // 交叉轴方向的间距
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        var model = TestDataProvider.getWidgetTypeModelListTest()[index];
                        return WidgetTypeItem(
                          model: model,
                          callback: (_) {
                            LoggerManager().d("WidgetTypeItem clicked ${model.toString()}}");
                            // unawaited(SmartDialog.dismiss(tag: "DailySOBViewAddActionButton"));
                            if (model.name == "Last Readings") {
                              // unawaited(
                              //   SmartDialog.show(
                              //     usePenetrate: false,
                              //     clickMaskDismiss: true,
                              //     keepSingle: true,
                              //     tag: "AddLastReadingsWidget",
                              //     builder: (_) => AddLastReadingsWidgetView(null),
                              //   ),
                              // );
                            } else if (model.name == "Chart") {
                              // unawaited(
                              //   SmartDialog.show(
                              //     usePenetrate: false,
                              //     clickMaskDismiss: true,
                              //     keepSingle: true,
                              //     tag: "AddChartWidget",
                              //     builder: (_) => AddChartWidgetView(null),
                              //   ),
                              // );
                            }
                          },
                        );
                      },
                      childCount: TestDataProvider.getWidgetTypeModelListTest().length,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
