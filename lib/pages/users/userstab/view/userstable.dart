// ignore_for_file: unused_result

import 'dart:async';

import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:smart_factory/pages/users/notifier/useruimanager.dart';
import '../../../../common/styles/theme_state_notifier.dart';
import '../../../../common/utils/time_utils.dart';
import '../../../../common/values/index.dart';
import '../../../../core/dependencies/dependencies.dart';
import '../../../../core/notifiers/floatbuttonmanager.dart';
import '../../../../models/user_manager_model.dart';
import '../../notifier/users_notifier.dart';
import 'useraddactionview.dart';

class UsersTable extends ConsumerStatefulWidget {
  const UsersTable({super.key});
  @override
  ConsumerState<UsersTable> createState() => _UsersTableState();
}

class _UsersTableState extends ConsumerState<UsersTable> {
  @override
  void initState() {
    super.initState();
    // ref.invalidate(getUsersProvider); //刷新不关心新值
    ref.refresh(getUsersProvider); //刷新并read新值
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
        ref.refresh(getUsersProvider);
      }
    });
    ref.listen<AddUserResponseEntity?>(addUserProvider, (previous, next) async {
      if (next?.code == 100001) {
        ref.refresh(getUsersProvider);
      }
    });
    return ref.watch(getUsersProvider).when(
      data: (data) {
        return ref.watch(itemsUserModelFilteredProvider).length > 0
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
                  // ref.read(itemsUserModelFilteredProvider.notifier).selectAll(val ?? false),
                },
                columns: [
                  DataColumn2(
                    label: customLabel("Name", ref),
                    size: ColumnSize.S,
                  ),
                  DataColumn2(
                    label: customLabel("Email", ref),
                    size: ColumnSize.S,
                  ),
                  DataColumn2(
                    label: customLabel("Status", ref),
                    size: ColumnSize.S,
                  ),
                  DataColumn2(
                    label: customLabel("Date", ref),
                    size: ColumnSize.S,
                  ),
                  DataColumn2(
                    label: customLabel("Last Login", ref),
                    size: ColumnSize.S,
                  ),
                ],
                empty: Center(
                    child: Container(
                        padding: const EdgeInsets.all(20), color: Colors.grey[200], child: const Text('No data'))),
                rows: List<DataRow>.generate(
                  ref.watch(valueSearchInUserProvider).length > 0
                      ? ref
                          .watch(userUIManagerProvider.notifier)
                          .getSearchUsers(ref.watch(valueSearchInUserProvider))
                          .length
                      : ref.watch(itemsUserModelFilteredProvider).length,
                  (index) => usersDataRow(
                      (ref.watch(valueSearchInUserProvider).length > 0
                          ? ref
                              .watch(userUIManagerProvider.notifier)
                              .getSearchUsers(ref.watch(valueSearchInUserProvider))
                          : ref.watch(itemsUserModelFilteredProvider))[index],
                      index,
                      ref),
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

  DataRow2 usersDataRow(UserModel userModel, int index, WidgetRef ref) {
    return DataRow2.byIndex(
      index: index,
      selected: userModel.selected ?? false,
      onSelectChanged: (value) {
        if (userModel.selected != value) {
          userModel.selected = value;
          ref.read(userUIManagerProvider.notifier).updateUser(userModel);
          //单选  多选注释
          if (userModel.selected ?? false) {
            for (var item in ref.read(itemsUserModelFilteredProvider)) {
              if (item.id != userModel.id) {
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
            return AddUserWidgetView(type: "EDIT", userModel: userModel);
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
        DataCell(tabText(userModel.username ?? "", ref)),
        DataCell(tabText(userModel.email ?? "", ref)),
        DataCell(tabText(userModel.isActive == true ? "Active" : "Inactive", ref)),
        DataCell(tabText(getTimeMMMDDYHHMMSSA(userModel.createdAt ?? 0), ref)),
        DataCell(tabText(getTimeMMMDDYHHMMSSA(userModel.lastLogin ?? 0), ref)),
      ],
    );
  }

  Text tabText(String tabValue, WidgetRef ref) =>
      Text(tabValue, style: TextStyle(color: ref.watch(colorProvider)['text'], fontSize: Constant.textSP_16));

  Widget customLabel(String label, WidgetRef ref) {
    return Text(label, style: TextStyle(color: ref.watch(colorProvider)['text'], fontSize: Constant.textSP_20));
  }
}
