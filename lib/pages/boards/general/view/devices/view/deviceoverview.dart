import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../common/utils/logger_manager.dart';
import '../../../../../../common/utils/screenutil.dart';
import '../../../../../../common/utils/time_utils.dart';
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
          path: "v1/energy/${next?.id}", token: ref.read(loginProvider).data?.token);
      LoggerManager().d("deviceEnergyResponseEntity: ${deviceEnergyResponseEntity.toString()}");
      ref
          .read(itemsGeneralDeviceProvider.notifier)
          .updateGeneralDeviceName(GeneralDeviceInfoModel(id: next?.id ?? "", name: next?.name ?? ""));
      List<GeneralDeviceInfoModel> generalDeviceInfoModel = ref.read(itemsGeneralDeviceProvider);
      if (deviceEnergyResponseEntity.code == 100001) {
        for (var item in generalDeviceInfoModel) {
          if (item.id == deviceEnergyResponseEntity.data?.id && item.type == "Current") {
            item.value = (deviceEnergyResponseEntity.data?.current ?? 0.0).toStringAsFixed(2) + "A";
            item.time = getTimeMMMDDYHHMMSSA((deviceEnergyResponseEntity.data?.timestamp ?? 0)).toString();
          }
          if (item.id == deviceEnergyResponseEntity.data?.id && item.type == "Energy") {
            item.value = (deviceEnergyResponseEntity.data?.energy ?? 0.0).toStringAsFixed(2) + "kWh";
            item.time = getTimeMMMDDYHHMMSSA((deviceEnergyResponseEntity.data?.timestamp ?? 0)).toString();
          }
          if (item.id == deviceEnergyResponseEntity.data?.id && item.type == "Power") {
            item.value = (deviceEnergyResponseEntity.data?.power ?? 0.0).toStringAsFixed(2) + "kW";
            item.time = getTimeMMMDDYHHMMSSA((deviceEnergyResponseEntity.data?.timestamp ?? 0)).toString();
          }
          if (item.id == deviceEnergyResponseEntity.data?.id && item.type == "Status") {
            item.value = "Connected";
            item.time = getTimeMMMDDYHHMMSSA((deviceEnergyResponseEntity.data?.timestamp ?? 0)).toString();
          }
          if (item.id == deviceEnergyResponseEntity.data?.id && item.type == "Hourly Total Energy") {
            item.value = (deviceEnergyResponseEntity.data?.energyHourly ?? 0.0).toStringAsFixed(2) + "kWh";
            item.time = getTimeMMMDDYHHMMSSA((deviceEnergyResponseEntity.data?.energyHourlyTimestamp ?? 0)).toString();
          }
          if (item.id == deviceEnergyResponseEntity.data?.id && item.type == "Daily Total Energy") {
            item.value = (deviceEnergyResponseEntity.data?.energyDaily ?? 0.0).toStringAsFixed(2) + "kWh";
            item.time = getTimeMMMDDYHHMMSSA((deviceEnergyResponseEntity.data?.energyDailyTimestamp ?? 0)).toString();
          }
          if (item.id == deviceEnergyResponseEntity.data?.id && item.type == "Monthly Total Energy") {
            item.value = (deviceEnergyResponseEntity.data?.energyMonthly ?? 0.0).toStringAsFixed(2) + "kWh";
            item.time = getTimeMMMDDYHHMMSSA((deviceEnergyResponseEntity.data?.energyMonthlyTimestamp ?? 0)).toString();
          }
          if (item.id == deviceEnergyResponseEntity.data?.id && item.type == "Weekly Energy Diff") {
            item.value = (deviceEnergyResponseEntity.data?.energyWeeklyDiff ?? 0.0).toStringAsFixed(2) + "kWh";
            item.time = getTimeMMMDDYHHMMSSA((deviceEnergyResponseEntity.data?.energyWeeklyTimestamp ?? 0)).toString();
          }
          if (item.id == deviceEnergyResponseEntity.data?.id && item.type == "Weekly Total Energy") {
            item.value = (deviceEnergyResponseEntity.data?.energyWeekly ?? 0.0).toStringAsFixed(2) + "kWh";
            item.time = getTimeMMMDDYHHMMSSA((deviceEnergyResponseEntity.data?.energyWeeklyTimestamp ?? 0)).toString();
          }
        }
      } else {
        for (var item in generalDeviceInfoModel) {
          if (item.type == "Current") {
            item.value = "N/A";
            item.time = "N/A";
          }
          if (item.type == "Energy") {
            item.value = "N/A";
            item.time = "N/A";
          }
          if (item.type == "Power") {
            item.value = "N/A";
            item.time = "N/A";
          }
          if (item.type == "Status") {
            item.value = "N/A";
            item.time = "N/A";
          }
          if (item.type == "Hourly Total Energy") {
            item.value = "N/A";
            item.time = "N/A";
          }
          if (item.type == "Daily Total Energy") {
            item.value = "N/A";
            item.time = "N/A";
          }
          if (item.type == "Monthly Total Energy") {
            item.value = "N/A";
            item.time = "N/A";
          }
          if (item.type == "Weekly Energy Diff") {
            item.value = "N/A";
            item.time = "N/A";
          }
          if (item.type == "Weekly Total Energy") {
            item.value = "N/A";
            item.time = "N/A";
          }
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
                  return GeneralViewDevicesItem(index: index, type: "ITEMSGENERALDEVICEPROVIDER");
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
