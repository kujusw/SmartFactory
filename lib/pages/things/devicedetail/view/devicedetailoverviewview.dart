import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_factory/pages/boards/general/notifier/device_energy_notifier.dart';

import '../../../../common/utils/logger_manager.dart';
import '../../../../common/utils/screenutil.dart';
import '../../../boards/general/view/devices/view/generalviewdeviceitem.dart';
import '../../../login/notifier/login_notifier.dart';
import '../../notifier/things_notifier.dart';

class DeviceDetailOverviewView extends ConsumerWidget {
  const DeviceDetailOverviewView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDevice = ref.watch(selectedDeviceProvider);
    LoggerManager().d("Selected Device: $selectedDevice");
    final token = ref.watch(loginProvider).data?.token ?? "";

    if (selectedDevice == null) return const SizedBox.shrink();

    final generalDevices = ref.watch(generalDeviceEnergyProvider(selectedDevice, token));

    return Container(
      padding: EdgeInsets.only(left: 20.w, top: 10.h, right: 20.w),
      height: 600.h,
      child: ScrollConfiguration(
        behavior:
            const MaterialScrollBehavior().copyWith(scrollbars: false, dragDevices: KJScreenUtil.kTouchLikeDeviceTypes),
        child: CustomScrollView(
          slivers: [
            SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  final item = generalDevices[index];
                  return GeneralViewDevicesItem(
                    item: item,
                  );
                },
                childCount: generalDevices.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
