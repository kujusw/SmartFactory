// ignore_for_file: unused_result

import 'dart:async';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:smart_factory/pages/users/notifier/locationuimanager.dart';
import '../../../../common/styles/theme_state_notifier.dart';
import '../../../../common/values/index.dart';
import '../../../../core/dependencies/dependencies.dart';
import '../../../../core/notifiers/device_state_notifier.dart';
import '../../../../models/device_model.dart';
import '../../../boards/general/notifier/device_notifier.dart';
import '../../notifier/things_notifier.dart';
import '../../view/thingsviewdevicedetailview.dart';

class ThingsTable extends ConsumerStatefulWidget {
  const ThingsTable({super.key});
  @override
  ConsumerState<ThingsTable> createState() => _ThingsTableState();
}

class _ThingsTableState extends ConsumerState<ThingsTable> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!context.mounted) return Container();
    ref.listen<int?>(indexHomeProvider, (previous, next) async {
      if (next == 1) {
        ref.refresh(devicesProvider);
      }
    });
    return DataTable2(
      // Forcing all scrollbars to be visible, alternatively themes can be used (see above)
      // headingRowColor: MaterialStateColor.resolveWith((states) => Colors.green[300]!),
      headingTextStyle: TextStyle(color: ref.watch(colorProvider)['white']),
      headingCheckboxTheme: CheckboxThemeData(side: BorderSide(color: ref.watch(colorProvider)['white']!, width: 1.0)),
      datarowCheckboxTheme: CheckboxThemeData(side: BorderSide(color: ref.watch(colorProvider)['white']!, width: 1.0)),
      checkboxAlignment: Alignment.center,
      isHorizontalScrollBarVisible: true,
      isVerticalScrollBarVisible: true,
      columnSpacing: 12,
      horizontalMargin: 12,
      border: TableBorder(
        top: BorderSide(color: Colors.grey[300]!),
        bottom: BorderSide(color: Colors.grey[300]!),
        left: BorderSide(color: Colors.grey[300]!),
        right: BorderSide(color: Colors.grey[300]!),
        // verticalInside: BorderSide(color: Colors.grey[300]!),
        // horizontalInside: const BorderSide(color: Colors.grey, width: 1),
      ),
      // dividerThickness: 2.w, // this one will be ignored if [border] is set above
      bottomMargin: 10.h,
      sortArrowIcon: Icons.keyboard_arrow_up, // custom arrow
      sortArrowAnimationDuration: const Duration(milliseconds: 500), // custom animation duration
      onSelectAll: (val) => {
        // ref.read(itemsDeviceModelProvider.notifier).selectAllDevice(val),
        //暂时不支持全选
        unawaited(SmartDialog.showToast("Not Supported Select All")),
      },
      columns: [
        DataColumn2(
          label: customLabel("SID", ref),
          size: ColumnSize.S,
        ),
        DataColumn2(
          label: customLabel("NAME", ref),
          size: ColumnSize.S,
        ),
        DataColumn2(
          label: customLabel("LOCATION", ref),
          size: ColumnSize.S,
        ),
        DataColumn2(
          label: customLabel("TYPE", ref),
          size: ColumnSize.S,
        ),
        DataColumn2(
          label: customLabel("ONLINE", ref),
          size: ColumnSize.S,
        ),
      ],
      empty: Center(
          child: Container(padding: const EdgeInsets.all(20), color: Colors.grey[200], child: const Text('No data'))),

      rows: List<DataRow>.generate(
        ref.watch(searchDevicesInThingsProvider).length,
        (index) => devicesDataRow(ref.watch(searchDevicesInThingsProvider)[index], index, ref, context),
      ),
    );
  }

  DataRow2 devicesDataRow(DeviceModel deviceModel, int index, WidgetRef ref, BuildContext context) {
    return DataRow2.byIndex(
      index: index,
      selected: deviceModel.selected ?? false,
      onSelectChanged: (value) {
        if (deviceModel.selected != value) {
          //现在只能选择虚拟设备进行删除
          if (deviceModel.deviceType == "virtual") {
            deviceModel.selected = value;
            ref.read(deviceManagerProvider.notifier).updateDevice(deviceModel);

            //单选  多选注释
            if (deviceModel.selected ?? false) {
              for (var item in ref.read(deviceManagerProvider)) {
                if (item.id != deviceModel.id) {
                  item.selected = false;
                }
              }
            }
          } else {
            unawaited(SmartDialog.showToast("Only Virtual Device Can Be Selected"));
          }
        }
      },
      onTap: () => {
        ref.read(selectedDeviceProvider.notifier).set(deviceModel),
        unawaited(
          SmartDialog.show(
            usePenetrate: false,
            alignment: Alignment.centerRight,
            clickMaskDismiss: true,
            keepSingle: true,
            tag: "ThingsViewDeviceDetail",
            builder: (_) => Navigator(
              // 包一层局部 Navigator
              onGenerateRoute: (_) => MaterialPageRoute(
                builder: (_) => Align(
                  alignment: Alignment.centerRight, // 这里手动设置
                  child: SizedBox(
                    width: 600.w,
                    height: 1080.h,
                    child: ThingsViewDeviceDetailView(
                      buildContext: context,
                      model: deviceModel,
                    ),
                  ),
                ),
              ),
            ),
            onDismiss: () {},
          ),
        ),
      },
      onDoubleTap: () => {},
      onLongPress: () => {},
      onSecondaryTap: () => {},
      onSecondaryTapDown: (d) => {},
      specificRowHeight: 60.h,
      cells: [
        DataCell(customValue(deviceModel.id ?? "0", ref)),
        DataCell(customValue(deviceModel.deviceName ?? "", ref)),
        DataCell(customValue(
            ref.read(locationUIManagerProvider.notifier).getLocationNameById(deviceModel.locationId ?? 0), ref)),
        DataCell(customValue(deviceModel.deviceType ?? "", ref)),
        DataCell(customValueOnline(deviceModel)),
      ],
    );
  }

  customValueOnline(DeviceModel deviceModel) {
    return Text(
      (deviceModel.deviceStatus == 1) ? "Online" : "Offline",
      style: TextStyle(
        color: (deviceModel.deviceStatus == 1) ? Colors.green : Colors.red,
        fontWeight: FontWeight.bold,
        fontSize: Constant.textSP_16,
      ),
    );
  }

  Widget customValue(String value, WidgetRef ref) {
    return Text(value, style: TextStyle(fontSize: Constant.textSP_16, color: ref.watch(colorProvider)['white']));
  }

  Widget customLabel(String label, WidgetRef ref) {
    return Text(label, style: TextStyle(fontSize: Constant.textSP_20, color: ref.watch(colorProvider)['white']));
  }
}
