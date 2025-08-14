import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../common/styles/assets.dart';
import '../../common/utils/logger_manager.dart';
import '../../core/dependencies/dependencies.dart';
import '../boards/daily_sob/notifier/dailys_sob_notifier.dart';

class LastReadingsWidgetTemplate extends ConsumerWidget {
  const LastReadingsWidgetTemplate({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MouseRegion(
      onEnter: (PointerEvent details) => () {
        // 鼠标悬停时的背景色
      },
      onExit: (PointerEvent details) => () {
        // 鼠标离开时的背景色
      },
      child: Container(
        width: ref.watch(lastreadingsWidgetWidthProvider).toDouble(),
        height: ref.watch(lastreadingsWidgetHeightProvider).toDouble(),
        padding: EdgeInsets.only(left: 20.w, top: 5.h, right: 20.w),
        decoration: BoxDecoration(
          color: ref.watch(widgetBackgroundColorProvider),
          borderRadius: BorderRadius.circular(5.h),
          boxShadow: [
            BoxShadow(
              color: ref.watch(widgetBackgroundColorProvider),
              spreadRadius: 2,
              blurRadius: 2,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Stack(
          children: [
            Visibility(
              visible: ref.read(widgetIsShowConnectedStatusProvider),
              child: Positioned(
                right: 10.w,
                top: 10.h,
                child: ColorFiltered(
                  colorFilter: ColorFilter.mode(
                    ref.read(widgetFontColorProvider),
                    BlendMode.srcIn,
                  ),
                  child: SvgPicture.asset(
                    AssetsImages.lightningBoltIconRemovebgPreview_2Svg,
                    height: 30.h,
                    width: 30.h,
                  ),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      ref.watch(widgetTitleProvider),
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: ref.read(widgetFontSizeProvider).sp,
                        color: ref.read(widgetFontColorProvider),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      ref.read(widgetStatusProvider),
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: (ref.read(widgetFontSizeProvider) + 10).sp,
                        color: ref.read(widgetFontColorProvider),
                      ),
                    ),
                  ),
                ),
                ref.watch(currentTime2Provider).when(
                      data: (time) => Expanded(
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            time,
                            style: TextStyle(
                              fontSize: ref.read(widgetFontSizeProvider).sp,
                              color: ref.read(widgetFontColorProvider),
                            ),
                          ),
                        ),
                      ),
                      loading: () => Container(),
                      error: (error, stack) {
                        LoggerManager().e("LastReadingsWidgetTemplate error: $error");
                        return Container();
                      },
                    ),
                Expanded(
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      ref.read(widgetDescriptionProvider),
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: ref.read(widgetFontSizeProvider).sp,
                        color: ref.read(widgetFontColorProvider),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
