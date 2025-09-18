import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_factory/core/notifiers/device_state_notifier.dart';
import '../../../../../../common/styles/assets.dart';
import '../../../../../../common/styles/theme_state_notifier.dart';
import '../../../../../../common/utils/logger_manager.dart';
import '../../../../../../common/utils/screenutil.dart';
import '../../../../../../common/values/index.dart';
import '../../../../../../core/dependencies/dependencies.dart';
import '../../../notifier/device_notifier.dart';
import 'generalviewglobalgroupitem.dart';

class GeneralViewProject extends ConsumerWidget {
  GeneralViewProject({Key? key}) : super(key: key);
  final TextEditingController searchController = TextEditingController()..text = "";
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 770.h,
      margin: EdgeInsets.only(top: 10.h),
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.w),
              color: ref.watch(colorProvider)['backgroundColorWidget'],
            ),
            height: 158.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 136.h,
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 20.w, top: 10.h, right: 20.w),
                  child: ref.watch(currentTimeProvider).when(
                        data: (time) => RichText(
                          text: TextSpan(
                            text: time.split('@')[0],
                            style: TextStyle(fontSize: Constant.textSP_24, color: ref.watch(colorProvider)['text']),
                            children: [
                              TextSpan(
                                text: "\n" + time.split('@')[1],
                                style: TextStyle(fontSize: Constant.textSP_30, color: ref.watch(colorProvider)['text']),
                              ),
                            ],
                          ),
                        ),
                        loading: () => Container(),
                        error: (error, stack) {
                          LoggerManager().e("GeneralViewProject error: $error");
                          return Container();
                        },
                      ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10.h),
          Container(
            height: 592.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.w),
              color: ref.watch(colorProvider)['backgroundColorWidget'],
            ),
            padding: EdgeInsets.only(left: 20.w, right: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 45.h,
                  child: TextField(
                    style: TextStyle(
                      fontSize: Constant.textSP_14,
                      color: ref.watch(colorProvider)['text'],
                    ),
                    controller: searchController,
                    onChanged: (value) {
                      ref.read(vualeSearchProvider.notifier).setValue(value);
                    },
                    decoration: InputDecoration(
                      hintText: "Search Groups",
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
                      suffixIcon: GestureDetector(
                        onTap: () {
                          if (ref.read(vualeSearchProvider).toString().length > 0) {
                            ref.read(vualeSearchProvider.notifier).setValue("");
                            searchController.clear();
                          }
                        },
                        child: ref.watch(vualeSearchProvider).toString().length > 0
                            ? Icon(
                                Icons.close,
                                color: ref.watch(colorProvider)['text'],
                                size: 20.h,
                              )
                            : ColorFiltered(
                                colorFilter: ColorFilter.mode(
                                  ref.watch(colorProvider)['white']!,
                                  BlendMode.srcIn,
                                ),
                                child: null,
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
                  height: 48.h,
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
                      Consumer(builder: (_, WidgetRef ref, __) {
                        return Text(
                          ref.watch(deviceManagerProvider).length.toString() + " Devices",
                          style: TextStyle(
                            fontSize: Constant.textSP_14,
                            color: ref.watch(colorProvider)['text'],
                          ),
                        );
                      }),
                    ],
                  ),
                ),

                Container(
                  height: 492.h,
                  child: ScrollConfiguration(
                    behavior: const MaterialScrollBehavior()
                        .copyWith(scrollbars: false, dragDevices: KJScreenUtil.kTouchLikeDeviceTypes),
                    child: GeneralViewGlobalGroupsItem(),
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
