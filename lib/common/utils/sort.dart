import '../../models/device_model.dart';

sortDevices(List<DeviceModel> devices) {
  try {
    if (devices.isEmpty) {
      return devices;
    }
    //分离出名字含有total的设备
    List<DeviceModel> totalDeviceList = devices.where((element) {
      return (element.name ?? "").toLowerCase().contains("total");
    }).toList();

    //根据名字排序
    totalDeviceList.sort((a, b) {
      return (a.name ?? "").toLowerCase().compareTo((b.name ?? "").toLowerCase());
    });
    //分离出名字不含有total的设备
    List<DeviceModel> noTotalDeviceList = devices.where((element) {
      return !((element.name ?? "").toLowerCase().contains("total"));
    }).toList();

    //根据名字排序
    noTotalDeviceList.sort((a, b) {
      return (a.name ?? "").toLowerCase().compareTo((b.name ?? "").toLowerCase());
    });

    //合并
    devices = totalDeviceList + noTotalDeviceList;
    return devices;
  } catch (e) {
    print(e);
  }
  return devices;
}
