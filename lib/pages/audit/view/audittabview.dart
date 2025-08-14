// ignore_for_file: unused_result

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../common/styles/theme.dart';
import '../../../common/values/index.dart';
import '../notifier/audit_notifier.dart';
import 'audittable.dart';

class AuditTableWidget extends ConsumerWidget {
  AuditTableWidget({Key? key}) : super(key: key);
  final verticalScrollController = ScrollController();
  final horizontalScrollController = ScrollController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 1010.h,
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
                          "All Audits",
                          style: TextStyle(
                            fontSize: Constant.textSP_20,
                            color: ref.watch(colorProvider)['text'],
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
                      //
                      Consumer(
                        builder: (context, ref, child) {
                          return Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: ref.watch(colorProvider)['backgroundColorIconButton'], // 设置背景颜色
                            ),
                            child: IconButton(
                              icon: Icon(Icons.arrow_back, color: ref.watch(colorProvider)['text'], size: 25.h),
                              onPressed: () {
                                if (ref.read(getAuditsPageProvider) > 1) {
                                  ref.read(getAuditsPageProvider.notifier).state = ref.read(getAuditsPageProvider) - 1;
                                } else if (ref.read(getAuditsPageProvider) == 1) {
                                  //相当于刷新
                                  ref.refresh(getAuditsProvider);
                                }
                              },
                              style: ButtonStyle(
                                overlayColor: WidgetStateProperty.all(
                                    ref.watch(colorProvider)['accentColor']?.withValues(alpha: 0.3)),
                              ),
                            ),
                          );
                        },
                      ),
                      SizedBox(width: 8.w),
                      Consumer(
                        builder: (context, ref, child) {
                          return Center(
                            child: Text(
                                'Page ${ref.watch(getAuditsPageProvider)} / ${ref.watch(getAuditsPageTotalProvider)}',
                                style: TextStyle(
                                  fontSize: Constant.textSP_20,
                                  color: ref.watch(colorProvider)['text'],
                                )),
                          );
                        },
                      ),
                      SizedBox(width: 8.w),
                      Consumer(
                        builder: (context, ref, child) {
                          return Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: ref.watch(colorProvider)['backgroundColorIconButton'], // 设置背景颜色
                              ),
                              child: IconButton(
                                icon: Icon(Icons.arrow_forward, color: ref.watch(colorProvider)['text'], size: 25.h),
                                onPressed: () {
                                  if (ref.read(getAuditsPageProvider) < ref.read(getAuditsPageTotalProvider)) {
                                    ref.read(getAuditsPageProvider.notifier).state =
                                        ref.read(getAuditsPageProvider) + 1;
                                  }
                                },
                                style: ButtonStyle(
                                  overlayColor: WidgetStateProperty.all(
                                      ref.watch(colorProvider)['accentColor']?.withValues(alpha: 0.3)),
                                ),
                              ));
                        },
                      ),
                      SizedBox(width: 10.w),
                      Consumer(
                        builder: (context, ref, child) {
                          return Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: ref.watch(colorProvider)['backgroundColorIconButton'], // 设置背景颜色
                            ),
                            child: IconButton(
                              icon:
                                  Icon(Icons.restart_alt_rounded, color: ref.watch(colorProvider)['text'], size: 25.h),
                              onPressed: () {
                                //刷新
                                ref.refresh(getAuditsProvider);
                              },
                              style: ButtonStyle(
                                overlayColor: WidgetStateProperty.all(
                                    ref.watch(colorProvider)['accentColor']?.withValues(alpha: 0.3)),
                              ),
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
            child: AuditTable(),
          ),
        ],
      ),
    );
  }
}
