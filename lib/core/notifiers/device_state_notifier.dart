// 定义一个 StateNotifier 类，用来更新索引值
// ignore_for_file: cast_from_null_always_fails

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../models/device_model.dart';

part 'device_state_notifier.g.dart';

@riverpod
class DeviceManager extends _$DeviceManager {
  @override
  List<DeviceModel> build() => [];

  // 添加设备
  void addDevice(DeviceModel device) {
    state = [...state, device];
  }

  // 删除设备
  void removeDevice(String deviceId) {
    state = state.where((device) => device.id != deviceId).toList();
  }

  // 更新设备
  void updateDevice(DeviceModel updatedDevice) {
    state = state.map((device) {
      return device.id == updatedDevice.id ? updatedDevice : device;
    }).toList();
  }

  // 查询设备
  DeviceModel? getDeviceById(String? deviceId) {
    return state.firstWhere(
      (device) => device.id == deviceId,
      orElse: () => null as DeviceModel, // 👈 防止报错
    );
  }

  // 选中所有设备
  void selectAllDevice(bool? val) {
    state = state.map((device) {
      return device.copyWith(selected: val);
    }).toList();
  }

  // 选中单个设备（在设备添加列表中）
  void selectDevice(DeviceModel device, bool selected) {
    state = state.map((t) => t.id == device.id ? device.copyWith(selectedInAddDevice: selected) : t).toList();
  }

  // 取消所有选中
  void unSelectDevice() {
    state = state.map((device) {
      return device.copyWith(selectedInAddDevice: false);
    }).toList();
  }

  // 选中设备（菜单）
  void selectDeviceInMenu(DeviceModel device, bool selected) {
    state = state.map((t) => t.id == device.id ? device.copyWith(selectedInMenu: selected) : t).toList();
  }

  // 批量：按 locationId 设置菜单选中状态（一次性产生新列表，确保触发刷新）
  void selectDeviceInMenuByLocation(int? locationId, bool selected) {
    state = [
      for (final d in state)
        if (d.locationId == locationId) d.copyWith(selectedInMenu: selected) else d,
    ];
  }

  // 获取菜单里选中的设备
  List<DeviceModel>? getSelectedDevices() {
    return state.where((device) => device.selectedInMenu ?? false).toList();
  }

  // 覆盖设备列表
  void setDevices(List<DeviceModel> list) {
    state = list;
    // 底部增加一个调试设备  如果不存在添加
    if (!state.any((element) => element.id == "debug")) {
      addDevice(DeviceModel(
        id: "debug",
        deviceName: "SMD",
        deviceType: "debug",
        locationId: 0,
        selected: false,
        selectedInAddDevice: false,
        selectedInMenu: false,
      ));
    }
  }
}
