import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../notifier/device_detail_chart_notifier.dart';

class CustomDateRangePicker extends ConsumerWidget {
  final BuildContext buildContext;
  final void Function(DateTimeRange?) onResult;

  const CustomDateRangePicker({super.key, required this.buildContext, required this.onResult});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // string 转 DateTime 时间
    final start = ref.watch(chartDataStartProvider);
    final end = ref.watch(chartDataEndProvider);
    DateTime? startDate = start != null ? DateTime.tryParse(start) : null;
    DateTime? endDate = end != null ? DateTime.tryParse(end) : null;
    if (startDate == null && start != null) {
      print('start 日期格式错误: $start');
    }
    if (endDate == null && end != null) {
      print('end 日期格式错误: $end');
    }
    String text = "Select Range";
    if (startDate != null && endDate != null) {
      text = "${startDate.toLocal().toString().split(' ')[0]} → ${endDate.toLocal().toString().split(' ')[0]}";
    }

    return GestureDetector(
      onTap: () async {
        final today = DateTime.now();
        final picked = await showDateRangePicker(
          context: context, // 使用局部 Navigator 的 context
          useRootNavigator: false,
          firstDate: DateTime(today.year - 5),
          lastDate: DateTime(today.year + 5),
          initialDateRange:
              (startDate != null && endDate != null) ? DateTimeRange(start: startDate, end: endDate) : null,
        );
        onResult(picked);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade400),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          text,
          style: const TextStyle(fontSize: 14),
        ),
      ),
    );
  }
}
