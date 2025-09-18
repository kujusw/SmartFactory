import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../common/styles/assets.dart';
import '../../../../common/styles/theme_state_notifier.dart';
import '../../../../common/values/index.dart';

class GeneralViewGlobalInfoItem extends ConsumerWidget {
  final Map<String, dynamic> item;
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
                  ref.watch(colorProvider)['text'] ?? Colors.white,
                  BlendMode.srcIn,
                ),
                child: SvgPicture.asset(
                  AssetsImages.chipIconBlueSvg,
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
                    item.values.first.toString(),
                    style: TextStyle(
                      color: ref.watch(colorProvider)['text'] ?? Colors.white,
                      fontSize: Constant.textSP_42,
                    ),
                  ),
                  Text(
                    item.keys.first,
                    style: TextStyle(
                      color: ref.watch(colorProvider)['text'] ?? Colors.white,
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
