import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../common/styles/theme.dart';
import '../../../../common/values/index.dart';
import '../../../../models/user_role_model.dart';
import '../../notifier/users_notifier.dart';

class PermissionTable extends ConsumerWidget {
  const PermissionTable({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(getPermissionsProvider).when(
      data: (data) {
        return data.length > 0
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
                  verticalInside: BorderSide(color: Colors.grey[300]!, width: 1.w),
                  // horizontalInside: BorderSide(color: Colors.grey, width: 1.h),
                ),
                dividerThickness: 1.w, // this one will be ignored if [border] is set above
                bottomMargin: 10.h,
                sortArrowIcon: Icons.keyboard_arrow_up, // custom arrow
                sortArrowAnimationDuration: const Duration(milliseconds: 500), // custom animation duration

                columns: [
                  DataColumn2(
                    label: customLabel("Permissions", ref),
                    size: ColumnSize.S,
                  ),
                  DataColumn2(
                    label: customLabel("Read", ref),
                    size: ColumnSize.S,
                  ),
                  DataColumn2(
                    label: customLabel("Write", ref),
                    size: ColumnSize.S,
                  ),
                ],
                empty: Center(
                    child: Container(
                        padding: const EdgeInsets.all(20), color: Colors.grey[200], child: const Text('No data'))),
                rows: List<DataRow>.generate(
                  ref.watch(itemsPermissionSelectProvider).length,
                  (index) => rolesDataRow(ref.watch(itemsPermissionSelectProvider)[index], index, ref),
                ),
              )
            : Container();
      },
      error: (Object error, StackTrace stackTrace) {
        return Container();
      },
      loading: () {
        return Container();
      },
    );
  }

  DataRow2 rolesDataRow(PermissionSelect permissionSelect, int index, WidgetRef ref) {
    return DataRow2.byIndex(
      index: index,
      onTap: () => {},
      onDoubleTap: () => {},
      onLongPress: () => {},
      onSecondaryTap: () => {},
      onSecondaryTapDown: (d) => {},
      specificRowHeight: 60.h,
      cells: [
        DataCell(customValueText(permissionSelect.module ?? "", ref)),
        DataCell(customValueCheckbox(permissionSelect, ref, "read")),
        DataCell(permissionSelect.module != "Reports" && permissionSelect.module != "Audit"
            ? customValueCheckbox(permissionSelect, ref, "write")
            : Container()),
      ],
    );
  }

  customValueText(String tabValue, WidgetRef ref) {
    return Center(
      child: Container(
        child: Text(
          tabValue,
          style: TextStyle(color: ref.watch(colorProvider)['text'], fontSize: Constant.textSP_16),
        ),
      ),
    );
  }

  customValueCheckbox(PermissionSelect permissionSelect, WidgetRef ref, String type) {
    return Center(
      child: Checkbox(
        activeColor: ref.watch(colorProvider)['accentColor'],
        side: BorderSide(
          color: ref.watch(colorProvider)['white']!,
        ),
        value: type == "read" ? permissionSelect.read : permissionSelect.write,
        onChanged: (bool? value) {
          if (type == "read") {
            if (value ?? false) {
              permissionSelect.read = true;
              if (permissionSelect.write == true) {
                permissionSelect.write = false;
              }
            } else {
              permissionSelect.read = false;
            }

            ref.read(itemsPermissionSelectProvider.notifier).updatePermissionSelect(permissionSelect);
          } else {
            if (value ?? false) {
              permissionSelect.write = true;
              if (permissionSelect.read == true) {
                permissionSelect.read = false;
              }
            } else {
              permissionSelect.write = false;
            }
            ref.read(itemsPermissionSelectProvider.notifier).updatePermissionSelect(permissionSelect);
          }
        },
      ),
    );
  }

  Widget customLabel(String label, WidgetRef ref) {
    return Center(
        child: Text(label, style: TextStyle(color: ref.watch(colorProvider)['text'], fontSize: Constant.textSP_20)));
  }
}
