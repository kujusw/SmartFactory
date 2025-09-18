import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_factory/core/notifiers/device_state_notifier.dart';
import '../../../core/dependencies/dependencies.dart';
import '../../../http/device.dart';
import '../../../models/device_model.dart';
import '../../../models/device_model_new.dart';
import '../../../models/general_device_info_model.dart';
import '../../../models/locationresponseentity.dart';
import '../../boards/general/notifier/device_notifier.dart';
import 'deviceaddhttpmanager.dart';
import 'devicedeletehttpmanager.dart';
import 'location_inuser_state_notifier.dart';
import 'updatedevicelocationhttpmanager.dart';

part 'things_notifier.g.dart';

// 分组选择
@riverpod
class SelectedGroup extends _$SelectedGroup {
  @override
  String build() => "All Devices";

  void set(String group) => state = group;
}

@riverpod
class SelectedDevice extends _$SelectedDevice {
  @override
  DeviceModel? build() => null;

  void set(DeviceModel? device) => state = device;
}

// 添加 / 删除设备
@riverpod
class AddDevice extends _$AddDevice {
  @override
  AddDeviceResponseEntity build() => AddDeviceResponseEntity(code: 0, message: "");

  Future<bool> addDevice(params, token) async {
    try {
      final result = await DeviceAPI.addDevice(params: params, token: token);
      state = result;
      return true;
    } catch (e) {
      state = AddDeviceResponseEntity(code: 201, message: "Add Device failed");
      return false;
    }
  }
}

@riverpod
class DeleteDevice extends _$DeleteDevice {
  @override
  DeleteDeviceResponseEntity build() => DeleteDeviceResponseEntity(code: 0, message: "");

  Future<bool> deleteDevice(deviceId, token) async {
    try {
      final result = await DeviceAPI.deleteDevice(deviceId: deviceId, token: token);
      state = result;
      return true;
    } catch (e) {
      state = DeleteDeviceResponseEntity(code: 201, message: "Delete Device failed");
      return false;
    }
  }
}

// 搜索
@riverpod
class SearchValueInThings extends _$SearchValueInThings {
  @override
  String build() => "";

  void set(String value) => state = value;
}

@riverpod
List<DeviceModel> searchDevicesInThings(Ref ref) {
  final searchValue = ref.watch(searchValueInThingsProvider);
  final devices = ref.watch(deviceManagerProvider);

  if (searchValue.isNotEmpty) {
    return devices.where((d) => d.name?.toLowerCase().contains(searchValue.toLowerCase()) ?? false).toList();
  }
  return devices;
}

// 选中的设备
@riverpod
List<DeviceModel> selectedDevicesInThings(Ref ref) {
  final devices = ref.watch(deviceManagerProvider);
  return devices.where((d) => d.selectedInAddDevice ?? false).toList();
}

// 修改设备名称
@riverpod
class UpdateDeviceName extends _$UpdateDeviceName {
  @override
  String build() => "";

  void set(String name) => state = name;
}

// 设备位置
@riverpod
class SelectedLocationInThings extends _$SelectedLocationInThings {
  @override
  LocationModel? build() => null;

  void set(LocationModel? location) => state = location;
}

@riverpod
class SelectedLocationsInUsers extends _$SelectedLocationsInUsers {
  @override
  List<LocationModel> build() => [];

  void add(LocationModel location) {
    if ((location.id ?? 0) > 0) {
      state = [...state, location];
    }
  }

  void remove(LocationModel location) {
    state = state.where((e) => e != location).toList();
  }
}

// things 页面设备能源信息
@riverpod
class GeneralDevicesInThings extends _$GeneralDevicesInThings {
  @override
  List<GeneralDeviceInfoModel> build() => [];

  void updateGeneralDeviceName(String name) {
    state = state.map((e) => e.copyWith(name: name)).toList();
  }

  void updateGeneralDeviceID(String id) {
    state = state.map((e) => e.copyWith(id: id)).toList();
  }

  void setList(List<GeneralDeviceInfoModel> list) {
    state = list;
  }
}

// 搜索 + 菜单筛选
@riverpod
class SearchValueForMenuInThings extends _$SearchValueForMenuInThings {
  @override
  String build() => "";

  void set(String value) => state = value;
}

@riverpod
List<DeviceModel> filteredDevicesInThings(Ref ref) {
  final searchValue = ref.watch(searchValueForMenuInThingsProvider);
  final devices = ref.watch(deviceManagerProvider);
  final menuDeviceList = ref.watch(showMenuDeviceListProvider);
  final selectedDevices = ref.watch(deviceManagerProvider.notifier).getSelectedDevices();

  var deviceList = devices;

  if (searchValue.isNotEmpty) {
    if (menuDeviceList > 0) {
      deviceList = (selectedDevices?.isNotEmpty ?? false)
          ? selectedDevices!.where((d) => d.toString().toLowerCase().contains(searchValue.toLowerCase())).toList()
          : [];
    } else {
      deviceList = deviceList.where((d) => d.toString().toLowerCase().contains(searchValue.toLowerCase())).toList();
    }
  } else {
    deviceList = deviceList.where((d) => d.selectedInMenu ?? false).toList();
    if (deviceList.isEmpty) {
      deviceList = devices;
    }
  }

  return deviceList;
}

// 退出登录清理
void clearThingsProvider(WidgetRef ref) {
  ref.invalidate(selectedGroupProvider);
  ref.invalidate(selectedDeviceProvider);
  ref.invalidate(addDeviceProvider);
  ref.invalidate(deleteDeviceProvider);
  ref.invalidate(searchValueInThingsProvider);
  ref.invalidate(searchDevicesInThingsProvider);
  ref.invalidate(selectedDevicesInThingsProvider);
  ref.invalidate(updateDeviceNameProvider);
  ref.invalidate(selectedLocationInThingsProvider);
  ref.invalidate(selectedLocationsInUsersProvider);
  ref.invalidate(updateDeviceLocationProvider);
  ref.invalidate(generalDevicesInThingsProvider);
  ref.invalidate(searchValueForMenuInThingsProvider);
  ref.invalidate(filteredDevicesInThingsProvider);
}
