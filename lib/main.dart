import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:logger/logger.dart';
import 'bootstrap.dart';
import 'common/styles/theme.dart';
import 'core/notifiers/language_notifier.dart';
import 'core/router/routes.dart';
import 'generated/l10n.dart';
import 'pages/common/widget/dialog.dart';
// SmartDialog.config
//   ..toast = SmartConfigToast(displayTime: const Duration(milliseconds: 2000), displayType: SmartToastType.normal)
//   ..custom = SmartConfigCustom(animationType: SmartAnimationType.centerScale_otherSlide, animationTime: const Duration(milliseconds: 100));

Future<void> main() async {
  await bootstrap(() => const MyApp());
  SmartDialog.config..custom = SmartConfigCustom(useAnimation: false);
  if (kReleaseMode) {
    Logger.level = Level.warning;
  } else {
    Logger.level = Level.debug;
  }
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});
//
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final language = ref.watch(
      languageNotifierProvider.select((value) => value.value),
    );
    final darkThemeValue = ref.watch(darkThemeProvider);

    return ScreenUtilInit(
      designSize: const Size(1920, 1080),
      builder: (BuildContext context, Widget? widget) {
        return MaterialApp.router(
          routerConfig: appRouter,
          debugShowCheckedModeBanner: false,
          theme: darkThemeValue ? darkTheme : lightTheme,
          locale: language,
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          // 将zh设置为第一项,没有适配语言时，英语为首选项
          supportedLocales: S.delegate.supportedLocales,
          localeResolutionCallback: (locale, supportedLocales) {
            if (locale == null) return supportedLocales.first;
            for (final currentLocale in supportedLocales) {
              if (currentLocale.languageCode == locale.languageCode) {
                return currentLocale;
              }
            }
            return supportedLocales.first;
          },
          builder: FlutterSmartDialog.init(
            //default toast widget
            toastBuilder: (String msg) => CustomToastWidget(msg: msg),
          ),
        );
      },
    );
  }
}
