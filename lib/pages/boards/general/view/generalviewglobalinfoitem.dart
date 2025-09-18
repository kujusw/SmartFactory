import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_factory/core/notifiers/device_state_notifier.dart';
import '../../../../common/styles/theme_state_notifier.dart';
import '../../../../common/values/index.dart';
import '../../../../models/general_globalinfo_model.dart';
import '../../../common/general_globalinfo_utils.dart';

class GeneralViewGlobalInfoItem extends ConsumerWidget {
  final GeneralGlobalInfoModel item;
  const GeneralViewGlobalInfoItem({super.key, required this.item});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 140.h,
      margin: EdgeInsets.only(top: 2.h, bottom: 2.h, left: 2.w, right: 2.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.w),
        color: ref.watch(colorProvider)['backgroundColorWidget'],
      ),
      child: Center(
        child: Stack(
          children: [
            Positioned(
              top: 10.h,
              right: 10.w,
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(
                  getAlarmColor(item.name, ref),
                  BlendMode.srcIn,
                ),
                child: SvgPicture.asset(
                  alarmTypeIconPathMap[item.name] ?? '',
                  height: 30.h,
                  width: 30.h,
                ),
              ),
            ),
            Positioned(
              bottom: 10.h,
              left: 20.w,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    (item.name == "Devices" || item.name == "Connected Devices")
                        ? ref.watch(deviceManagerProvider).length.toString()
                        : item.value.toString(),
                    style: TextStyle(
                      color: getAlarmColor(item.name, ref),
                      fontSize: Constant.textSP_42,
                    ),
                  ),
                  Text(
                    item.name ?? '',
                    style: TextStyle(
                      color: getAlarmColor(item.name, ref),
                      fontSize: Constant.textSP_20,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
