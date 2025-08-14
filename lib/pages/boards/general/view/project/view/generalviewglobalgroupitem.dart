// ignore_for_file: unused_result

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../../common/styles/assets.dart';
import '../../../../../../common/styles/theme.dart';
import '../../../../../../common/utils/logger_manager.dart';
import '../../../../../../common/values/index.dart';
import '../../../../../../core/dependencies/dependencies.dart';
import '../../../../../../models/device_model.dart';
import '../../../../../../models/locationresponseentity.dart';
import '../../../../../common/widget/customthreelevelmenu.dart';
import '../../../../../common/widget/tristatecheckbox.dart';
import '../../../../../users/notifier/users_notifier.dart';
import '../../../notifier/device_notifier.dart';

//注意 body 设备列表只需要id 然后通过itemsDeviceModelProvider get id的对象做逻辑判断

class GeneralViewGlobalGroupsItem extends ConsumerStatefulWidget {
  const GeneralViewGlobalGroupsItem({super.key});
  @override
  ConsumerState<GeneralViewGlobalGroupsItem> createState() => _GeneralViewGlobalGroupsItemState();
}

class _GeneralViewGlobalGroupsItemState extends ConsumerState<GeneralViewGlobalGroupsItem> {
  @override
  void initState() {
    super.initState();
    // ref.invalidate(getUsersProvider); //刷新不关心新值
    ref.refresh(getLocationsProvider); //刷新并read新值
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
  }

  List<Map<String, dynamic>> getJsonList(LocationModel locationModel, List<DeviceModel> devices, String type) {
    List<Map<String, dynamic>> list = [];
    for (var item in devices) {
      if (item.location == locationModel.name) {
        if (type == "Lighting") {
          if ((item.name ?? "").toUpperCase().contains("LTG")) {
            list.add(item.toJson());
          }
        } else if (type == "AC") {
          if ((item.name ?? "").toUpperCase().contains("AC")) {
            list.add(item.toJson());
          }
        } else if (type == "Socket") {
          if ((item.name ?? "").toUpperCase().contains("SO")) {
            list.add(item.toJson());
          }
        } else if (type == "Total Consumption") {
          if ((item.name ?? "").toUpperCase().contains("TOTAL")) {
            list.add(item.toJson());
          }
        } else if (type == "Mains") {
          if ((item.name ?? "").toUpperCase().contains("MAINS")) {
            list.add(item.toJson());
          }
        } else {
          list.add(item.toJson());
        }
      }
    }
    return list;
  }

  List<Map<String, dynamic>> getMenuData(List<LocationModel> groups, List<DeviceModel> devices) {
    List<Map<String, dynamic>> list = [];
    for (var generalGlobalGroupModel in groups) {
      list.add(
        {
          'item': generalGlobalGroupModel.toJson(),
          'children': [
            {
              'item': generalGlobalGroupModel.toJson(),
              'type': 'Total Consumption',
              'children': getJsonList(generalGlobalGroupModel, devices, "Total Consumption"),
            },
            {
              'item': generalGlobalGroupModel.toJson(),
              'type': 'Lighting',
              'children': getJsonList(generalGlobalGroupModel, devices, "Lighting"),
            },
            {
              'item': generalGlobalGroupModel.toJson(),
              'type': 'AC',
              'children': getJsonList(generalGlobalGroupModel, devices, "AC"),
            },
            {
              'item': generalGlobalGroupModel.toJson(),
              'type': 'Socket',
              'children': getJsonList(generalGlobalGroupModel, devices, "Socket"),
            },
            {
              'item': generalGlobalGroupModel.toJson(),
              'type': 'Mains',
              'children': getJsonList(generalGlobalGroupModel, devices, "Mains"),
            },
          ],
        },
      );
    }
    // LoggerManager().d("list: ${json.encode(list)}");
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return ref.watch(itemsLocationModelProvider).length > 0 && ref.watch(itemsDeviceModelProvider).length > 0
        ? Container(
            child: CustomThreeLevelMenu(
              data: getMenuData(ref.watch(itemsLocationModelProvider), ref.read(itemsDeviceModelProvider)),
              itemBuilder: (item) => GroupsItemTile(body: item, title: 1),
              subItemBuilder: (subItem) => GroupsItemTile(body: subItem, title: 2),
              subSubItemBuilder: (subSubItem) => GroupsItemTile(body: subSubItem, title: 3),
            ),
          )
        : Container();
  }
}

