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
  bool _useGauge = false;

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

    // 其他格式（如 "60/100" 已处理，或者非百分值），返回 0
    return 0;
  }

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
              Positioned(
                right: 10.w,
                top: 10.h,
                child: SvgPicture.asset(
                  AssetsImages.moreVerticalIconSvg,
                  height: 15.h,
                  width: 15.h,
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (!_useGauge)
                      item.uiType == "SMD"
                          ? Icon(
                              Icons.pie_chart,
                              size: 30.h,
                            )
                          : SvgPicture.asset(
                              AssetsImages.chipIconBlueSvg,
                              height: 30.h,
                              width: 30.h,
                            ),
                    SizedBox(height: 10.h),

                    // 样式切换区域：SMD 且 _useGauge 为 true 显示仪表，否则显示原先的滚动文本
                    if (item.uiType == "SMD" && _useGauge)
                      SizedBox(
                        width: double.infinity,
                        height: 120.h,
                        child: SfRadialGauge(
                          axes: <RadialAxis>[
                            RadialAxis(
                              minimum: 0,
                              maximum: 100,
                              showTicks: false,
                              showLabels: false,
                              axisLineStyle: AxisLineStyle(
                                thickness: 0.15,
                                thicknessUnit: GaugeSizeUnit.factor,
                                color: textColor.withOpacity(0.12),
                              ),
                              pointers: <GaugePointer>[
                                RangePointer(
                                  value: percent.clamp(0, 100),
                                  width: 0.15,
                                  sizeUnit: GaugeSizeUnit.factor,
                                  color: gaugeColor,
                                  cornerStyle: CornerStyle.bothCurve,
                                ),
                              ],
                              annotations: <GaugeAnnotation>[
                                GaugeAnnotation(
                                  angle: 90,
                                  positionFactor: 0.0,
                                  widget: Text(
                                    '${percent.clamp(0, 100).toStringAsFixed(0)}%',
                                    style: TextStyle(
                                      fontSize: Constant.textSP_16,
                                      color: gaugeColor,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    else
                      Container(
                        width: double.infinity,
                        height: 50.h,
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

                    SizedBox(height: 10.h),

                    Text(
                      item.type ?? "",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: Constant.textSP_16,
                        color: gaugeColor,
                      ),
                    ),

                    SizedBox(height: 10.h),

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
      ),
    );
  }
}
