import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../common/utils/logger_manager.dart';
import '../../../../../../common/utils/screenutil.dart';
import '../../../../../../http/device.dart';
import '../../../../../../models/device_model.dart';
import '../../../../../../models/general_device_info_model.dart';
import '../../../../../login/notifier/login_notifier.dart';
import '../../../notifier/device_notifier.dart';
import 'generalviewdeviceitem.dart';

class DeviceOverView extends ConsumerWidget {
  DeviceOverView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // The solution is to, like with BuildContext, check mounted before using ref:
    // LoggerManager().d("DeviceOverView: build ${ref.read(itemsGeneralDeviceProvider)}");
    if (!context.mounted) return Container();
    ref.listen<DeviceModel?>(currentDeviceProvider, (previous, next) async {
      DeviceEnergyResponseEntity deviceEnergyResponseEntity = await DeviceAPI.getDeviceModelEnergy(
          path: "api/v1/energy/${next?.id}", token: ref.read(loginProvider).data?.token);
      LoggerManager().d("deviceEnergyResponseEntity: ${deviceEnergyResponseEntity.toString()}");
      List<GeneralDeviceInfoModel> generalDeviceInfoModel = [];
      if (deviceEnergyResponseEntity.code == 100001) {
        generalDeviceInfoModel.add(GeneralDeviceInfoModel(
          id: next?.id,
          name: next?.deviceName ?? "",
          type: "Current",
          value: (deviceEnergyResponseEntity.data?.current ?? 0.0).toStringAsFixed(2) + "A",
          time: deviceEnergyResponseEntity.data?.timestamp,
        ));
        generalDeviceInfoModel.add(GeneralDeviceInfoModel(
          id: next?.id,
          name: next?.deviceName ?? "",
          type: "Energy",
          value: (deviceEnergyResponseEntity.data?.energy ?? 0.0).toStringAsFixed(2) + "kWh",
          time: deviceEnergyResponseEntity.data?.timestamp,
        ));
        generalDeviceInfoModel.add(GeneralDeviceInfoModel(
          id: next?.id,
          name: next?.deviceName ?? "",
          type: "Power",
          value: (deviceEnergyResponseEntity.data?.power ?? 0.0).toStringAsFixed(2) + "kW",
          time: deviceEnergyResponseEntity.data?.timestamp,
        ));
        generalDeviceInfoModel.add(GeneralDeviceInfoModel(
          id: next?.id,
          name: next?.deviceName ?? "",
          type: "Power Factor",
          value: (deviceEnergyResponseEntity.data?.powerFactor ?? 0.0).toStringAsFixed(2),
          time: deviceEnergyResponseEntity.data?.timestamp,
        ));

        generalDeviceInfoModel.add(GeneralDeviceInfoModel(
          id: next?.id,
          name: next?.deviceName ?? "",
          type: "Total Current",
          value: (deviceEnergyResponseEntity.data?.totalCurrent ?? 0.0).toStringAsFixed(2) + "A",
          time: deviceEnergyResponseEntity.data?.timestamp,
        ));
        generalDeviceInfoModel.add(GeneralDeviceInfoModel(
          id: next?.id,
          name: next?.deviceName ?? "",
          type: "Total Power",
          value: (deviceEnergyResponseEntity.data?.totalPower ?? 0.0).toStringAsFixed(2) + "kW",
          time: deviceEnergyResponseEntity.data?.timestamp,
        ));

        generalDeviceInfoModel.add(GeneralDeviceInfoModel(
          id: next?.id,
          name: next?.deviceName ?? "",
          type: "Voltage",
          value: (deviceEnergyResponseEntity.data?.voltage ?? 0.0).toStringAsFixed(2) + "V",
          time: deviceEnergyResponseEntity.data?.timestamp,
        ));

        for (var warning in deviceEnergyResponseEntity.data?.warnings ?? []) {
          generalDeviceInfoModel.add(GeneralDeviceInfoModel(
            id: next?.id,
            name: next?.deviceName ?? "",
            type: warning.type,
            value: warning.message,
            time: deviceEnergyResponseEntity.data?.timestamp,
          ));
        }
      }
      ref.read(itemsGeneralDeviceProvider.notifier).setDevices(generalDeviceInfoModel);
    });

    return Container(
      height: 680.h,
      child: ScrollConfiguration(
        behavior:
            const MaterialScrollBehavior().copyWith(scrollbars: false, dragDevices: KJScreenUtil.kTouchLikeDeviceTypes),
        child: CustomScrollView(
          slivers: [
            SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // 每行三个项目
                mainAxisSpacing: 10.0, // 主轴方向的间距
                crossAxisSpacing: 10.0, // 交叉轴方向的间距
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  final item = ref.watch(itemsGeneralDeviceProvider)[index];
                  return GeneralViewDevicesItem(item: item);
                },
                childCount: ref.watch(itemsGeneralDeviceProvider).length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
