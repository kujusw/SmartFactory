// ignore_for_file: unused_result

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_factory/core/notifiers/device_state_notifier.dart';
import 'package:smart_factory/pages/boards/daily_sob/notifier/location_notifier.dart';
import '../../../../../../common/styles/assets.dart';
import '../../../../../../common/styles/theme_state_notifier.dart';
import '../../../../../../common/utils/logger_manager.dart';
import '../../../../../../common/values/index.dart';
import '../../../../../../models/locationresponseentity.dart';
import '../../../../../common/widget/tristatecheckbox.dart';
import '../../../notifier/device_notifier.dart';

//注意 body 设备列表只需要id 然后通过itemsDeviceModelProvider get id的对象做逻辑判断

class GeneralViewGlobalGroupsItem extends ConsumerStatefulWidget {
  const GeneralViewGlobalGroupsItem({super.key});
  @override
  ConsumerState<GeneralViewGlobalGroupsItem> createState() => _GeneralViewGlobalGroupsItemState();
}

class _GeneralViewGlobalGroupsItemState extends ConsumerState<GeneralViewGlobalGroupsItem> {
  late final ProviderSubscription subscription;
  @override
  void initState() {
    super.initState();
    // 监听 getLocationsProvider 的变化
    subscription = ref.listenManual<AsyncValue<List<LocationModel>>>(
      getLocationsProvider,
      (previous, next) {
        next.whenData((list) {
          ref.read(locationListProvider.notifier).setLocations(list);
        });
      },
    );

    // 第一次强制刷新一下
    ref.refresh(getLocationsProvider);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    subscription.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    LoggerManager().d(" locationListProvider ${ref.watch(locationListProvider).length}");
    final locations = ref.watch(locationListProvider);
    return locations.isNotEmpty
        ? Container(
            child: CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => GroupsItemTile(body: ref.watch(locationListProvider)[index]),
                    childCount: ref.watch(locationListProvider).length,
                  ),
                ),
              ],
            ),
          )
        : Container();
  }
}

class GroupsItemTile extends ConsumerWidget {
  final LocationModel body;
  const GroupsItemTile({super.key, required this.body});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // 这段代码将在 widget 树构建完成后执行
      //显示menu三级菜单关联的设备列表
      ref
          .read(showMenuDeviceListProvider.notifier)
          .setValue(ref.watch(deviceManagerProvider.notifier).getSelectedDevices()?.length ?? 0);
    });
    LoggerManager().d(" body $body. ");
    return Container(
      height: 40.h,
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
                  AssetsImages.plusIconRemovebgPreview_1Svg,
                  height: 15.h,
                  width: 15.h,
                ),
              ),
              Transform.scale(
                scale: 0.6, // 缩放比例
                child: TriStateCheckbox(
                  value: CheckboxState.unchecked,
                  onChanged: (value) {
                    LoggerManager().d("value $value");
                    //根据位置过滤设备到showMenuDeviceListProvider
                    if (value == CheckboxState.checked) {
                      //根据位置过滤所有的设备
                      ref.read(showMenuDeviceListProvider.notifier).setValue(
                            //根据位置过滤所有的设备
                            ref
                                    .watch(deviceManagerProvider.notifier)
                                    .getSelectedDevices()
                                    ?.where((element) => element.locationId == body.id)
                                    .length ??
                                0,
                          );
                    }
                  },
                ),
              ),
              Text(
                body.name ?? "",
                style: TextStyle(
                  fontSize: Constant.textSP_14,
                  color: ref.watch(colorProvider)['text'],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
