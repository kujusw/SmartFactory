import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_factory/core/notifiers/device_state_notifier.dart';
import '../../../common/utils/logger_manager.dart';
import '../../../http/device.dart';
import '../../../models/device_model.dart';
import '../../../models/device_model_new.dart';
import '../../../models/general_device_info_model.dart';
import '../../../models/locationresponseentity.dart';
import '../../boards/general/notifier/device_notifier.dart';
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
Future<AddDeviceResponseEntity> addDevice(
  Ref ref,
  AddDeviceModelRequestEntity params,
  String token,
) async {
  try {
    LoggerManager().d("Add Device params: $params");
    final result = await DeviceAPI.addDevice(params: params, token: token);
    return result;
  } catch (e) {
    return AddDeviceResponseEntity(code: 201, message: "Add Device failed");
  }
}

@riverpod
Future<DeleteDeviceResponseEntity> deleteDevice(
  Ref ref,
  String deviceId,
  String token,
) async {
  try {
    LoggerManager().d("deleteDevice params: $deviceId");
    final result = await DeviceAPI.deleteDevice(deviceId: deviceId, token: token);
    return result;
  } catch (e) {
    return DeleteDeviceResponseEntity(code: 201, message: "Delete Device failed");
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
  final searchQuery = ref.watch(searchValueInThingsProvider);
  final deviceList = ref.watch(deviceManagerProvider);
  final showMenuDevice = ref.watch(showMenuDeviceListProvider);
  final selectedDevices = ref.watch(deviceManagerProvider.notifier).getSelectedDevices();
  // 有搜索内容
  if (searchQuery.isNotEmpty) {
    final lowerQuery = searchQuery.toLowerCase();

    if (showMenuDevice > 0) {
      if (selectedDevices == null || selectedDevices.isEmpty) {
        return [];
      }
      return selectedDevices.where((element) => element.toString().toLowerCase().contains(lowerQuery)).toList();
    }

    return deviceList.where((element) => element.toString().toLowerCase().contains(lowerQuery)).toList();
  }

  // 没有搜索内容
  final menuDevices = deviceList.where((e) => e.selectedInMenu ?? false).toList();
  if (menuDevices.isNotEmpty) {
    return menuDevices;
  }

  return deviceList;
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
  ref.invalidate(updateDeviceLocationProvider);
  ref.invalidate(generalDevicesInThingsProvider);
  ref.invalidate(searchValueForMenuInThingsProvider);
  ref.invalidate(filteredDevicesInThingsProvider);
}
