import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../common/utils/screenutil.dart';
import '../../../../models/general_globalinfo_model.dart';
import '../notifier/general_info_notifier.dart';
import 'generalviewglobalinfoitem.dart';

/**
 * general 顶部横向信息栏
 */
class GeneralViewGlobalInfo extends ConsumerWidget {
  const GeneralViewGlobalInfo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final overviewAsync = ref.watch(getGeneralGlobalInfoProvider);

    return Container(
      height: 140.h,
      child: overviewAsync.when(
        loading: () => const Center(child: CircularProgressIndicator(strokeWidth: 2)),
        error: (e, st) => Center(child: Text('Load overview failed: $e')),
        data: (overview) {
          final items = _overviewToItems(overview);
          return ScrollConfiguration(
            behavior: const MaterialScrollBehavior()
                .copyWith(scrollbars: false, dragDevices: KJScreenUtil.kTouchLikeDeviceTypes),
            child: CustomScrollView(
              scrollDirection: Axis.horizontal,
              slivers: [
                SliverGrid(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    childAspectRatio: 0.5,
                    mainAxisSpacing: 10.w,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return GeneralViewGlobalInfoItem(item: items[index]);
                    },
                    childCount: items.length,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  // 将 Overview 拆成多个 item，适配 GeneralViewGlobalInfoItem 的 Map<String, dynamic> 结构
  List<Map<String, dynamic>> _overviewToItems(Overview overview) {
    return [
      {'Total Devices': overview.totalDevices ?? 0},
      {'Online Devices': overview.onlineDevices ?? 0},
      {'Offline Devices': overview.offlineDevices ?? 0},
      {'Physical Devices': overview.physicalDevices ?? 0},
      {'Virtual Devices': overview.virtualDevices ?? 0},
    ];
  }
}
