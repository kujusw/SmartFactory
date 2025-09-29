import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../common/styles/theme_state_notifier.dart';
import '../../../../../../common/values/index.dart';
import '../../../../../things/devicedetail/view/devicedetailchartsview.dart';
import '../../../notifier/device_notifier.dart';
import 'deviceoverview.dart';

class GeneralViewDevices extends ConsumerStatefulWidget {
  GeneralViewDevices({super.key});

  @override
  GeneralViewDevicesState createState() => GeneralViewDevicesState();
}

class GeneralViewDevicesState extends ConsumerState<GeneralViewDevices> {
  @override
  Widget build(BuildContext context) {
    final tabLength = ref.watch(currentDeviceProvider)?.deviceType != "debug" ? 2 : 1;

    return DefaultTabController(
      length: tabLength,
      child: Container(
        height: 770.h,
        margin: EdgeInsets.only(top: 10.h, right: 10.w),
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 20.w, top: 10.h, right: 20.w),
              height: 60.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.w),
                color: ref.watch(colorProvider)['backgroundColorWidget'],
              ),
              child: TabBar(
                indicatorPadding: EdgeInsets.zero,
                dividerHeight: 0.0,
                indicatorSize: TabBarIndicatorSize.tab,
                unselectedLabelColor: ref.watch(colorProvider)['tabBar'],
                indicator: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.blue,
                      width: 2.0.h,
                    ),
                  ),
                ),
                tabs: [
                  Text(
                    ref.watch(currentDeviceProvider)?.deviceName ?? "No info",
                    style: TextStyle(
                      fontSize: Constant.textSP_20,
                      color: ref.watch(colorProvider)['text'],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  if (ref.watch(currentDeviceProvider)?.deviceType != "debug")
                    Text(
                      "Chart",
                      style: TextStyle(fontSize: Constant.textSP_18, color: ref.watch(colorProvider)['white']),
                    ),
                ],
              ),
            ),
            SizedBox(height: 10.h),
            Expanded(
              child: TabBarView(
                children: [
                  DeviceOverView(),
                  if (ref.watch(currentDeviceProvider)?.deviceType != "debug")
                    DeviceDetailChartsView(ref.read(currentDeviceProvider), buildContext: context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
