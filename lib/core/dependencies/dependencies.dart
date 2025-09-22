import 'package:intl/intl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../preferences/preferences.dart';
import '../repository/language_repository.dart';
import '../repository/user_repository.dart';

part 'dependencies.g.dart';

/// SharedPreferences
@riverpod
SharedPreferences sharedPreferences(Ref ref) {
  throw UnimplementedError('You must implement SharedPreferences provider');
}

/// Preferences
@riverpod
Preferences preferences(Ref ref) {
  return Preferences(ref.watch(sharedPreferencesProvider));
}

/// LanguageRepository
@riverpod
LanguageRepository languageRepository(Ref ref) {
  return LanguageRepository(ref.watch(preferencesProvider));
}

/// UserRepository
@riverpod
UserRepository userRepository(Ref ref) {
  return UserRepository(ref.watch(preferencesProvider));
}

/// Home Index
@riverpod
class IndexHome extends _$IndexHome {
  @override
  int build() => 0;

  void setIndex(int index) => state = index;
}

/// Current Time (格式1)
@riverpod
Stream<String> currentTime(Ref ref) {
  return Stream.periodic(const Duration(seconds: 1), (_) {
    return DateFormat('EEEE MMMM dd.y @HH:mm:ss', 'en_US').format(DateTime.now());
  });
}

/// Current Time (格式2)
@riverpod
Stream<String> currentTime2(Ref ref) {
  return Stream.periodic(const Duration(seconds: 1), (_) {
    return DateFormat('E MMM dd.y HH:mm:ss', 'en_US').format(DateTime.now());
  });
}

// clearDependencyProvider(WidgetRef ref) {
//   ref.invalidate(currentTimeProvider);
//   ref.invalidate(itemsGeneralDeviceProvider);
//   ref.invalidate(itemsDeviceModelProvider);
// }
