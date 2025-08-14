import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'devices/view/generalviewdevices.dart';
import 'groups/view/generalviewgroups.dart';
import 'project/view/generalviewproject.dart';

//general 底部信息栏
class GeneralViewSingleInfo extends ConsumerWidget {
  const GeneralViewSingleInfo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 770.h,
      child: Row(
        children: [
          Expanded(
            flex: 5,
            child: GeneralViewProject(),
          ),
          Expanded(
            flex: 8,
            child: GeneralViewGroups(),
          ),
          Expanded(
            flex: 8,
            child: GeneralViewDevices(),
          ),
          // Expanded(
          //   flex: 5,
          //   child: GeneralViewAlarms(),
          // ),
        ],
      ),
    );
  }
}
