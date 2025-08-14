import 'package:flutter/material.dart';

import 'app_themes.dart';
import 'theme_provider.dart';
import 'utils/platform_utils.dart';

class SettingsTheme extends InheritedWidget {
  final SettingsThemeData themeData;
  final DevicePlatform platform;

  const SettingsTheme({
    super.key,
    required this.themeData,
    required this.platform,
    required super.child,
  });

  @override
  bool updateShouldNotify(SettingsTheme oldWidget) => true;

  static SettingsTheme of(BuildContext context) {
    final SettingsTheme? result = context.dependOnInheritedWidgetOfExactType<SettingsTheme>();
    return result ??
        SettingsTheme(
          themeData: ThemeProvider.iosTheme(
            context: context,
            brightness: AppThemes.calculateBrightness(context),
          ),
          platform: DevicePlatform.iOS,
          child: const SizedBox(),
        );
  }
}

class SettingsThemeData {
  const SettingsThemeData({
    this.trailingTextColor,
    this.globalBackground,
    this.whiteDarkGray,
    this.dividerColor,
    this.tileHighlightColor,
    this.titleTextColor,
    this.leadingIconsColor,
    this.tileDescriptionTextColor,
    this.globalBlackWhite,
    this.inactiveTitleColor,
    this.inactiveSubtitleColor,
    this.buttonBackground,
    this.buttonDisableBackground,
    this.iconColor,
    this.appBarBackground,
    this.whiteBlack,
    this.blackWhite,
    this.whiteMain,
    this.blackMain,
    this.popupMenuBackground,
  });

  final Color? globalBackground;
  final Color? trailingTextColor;
  final Color? leadingIconsColor;
  final Color? whiteDarkGray;
  final Color? dividerColor;
  final Color? tileDescriptionTextColor;
  final Color? tileHighlightColor;
  final Color? titleTextColor;
  final Color? globalBlackWhite;
  final Color? inactiveTitleColor;
  final Color? inactiveSubtitleColor;
  final Color? buttonBackground;
  final Color? buttonDisableBackground;
  final Color? appBarBackground;
  final Color? iconColor;
  final Color? whiteBlack;
  final Color? blackWhite;
  final Color? whiteMain;
  final Color? blackMain;
  final Color? popupMenuBackground;
}
