import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../../common/utils/screenutil.dart';
import '../../../../common/styles/assets.dart';
import '../../../../common/styles/theme.dart';
import '../../../../common/values/index.dart';
import '../../../../core/dependencies/dependencies.dart';
import '../../../boards/general/view/project/view/generalviewglobalgroupitem.dart';
// import '../../../common/allthingsgroupitem.dart';

class ThingsViewGeneralWidget extends ConsumerWidget {
  const ThingsViewGeneralWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 1000.h,
      margin: EdgeInsets.only(top: 10.h, bottom: 10.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.w),
        color: ref.watch(colorProvider)['backgroundColorWidget'],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 48.h,
            padding: EdgeInsets.only(left: 10.w, right: 10.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ColorFiltered(
                      colorFilter: ColorFilter.mode(
                        ref.watch(colorProvider)['white']!,
                        BlendMode.srcIn,
                      ),
                      child: SvgPicture.asset(
                        AssetsImages.listIconRemovebgPreviewSvg,
                        height: 15.h,
                        width: 15.h,
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      "All Devices",
                      style: TextStyle(
                        fontSize: Constant.textSP_14,
                        color: ref.watch(colorProvider)['text'],
                      ),
                    ),
                  ],
                ),
                Text(
                  ref.watch(itemsDeviceModelProvider).length.toString() + " Devices",
                  style: TextStyle(
                    fontSize: Constant.textSP_14,
                    color: ref.watch(colorProvider)['text'],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 10.w, right: 10.w),
            height: 932.h,
            child: ScrollConfiguration(
              behavior: const MaterialScrollBehavior()
                  .copyWith(scrollbars: false, dragDevices: KJScreenUtil.kTouchLikeDeviceTypes),
              child: GeneralViewGlobalGroupsItem(),
            ),
          ),
        ],
      ),
    );
  }
}