class GroupsItemTile extends ConsumerWidget {
  final dynamic body; //菜单 1 2 3 级
  final int title; //菜单 1 2 3 级
  const GroupsItemTile({super.key, required this.body, required this.title});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // 这段代码将在 widget 树构建完成后执行
      //显示menu三级菜单关联的设备列表
      ref.read(showMenuDeviceListProvider.notifier).state =
          ref.watch(itemsDeviceModelProvider.notifier).getSelectedDevices()?.length ?? 0;
    });

    return Container(
      height: 40.h,
      padding: EdgeInsets.only(
        left: title == 1
            ? 0.w
            : title == 2
                ? 10.w
                : title == 3
                    ? 20.w
                    : 0.w,
      ),
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
                  value: title == 1
                      ? getTitleOneChechkState(body, ref)
                      : title == 2
                          ? getTitleTwoChechkState(body, ref)
                          : title == 3
                              ? getTitleThreeChechkState(body, ref)
                              : CheckboxState.unchecked,
                  onChanged: (value) {
                    LoggerManager().d("value $value");
                    if (title == 1) {
                      // LoggerManager().d("value title ==1  $body");
                      if (value == CheckboxState.checked) {
                        for (var item in body["children"]) {
                          for (var device in item["children"]) {
                            ref
                                .read(itemsDeviceModelProvider.notifier)
                                .selectDeviceInMenu(DeviceModel.fromJson(device), true);
                          }
                        }
                      } else {
                        for (var item in body["children"]) {
                          for (var device in item["children"]) {
                            ref
                                .read(itemsDeviceModelProvider.notifier)
                                .selectDeviceInMenu(DeviceModel.fromJson(device), false);
                          }
                        }
                      }
                    } else if (title == 2) {
                      // LoggerManager().d("value title ==2  $body");
                      if (value == CheckboxState.checked) {
                        for (var item in body["children"]) {
                          ref
                              .read(itemsDeviceModelProvider.notifier)
                              .selectDeviceInMenu(DeviceModel.fromJson(item), true);
                        }
                      } else {
                        for (var item in body["children"]) {
                          ref
                              .read(itemsDeviceModelProvider.notifier)
                              .selectDeviceInMenu(DeviceModel.fromJson(item), false);
                        }
                      }
                    } else if (title == 3) {
                      if (value == CheckboxState.checked) {
                        ref
                            .read(itemsDeviceModelProvider.notifier)
                            .selectDeviceInMenu(DeviceModel.fromJson(body), true);
                      } else {
                        ref
                            .read(itemsDeviceModelProvider.notifier)
                            .selectDeviceInMenu(DeviceModel.fromJson(body), false);
                      }
                    }
                  },
                ),
              ),
              Text(
                title == 1
                    ? body['item']["name"] ?? "null"
                    : title == 2
                        ? body['type']
                        : title == 3
                            ? body['name']
                            : "null",
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

  getTitleOneChechkState(body, WidgetRef ref) {
    int total = 0;
    int selectedNum = 0;
    for (var item in body["children"]) {
      for (var device in item["children"]) {
        total++;
        if (ref.watch(itemsDeviceModelProvider.notifier).getDeviceById(device["id"])?.selectedInMenu == true) {
          selectedNum++;
        }
      }
    }
    if (total != 0 && total == selectedNum) {
      return CheckboxState.checked;
    } else if (total != 0 && selectedNum != 0) {
      return CheckboxState.indeterminate;
    } else {
      return CheckboxState.unchecked;
    }
  }

  getTitleTwoChechkState(body, WidgetRef ref) {
    int total = 0;
    int selectedNum = 0;
    for (var device in body["children"]) {
      total++;
      if (ref.watch(itemsDeviceModelProvider.notifier).getDeviceById(device["id"])?.selectedInMenu == true) {
        selectedNum++;
      }
    }
    if (total != 0 && total == selectedNum) {
      return CheckboxState.checked;
    } else if (total != 0 && selectedNum != 0) {
      return CheckboxState.indeterminate;
    } else {
      return CheckboxState.unchecked;
    }
  }

  getTitleThreeChechkState(body, WidgetRef ref) {
    if (ref.watch(itemsDeviceModelProvider.notifier).getDeviceById(body["id"])?.selectedInMenu ?? false) {
      return CheckboxState.checked;
    } else {
      return CheckboxState.unchecked;
    }
  }
}
