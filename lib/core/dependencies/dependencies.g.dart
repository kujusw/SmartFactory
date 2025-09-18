// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dependencies.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// SharedPreferences

@ProviderFor(sharedPreferences)
const sharedPreferencesProvider = SharedPreferencesProvider._();

/// SharedPreferences

final class SharedPreferencesProvider extends $FunctionalProvider<
    SharedPreferences,
    SharedPreferences,
    SharedPreferences> with $Provider<SharedPreferences> {
  /// SharedPreferences
  const SharedPreferencesProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'sharedPreferencesProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$sharedPreferencesHash();

  @$internal
  @override
  $ProviderElement<SharedPreferences> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SharedPreferences create(Ref ref) {
    return sharedPreferences(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SharedPreferences value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SharedPreferences>(value),
    );
  }
}

String _$sharedPreferencesHash() => r'7df46875e3ed80894c17398e7b3907cff1903090';

/// Preferences

@ProviderFor(preferences)
const preferencesProvider = PreferencesProvider._();

/// Preferences

final class PreferencesProvider
    extends $FunctionalProvider<Preferences, Preferences, Preferences>
    with $Provider<Preferences> {
  /// Preferences
  const PreferencesProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'preferencesProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$preferencesHash();

  @$internal
  @override
  $ProviderElement<Preferences> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Preferences create(Ref ref) {
    return preferences(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Preferences value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Preferences>(value),
    );
  }
}

String _$preferencesHash() => r'd07fc59efce20812799f20cbdf3400355e315f57';

/// LanguageRepository

@ProviderFor(languageRepository)
const languageRepositoryProvider = LanguageRepositoryProvider._();

/// LanguageRepository

final class LanguageRepositoryProvider extends $FunctionalProvider<
    LanguageRepository,
    LanguageRepository,
    LanguageRepository> with $Provider<LanguageRepository> {
  /// LanguageRepository
  const LanguageRepositoryProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'languageRepositoryProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$languageRepositoryHash();

  @$internal
  @override
  $ProviderElement<LanguageRepository> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  LanguageRepository create(Ref ref) {
    return languageRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LanguageRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LanguageRepository>(value),
    );
  }
}

String _$languageRepositoryHash() =>
    r'6085a1a6cecf763ebba8c9a4de0d1033c7a78bb8';

/// UserRepository

@ProviderFor(userRepository)
const userRepositoryProvider = UserRepositoryProvider._();

/// UserRepository

final class UserRepositoryProvider
    extends $FunctionalProvider<UserRepository, UserRepository, UserRepository>
    with $Provider<UserRepository> {
  /// UserRepository
  const UserRepositoryProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'userRepositoryProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$userRepositoryHash();

  @$internal
  @override
  $ProviderElement<UserRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  UserRepository create(Ref ref) {
    return userRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UserRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UserRepository>(value),
    );
  }
}

String _$userRepositoryHash() => r'8433e5e94cfd1509cd8e2a6f15fb946e6cb943df';

/// Home Index

@ProviderFor(IndexHome)
const indexHomeProvider = IndexHomeProvider._();

/// Home Index
final class IndexHomeProvider extends $NotifierProvider<IndexHome, int> {
  /// Home Index
  const IndexHomeProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'indexHomeProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$indexHomeHash();

  @$internal
  @override
  IndexHome create() => IndexHome();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$indexHomeHash() => r'0f29f98a8cc9f17d553b229d56fa5b11b488b1f0';

/// Home Index

abstract class _$IndexHome extends $Notifier<int> {
  int build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<int, int>;
    final element = ref.element
        as $ClassProviderElement<AnyNotifier<int, int>, int, Object?, Object?>;
    element.handleValue(ref, created);
  }
}

/// Float Button
/// Float Button Motion

@ProviderFor(floatButtonMotion)
const floatButtonMotionProvider = FloatButtonMotionProvider._();

/// Float Button
/// Float Button Motion

final class FloatButtonMotionProvider
    extends $FunctionalProvider<bool, bool, bool> with $Provider<bool> {
  /// Float Button
  /// Float Button Motion
  const FloatButtonMotionProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'floatButtonMotionProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$floatButtonMotionHash();

  @$internal
  @override
  $ProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  bool create(Ref ref) {
    return floatButtonMotion(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$floatButtonMotionHash() => r'97dba1fb12330fe680d709178bdf1605366aec8d';

/// Float Button Restore

@ProviderFor(floatButtonRestore)
const floatButtonRestoreProvider = FloatButtonRestoreProvider._();

/// Float Button Restore

final class FloatButtonRestoreProvider
    extends $FunctionalProvider<bool, bool, bool> with $Provider<bool> {
  /// Float Button Restore
  const FloatButtonRestoreProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'floatButtonRestoreProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$floatButtonRestoreHash();

  @$internal
  @override
  $ProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  bool create(Ref ref) {
    return floatButtonRestore(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$floatButtonRestoreHash() =>
    r'3ce61d8dfd9c9db151b3febaac6da764916576ff';

/// Global Info
/// Current Time (格式1)

@ProviderFor(currentTime)
const currentTimeProvider = CurrentTimeProvider._();

/// Global Info
/// Current Time (格式1)

final class CurrentTimeProvider
    extends $FunctionalProvider<AsyncValue<String>, String, Stream<String>>
    with $FutureModifier<String>, $StreamProvider<String> {
  /// Global Info
  /// Current Time (格式1)
  const CurrentTimeProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'currentTimeProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$currentTimeHash();

  @$internal
  @override
  $StreamProviderElement<String> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<String> create(Ref ref) {
    return currentTime(ref);
  }
}

String _$currentTimeHash() => r'9d804e614bac5e6f0f773d06ff1c285f5e4cb1e5';

/// Current Time (格式2)

@ProviderFor(currentTime2)
const currentTime2Provider = CurrentTime2Provider._();

/// Current Time (格式2)

final class CurrentTime2Provider
    extends $FunctionalProvider<AsyncValue<String>, String, Stream<String>>
    with $FutureModifier<String>, $StreamProvider<String> {
  /// Current Time (格式2)
  const CurrentTime2Provider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'currentTime2Provider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$currentTime2Hash();

  @$internal
  @override
  $StreamProviderElement<String> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<String> create(Ref ref) {
    return currentTime2(ref);
  }
}

String _$currentTime2Hash() => r'e5c369bde86dcd18aed8645861170da9eb90660f';
