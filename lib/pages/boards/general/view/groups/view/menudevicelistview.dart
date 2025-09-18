import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_factory/core/notifiers/device_state_notifier.dart';

import '../../../../../../common/styles/assets.dart';
import '../../../../../../common/styles/theme_state_notifier.dart';
import '../../../../../../common/utils/screenutil.dart';
import '../../../../../../common/values/index.dart';
import '../../../notifier/device_notifier.dart';

class MenuDeviceListView extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var datas = ref.watch(deviceManagerProvider.notifier).getSelectedDevices();
    if (datas == null) {
      return Container();
    }
    return Container(
      padding: EdgeInsets.only(left: 20.w, right: 20.w),
      height: 590.h,
      child: ScrollConfiguration(
        behavior:
            const MaterialScrollBehavior().copyWith(scrollbars: false, dragDevices: KJScreenUtil.kTouchLikeDeviceTypes),
        child: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () => {ref.read(currentDeviceProvider) == datas[index]},
                    child: Column(
                      children: [
                        Container(
                          height: 48.h,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  ColorFiltered(
                                    colorFilter: ColorFilter.mode(
                                      Colors.green,
                                      BlendMode.srcIn,
                                    ),
                                    child: SvgPicture.asset(
                                      AssetsImages.lightningBoltIconRemovebgPreview_2Svg,
                                      height: 30.h,
                                      width: 30.h,
                                    ),
                                  ),
                                  Container(
                                    color: ref.watch(colorProvider)['transparent'],
                                    width: 2.w,
                                    margin: EdgeInsets.only(left: 20.w, right: 20.w, top: 10.h, bottom: 10.h),
                                  ),
                                  Text(
                                    datas[index].deviceName ?? "",
                                    style: TextStyle(
                                      fontSize: Constant.textSP_14,
                                      color: ref.watch(colorProvider)['text'],
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    color: ref.watch(colorProvider)['transparent'],
                                    width: 2.w,
                                    margin: EdgeInsets.only(left: 20.w, right: 20.w, top: 10.h, bottom: 10.h),
                                  ),
                                  ColorFiltered(
                                    colorFilter: ColorFilter.mode(
                                      Colors.grey,
                                      BlendMode.srcIn,
                                    ),
                                    child: SvgPicture.asset(
                                      AssetsImages.bellIconGraySvg,
                                      height: 30.h,
                                      width: 30.h,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        // Divider(height: 1.h, color: ref.watch(colorProvider)['dividerColor'])
                      ],
                    ),
                  );
                },
                childCount: datas.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
