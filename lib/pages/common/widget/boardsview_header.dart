// ignore_for_file: unused_result

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../common/styles/assets.dart';
import '../../../common/styles/theme_state_notifier.dart';
import '../../../common/utils/screenutil.dart';
import '../../../common/values/index.dart';
import '../../../models/boards_tab_model.dart';
import '../../boards/daily_sob/notifier/dailys_sob_notifier.dart';
import 'boardview_tab_sort.dart';

class BoardsViewHeader extends ConsumerStatefulWidget {
  const BoardsViewHeader({super.key});
  @override
  ConsumerState<BoardsViewHeader> createState() => _BoardsViewHeaderState();
}

class _BoardsViewHeaderState extends ConsumerState<BoardsViewHeader> {
  @override
  void initState() {
    super.initState();
    ref.refresh(boardsTabsProvider); //刷新并read新值
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
      height: 60.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: ref.watch(colorProvider)['transparent'],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 1440.w,
            child: ScrollConfiguration(
              behavior: const MaterialScrollBehavior()
                  .copyWith(scrollbars: false, dragDevices: KJScreenUtil.kTouchLikeDeviceTypes),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: ref.watch(pageProvider).map((tab) {
                    return Row(
                      children: [
                        BoardsTabWidget(
                          tab: tab,
                          isSelected: ref.watch(boardsIndexProvider) == ref.watch(pageProvider).indexOf(tab),
                          press: () {
                            ref.watch(boardsIndexProvider.notifier).setIndex(ref.watch(pageProvider).indexOf(tab));
                          },
                        ),
                        Container(
                          width: 4.w,
                          color: ref.watch(colorProvider)['transparent'],
                        ),
                      ],
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: ref.watch(colorProvider)['backgroundColorWidget'], // 设置背景颜色
                ),
                child: IconButton(
                  onPressed: () {
                    unawaited(SmartDialog.show(
                      usePenetrate: false,
                      alignment: Alignment.centerRight,
                      clickMaskDismiss: true,
                      keepSingle: true,
                      tag: "BoardviewTabSortView",
                      builder: (_) {
                        return BoardviewTabSortView();
                      },
                      onDismiss: () {},
                    ));
                  },
                  icon: Icon(
                    Icons.settings,
                    color: ref.watch(colorProvider)['white'],
                  ),
                ),
              ),
              SizedBox(width: 10.w),
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: ref.watch(colorProvider)['backgroundColorWidget'], // 设置背景颜色
                ),
                child: IconButton(
                  onPressed: () {
                    // unawaited(html.document.documentElement?.requestFullscreen()); // 进入全屏模式
                  },
                  style: ButtonStyle(
                    overlayColor:
                        WidgetStateProperty.all(ref.watch(colorProvider)['accentColor']?.withValues(alpha: 0.3)),
                  ),
                  icon: Icon(
                    Icons.fullscreen,
                    color: ref.watch(colorProvider)['white'],
                  ),
                ),
              ),
              SizedBox(width: 10.w),
              Consumer(
                builder: (_, WidgetRef ref, __) {
                  return Container(
                    height: 70.h,
                    width: 100.w,
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top: 10.h, bottom: 10.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(25.r)),
                      color: ref.watch(colorProvider)['backgroundColorWidget'],
                    ),
                    child: TextButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        overlayColor:
                            WidgetStateProperty.all(ref.watch(colorProvider)['accentColor']?.withValues(alpha: 0.3)),
                      ),
                      child: Container(
                        height: 50.h,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ColorFiltered(
                              colorFilter: ColorFilter.mode(
                                ref.watch(colorProvider)['white']!,
                                BlendMode.srcIn,
                              ),
                              child: SvgPicture.asset(
                                AssetsImages.plusIconRemovebgPreview_1Svg,
                                height: 30.h,
                                width: 30.h,
                              ),
                            ),
                            Text(
                              "Add",
                              style: TextStyle(
                                color: ref.watch(colorProvider)['text'],
                                fontSize: Constant.textSP_20,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class BoardsTabWidget extends ConsumerWidget {
  BoardsTabWidget({
    super.key,
    required this.tab,
    required this.press,
    this.isSelected = false,
  });

  final BoardsTabModel tab;
  final VoidCallback press;
  final bool isSelected;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onLongPress: () {},
      onDoubleTap: () {
        // 双击事件的处理逻辑
        if (tab.id != 0 && tab.name != "General") {
          ref.refresh(boardsWidgetsProvider(tab.id ?? 0)); //刷新并read新值
        }
      },
      child: Stack(
        children: [
          TextButton(
            onPressed: press,
            style: ButtonStyle(
              minimumSize: WidgetStateProperty.all(Size(0, 0)),
              padding: WidgetStateProperty.all(EdgeInsets.zero),
              shape: WidgetStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.r),
                ),
              ),
              backgroundColor: WidgetStateProperty.resolveWith<Color>(
                (Set<WidgetState> states) {
                  if (states.contains(WidgetState.hovered)) {
                    return ref.watch(colorProvider)['accentColor']!.withValues(alpha: 0.3); // 鼠标悬停时的颜色
                  }
                  // 默认状态下的颜色
                  return ref.watch(colorProvider)['backgroundColorWidget']!;
                },
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                color:
                    isSelected ? ref.watch(colorProvider)['accentColor']?.withValues(alpha: 0.8) : Colors.transparent,
                borderRadius: BorderRadius.circular(10.0.w),
                shape: BoxShape.rectangle,
              ),
              padding: EdgeInsets.only(left: 18.w, right: 18.w, top: 8.h, bottom: 8.h),
              child: Stack(
                children: [
                  Center(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: 200.w,
                      ),
                      child: Text(
                        tab.name ?? "",
                        //单行显示,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: Constant.textSP_16,
                          color: isSelected ? ref.watch(colorProvider)['white'] : ref.watch(colorProvider)['text'],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
