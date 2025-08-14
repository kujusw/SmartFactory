// ignore_for_file: unused_result

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import '../../../common/styles/theme.dart';
import '../../../common/utils/logger_manager.dart';
import '../../../models/boards_tab_model.dart';
import '../../common/widget/boardsview_header.dart';
import '../../users/notifier/users_notifier.dart';
import '../daily_sob/addchartwidget.dart';
import '../daily_sob/addlastreadingswidget.dart';
import '../daily_sob/dailysobview.dart';
import '../daily_sob/notifier/dailys_sob_notifier.dart';
import '../general/notifier/device_notifier.dart';
import '../general/view/generalview.dart';

class BoardsView extends ConsumerStatefulWidget {
  const BoardsView({super.key});
  @override
  ConsumerState<BoardsView> createState() => _BoardsViewState();
}

class _BoardsViewState extends ConsumerState<BoardsView> {
  @override
  void initState() {
    super.initState();
    // ref.invalidate(getUsersProvider); //刷新不关心新值
    ref.refresh(devicesProvider); //刷新并read新值
    ref.refresh(getLocationsProvider); //刷新并read新值
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<BoardsChartWidgetModel?>(selectedWidgetProvider, (previous, next) async {
      if (next == null) return;
      LoggerManager().d("BoardsView Widget 编辑 ${next.deviceId}");
      if (next.type == "chart") {
        unawaited(
          SmartDialog.show(
            usePenetrate: false,
            clickMaskDismiss: true,
            keepSingle: true,
            tag: "AddChartWidget",
            builder: (_) => AddChartWidgetView(next),
          ),
        );
      } else if (next.type == "last_readings") {
        unawaited(
          SmartDialog.show(
            usePenetrate: false,
            clickMaskDismiss: true,
            keepSingle: true,
            tag: "AddLastReadingsWidget",
            builder: (_) => AddLastReadingsWidgetView(next),
          ),
        );
      }
    });
    return Scaffold(
      backgroundColor: ref.watch(colorProvider)['backgroundColorWhole'],
      body: Container(
        width: 1820.w,
        height: 1010.h,
        padding: EdgeInsets.only(left: 15.w, right: 15.w),
        decoration: BoxDecoration(
          color: ref.watch(colorProvider)['backgroundColorWhole'],
        ),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
              child: SizedBox(
                height: 60.h,
                child: BoardsViewHeader(),
              ),
            ),
            SizedBox(
              height: 920.h,
              child: ref.watch(indexBoardsProvider) == 0
                  ? GeneralView()
                  : DailySOBView(
                      key: UniqueKey(), // 使用UniqueKey确保每次都创建新的实例
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
