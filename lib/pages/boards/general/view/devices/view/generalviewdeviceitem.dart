import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../../common/styles/assets.dart';
import '../../../../../../common/styles/theme_state_notifier.dart';
import '../../../../../../common/utils/logger_manager.dart';
import '../../../../../../common/values/index.dart';
import '../../../../../../models/general_device_info_model.dart';
import '../../../../../things/notifier/things_notifier.dart';
import '../../../notifier/device_notifier.dart';

class GeneralViewDevicesItem extends ConsumerWidget {
  final int index;
  final String type;
  const GeneralViewDevicesItem({super.key, required this.index, required this.type});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    GeneralDeviceInfoModel item;
    if (type == "ITEMSGENERALDEVICEPROVIDER") {
      item = ref.read(itemsGeneralDeviceProvider)[index];
    } else {
      item = ref.read(generalDevicesInThingsProvider)[index];
    }
    return MouseRegion(
      onEnter: (PointerEvent details) => () {
        // 鼠标悬停时的背景色
      },
      onExit: (PointerEvent details) => () {
        // 鼠标离开时的背景色
      },
      child: GestureDetector(
        onTap: () {
          // 点击事件
          LoggerManager().d("GeneralViewDevicesItem onTap ${item.toRawJson()}");
        },
        child: Container(
          height: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.w),
            color: ref.watch(colorProvider)['backgroundColorWidget'],
          ),
          child: Stack(
            children: [
              Positioned(
                right: 10.w,
                top: 10.h,
                child: SvgPicture.asset(
                  AssetsImages.moreVerticalIconSvg,
                  height: 15.h,
                  width: 15.h,
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      AssetsImages.chipIconBlueSvg,
                      height: 30.h,
                      width: 30.h,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      item.value ?? "",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: Constant.textSP_16,
                        color: ref.watch(colorProvider)['text'],
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      item.type ?? "",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: Constant.textSP_16,
                        color: ref.watch(colorProvider)['text'],
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      item.time ?? "",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: Constant.textSP_12,
                        color: ref.watch(colorProvider)['text'],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
