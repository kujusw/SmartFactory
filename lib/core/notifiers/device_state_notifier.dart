// 定义一个 StateNotifier 类，用来更新索引值
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/device_model.dart';

class DeviceState extends StateNotifier<List<DeviceModel>> {
  DeviceState() : super([]);

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
    return state.firstWhere((device) => device.id == deviceId);
  }

  //选中所有设备
  void selectAllDevice(bool? val) {
    state = state.map((device) {
      return device.copyWith(selected: val);
    }).toList();
  }
  //选中单个设备 在设备添加列表中

  void selectDevice(DeviceModel device, bool selected) {
    state = state.map((t) => t.id == device.id ? device.copyWith(selectedInAddDevice: selected) : t).toList();
  }

  //取消所有的选中
  void unSelectDevice() {
    state = state.map((device) {
      return device.copyWith(selectedInAddDevice: false);
    }).toList();
  }

  void selectDeviceInMenu(DeviceModel device, bool selected) {
    state = state.map((t) => t.id == device.id ? device.copyWith(selectedInMenu: selected) : t).toList();
  }

  //获取selectedInMenu 为true的设备集合
  List<DeviceModel>? getSelectedDevices() {
    return state.where((device) => device.selectedInMenu ?? false).toList();
  }

  void setDevices(List<DeviceModel> list) {
    state = list;
  }
}
