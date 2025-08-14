import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/utils/screenutil.dart';
import '../../../boards/general/view/devices/view/generalviewdeviceitem.dart';
import '../../notifier/things_notifier.dart';

class DeviceDetailOverviewView extends ConsumerWidget {
  const DeviceDetailOverviewView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: EdgeInsets.only(left: 20.w, top: 10.h, right: 20.w),
      height: 600.h,
      child: ScrollConfiguration(
        behavior:
            const MaterialScrollBehavior().copyWith(scrollbars: false, dragDevices: KJScreenUtil.kTouchLikeDeviceTypes),
        child: CustomScrollView(
          slivers: [
            SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // 每行三个项目
                mainAxisSpacing: 10.0, // 主轴方向的间距
                crossAxisSpacing: 10.0, // 交叉轴方向的间距
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return GeneralViewDevicesItem(
                    index: index,
                    type: "ITEMSGENERALDEVICEINTHINGSPROVIDER",
                  );
                },
                childCount: ref.watch(itemsGeneralDeviceInThingsProvider).length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
