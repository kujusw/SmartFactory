import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import '../../../../../../common/styles/assets.dart';
import '../../../../../../common/styles/theme_state_notifier.dart';
import '../../../../../../common/utils/logger_manager.dart';
import '../../../../../../common/values/index.dart';
import '../../../../../../models/general_device_info_model.dart';
import '../../../../common/widgets/marquee.dart';

// 类：GeneralViewDevicesItem
class GeneralViewDevicesItem extends ConsumerStatefulWidget {
  final GeneralDeviceInfoModel item;
  const GeneralViewDevicesItem({
    super.key,
    required this.item,
  });

  @override
  ConsumerState<GeneralViewDevicesItem> createState() => _GeneralViewDevicesItemState();
}

class _GeneralViewDevicesItemState extends ConsumerState<GeneralViewDevicesItem> {
  @override
  Widget build(BuildContext context) {
    final item = widget.item;
    final textColor = ref.watch(colorProvider)['text'] as Color;
    final gaugeColor = _colorForType(item.type, textColor);
    final percent = _parsePercent(item.value);

    return MouseRegion(
      onEnter: (PointerEvent details) => () {
        // 鼠标悬停时的背景色
      },
      onExit: (PointerEvent details) => () {
        // 鼠标离开时的背景色
      },
      child: GestureDetector(
        onTap: () {
          // 点击事件：仅 SMD 支持样式切换
          if (item.uiType == "SMD") {
            setState(() {
              _useGauge = !_useGauge;
            });
          }
          LoggerManager().d("GeneralViewDevicesItem onTap ${item.toRawJson()}");
        },
        child: Container(
          height: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.w),
            color: ref.watch(colorProvider)['backgroundColorWidget'],
          ),
          child: Stack(
            children: [
              // 将原来的 Align+Column 替换为内部 Stack：顶部展示区 + 底部信息区
              Positioned.fill(
                child: Stack(
                  children: [
                    // 顶部展示区（预留底部信息高度 70.h，不遮挡 type/time）
                    Positioned.fill(
                      left: 0,
                      right: 0,
                      top: 0,
                      bottom: 70.h,
                      child: Center(
                        child: (item.uiType == "SMD" && _useGauge)
                            ? SfRadialGauge(
                                axes: <RadialAxis>[
                                  RadialAxis(
                                    minimum: 0,
                                    maximum: 100,
                                    startAngle: 180,
                                    endAngle: 0,
                                    canScaleToFit: true,
                                    centerY: 0.40,
                                    radiusFactor: 1.0,
                                    showTicks: false,
                                    showLabels: false,
                                    axisLineStyle: AxisLineStyle(
                                      thickness: 0.30,
                                      thicknessUnit: GaugeSizeUnit.factor,
                                      color: Colors.transparent,
                                    ),
                                    ranges: <GaugeRange>[
                                      GaugeRange(
                                        startValue: 0,
                                        endValue: 50,
                                        color: Colors.red.shade700,
                                        startWidth: 0.30,
                                        endWidth: 0.30,
                                        sizeUnit: GaugeSizeUnit.factor,
                                        label: 'Poor',
                                        labelStyle: GaugeTextStyle(
                                          fontSize: Constant.textSP_6,
                                          color: Colors.white,
                                        ),
                                      ),
                                      GaugeRange(
                                        startValue: 50,
                                        endValue: 75,
                                        color: Colors.yellow.shade600,
                                        startWidth: 0.30,
                                        endWidth: 0.30,
                                        sizeUnit: GaugeSizeUnit.factor,
                                        label: 'Average',
                                        labelStyle: GaugeTextStyle(
                                          fontSize: Constant.textSP_6,
                                          color: Colors.black87,
                                        ),
                                      ),
                                      GaugeRange(
                                        startValue: 75,
                                        endValue: 100,
                                        color: Colors.green.shade600,
                                        startWidth: 0.30,
                                        endWidth: 0.30,
                                        sizeUnit: GaugeSizeUnit.factor,
                                        label: 'Good',
                                        labelStyle: GaugeTextStyle(
                                          fontSize: Constant.textSP_6,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                    pointers: <GaugePointer>[
                                      NeedlePointer(
                                        value: percent.clamp(0, 100),
                                        enableAnimation: true,
                                        animationType: AnimationType.ease,
                                        needleColor: gaugeColor,
                                        needleLength: 0.68,
                                        lengthUnit: GaugeSizeUnit.factor,
                                        needleStartWidth: 0.5,
                                        needleEndWidth: 4.0,
                                        knobStyle: KnobStyle(
                                          knobRadius: 0.0,
                                          borderColor: Colors.transparent,
                                          color: Colors.transparent,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            : (item.uiType == "SMD"
                                ? Icon(Icons.pie_chart, size: 30.h)
                                : SvgPicture.asset(
                                    AssetsImages.chipIconBlueSvg,
                                    height: 30.h,
                                    width: 30.h,
                                  )),
                      ),
                    ),
                    // 底部信息区（固定在底部，始终显示 type 与 time）
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 8.h,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          if (!_useGauge)
                            SizedBox(
                              height: 24.h, // 为水平 ListView 提供有界高度，避免 unbounded height
                              child: Marquee(
                                text: item.value ?? "",
                                scrollAxis: Axis.horizontal,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                blankSpace: 20.w,
                                velocity: 30.0,
                                startPadding: 10.0,
                                accelerationCurve: Curves.easeIn,
                                decelerationCurve: Curves.easeOut,
                                style: TextStyle(
                                  fontSize: Constant.textSP_16,
                                  color: gaugeColor,
                                ),
                              ),
                            ),
                          SizedBox(height: 6.h),
                          Text(
                            item.type ?? "",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: Constant.textSP_16,
                              color: gaugeColor,
                            ),
                          ),
                          SizedBox(height: 6.h),
                          Text(
                            item.time ?? "",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: Constant.textSP_12,
                              color: gaugeColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 控制 SMD 点击后是否使用仪表盘样式
  bool _useGauge = false;

  // 解析百分比：支持 "60/100"、"80%" 等格式
  double _parsePercent(String? v) {
    if (v == null) return 0;
    final trimmed = v.trim();

    // 格式 "60/100"
    final slash = trimmed.split('/');
    if (slash.length == 2) {
      final num = double.tryParse(slash[0].replaceAll(RegExp(r'[^0-9.]'), '')) ?? 0;
      final den = double.tryParse(slash[1].replaceAll(RegExp(r'[^0-9.]'), '')) ?? 100;
      if (den == 0) return 0;
      return (num / den) * 100.0;
    }

    // 格式 "80%" 或 "80 %"
    final percentMatch = RegExp(r'([\d.]+)\s*%').firstMatch(trimmed);
    if (percentMatch != null) {
      return double.tryParse(percentMatch.group(1)!) ?? 0;
    }

    // 其他格式（返回 0）
    return 0;
  }

  // 根据 item.type 映射颜色，未匹配时使用传入的文本颜色
  Color _colorForType(String? type, Color fallback) {
    switch (type) {
      case 'red':
        return Colors.red;
      case 'yellow':
        return Colors.yellow;
      case 'green':
        return Colors.green;
      default:
        return fallback;
    }
  }
}
