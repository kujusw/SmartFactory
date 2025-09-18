import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_factory/core/notifiers/device_state_notifier.dart';

import '../../../../common/utils/sort.dart';
import '../../../../http/device.dart';
import '../../../../models/device_model.dart';
import '../../../../models/general_device_info_model.dart';
import '../../../login/notifier/login_notifier.dart';

part 'device_notifier.g.dart';

/// 获取设备列表
@riverpod
Future<List<DeviceModel>> devices(Ref ref) async {
  final token = ref.read(loginProvider).data?.token;
  final devices = await DeviceAPI.getDevices(path: "api/v1/devices/all", token: token);
  final sortDevicesReturn = sortDevices(devices.data ?? []);

  ref.read(deviceManagerProvider.notifier).setDevices(sortDevicesReturn ?? []);
  return sortDevicesReturn ?? [];
}

/// 当前选中的设备
@riverpod
class CurrentDevice extends _$CurrentDevice {
  @override
  DeviceModel? build() => null;

  /// 设置当前选中的设备
  void setCurrentDevice(DeviceModel? device) {
    state = device;
  }

  /// 清空当前选中的设备
  void clearCurrentDevice() {
    state = null;
  }
}

/// 搜索值
@riverpod
class VualeSearch extends _$VualeSearch {
  @override
  String build() => "";

  /// 设置搜索值
  void setValue(String value) {
    state = value;
  }

  /// 清空搜索值
  void clear() {
    state = "";
  }
}

/// 显示 menu 的设备列表 ID

@riverpod
class ShowMenuDeviceList extends _$ShowMenuDeviceList {
  @override
  int build() => 0;

  void setValue(int value) {
    state = value;
  }

  void reset() {
    state = 0;
  }
}

/// 搜索结果设备
@riverpod
List<DeviceModel>? itemsSearchDeviceModelInDevice(Ref ref) {
  final search = ref.watch(vualeSearchProvider);
  final menu = ref.watch(showMenuDeviceListProvider);

  if (search.isNotEmpty) {
    if (menu > 0) {
      return ref
          .watch(deviceManagerProvider.notifier)
          .getSelectedDevices()
          ?.where(
            (element) => element.toString().toLowerCase().contains(search.toLowerCase()),
          )
          .toList();
    } else {
      return ref
          .watch(deviceManagerProvider)
          .where(
            (element) => element.toString().toLowerCase().contains(search.toLowerCase()),
          )
          .toList();
    }
  } else {
    if (menu > 0) {
      return ref.watch(deviceManagerProvider.notifier).getSelectedDevices();
    }
    return ref.watch(deviceManagerProvider);
  }
}

/// GeneralDevice 的状态管理
@riverpod
class ItemsGeneralDevice extends _$ItemsGeneralDevice {
  @override
  List<GeneralDeviceInfoModel> build() => [];

  /// 更新 GeneralDevice 名称
  void updateGeneralDeviceName(GeneralDeviceInfoModel device) {
    state = state.map((e) => e.id == device.id ? device : e).toList();
  }

  void setDevices(List<GeneralDeviceInfoModel> devices) {
    state = devices;
  }
}

/// 退出登录清空数据
void clearDeviceProvider(WidgetRef ref) {
  ref.invalidate(devicesProvider);
  ref.invalidate(currentDeviceProvider);
  ref.invalidate(vualeSearchProvider);
  ref.invalidate(itemsGeneralDeviceProvider);
  ref.invalidate(itemsSearchDeviceModelInDeviceProvider);
  ref.invalidate(showMenuDeviceListProvider);
}
