import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../common/styles/theme.dart';
import '../../../common/styles/theme_state_notifier.dart';
import '../../../common/values/index.dart';
import '../../common/widget/setting/list/settings_list.dart';
import '../../common/widget/setting/sections/settings_section.dart';
import '../../common/widget/setting/tiles/settings_tile.dart';
import '../../common/widget/setting/utils/platform_utils.dart';

class SettingsView extends ConsumerWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SettingsList(
      applicationType: ApplicationType.cupertino,
      platform: DevicePlatform.macOS,
      sections: [
        SettingsSection(
          title: Text('Appearance', style: TextStyle(fontSize: Constant.textSP_16)),
          tiles: [
            SettingsTile.switchTile(
              onToggle: (value) async {
                if (value) {
                  ref.read(darkThemeProvider.notifier).state = true;
                } else {
                  ref.read(darkThemeProvider.notifier).state = false;
                }
              },
              initialValue: ref.watch(darkThemeProvider),
              title: Text("Dark", style: TextStyle(fontSize: Constant.textSP_20)),
            ),
          ],
        )
      ],
    );
  }
}
