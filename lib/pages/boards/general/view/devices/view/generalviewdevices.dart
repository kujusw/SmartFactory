import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../common/styles/theme_state_notifier.dart';
import '../../../../../../common/values/index.dart';
import '../../../../../../core/notifiers/device_state_notifier.dart';
import '../../../../../../models/device_model.dart';
import '../../../notifier/device_notifier.dart';
import 'deviceoverview.dart';

class GeneralViewDevices extends ConsumerWidget {
  const GeneralViewDevices({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
              // boxShadow: [
              //   BoxShadow(
              //     color: ref.watch(colorProvider)['accentColor'],
              //     spreadRadius: 1,
              //   ),
              // ],
            ),
            child: Center(
              child: Consumer(
                builder: (context, watch, child) {
                  List<DeviceModel>? devices = watch.watch(deviceManagerProvider);
                  DeviceModel? deviceModel = watch.watch(currentDeviceProvider);
                  if (devices?.isNotEmpty == true && deviceModel?.id?.isNotEmpty == true) {
                    return Text(
                      deviceModel?.deviceName ?? "",
                      style: TextStyle(
                        fontSize: Constant.textSP_20,
                        color: ref.watch(colorProvider)['text'],
                        fontWeight: FontWeight.w500,
                      ),
                    );
                  } else {
                    return Text(
                      "No info",
                      style: TextStyle(
                        fontSize: Constant.textSP_20,
                        color: ref.watch(colorProvider)['text'],
                        fontWeight: FontWeight.w500,
                      ),
                    );
                  }
                },
              ),
            ),
          ),
          SizedBox(height: 10.h),
          DeviceOverView(),
        ],
      ),
    );
  }
}
