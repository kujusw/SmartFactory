import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphic/graphic.dart';
import '../../common/utils/logger_manager.dart';
import '../../common/utils/time_utils.dart';
import '../../models/boards_tab_model.dart';
import '../../models/device_energy_model.dart';
import '../boards/daily_sob/notifier/dailys_sob_notifier.dart';

class BarChartWidget extends ConsumerWidget {
  final BoardsChartWidgetModel chartWidgetModel;
  final bool fetchData; // New parameter to control data fetching

  BarChartWidget(this.chartWidgetModel, {this.fetchData = true}); // Default to true

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (!fetchData) {
      // Handle the case where data is not fetched and set data to null
      return buildChartWidget(null);
    }
    return ref.watch(deviceEnergysProvider(chartWidgetModel)).when(
          data: (data) {
            //根据chartWidgetModel获取对应的数据源
            return buildChartWidget(data);
          },
          loading: () => Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            height: (chartWidgetModel.height ?? 400) - 90,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
          error: (error, stack) => Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            height: (chartWidgetModel.height ?? 400) - 90,
            child: Center(
              child: Text("No data"),
            ),
          ),
        );
  }

  List<int> generateTicks(int max, int count) {
    List<int> ticks = [];
    double step = max / (count - 1);
    for (int i = 0; i < count; i++) {
      ticks.add((step * i).round());
    }
    return ticks;
  }

  Container buildChartWidget(List<DeviceEnergy>? data) {
    var jsonList = getJsonDataByChartWidgetModel(chartWidgetModel, data ?? []);
    //取data 中energy的最大值
    LoggerManager().d("jsonList $jsonList");
    num maxEnergy = 0;
    int adjustedEnergy;
    jsonList.forEach((element) {
      if ((element['energy'] ?? 0) > maxEnergy) {
        maxEnergy = element['energy'] ?? 0;
      }
    });
    //如果最大值小于1000，最大值设为1000 如果最大值小于100，最大值设为100 以此类推
    if (maxEnergy < 1) {
      adjustedEnergy = 1;
    } else if (maxEnergy < 10) {
      adjustedEnergy = maxEnergy.ceil(); // 步长为1，向上取整
    } else if (maxEnergy < 100) {
      adjustedEnergy = (maxEnergy / 10).ceil() * 10; // 步长为10，向上取整到最近的10的倍数
    } else if (maxEnergy < 1000) {
      adjustedEnergy = (maxEnergy / 100).ceil() * 100; // 步长为100，向上取整到最近的100的倍数
    } else if (maxEnergy < 10000) {
      adjustedEnergy = (maxEnergy / 1000).ceil() * 1000; // 步长为1000，向上取整到最近的1000的倍数
    } else if (maxEnergy < 100000) {
      adjustedEnergy = (maxEnergy / 10000).ceil() * 10000; // 步长为10000，向上取整到最近的10000的倍数
    } else {
      adjustedEnergy = maxEnergy.ceil(); // 如果超过100000，就保持原样并向上取整
    }
    // 生成刻度
    List<int> ticks = generateTicks(adjustedEnergy, 5);

    LoggerManager().d("maxEnergy adjustedEnergy $maxEnergy $adjustedEnergy");
    return jsonList.length > 0
        ? Container(
            margin: EdgeInsets.only(top: 10, left: 30, right: 20),
            height: (chartWidgetModel.height ?? 400) - 100,
            child: Container(
              child: chartWidgetModel.reading == "energy_hourly" && chartWidgetModel.period == "7d"
                  ? Chart(
                      data: jsonList,
                      variables: {
                        'day': Variable(
                          accessor: (Map map) => map['day'].toString(),
                        ),
                        'hour': Variable(
                          accessor: (Map map) => map['hour'].toString(),
                        ),
                        'energy': Variable(
                          accessor: (Map map) => map['energy'] as num,
                          scale: LinearScale(
                            min: 0,
                            max: adjustedEnergy,
                            formatter: (v) => '${v.toDouble()} kWh',
                            ticks: ticks,
                          ),
                        ),
                      },
                      marks: [
                        IntervalMark(
                          position: Varset('day') * Varset('energy') / Varset('hour'),
                          // shape: ShapeEncode(value: RectShape(borderRadius: BorderRadius.circular(2))),
                          size: SizeEncode(value: 0.5),
                          modifiers: [DodgeSizeModifier()],
                        )
                      ],
                      coord: RectCoord(
                        horizontalRangeUpdater: Defaults.horizontalRangeFocusEvent,
                      ),
                      axes: [
                        Defaults.horizontalAxis,
                        Defaults.verticalAxis,
                      ],
                      selections: {'tap': PointSelection(dim: Dim.x)},
                      // selections: {'tap': PointSelection(variable: 'hour')},
                      tooltip: TooltipGuide(multiTuples: false),
                      crosshair: CrosshairGuide(),
                    )
                  : chartWidgetModel.reading == "energy_daily" && chartWidgetModel.period == "month"
                      ? Chart(
                          data: jsonList,
                          variables: {
                            'day': Variable(
                              accessor: (Map map) => map['day'].toString(),
                            ),
                            'energy': Variable(
                              accessor: (Map map) => map['energy'] as num,
                              scale: LinearScale(
                                min: 0,
                                max: adjustedEnergy,
                                formatter: (v) => '${v.toDouble()} kWh',
                                ticks: ticks,
                              ),
                            ),
                          },
                          marks: [
                            IntervalMark(
                              position: Varset('day') * (Varset('energy')),
                              shape: ShapeEncode(value: RectShape(borderRadius: BorderRadius.circular(2))),
                              size: SizeEncode(value: 8),
                            )
                          ],
                          coord: RectCoord(
                            horizontalRangeUpdater: Defaults.horizontalRangeFocusEvent,
                          ),
                          axes: [
                            Defaults.horizontalAxis,
                            Defaults.verticalAxis,
                          ],
                          selections: {
                            'tap': PointSelection(
                              variable: 'day',
                            )
                          },
                          tooltip: TooltipGuide(multiTuples: false),
                          // crosshair: CrosshairGuide(),
                        )
                      : chartWidgetModel.reading == "energy_monthly" && chartWidgetModel.period == "year"
                          ? Chart(
                              data: jsonList,
                              variables: {
                                'month': Variable(
                                  accessor: (Map map) {
                                    LoggerManager().d("energy_monthly month ${map['month'].toString()}");
                                    return "${map['month']}\n${map['year']}";
                                  },
                                ),
                                'energy': Variable(
                                  accessor: (Map map) => map['energy'] as num,
                                  scale: LinearScale(
                                    min: 0,
                                    max: adjustedEnergy,
                                    formatter: (v) => '${v.toDouble()} kWh',
                                    ticks: ticks,
                                  ),
                                ),
                              },
                              marks: [
                                IntervalMark(
                                  position: Varset('month') * (Varset('energy')),
                                  shape: ShapeEncode(value: RectShape(borderRadius: BorderRadius.circular(2))),
                                )
                              ],
                              axes: [
                                Defaults.horizontalAxis,
                                Defaults.verticalAxis,
                              ],
                              selections: {
                                'tap': PointSelection(
                                  variable: 'month',
                                )
                              },
                              tooltip: TooltipGuide(multiTuples: false),
                              // crosshair: CrosshairGuide(),
                            )
                          : Chart(
                              data: jsonList,
                              variables: {
                                'day': Variable(
                                  accessor: (Map map) => map['day'].toString(),
                                ),
                                'energy': Variable(
                                  accessor: (Map map) => map['energy'] as num,
                                  scale: LinearScale(
                                    min: 0,
                                    max: adjustedEnergy,
                                    formatter: (v) => '${v.toDouble()} kWh',
                                    ticks: ticks,
                                  ),
                                ),
                              },
                              marks: [
                                IntervalMark(
                                  position: Varset('day') * (Varset('energy')),
                                  shape: ShapeEncode(value: RectShape(borderRadius: BorderRadius.circular(2))),
                                )
                              ],
                              axes: [
                                Defaults.horizontalAxis,
                                Defaults.verticalAxis,
                              ],
                              selections: {
                                'tap': PointSelection(
                                  variable: 'day',
                                )
                              },
                              tooltip: TooltipGuide(multiTuples: false),
                              // crosshair: CrosshairGuide(),
                            ),
            ),
          )
        : Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            height: (chartWidgetModel.height ?? 400) - 90,
            child: Center(
              child: Text("No data"),
            ),
          );
  }
}

