// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usersindexstate.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(UsersIndexState)
const usersIndexStateProvider = UsersIndexStateProvider._();

final class UsersIndexStateProvider
    extends $NotifierProvider<UsersIndexState, int> {
  const UsersIndexStateProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'usersIndexStateProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$usersIndexStateHash();

  @$internal
  @override
  UsersIndexState create() => UsersIndexState();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$usersIndexStateHash() => r'1a9a0689d310e6cf8e03c107fe46a3359b8f1392';

abstract class _$UsersIndexState extends $Notifier<int> {
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
