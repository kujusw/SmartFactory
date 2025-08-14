// 定义一个 StateNotifier 类，用来更新索引值
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/general_device_info_model.dart';

class DeviceInfosState extends StateNotifier<List<GeneralDeviceInfoModel>> {
  DeviceInfosState()
      : super(
          [
            GeneralDeviceInfoModel(
              id: "1",
              name: 'RA203',
              value: "N/A",
              state: "ON",
              type: "Current",
              time: "N/A",
            ),
            GeneralDeviceInfoModel(
              id: "2",
              name: 'RA203',
              value: "Connected",
              state: "ON",
              type: "Status",
              time: "N/A",
            ),
            GeneralDeviceInfoModel(
              id: "3",
              name: 'RA203',
              value: "N/A",
              state: "ON",
              type: "Daily Total Energy",
              time: "N/A",
            ),
            GeneralDeviceInfoModel(
              id: "4",
              name: 'RA203',
              value: "N/A",
              state: "ON",
              type: "Energy",
              time: "N/A",
            ),
            GeneralDeviceInfoModel(
              id: "5",
              name: 'RA203',
              value: "N/A",
              state: "ON",
              type: "Hourly Total Energy",
              time: "N/A",
            ),
            GeneralDeviceInfoModel(
              id: "6",
              name: 'RA203',
              value: "N/A",
              state: "ON",
              type: "Monthly Total Energy",
              time: "N/A",
            ),
            GeneralDeviceInfoModel(
              id: "7",
              name: 'RA203',
              value: "N/A",
              state: "ON",
              type: "Power",
              time: "N/A",
            ),
            GeneralDeviceInfoModel(
              id: "8",
              name: 'RA203',
              value: "N/A",
              state: "ON",
              type: "Weekly Energy Diff",
              time: "N/A",
            ),
            GeneralDeviceInfoModel(
              id: "9",
              name: 'RA203',
              value: "N/A",
              state: "ON",
              type: "Weekly Total Energy",
              time: "N/A",
            ),
          ],
        );

  // 更新设备
  void updateGeneralDeviceInfo(String deviceID, String type, String value, String? time, String? status) {
    state = state.map((device) {
      if (device.id == deviceID && device.type == type) {
        device.value = value;
        device.time = time ?? device.time;
        device.state = status ?? device.state;
      }
      return device;
    }).toList();
  }

  DeviceInfosState updateGeneralDeviceName(String name) {
    state = state.map((device) {
      device.name = name;
      return device;
    }).toList();
    return this;
  }

  DeviceInfosState updateGeneralDeviceID(String id) {
    state = state.map((device) {
      device.id = id;
      return device;
    }).toList();
    return this;
  }

  void setList(List<GeneralDeviceInfoModel> generalDeviceInfoModels) {
    state = generalDeviceInfoModels.map((role) => GeneralDeviceInfoModel.copy(role)).toList();
  }
}
