import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_factory/core/notifiers/device_state_notifier.dart';
import '../../../../../../common/utils/screenutil.dart';
import '../../../../common/styles/theme_state_notifier.dart';
import '../../../../common/values/index.dart';

class DeviceListViewInAddDevice extends ConsumerStatefulWidget {
  final String type;
  const DeviceListViewInAddDevice({super.key, required this.type});
  @override
  ConsumerState<DeviceListViewInAddDevice> createState() => _DeviceListViewInAddDeviceState();
}

class _DeviceListViewInAddDeviceState extends ConsumerState<DeviceListViewInAddDevice> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        if (widget.type == "NEW") {
          ref.read(deviceManagerProvider.notifier).unSelectDevice();
        }
      },
    );
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
    return Container(
      height: 600.h,
      decoration: BoxDecoration(
        border: Border.all(color: ref.watch(colorProvider)['dividerColor']!),
        borderRadius: BorderRadius.circular(10.w),
      ),
      child: ScrollConfiguration(
        behavior:
            const MaterialScrollBehavior().copyWith(scrollbars: false, dragDevices: KJScreenUtil.kTouchLikeDeviceTypes),
        child: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  var data = ref.watch(deviceManagerProvider);
                  return Column(
                    children: [
                      Container(
                        height: 48.h,
                        padding: EdgeInsets.only(left: 20.w, right: 20.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  data[index].deviceName ?? "",
                                  style: TextStyle(
                                    fontSize: Constant.textSP_14,
                                    color: ref.watch(colorProvider)['text'],
                                  ),
                                ),
                              ],
                            ),
                            Checkbox(
                              activeColor: ref.watch(colorProvider)['accentColor'],
                              side: BorderSide(
                                color: ref.watch(colorProvider)['white']!,
                              ),
                              value: data[index].selectedInAddDevice,
                              onChanged: (value) {
                                ref.read(deviceManagerProvider.notifier).selectDevice(data[index], value!);
                              },
                            ),
                          ],
                        ),
                      ),
                      Divider(height: 1.h, color: ref.watch(colorProvider)['dividerColor'])
                    ],
                  );
                },
                childCount: ref.watch(deviceManagerProvider).length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
