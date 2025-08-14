import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../common/styles/theme.dart';
import '../../common/values/index.dart';
import '../../models/reports_group_model.dart';
import '../reports/notifier/reports_notifier.dart';

class ReportsGroupsItem extends ConsumerWidget {
  final ReportsGroupsModel item;
  const ReportsGroupsItem({super.key, required this.item});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 40.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Checkbox(
                value: item.selected,
                activeColor: ref.watch(colorProvider)['accentColor'],
                side: BorderSide(
                  color: ref.watch(colorProvider)['white']!,
                ),
                onChanged: (bool? value) {
                  ref.read(itemsReportsGroupsProvider.notifier).updateReportsGroups(
                        ReportsGroupsModel(
                          id: item.id,
                          name: item.name,
                          value: item.value,
                          description: item.description,
                          createdAt: item.createdAt,
                          updatedAt: item.updatedAt,
                          selected: value ?? false,
                        ),
                      );
                  final itemsReport = ref.read(itemsReportModelProvider);
                  final itemsReportsGroups = ref.read(itemsReportsGroupsProvider);
                  //判断数据的类型 是否在itemsReportsGroupsProvider中选中
                  final selectedReportGroup = itemsReportsGroups.where((element) => element.selected);
                  if (selectedReportGroup.length > 0) {
                    ref.watch(itemsReportModelFilteredProvider.notifier).setReports(itemsReport
                        .where((element) => selectedReportGroup.any((element2) => element2.name == element.type))
                        .toList());
                  } else {
                    ref.watch(itemsReportModelFilteredProvider.notifier).setReports(itemsReport);
                  }
                },
              ),
              Text(
                item.name ?? "",
                style: TextStyle(
                  fontSize: Constant.textSP_14,
                  color: ref.watch(colorProvider)['text'],
                ),
              ),
            ],
          ),
          Text(
            item.value ?? "",
            style: TextStyle(
              fontSize: Constant.textSP_14,
              color: ref.watch(colorProvider)['text'],
            ),
          ),
        ],
      ),
    );
  }
}
