// ignore_for_file: unused_result
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../common/styles/theme.dart';
import '../../../../common/utils/time_utils.dart';
import '../../../../common/values/index.dart';
import '../../../../core/dependencies/dependencies.dart';
import '../../../../models/report_model.dart';
import '../../notifier/reports_notifier.dart';

class ReportsTable extends ConsumerStatefulWidget {
  const ReportsTable({super.key});
  @override
  ConsumerState<ReportsTable> createState() => _ReportsTableState();
}

class _ReportsTableState extends ConsumerState<ReportsTable> {
  @override
  void initState() {
    super.initState();
    ref.refresh(getReportsProvider);
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
      if (next == 2) {
        ref.refresh(getReportsProvider);
      }
    });
    return ref.watch(getReportsProvider).when(
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
          onSelectAll: (val) => {
            setState(() {
              ref.read(itemsReportModelFilteredProvider.notifier).selectAll(val ?? false);
            })
            // unawaited(SmartDialog.showToast("Not Supported Select All")),
          },
          columns: [
            DataColumn2(
              label: customLabel("NAME", ref),
              size: ColumnSize.S,
            ),
            DataColumn2(
              label: customLabel("Create Date", ref),
              size: ColumnSize.S,
            ),
          ],
          empty: Center(
              child:
                  Container(padding: const EdgeInsets.all(20), color: Colors.grey[200], child: const Text('No data'))),
          rows: List<DataRow>.generate(
            ref.watch(vualeSearchProviderInReport).length > 0
                ? ref
                        .watch(itemsReportModelFilteredProvider.notifier)
                        .getSearchReports(ref.watch(vualeSearchProviderInReport))
                        .length ??
                    0
                : ref.watch(itemsReportModelFilteredProvider).length,
            (index) => reportsDataRow(
                (ref.watch(vualeSearchProviderInReport).length > 0
                    ? ref
                        .watch(itemsReportModelFilteredProvider.notifier)
                        .getSearchReports(ref.watch(vualeSearchProviderInReport))
                    : ref.watch(itemsReportModelFilteredProvider))[index],
                index,
                ref),
          ),
        );
      },
      loading: () {
        return const Center(child: CircularProgressIndicator());
      },
      error: (error, stack) {
        return Center(child: Text('Error: $error'));
      },
    );
  }

  DataRow2 reportsDataRow(ReportModel reportModel, int index, WidgetRef ref) {
    return DataRow2.byIndex(
      index: index,
      selected: reportModel.selected ?? false,
      onSelectChanged: (value) {
        if (reportModel.selected != value) {
          setState(() {
            reportModel.selected = value;
          });
          ref.read(itemsReportModelFilteredProvider.notifier).updateReport(reportModel);
        }
        //单选  多选注释
        // if (reportModel.selected ?? false) {
        //   for (var item in ref.read(itemsReportModelFilteredProvider)) {
        //     if (item.id != reportModel.id) {
        //       item.selected = false;
        //     }
        //   }
        // }
      },
      onTap: () => {},
      onDoubleTap: () => {},
      onLongPress: () => {},
      onSecondaryTap: () => {},
      onSecondaryTapDown: (d) => {},
      specificRowHeight: 60.h,
      cells: [
        DataCell(customValueTextString(reportModel.name ?? "", ref)),
        DataCell(customValueTextString(getTimeMMMDDYHHMMSSA((reportModel.createdAt ?? 0)).toString(), ref)),
      ],
    );
  }

  customValueTextString(String value, WidgetRef ref) {
    return Text(
      value,
      style: TextStyle(
        color: ref.watch(colorProvider)['text'],
        fontSize: Constant.textSP_16,
      ),
    );
  }

  Widget customLabel(String label, WidgetRef ref) {
    return Text(label, style: TextStyle(color: ref.watch(colorProvider)['white'], fontSize: Constant.textSP_20));
  }
}