const _kBaseGroupPaddingHorizontal = 32.0;
const _kMinBarSize = 4.0;

class DodgeSizeModifier extends Modifier {
  @override
  AttributesGroups modify(AttributesGroups groups, Map<String, ScaleConv<dynamic, num>> scales, AlgForm form,
      CoordConv coord, Offset origin) {
    final xField = form.first[0];
    final band = (scales[xField]! as DiscreteScaleConv).band;

    final ratio = 1 / groups.length;
    final numGroups = groups.length;
    final groupHorizontalPadding = _kBaseGroupPaddingHorizontal / numGroups;
    final invertedGroupPaddingHorizontal = coord.invertDistance(groupHorizontalPadding, Dim.x);

    final effectiveBand = band - 2 * invertedGroupPaddingHorizontal;

    final maxWidth = coord.convert(const Offset(1, 0)).dx;
    final maxWidthInBand = effectiveBand * maxWidth;
    final maxWidthPerAttributes = maxWidthInBand / numGroups;
    final barHorizontalPadding = groupHorizontalPadding / 2;
    final size = max(maxWidthPerAttributes - barHorizontalPadding, _kMinBarSize);

    final bias = ratio * effectiveBand;

    // Negatively shift half of the total bias.
    var accumulated = -bias * (numGroups + 1) / 2;

    final AttributesGroups rst = [];
    for (final group in groups) {
      final groupRst = <Attributes>[];
      for (final attributes in group) {
        final oldPosition = attributes.position;

        groupRst.add(Attributes(
          index: attributes.index,
          tag: attributes.tag,
          position: oldPosition
              .map(
                (point) => Offset(point.dx + accumulated + bias, point.dy),
              )
              .toList(),
          shape: attributes.shape,
          color: attributes.color,
          gradient: attributes.gradient,
          elevation: attributes.elevation,
          label: attributes.label,
          size: size,
        ));
      }
      rst.add(groupRst);
      accumulated += bias;
    }

    return rst;
  }

  @override
  bool equalTo(Object other) {
    return super == other;
  }
}
