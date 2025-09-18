import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/styles/assets.dart';
import '../../common/styles/theme.dart';
import '../../common/styles/theme_state_notifier.dart';

Color getAlarmColor(String? name, WidgetRef ref) {
  final Map<String, Color> alarmTypeColorMap = {
    'Devices': ref.watch(colorProvider)['text']!,
    'Connected Devices': Colors.green,
    'Open Alarms': ref.watch(colorProvider)['text_grey']!,
    'Critical Alarms': Colors.red,
    'Major Alarms': Colors.redAccent,
    'Minor Alarms': Colors.orangeAccent,
    'Warning Alarms': Colors.orange,
    'Information Alarms': Colors.blue,
  };

  return alarmTypeColorMap[name] ?? Colors.black; // default color if name not found
}

final Map<String, String> alarmTypeIconPathMap = {
  'Devices': AssetsImages.chipIconBlueSvg,
  'Connected Devices': AssetsImages.lightningBoltIconRemovebgPreview_2Svg,
  'Open Alarms': AssetsImages.bellIconSvg,
  'Critical Alarms': AssetsImages.bellIconSvg,
  'Major Alarms': AssetsImages.bellIconSvg,
  'Minor Alarms': AssetsImages.bellIconSvg,
  'Warning Alarms': AssetsImages.bellIconSvg,
  'Information Alarms': AssetsImages.bellIconSvg,
};

final Map<String, String> addWidgetIconPathMap = {
  'Last Readings': AssetsImages.readingsIconSvg,
  'Chart': AssetsImages.chartIconSvg,
};
