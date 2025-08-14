// ignore_for_file: unused_result

import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../common/utils/logger_manager.dart';
import '../../../common/styles/theme.dart';
import '../../../common/utils/time_utils.dart';
import '../../../common/values/index.dart';
import '../../../core/dependencies/dependencies.dart';
import '../../../models/audit_manager_model.dart';
import '../notifier/audit_notifier.dart';

class AuditTable extends ConsumerStatefulWidget {
  const AuditTable({super.key});
  @override
  ConsumerState<AuditTable> createState() => _AuditTableState();
}

class _AuditTableState extends ConsumerState<AuditTable> {
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
      if (next == 4) {
        ref.refresh(getAuditsProvider);
      }
    });
    ref.listen<int?>(getAuditsPageProvider, (previous, next) async {
      ref.refresh(getAuditsProvider);
    });

    return ref.watch(getAuditsProvider).when(
        data: (data) {
          return DataTable2(
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

            columns: [
              DataColumn2(
                label: customLabel("Date"),
                size: ColumnSize.S,
              ),
              DataColumn2(
                label: customLabel("User"),
                size: ColumnSize.S,
              ),
              DataColumn2(
                label: customLabel("Email"),
                size: ColumnSize.S,
              ),
              DataColumn2(
                label: customLabel("Action"),
                size: ColumnSize.S,
              ),
              DataColumn2(
                label: customLabel("Result"),
                size: ColumnSize.S,
              ),
            ],
            empty: Center(
                child: Container(
                    padding: const EdgeInsets.all(20), color: Colors.grey[200], child: const Text('No data'))),
            rows: List<DataRow>.generate(
              data.length,
              (index) => auditsDataRow(data[index], index, ref),
            ),
          );
        },
        loading: () => Container(
              padding: EdgeInsets.only(left: 20.w, right: 20.w),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
        error: (error, stack) {
          LoggerManager().e("AuditTable error: $error");
          return Container();
        });
  }

  DataRow2 auditsDataRow(Audit auditManagerModel, int index, WidgetRef ref) {
    return DataRow2.byIndex(
      index: index,
      onTap: () => {},
      onDoubleTap: () => {},
      onLongPress: () => {},
      onSecondaryTap: () => {},
      onSecondaryTapDown: (d) => {},
      specificRowHeight: 60.h,
      cells: [
        DataCell(customValueText(getTimeMMMDDYHHMMSSA(auditManagerModel.createdAt ?? 0) ?? "")),
        DataCell(customValueText(auditManagerModel.username ?? "")),
        DataCell(customValueText(auditManagerModel.email ?? "")),
        DataCell(customValueText(auditManagerModel.action ?? "")),
        DataCell(customValueText(auditManagerModel.success == true ? "Success" : "Failed")),
      ],
    );
  }

  customValueText(String tabValue) {
    return Text(
      tabValue,
      style: TextStyle(color: ref.watch(colorProvider)['text'], fontSize: Constant.textSP_16),
    );
  }

  resultText(String tabValue) {
    return Icon(
      tabValue == "success" ? Icons.verified : Icons.dangerous,
      color: ref.watch(colorProvider)['white'],
    );
  }

  Widget customLabel(String label) {
    return Text(label, style: TextStyle(color: ref.watch(colorProvider)['text'], fontSize: Constant.textSP_20));
  }
}
