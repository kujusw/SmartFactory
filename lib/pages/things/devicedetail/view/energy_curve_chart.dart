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
  // 新增参数支持多条曲线和警戒线
  final List<List<double>>? additionalSeries;
  final List<String>? seriesNames;
  final List<Color>? seriesColors;
  final double? redAlertValue;
  final double? yellowAlertValue;
  
  const EnergyCurveChart({
    Key? key,
    required this.params,
    this.additionalSeries,
    this.seriesNames,
    this.seriesColors,
    this.redAlertValue,
    this.yellowAlertValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncData = ref.watch(energyCurveProvider(params));
    return asyncData.when(
      data: (energyCurve) {
        final lineSections = buildLineSections(energyCurve);
        final yMax = getYAxisMax(lineSections[1].cast<double>());
        
        // 计算包含警戒线的最大值
        double adjustedYMax = yMax;
        if (redAlertValue != null && redAlertValue! > adjustedYMax) {
          adjustedYMax = redAlertValue! * 1.1;
        }
        if (yellowAlertValue != null && yellowAlertValue! > adjustedYMax) {
          adjustedYMax = yellowAlertValue! * 1.1;
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Period: ${energyCurve.data?.period ?? "day"}",
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  // 添加图例
                  if (seriesNames != null || redAlertValue != null || yellowAlertValue != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Wrap(
                        spacing: 16,
                        children: [
                          // 主曲线图例
                          _buildLegendItem("能耗曲线", seriesColors?[0] ?? Colors.blue),
                          // 其他曲线图例
                          if (seriesNames != null)
                            ...seriesNames!.asMap().entries.map((entry) => 
                              _buildLegendItem(entry.value, seriesColors?[entry.key + 1] ?? Colors.green)
                            ),
                          // 警戒线图例
                          if (redAlertValue != null)
                            _buildLegendItem("红色警戒线 (${redAlertValue!.toInt()} kW)", Colors.red, isDashed: true),
                          if (yellowAlertValue != null)
                            _buildLegendItem("黄色警戒线 (${yellowAlertValue!.toInt()} kW)", Colors.orange, isDashed: true),
                        ],
                      ),
                    ),
                ],
              ),
            ),
            SizedBox(
              height: 300.h,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: LineChartWidget(
                  labels: lineSections[0].cast<String>(),
                  values: lineSections[1].cast<double>(),
                  yMax: adjustedYMax,
                  multipleValues: additionalSeries,
                  seriesNames: seriesNames,
                  seriesColors: seriesColors ?? [Colors.blue, Colors.green, Colors.purple, Colors.cyan],
                  redAlertLine: redAlertValue,
                  yellowAlertLine: yellowAlertValue,
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

  Widget _buildLegendItem(String label, Color color, {bool isDashed = false}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 16,
          height: 2,
          decoration: BoxDecoration(
            color: color,
            border: isDashed ? Border.all(color: color, width: 1) : null,
          ),
          child: isDashed ? 
            CustomPaint(
              painter: DashedLinePainter(color: color),
            ) : null,
        ),
        const SizedBox(width: 4),
        Text(
          label,
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}

// 虚线绘制器
class DashedLinePainter extends CustomPainter {
  final Color color;
  
  DashedLinePainter({required this.color});
  
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 2;
    
    const dashWidth = 3.0;
    const dashSpace = 2.0;
    double startX = 0;
    
    while (startX < size.width) {
      canvas.drawLine(
        Offset(startX, size.height / 2),
        Offset(startX + dashWidth, size.height / 2),
        paint,
      );
      startX += dashWidth + dashSpace;
    }
  }
  
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
