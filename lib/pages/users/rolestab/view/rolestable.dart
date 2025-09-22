// ignore_for_file: unused_result

import 'dart:async';

import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:smart_factory/pages/users/notifier/roleuimanager.dart';
import '../../../../common/styles/theme_state_notifier.dart';
import '../../../../common/values/index.dart';
import '../../../../core/dependencies/dependencies.dart';
import '../../../../core/notifiers/floatbuttonmanager.dart';
import '../../../../models/user_role_model.dart';
import '../../notifier/users_notifier.dart';
import 'roleaddactionview.dart';

class RolesTable extends ConsumerStatefulWidget {
  const RolesTable({super.key});
  @override
  ConsumerState<RolesTable> createState() => _RolesTableState();
}

class _RolesTableState extends ConsumerState<RolesTable> {
  @override
  void initState() {
    super.initState();
    // ref.invalidate(getUsersProvider); //刷新不关心新值
    ref.refresh(getRolesProvider); //刷新并read新值
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
        ref.refresh(getRolesProvider);
      }
    });
    ref.listen<AddRoleResponseEntity?>(addRoleProvider, (previous, next) async {
      if (next?.code == 100001) {
        ref.refresh(getRolesProvider);
      }
    });

    return ref.watch(getRolesProvider).when(data: (data) {
      return ref.watch(roleUIManagerProvider).length > 0
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
                // ref.read(itemsRoleModelFilteredProvider.notifier).selectAll(val ?? false),
              },
              columns: [
                DataColumn2(
                  label: customLabel("Name"),
                  size: ColumnSize.S,
                ),
                DataColumn2(
                  label: customLabel("Boards"),
                  size: ColumnSize.S,
                ),
                DataColumn2(
                  label: customLabel("Devices"),
                  size: ColumnSize.S,
                ),
                DataColumn2(
                  label: customLabel("Users"),
                  size: ColumnSize.S,
                ),
                DataColumn2(
                  label: customLabel("Roles"),
                  size: ColumnSize.S,
                ),
                DataColumn2(
                  label: customLabel("Reports"),
                  size: ColumnSize.S,
                ),
                DataColumn2(
                  label: customLabel("Audit"),
                  size: ColumnSize.S,
                ),
              ],
              empty: Center(
                  child: Container(
                      padding: const EdgeInsets.all(20), color: Colors.grey[200], child: const Text('No data'))),
              rows: List<DataRow>.generate(
                ref.watch(valueSearchInRoleProvider).length > 0
                    ? ref
                        .watch(roleUIManagerProvider.notifier)
                        .getSearchRoles(ref.watch(valueSearchInRoleProvider))
                        .length
                    : ref.watch(roleUIManagerProvider).length,
                (index) => rolesDataRow(
                    (ref.watch(valueSearchInRoleProvider).length > 0
                        ? ref.watch(roleUIManagerProvider.notifier).getSearchRoles(ref.watch(valueSearchInRoleProvider))
                        : ref.watch(roleUIManagerProvider))[index],
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

  DataRow2 rolesDataRow(RoleModel roleModel, int index, WidgetRef ref) {
    return DataRow2.byIndex(
      index: index,
      selected: roleModel.selected ?? false,
      onSelectChanged: (value) {
        if (roleModel.selected != value) {
          roleModel.selected = value;
          ref.read(roleUIManagerProvider.notifier).updateRole(roleModel);
          //单选  多选注释
          if (roleModel.selected ?? false) {
            for (var item in ref.read(roleUIManagerProvider)) {
              if (item.id != roleModel.id) {
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
            return AddRoleWidgetView(type: "EDIT", roleModel: roleModel);
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
        DataCell(customRoleValueText(roleModel.name ?? "")),
        DataCell(customValueText((roleModel.permissions != null && roleModel.permissions!.length > 0)
            ? roleModel.permissions?.firstWhere(
                (element) => element.module == "Boards",
                orElse: () {
                  return Permission(name: "no access");
                },
              ).name
            : "")),
        DataCell(customValueText((roleModel.permissions != null && roleModel.permissions!.length > 0)
            ? roleModel.permissions?.firstWhere(
                (element) => element.module == "Devices",
                orElse: () {
                  return Permission(name: "no access");
                },
              ).name
            : "")),
        DataCell(customValueText((roleModel.permissions != null && roleModel.permissions!.length > 0)
            ? roleModel.permissions?.firstWhere(
                (element) => element.module == "Users",
                orElse: () {
                  return Permission(name: "no access");
                },
              ).name
            : "")),
        DataCell(customValueText((roleModel.permissions != null && roleModel.permissions!.length > 0)
            ? roleModel.permissions?.firstWhere(
                (element) => element.module == "Roles",
                orElse: () {
                  return Permission(name: "no access");
                },
              ).name
            : "")),
        DataCell(customValueText((roleModel.permissions != null && roleModel.permissions!.length > 0)
            ? roleModel.permissions?.firstWhere(
                (element) => element.module == "Reports",
                orElse: () {
                  return Permission(name: "no access");
                },
              ).name
            : "")),
        DataCell(customValueText((roleModel.permissions != null && roleModel.permissions!.length > 0)
            ? roleModel.permissions?.firstWhere(
                (element) => element.module == "Audit",
                orElse: () {
                  return Permission(name: "no access");
                },
              ).name
            : "")),
      ],
    );
  }

  customRoleValueText(String? tabValue) {
    return Text(
      tabValue ?? "",
      style: TextStyle(color: ref.watch(colorProvider)['text'], fontSize: Constant.textSP_16),
    );
  }

  customValueText(String? tabValue) {
    return Row(
      children: [
        Visibility(
          child: Icon(
            tabValue == "write"
                ? Icons.edit
                : tabValue == "read"
                    ? Icons.visibility
                    : tabValue == "no access"
                        ? Icons.close
                        : Icons.close,
            color: ref.watch(colorProvider)['white'],
          ),
          visible: tabValue == "write" || tabValue == "read" || tabValue == "no access",
        ),
        SizedBox(width: 10.w),
        Text(
          tabValue == "write"
              ? "editable"
              : tabValue == "read"
                  ? "view only"
                  : "no access",
          style: TextStyle(color: ref.watch(colorProvider)['text'], fontSize: Constant.textSP_16),
        )
      ],
    );
  }

  Widget customLabel(String label) {
    return Text(label, style: TextStyle(color: ref.watch(colorProvider)['white'], fontSize: Constant.textSP_20));
  }
}
