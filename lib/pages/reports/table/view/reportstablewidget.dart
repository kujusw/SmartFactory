// ignore_for_file: unused_result

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../common/styles/assets.dart';
import '../../../../common/styles/theme.dart';
import '../../../../common/values/constant.dart';
import '../../../../http/http.dart';
import '../../../../models/report_model.dart';
import '../../../login/notifier/login_notifier.dart';
import '../../notifier/reports_notifier.dart';
import 'reportstable.dart';

class ReportsViewTableWidget extends ConsumerWidget {
  ReportsViewTableWidget({Key? key}) : super(key: key);
  final verticalScrollController = ScrollController();
  final horizontalScrollController = ScrollController();

  final TextEditingController searchController = TextEditingController()..text = "";
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 1000.h,
      margin: EdgeInsets.only(top: 10.h, left: 10.w, bottom: 10.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.w),
        color: ref.watch(colorProvider)['backgroundColorWidget'],
      ),
      child: Column(
        children: [
          SizedBox(
            height: 55.h,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: 20.w),
                    child: Consumer(
                      builder: (context, ref, child) {
                        return Text(
                          "All Reports",
                          style: TextStyle(
                            color: ref.watch(colorProvider)['text'],
                            fontSize: Constant.textSP_20,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: 300.w,
                        height: 35.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.w),
                          color: ref.watch(colorProvider)['backgroundColorIconButton'],
                        ),
                        child: Consumer(
                          builder: (contextConsumer, ref, child) {
                            return TextField(
                              style: TextStyle(
                                fontSize: Constant.textSP_16,
                                color: ref.watch(colorProvider)['text'],
                              ),
                              onChanged: (value) {
                                ref.read(vualeSearchProviderInReport.notifier).state = value;
                              },
                              controller: searchController,
                              decoration: InputDecoration(
                                hintText: "Search Report",
                                hintStyle:
                                    TextStyle(fontSize: Constant.textSP_16, color: ref.watch(colorProvider)['text']),
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
                                    if (ref.read(vualeSearchProviderInReport).toString().length > 0) {
                                      ref.read(vualeSearchProviderInReport.notifier).state = "";
                                      searchController.clear();
                                    }
                                  },
                                  child: ref.watch(vualeSearchProviderInReport).toString().length > 0
                                      ? Icon(
                                          Icons.close,
                                          color: ref.watch(colorProvider)['text'],
                                          size: 20.sp,
                                        )
                                      : Container(height: 0, width: 0),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(width: 10.w),
                      // Container(
                      //   height: 48.h,
                      //   decoration: BoxDecoration(
                      //     shape: BoxShape.circle,
                      //     color: ref.watch(colorProvider)['backgroundColorIconButton'], // 设置背景颜色
                      //   ),
                      //   child: IconButton(
                      //     icon: Icon(Icons.filter_alt_rounded, color: ref.watch(colorProvider)['white'], size: 25.h),
                      //     onPressed: () {},
                      //   ),
                      // ),

                      // SizedBox(width: 10.w),
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: ref.watch(colorProvider)['backgroundColorIconButton'], // 设置背景颜色
                        ),
                        child: Consumer(
                          builder: (BuildContext context, WidgetRef ref, Widget? child) {
                            return IconButton(
                              icon: Icon(
                                Icons.restart_alt_rounded,
                                color: ref.watch(colorProvider)['white'],
                                size: 25.h,
                              ),
                              style: ButtonStyle(
                                overlayColor: WidgetStateProperty.all(
                                    ref.watch(colorProvider)['accentColor']?.withValues(alpha: 0.3)),
                              ),
                              onPressed: () {
                                ref.refresh(getReportsProvider);
                              },
                            );
                          },
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Consumer(
                        builder: (BuildContext context, WidgetRef ref, Widget? child) {
                          return Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: ref.watch(colorProvider)['backgroundColorIconButton'], // 设置背景颜色
                            ),
                            child: IconButton(
                              icon: Icon(Icons.download, color: ref.watch(colorProvider)['white'], size: 25.h),
                              style: ButtonStyle(
                                overlayColor: WidgetStateProperty.all(
                                    ref.watch(colorProvider)['accentColor']?.withValues(alpha: 0.3)),
                              ),
                              onPressed: () async {
                                List<ReportModel> reportModels = ref
                                    .watch(itemsReportModelFilteredProvider)
                                    .where((element) => element.selected == true)
                                    .toList();
                                //间隔1秒循环下载
                                for (var reportModel in reportModels) {
                                  //开始下载
                                  if (reportModel.id == null) {
                                    return;
                                  } else {
                                    var id = reportModel.id;
                                    var url = "${Constant.HOST}/v1/reports/download/$id";
                                    // await HttpUtil.downloadReport(
                                    //     url, reportModel.name ?? "", ref.read(loginProvider).data?.token ?? "");
                                  }
                                }
                              },
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 925.h,
            child: ReportsTable(),
          ),
        ],
      ),
    );
  }
}
