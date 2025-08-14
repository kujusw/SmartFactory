import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../../common/utils/screenutil.dart';
import '../../../../common/styles/assets.dart';
import '../../../../common/styles/theme.dart';
import '../../../../common/values/index.dart';
import '../../../common/reportsgroupitem.dart';
import '../../notifier/reports_notifier.dart';

class ReportsViewGeneralWidget extends ConsumerWidget {
  const ReportsViewGeneralWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 1000.h,
      margin: EdgeInsets.only(top: 10.h, bottom: 10.h),
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.w),
              color: ref.watch(colorProvider)['backgroundColorWidget'],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 45.h,
                  child: TextField(
                    style: TextStyle(
                      fontSize: Constant.textSP_14,
                      color: ref.watch(colorProvider)['text'],
                    ),
                    onChanged: (value) {},
                    decoration: InputDecoration(
                      hintText: "Search Report",
                      hintStyle: TextStyle(fontSize: Constant.textSP_16, color: ref.watch(colorProvider)['text']),
                      contentPadding: EdgeInsets.only(top: 0, bottom: 0),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                      prefixIcon: GestureDetector(
                        onTap: () {},
                        child: ColorFiltered(
                          colorFilter: ColorFilter.mode(
                            ref.watch(colorProvider)['white']!,
                            BlendMode.srcIn,
                          ),
                          child: SvgPicture.asset(
                            AssetsImages.searchIconSvg,
                            height: 20.h,
                            width: 20.h,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                //分割线
                Container(
                  color: ref.watch(colorProvider)['dividerColor'],
                  margin: EdgeInsets.only(bottom: 5.h),
                  height: 2.h,
                ),

                Container(
                  height: 40.h,
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 20.w, right: 20.w),
                  child: Row(
                    children: [
                      ColorFiltered(
                        colorFilter: ColorFilter.mode(
                          ref.watch(colorProvider)['white']!,
                          BlendMode.srcIn,
                        ),
                        child: SvgPicture.asset(
                          AssetsImages.reportIconSvg,
                          height: 20.h,
                          width: 20.h,
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(
                        "All Reports",
                        style: TextStyle(
                          color: ref.watch(colorProvider)['text'],
                          fontSize: Constant.textSP_14,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 240.h,
                  padding: EdgeInsets.only(left: 20.w, right: 20.w),
                  child: ScrollConfiguration(
                    behavior: const MaterialScrollBehavior()
                        .copyWith(scrollbars: false, dragDevices: KJScreenUtil.kTouchLikeDeviceTypes),
                    child: CustomScrollView(
                      slivers: [
                        SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (BuildContext context, int index) {
                              return ReportsGroupsItem(item: ref.watch(itemsReportsGroupsProvider)[index]);
                            },
                            childCount: ref.watch(itemsReportsGroupsProvider).length,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
