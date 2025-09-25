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

class GeneralViewDevicesState extends ConsumerState<GeneralViewDevices> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
              controller: _tabController,
              indicatorSize: TabBarIndicatorSize.tab,
              unselectedLabelColor: ref.watch(colorProvider)['tabBar'],
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
                  ref.watch(currentDeviceProvider)?.deviceName ?? "No info",
                  style: TextStyle(
                    fontSize: Constant.textSP_20,
                    color: ref.watch(colorProvider)['text'],
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "Chart",
                  style: TextStyle(fontSize: Constant.textSP_18, color: ref.watch(colorProvider)['white']),
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                DeviceOverView(),
                DeviceDetailChartsView(ref.read(currentDeviceProvider), buildContext: context),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
