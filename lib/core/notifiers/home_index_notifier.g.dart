// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_index_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(HomeIndexState)
const homeIndexStateProvider = HomeIndexStateProvider._();

final class HomeIndexStateProvider
    extends $NotifierProvider<HomeIndexState, int> {
  const HomeIndexStateProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'homeIndexStateProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$homeIndexStateHash();

  @$internal
  @override
  HomeIndexState create() => HomeIndexState();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$homeIndexStateHash() => r'1b36cdfefefda686bbd1e98bf557620f64cf18fe';

abstract class _$HomeIndexState extends $Notifier<int> {
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
