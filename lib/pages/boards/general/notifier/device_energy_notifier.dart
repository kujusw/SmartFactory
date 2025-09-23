import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../http/device.dart';
import '../../../../models/device_model.dart';
import '../../../../models/general_device_info_model.dart';

part 'device_energy_notifier.g.dart';

@riverpod
class DeviceEnergy extends _$DeviceEnergy {
  @override
  Future<DeviceEnergyResponseEntity> build(String deviceId, String token) async {
    // 初始请求
    return await DeviceAPI.getDeviceModelEnergy(
      path: "api/v1/energy/$deviceId",
      token: token,
    );
  }

  Future<void> refresh(String deviceId, String token) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      return await DeviceAPI.getDeviceModelEnergy(
        path: "api/v1/energy/$deviceId",
        token: token,
      );
    });
  }
}

@riverpod
List<GeneralDeviceInfoModel> generalDeviceEnergy(
  Ref ref,
  DeviceModel selectedDevice,
  String token,
) {
  final asyncDeviceEnergy = ref.watch(deviceEnergyProvider(selectedDevice.id ?? "", token));

  return asyncDeviceEnergy.when(
    data: (deviceEnergyResponseEntity) {
      final List<GeneralDeviceInfoModel> list = [];
      if (deviceEnergyResponseEntity.code == 100001) {
        list.addAll([
          GeneralDeviceInfoModel(
            id: selectedDevice.id,
            name: selectedDevice.deviceName ?? "",
            type: "Current",
            value: (deviceEnergyResponseEntity.data?.current ?? 0.0).toStringAsFixed(2) + "A",
            time: deviceEnergyResponseEntity.data?.timestamp,
          ),
          GeneralDeviceInfoModel(
            id: selectedDevice.id,
            name: selectedDevice.deviceName ?? "",
            type: "Energy",
            value: (deviceEnergyResponseEntity.data?.energy ?? 0.0).toStringAsFixed(2) + "kWh",
            time: deviceEnergyResponseEntity.data?.timestamp,
          ),
          GeneralDeviceInfoModel(
            id: selectedDevice.id,
            name: selectedDevice.deviceName ?? "",
            type: "Power",
            value: (deviceEnergyResponseEntity.data?.power ?? 0.0).toStringAsFixed(2) + "kW",
            time: deviceEnergyResponseEntity.data?.timestamp,
          ),
          GeneralDeviceInfoModel(
            id: selectedDevice.id,
            name: selectedDevice.deviceName ?? "",
            type: "Power Factor",
            value: (deviceEnergyResponseEntity.data?.powerFactor ?? 0.0).toStringAsFixed(2),
            time: deviceEnergyResponseEntity.data?.timestamp,
          ),
          GeneralDeviceInfoModel(
            id: selectedDevice.id,
            name: selectedDevice.deviceName ?? "",
            type: "Total Current",
            value: (deviceEnergyResponseEntity.data?.totalCurrent ?? 0.0).toStringAsFixed(2) + "A",
            time: deviceEnergyResponseEntity.data?.timestamp,
          ),
          GeneralDeviceInfoModel(
            id: selectedDevice.id,
            name: selectedDevice.deviceName ?? "",
            type: "Total Power",
            value: (deviceEnergyResponseEntity.data?.totalPower ?? 0.0).toStringAsFixed(2) + "kW",
            time: deviceEnergyResponseEntity.data?.timestamp,
          ),
          GeneralDeviceInfoModel(
            id: selectedDevice.id,
            name: selectedDevice.deviceName ?? "",
            type: "Voltage",
            value: (deviceEnergyResponseEntity.data?.voltage ?? 0.0).toStringAsFixed(2) + "V",
            time: deviceEnergyResponseEntity.data?.timestamp,
          ),
        ]);

        for (var warning in deviceEnergyResponseEntity.data?.warnings ?? []) {
          list.add(GeneralDeviceInfoModel(
            id: selectedDevice.id ?? "",
            name: selectedDevice.deviceName ?? "",
            type: warning.type,
            value: warning.message,
            time: deviceEnergyResponseEntity.data?.timestamp,
          ));
        }
      }
      return list;
    },
    error: (_, __) => [],
    loading: () => [],
  );
}
