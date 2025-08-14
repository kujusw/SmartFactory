import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../common/utils/screenutil.dart';
import '../../../../core/dependencies/dependencies.dart';
import 'generalviewglobalinfoitem.dart';

/**
 * general 顶部横向信息栏
 */
class GeneralViewGlobalInfo extends ConsumerWidget {
  const GeneralViewGlobalInfo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 140.h,
      child: ScrollConfiguration(
        behavior:
            const MaterialScrollBehavior().copyWith(scrollbars: false, dragDevices: KJScreenUtil.kTouchLikeDeviceTypes),
        child: CustomScrollView(
          scrollDirection: Axis.horizontal,
          slivers: [
            SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                childAspectRatio: 0.5,
                mainAxisSpacing: 10.w,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return GeneralViewGlobalInfoItem(item: ref.watch(itemsGeneralGlobalInfoProvider)[index]);
                },
                childCount: ref.watch(itemsGeneralGlobalInfoProvider).length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
