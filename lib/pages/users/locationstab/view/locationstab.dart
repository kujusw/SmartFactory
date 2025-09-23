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
import '../../../../core/notifiers/floatbuttonmanager.dart';
import '../../../../models/locationresponseentity.dart';
import '../../notifier/users_notifier.dart';
import 'locationaddactionview.dart';

class LocationsTable extends ConsumerStatefulWidget {
  const LocationsTable({super.key});
  @override
  ConsumerState<LocationsTable> createState() => _LocationsTableState();
}

class _LocationsTableState extends ConsumerState<LocationsTable> {
  @override
  void initState() {
    super.initState();
    // ref.invalidate(getUsersProvider); //刷新不关心新值
    ref.refresh(getLocationsProvider); //刷新并read新值
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
      if (next == 3) {
        ref.refresh(getLocationsProvider);
      }
    });

    return ref.watch(getLocationsProvider).when(data: (data) {
      return ref.watch(locationUIManagerProvider).length > 0
          ? DataTable2(
              // Forcing all scrollbars to be visible, alternatively themes can be used (see above)
              // headingRowColor: MaterialStateColor.resolveWith((states) => Colors.green[300]!),
              headingTextStyle: TextStyle(color: ref.watch(colorProvider)['white']),
              headingCheckboxTheme:
                  CheckboxThemeData(side: BorderSide(color: ref.watch(colorProvider)['white']!, width: 1.0)),
              datarowCheckboxTheme:
                  CheckboxThemeData(side: BorderSide(color: ref.watch(colorProvider)['white']!, width: 1.0)),
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
                //暂时不支持全选
                unawaited(SmartDialog.showToast("Not Supported Select All")),
                // ref.read(itemsLocationModelFilteredProvider.notifier).selectAll(val ?? false),
              },
              columns: [
                DataColumn2(
                  label: customLabel("Name"),
                  size: ColumnSize.S,
                ),
                DataColumn2(
                  label: customLabel("Building"),
                  size: ColumnSize.S,
                ),
                DataColumn2(
                  label: customLabel("Tenant"),
                  size: ColumnSize.S,
                ),
                DataColumn2(
                  label: customLabel("Area"),
                  size: ColumnSize.S,
                ),
              ],
              empty: Center(
                  child: Container(
                      padding: const EdgeInsets.all(20), color: Colors.grey[200], child: const Text('No data'))),
              rows: List<DataRow>.generate(
                ref.watch(valueSearchInLocationProvider).length > 0
                    ? ref
                        .watch(locationUIManagerProvider.notifier)
                        .getSearchLocations(ref.watch(valueSearchInLocationProvider))
                        .length
                    : ref.watch(locationUIManagerProvider).length,
                (index) => locationsDataRow(
                    (ref.watch(valueSearchInLocationProvider).length > 0
                        ? ref
                            .watch(locationUIManagerProvider.notifier)
                            .getSearchLocations(ref.watch(valueSearchInLocationProvider))
                        : ref.watch(locationUIManagerProvider))[index],
                    index,
                    ref),
              ),
            )
          : Container();
    }, error: (Object error, StackTrace stackTrace) {
      return Container();
    }, loading: () {
      return Container();
    });
  }

  DataRow2 locationsDataRow(LocationModel locationModel, int index, WidgetRef ref) {
    return DataRow2.byIndex(
      index: index,
      selected: locationModel.selected ?? false,
      onSelectChanged: (value) {
        if (locationModel.selected != value) {
          locationModel.selected = value;
          ref.read(locationUIManagerProvider.notifier).updateLocation(locationModel);

          //单选  多选注释
          if (locationModel.selected ?? false) {
            for (var item in ref.read(locationUIManagerProvider)) {
              if (item.id != locationModel.id) {
                item.selected = false;
              }
            }
          }
        }
      },
      onTap: () => {
        ref.read(floatButtonProvider.notifier).change("UsersViewAdd"),
        unawaited(SmartDialog.show(
          usePenetrate: false,
          alignment: Alignment.centerRight,
          clickMaskDismiss: true,
          keepSingle: true,
          tag: "UsersViewAddActionButton",
          builder: (_) {
            return AddLocationWidgetView(type: "EDIT", locationModel: locationModel);
          },
          onDismiss: () {
            ref.read(floatButtonProvider.notifier).change("");
          },
        ))
      },
      onDoubleTap: () => {},
      onLongPress: () => {},
      onSecondaryTap: () => {},
      onSecondaryTapDown: (d) => {},
      specificRowHeight: 60.h,
      cells: [
        DataCell(tabText(locationModel.name ?? "")),
        DataCell(tabText(locationModel.building ?? "N/A")),
        DataCell(tabText(locationModel.tenant ?? "N/A")),
        DataCell(tabText((locationModel.area ?? 0) == 0 ? "N/A" : locationModel.area.toString())),
      ],
    );
  }

  Text tabText(String tabValue) =>
      Text(tabValue, style: TextStyle(color: ref.watch(colorProvider)['text'], fontSize: Constant.textSP_16));

  Widget customLabel(String label) {
    return Text(label, style: TextStyle(color: ref.watch(colorProvider)['text'], fontSize: Constant.textSP_20));
  }
}
