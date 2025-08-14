import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import '../../../common/styles/theme.dart';
import '../../../common/values/index.dart';

class CustomDropdown extends ConsumerWidget {
  final String title;
  final String? value;
  final List<String> list;
  final Function(String?) onSelected;

  const CustomDropdown(
      {super.key, required this.title, required this.value, required this.list, required this.onSelected});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 70.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.star,
                size: 10.w,
                color: Colors.red,
              ),
              SizedBox(
                width: 4.w,
              ),
              Text(
                title,
                style: TextStyle(
                  fontSize: Constant.textSP_18,
                  color: ref.watch(colorProvider)['text'],
                ),
              ),
            ],
          ),
          SizedBox(height: 5.h),
          GestureDetector(
            onTap: () {
              unawaited(SmartDialog.showAttach(
                targetContext: context,
                usePenetrate: false,
                maskColor: Colors.transparent,
                clickMaskDismiss: true,
                keepSingle: true,
                tag: "SelectPopupPage",
                builder: (_) => SelectPopupPage(list, onSelected),
              ));
            },
            child: Container(
              height: 30.h,
              padding: EdgeInsets.only(left: 10.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.h),
                border: Border.all(
                  color: ref.watch(colorProvider)['dividerColor']!,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(value ?? 'Select',
                      style: TextStyle(fontSize: Constant.textSP_12, color: ref.watch(colorProvider)['text'])),
                  Container(
                    padding: EdgeInsets.only(right: 10.w),
                    child: Icon(
                      Icons.arrow_drop_down,
                      color: ref.watch(colorProvider)['white'],
                      size: 15.h, // Customize the icon color
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

class SelectPopupPage extends ConsumerWidget {
  final List<String> list;
  final Function(String?) onSelected;
  SelectPopupPage(this.list, this.onSelected);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      alignment: Alignment.centerLeft,
      width: 560.w,
      height: (list.length * 30.h + 4.h) > 300.h ? 300.h : (list.length * 30.h + 4.h),
      margin: EdgeInsets.only(left: 20.w, right: 20.w, top: 5.h, bottom: 5.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.h),
        color: ref.watch(colorProvider)['backgroundColorWidget'],
        shape: BoxShape.rectangle,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.5),
            spreadRadius: 1.h,
            blurRadius: 1.h,
          ),
        ],
      ),
      child: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () => onSelected(list[index]),
                  child: Container(
                      color: ref.watch(colorProvider)['backgroundColorWidget'],
                      alignment: Alignment.centerLeft,
                      height: 30.h,
                      width: double.infinity,
                      padding: EdgeInsets.only(left: 16.w),
                      child: Text(list[index],
                          style: TextStyle(fontSize: Constant.textSP_16, color: ref.watch(colorProvider)['text']))),
                );
              },
              childCount: list.length,
            ),
          ),
        ],
      ),
    );
  }
}
