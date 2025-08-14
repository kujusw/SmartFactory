import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/all_things_group_model.dart';
import '../../models/device_model.dart';
import '../../models/general_globalinfo_model.dart';
import '../notifiers/device_state_notifier.dart';
import '../notifiers/floatbuttonmanager.dart';
import '../notifiers/home_index_notifier.dart';
import '../preferences/preferences.dart';
import '../repository/language_repository.dart';
import '../repository/user_repository.dart';

final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError('You must implement SharedPreferences provider');
});

final preferencesProvider = Provider<Preferences>(
  (ref) => Preferences(ref.watch(sharedPreferencesProvider)),
);

final languageRepositoryProvider = Provider<LanguageRepository>(
  (ref) => LanguageRepository(ref.watch(preferencesProvider)),
);

final userRepositoryProvider = Provider<UserRepository>(
  (ref) => UserRepository(ref.watch(preferencesProvider)),
);

final indexHomeProvider = StateNotifierProvider<HomeIndexState, int>((ref) {
  return HomeIndexState();
});

final floatButtonProvider = StateNotifierProvider<FloatButtonManager, String>(
  (ref) {
    return FloatButtonManager();
  },
);
final floatButtonMotionProvider = StateProvider.autoDispose<bool>(
  (ref) {
    final floatButtonState = ref.watch(floatButtonProvider);
    return floatButtonState == "BoardsViewAdd" ||
        floatButtonState == "ThingsViewAdd" ||
        floatButtonState == "ThingsViewEdit" ||
        floatButtonState == "UsersViewAdd" ||
        floatButtonState == "UsersViewEdit";
  },
);

final floatButtonRestoreProvider = StateProvider.autoDispose<bool>(
  (ref) {
    final floatButtonState = ref.watch(floatButtonProvider);
    return floatButtonState == "BoardsViewAdd" ||
        floatButtonState == "ThingsViewAdd" ||
        floatButtonState == "ThingsViewEdit" ||
        floatButtonState == "UsersViewAdd" ||
        floatButtonState == "UsersViewEdit";
  },
);

final itemsGeneralGlobalInfoProvider = StateProvider<List<GeneralGlobalInfoModel>>(
  (ref) => [
    GeneralGlobalInfoModel(name: 'Devices', value: "515", type: "Devices", time: ""),
    GeneralGlobalInfoModel(name: 'Connected Devices', value: "326", type: "Connected Devices", time: ""),
    // GeneralGlobalInfoModel(name: 'Open Alarms', value: "0", type: "Open Alarms", time: ""),
    // GeneralGlobalInfoModel(name: 'Critical Alarms', value: "0", type: "Critical Alarms", time: ""),
    // GeneralGlobalInfoModel(name: 'Major Alarms', value: "0", type: "Major Alarms", time: ""),
    // GeneralGlobalInfoModel(name: 'Minor Alarms', value: "0", type: "Minor Alarms", time: ""),
    // GeneralGlobalInfoModel(name: 'Warning Alarms', value: "0", type: "Warning Alarms", time: ""),
    // GeneralGlobalInfoModel(name: 'Information Alarms', value: "0", type: "Warning Alarms", time: ""),
  ],
);

final currentTimeProvider = StreamProvider<String>((ref) {
  return Stream.periodic(Duration(seconds: 1), (_) {
    return DateFormat('EEEE MMMM dd.y @HH:mm:ss', 'en_US').format(DateTime.now());
  });
});

final currentTime2Provider = StreamProvider<String>((ref) {
  return Stream.periodic(Duration(seconds: 1), (_) {
    return DateFormat('E MMM dd.y HH:mm:ss', 'en_US').format(DateTime.now());
  });
});

final itemsAllThingsGroupsProvider = StateProvider<List<AllThingsGroupsModel>>(
  (ref) => [
    AllThingsGroupsModel(
      id: "1",
      name: 'Physical Devices',
      description: "Smart Business",
      createdAt: "Feb 26 2024 4:45:00 PM",
      updatedAt: "Feb 26 2024 4:45:00 PM",
    ),
    AllThingsGroupsModel(
      id: "2",
      name: 'Total Consumption',
      description: "Smart Business",
      createdAt: "Feb 26 2024 4:45:00 PM",
      updatedAt: "Feb 26 2024 4:45:00 PM",
    ),
    AllThingsGroupsModel(
      id: "3",
      name: 'Lighting',
      description: "Smart Business",
      createdAt: "Feb 26 2024 4:45:00 PM",
      updatedAt: "Feb 26 2024 4:45:00 PM",
    ),
    AllThingsGroupsModel(
      id: "4",
      name: 'AC',
      description: "Smart Business",
      createdAt: "Feb 26 2024 4:45:00 PM",
      updatedAt: "Feb 26 2024 4:45:00 PM",
    ),
    AllThingsGroupsModel(
      id: "5",
      name: 'Socket',
      description: "Smart Business",
      createdAt: "Feb 26 2024 4:45:00 PM",
      updatedAt: "Feb 26 2024 4:45:00 PM",
    ),
    AllThingsGroupsModel(
      id: "6",
      name: 'Mains',
      description: "Smart Business",
      createdAt: "Feb 26 2024 4:45:00 PM",
      updatedAt: "Feb 26 2024 4:45:00 PM",
    ),
  ],
);

final itemsDeviceModelProvider = StateNotifierProvider<DeviceState, List<DeviceModel>>((ref) {
  return DeviceState();
});

// clearDependencyProvider(WidgetRef ref) {
//   ref.invalidate(currentTimeProvider);
//   ref.invalidate(itemsGeneralDeviceProvider);
//   ref.invalidate(itemsDeviceModelProvider);
// }
