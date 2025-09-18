import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../common/styles/theme_state_notifier.dart';
import '../../../../../../common/utils/logger_manager.dart';
import '../../../../../../common/values/index.dart';
import '../../../../../../core/dependencies/dependencies.dart';

class GeneralViewTimeHeader extends ConsumerWidget {
  const GeneralViewTimeHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
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
                          text: "\n${time.split('@')[1]}",
                          style: TextStyle(fontSize: Constant.textSP_30, color: ref.watch(colorProvider)['text']),
                        ),
                      ],
                    ),
                  ),
                  loading: () => const SizedBox.shrink(),
                  error: (error, stack) {
                    LoggerManager().e("GeneralViewTimeHeader error: $error");
                    return const SizedBox.shrink();
                  },
                ),
          ),
        ],
      ),
    );
  }
}