// ignore_for_file: unused_result

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_factory/core/notifiers/device_state_notifier.dart';
import 'package:smart_factory/pages/users/notifier/locationuimanager.dart';
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
          ref.read(locationUIManagerProvider.notifier).setLocations(list);
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
    LoggerManager().d(" locationListProvider ${ref.watch(locationUIManagerProvider).length}");
    final locations = ref.watch(locationUIManagerProvider);
    return locations.isNotEmpty
        ? Container(
            child: CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => GroupsItemTile(body: ref.watch(locationUIManagerProvider)[index]),
                    childCount: ref.watch(locationUIManagerProvider).length,
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
              Transform.scale(
                scale: 0.6, // 缩放比例
                child: TriStateCheckbox(
                  value: getTitleOneChechkState(body, ref),
                  onChanged: (value) {
                    LoggerManager().d("value $value");
                    final notifier = ref.read(deviceManagerProvider.notifier);
                    final selected = value == CheckboxState.checked;
                    // 用不可变方式一次性更新，确保触发 Riverpod 通知
                    notifier.selectDeviceInMenuByLocation(body.id ?? 0, selected);
                    // 回调里使用 read 而不是 watch
                    ref.read(showMenuDeviceListProvider.notifier).setValue(notifier.getSelectedDevices()?.length ?? 0);
                    LoggerManager().d("showMenuDeviceListProvider  ${ref.read(showMenuDeviceListProvider)}");
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

  getTitleOneChechkState(LocationModel body, WidgetRef ref) {
    int total = 0;
    int selectedNum = 0;
    for (var device in ref.watch(deviceManagerProvider)) {
      if (device.locationId == body.id) {
        total++;
        if (device.selectedInMenu ?? false) {
          selectedNum++;
        }
      }
    }
    LoggerManager().d("getTitleOneChechkState total $total selectedNum $selectedNum");
    if (total != 0 && total == selectedNum) {
      return CheckboxState.checked;
    } else if (total != 0 && selectedNum != 0) {
      return CheckboxState.indeterminate;
    } else {
      return CheckboxState.unchecked;
    }
  }
}
