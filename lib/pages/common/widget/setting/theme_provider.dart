import 'package:flutter/cupertino.dart';
import 'settings_theme.dart';
import 'utils/platform_utils.dart';

class ThemeProvider {
  static SettingsThemeData getTheme({
    required BuildContext context,
    required DevicePlatform platform,
    required Brightness brightness,
  }) {
    return iosTheme(context: context, brightness: brightness);
  }

  static SettingsThemeData iosTheme({
    required BuildContext context,
    required Brightness brightness,
  }) {
    const white = Color.fromARGB(255, 255, 255, 255);
    const black = Color.fromARGB(255, 0, 0, 0);
    const blue_1 = Color.fromARGB(255, 0, 77, 127);

    const lightBackground = Color.fromARGB(255, 247, 247, 255);
    const darkBackground = Color.fromARGB(255, 4, 47, 91);

    const lightDividerColor = Color.fromARGB(255, 238, 238, 238);
    const darkDividerColor = Color.fromARGB(255, 40, 40, 42);

    const lightTrailingTextColor = Color.fromARGB(255, 138, 138, 142);
    const darkTrailingTextColor = Color.fromARGB(255, 152, 152, 159);

    const lightTileHighlightColor = Color.fromARGB(255, 209, 209, 214);
    const darkTileHighlightColor = Color.fromARGB(255, 58, 58, 60);

    const lightLeadingIconsColor = CupertinoColors.inactiveGray;
    const darkLeadingIconsColor = CupertinoColors.inactiveGray;

    final isLight = brightness == Brightness.light;

    final appBarBackground = isLight ? white : black;
    final globalBackground = isLight ? lightBackground : darkBackground;
    final titleTextColor = isLight ? CupertinoColors.black : CupertinoColors.white;
    final dividerColor = isLight ? lightDividerColor : darkDividerColor;
    final trailingTextColor = isLight ? lightTrailingTextColor : darkTrailingTextColor;
    final tileHighlightColor = isLight ? lightTileHighlightColor : darkTileHighlightColor;
    final leadingIconsColor = isLight ? lightLeadingIconsColor : darkLeadingIconsColor;
    final buttonBackground = isLight ? blue_1 : const Color.fromARGB(255, 141, 141, 142);
    final buttonDisableBackground =
        isLight ? const Color.fromARGB(255, 141, 141, 142) : const Color.fromARGB(255, 28, 28, 30);
    final iconColor = isLight ? blue_1 : white;
    final whiteBlack = isLight ? CupertinoColors.white : CupertinoColors.black;
    final blackWhite = isLight ? CupertinoColors.black : CupertinoColors.white;
    final whiteMain = isLight ? CupertinoColors.white : blue_1;
    final blackMain = isLight ? CupertinoColors.black : blue_1;
    final popupMenuBackground =
        isLight ? const Color.fromARGB(255, 245, 244, 249) : const Color.fromRGBO(109, 109, 114, 1);

    final whiteDarkGray = isLight ? CupertinoColors.white : const Color.fromARGB(255, 28, 28, 30);

    return SettingsThemeData(
      tileHighlightColor: tileHighlightColor,
      globalBackground: globalBackground,
      whiteDarkGray: whiteDarkGray,
      titleTextColor: titleTextColor,
      dividerColor: dividerColor,
      trailingTextColor: trailingTextColor,
      leadingIconsColor: leadingIconsColor,
      inactiveTitleColor: CupertinoColors.inactiveGray,
      inactiveSubtitleColor: CupertinoColors.inactiveGray,
      buttonBackground: buttonBackground,
      buttonDisableBackground: buttonDisableBackground,
      iconColor: iconColor,
      appBarBackground: appBarBackground,
      whiteBlack: whiteBlack,
      blackWhite: blackWhite,
      whiteMain: whiteMain,
      blackMain: blackMain,
      popupMenuBackground: popupMenuBackground,
    );
  }
}
