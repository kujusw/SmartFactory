import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../common/utils/sort.dart';
import '../../../../core/dependencies/dependencies.dart';
import '../../../../core/notifiers/general_device_state_notifier.dart';
import '../../../../http/device.dart';
import '../../../../models/device_model.dart';
import '../../../../models/general_device_info_model.dart';
import '../../../login/notifier/login_notifier.dart';

Future<List<DeviceModel>> getDevices(FutureProviderRef<List<DeviceModel>> ref) async {
  var devices = await DeviceAPI.getDevices(path: "v1/devices/all", token: ref.read(loginProvider).data?.token);
  var sortDevicesReturn = sortDevices(devices.data ?? []);
  ref.read(itemsDeviceModelProvider.notifier).setDevices(sortDevicesReturn ?? []);
  return sortDevicesReturn ?? [];
}

final devicesProvider = FutureProvider<List<DeviceModel>>((ref) async {
  return getDevices(ref);
});

final currentDeviceProvider = StateProvider.autoDispose<DeviceModel?>((ref) {
  // if (ref.watch(itemsDeviceModelProvider).isNotEmpty) {
  //   return ref.watch(itemsDeviceModelProvider)[0];
  // } else {
  return null;
  // }
});

//搜索值
final vualeSearchProvider = StateProvider.autoDispose<String>((ref) => "");

final itemsSearchDeviceModelInDeviceProvider = StateProvider.autoDispose<List<DeviceModel>?>((ref) {
  if (ref.watch(vualeSearchProvider).isNotEmpty) {
    //如果菜单中选择了设备
    if (ref.watch(showMenuDeviceListProvider) > 0) {
      return ref.watch(itemsDeviceModelProvider.notifier).getSelectedDevices()?.where((element) {
        //忽略大小写
        return element.toString().toLowerCase().contains(ref.watch(vualeSearchProvider).toLowerCase());
      }).toList();
    } else {
      return ref.watch(itemsDeviceModelProvider).where((element) {
        //忽略大小写
        return element.toString().toLowerCase().contains(ref.watch(vualeSearchProvider).toLowerCase());
      }).toList();
    }
  } else {
    //如果菜单中选择了设备
    if (ref.watch(showMenuDeviceListProvider) > 0) {
      return ref.watch(itemsDeviceModelProvider.notifier).getSelectedDevices();
    }
    return ref.watch(itemsDeviceModelProvider);
  }
});
//显示menu三级菜单关联的设备列表
final showMenuDeviceListProvider = StateProvider.autoDispose<int>((ref) => 0);

final itemsGeneralDeviceProvider = StateNotifierProvider<GeneralDeviceState, List<GeneralDeviceInfoModel>>((ref) {
  return GeneralDeviceState();
});

//退出登录后 清空数据
void clearDeviceProvider(WidgetRef ref) {
  ref.invalidate(devicesProvider);
  ref.invalidate(currentDeviceProvider);
  ref.invalidate(vualeSearchProvider);
  ref.invalidate(itemsGeneralDeviceProvider);
  ref.invalidate(itemsSearchDeviceModelInDeviceProvider);
  ref.invalidate(showMenuDeviceListProvider);
}
