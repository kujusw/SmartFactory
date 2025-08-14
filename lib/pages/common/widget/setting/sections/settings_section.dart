import 'package:flutter/material.dart';

import '../tiles/abstract_settings_tile.dart';
import 'abstract_settings_section.dart';
import 'platforms/ios_settings_section.dart';

class SettingsSection extends AbstractSettingsSection {
  const SettingsSection({
    required this.tiles,
    this.margin,
    this.title,
    super.key,
  });

  final List<AbstractSettingsTile> tiles;
  final EdgeInsetsDirectional? margin;
  final Widget? title;

  @override
  Widget build(BuildContext context) {
    return IOSSettingsSection(
      title: title,
      tiles: tiles,
      margin: margin,
    );
  }
}
