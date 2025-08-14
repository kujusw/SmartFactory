import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/dependencies/dependencies.dart';
import '../../../core/notifiers/general_device_state_notifier.dart';
import '../../../models/device_model.dart';
import '../../../models/device_model_new.dart';
import '../../../models/general_device_info_model.dart';
import '../../../models/locationresponseentity.dart';
import '../../boards/general/notifier/device_notifier.dart';
import 'deviceaddhttpmanager.dart';
import 'devicedeletehttpmanager.dart';
import 'deviceinfo_state_notifier.dart';
import 'location_inuser_state_notifier.dart';
import 'updatedevicelocationhttpmanager.dart';

final selectedGroupProvider = StateProvider.autoDispose<String>((ref) => "All Devices");
final selectedDeviceProvider = StateProvider.autoDispose<DeviceModel?>((ref) {
  return null;
});

final itemsDeviceInfosProvider = StateNotifierProvider<DeviceInfosState, List<GeneralDeviceInfoModel>>((ref) {
  return DeviceInfosState();
});

final addDeviceProvider = StateNotifierProvider<DeviceAddHttpManager, AddDeviceResponseEntity>((ref) {
  return DeviceAddHttpManager(AddDeviceResponseEntity(code: 0, message: ""));
});

final deleteDeviceProvider = StateNotifierProvider<DeviceDeleteHttpManager, DeleteDeviceResponseEntity>((ref) {
  return DeviceDeleteHttpManager(DeleteDeviceResponseEntity(code: 0, message: ""));
});

// //添加虚拟点时关联的设备 多选
// final selectedAssociatedDeviceProvider = StateNotifierProvider<DeviceMultiSelectsState, List<DeviceModel>>((ref) {
//   return DeviceMultiSelectsState();
// });

//搜索值
final vualeSearchProviderInThings = StateProvider.autoDispose<String>((ref) => "");

final itemsSearchDeviceModelProviderInThings = StateProvider.autoDispose<List<DeviceModel>?>((ref) {
  if (ref.watch(vualeSearchProviderInThings).isNotEmpty) {
    return ref.watch(itemsDeviceModelProvider).where((element) {
      //忽略大小写
      return element.name!.toLowerCase().contains(ref.watch(vualeSearchProviderInThings).toLowerCase());
    }).toList();
  } else {
    return ref.watch(itemsDeviceModelProvider);
  }
});

//选中的设备
final itemsSelectDeviceModelProviderInThings = StateProvider.autoDispose<List<DeviceModel>?>((ref) {
  if (ref.watch(itemsDeviceModelProvider).isNotEmpty) {
    return ref.watch(itemsDeviceModelProvider).where((element) {
      //返回选中的设备
      return element.selectedInAddDevice!;
    }).toList();
  } else {
    return [];
  }
});

final updateDeviceNameProvider = StateProvider<String>((ref) => "");

final selectedLocationProviderInThings = StateProvider.autoDispose<LocationModel?>((ref) => null);
final selectedLocationProviderInUsers =
    StateNotifierProvider.autoDispose<LocationSelectInUserState, List<LocationModel>>((ref) {
  return LocationSelectInUserState();
});

//更新设备位置
final updateDeviceLocationProvider =
    StateNotifierProvider<UpdateDeviceLocationHttpManager, UpdateDeviceLocationResponseEntity>((ref) {
  return UpdateDeviceLocationHttpManager(UpdateDeviceLocationResponseEntity(code: 0, message: ""));
});

//things页面设备列表 的能源信息
final itemsGeneralDeviceInThingsProvider =
    StateNotifierProvider<GeneralDeviceState, List<GeneralDeviceInfoModel>>((ref) {
  return GeneralDeviceState();
});

//things页面设备列表筛选
final vualeSearchInThingsProvider = StateProvider.autoDispose<String>((ref) => "");

final itemsSearchDeviceModelProvider = StateProvider.autoDispose<List<DeviceModel>?>((ref) {
  List<DeviceModel> deviceList = ref.watch(itemsDeviceModelProvider);

  // Check if there is a search query
  if (ref.watch(vualeSearchInThingsProvider).isNotEmpty) {
    //如果菜单中选择了设备
    if (ref.watch(showMenuDeviceListProvider) > 0) {
      if (ref.watch(itemsDeviceModelProvider.notifier).getSelectedDevices()?.length == 0) {
        deviceList = [];
      } else {
        deviceList = ref.watch(itemsDeviceModelProvider.notifier).getSelectedDevices()!.where((element) {
          return element.toString().toLowerCase().contains(ref.watch(vualeSearchInThingsProvider).toLowerCase());
        }).toList();
      }
    } else {
      deviceList = deviceList.where((element) {
        // Ignore case when checking if element matches search query
        return element.toString().toLowerCase().contains(ref.watch(vualeSearchInThingsProvider).toLowerCase());
      }).toList();
    }
  } else {
    // Filter devices that are selected in the menu
    deviceList = deviceList.where((element) {
      return element.selectedInMenu ?? false;
    }).toList();

    // If no devices are selected in the menu, use all devices
    if (deviceList.isEmpty) {
      deviceList = ref.watch(itemsDeviceModelProvider);
    }
  }
  return deviceList;
});

//退出登录后 清空数据
void clearThingsProvider(WidgetRef ref) {
  ref.invalidate(selectedGroupProvider);
  ref.invalidate(selectedDeviceProvider);
  ref.invalidate(itemsDeviceInfosProvider);
  ref.invalidate(addDeviceProvider);
  ref.invalidate(deleteDeviceProvider);
  ref.invalidate(vualeSearchProviderInThings);
  ref.invalidate(itemsSearchDeviceModelProviderInThings);
  ref.invalidate(itemsSelectDeviceModelProviderInThings);
  ref.invalidate(updateDeviceNameProvider);
  ref.invalidate(selectedLocationProviderInThings);
  ref.invalidate(selectedLocationProviderInUsers);
  ref.invalidate(updateDeviceLocationProvider);
  ref.invalidate(itemsGeneralDeviceInThingsProvider);
  ref.invalidate(vualeSearchInThingsProvider);
  ref.invalidate(itemsSearchDeviceModelProvider);
}
