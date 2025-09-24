import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/linechart.dart';
import '../../notifier/energy_curve_provider.dart';

/// ----------------------------
/// 曲线图 UI
/// ----------------------------
class EnergyCurveChart extends ConsumerWidget {
  final EnergyCurveRequest params;
  const EnergyCurveChart({
    Key? key,
    required this.params,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncData = ref.watch(energyCurveProvider(params));
    return asyncData.when(
      data: (energyCurve) {
        final lineSections = buildLineSections(energyCurve);
        final yMax = getYAxisMax(lineSections[1].cast<double>());

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                "Period: ${energyCurve.data?.period ?? "day"}",
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 300.h,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: LineChartWidget(
                  labels: lineSections[0].cast<String>(),
                  values: lineSections[1].cast<double>(),
                  yMax: yMax,
                ),
              ),
            ),
          ],
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, _) => Center(child: Text("Error: $err")),
    );
  }
}
