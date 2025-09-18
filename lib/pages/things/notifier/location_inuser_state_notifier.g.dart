// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_inuser_state_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(LocationSelectInUserState)
const locationSelectInUserStateProvider = LocationSelectInUserStateProvider._();

final class LocationSelectInUserStateProvider
    extends $NotifierProvider<LocationSelectInUserState, List<LocationModel>> {
  const LocationSelectInUserStateProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'locationSelectInUserStateProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$locationSelectInUserStateHash();

  @$internal
  @override
  LocationSelectInUserState create() => LocationSelectInUserState();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<LocationModel> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<LocationModel>>(value),
    );
  }
}

String _$locationSelectInUserStateHash() =>
    r'25ff8ddc431ae17d1e8b1b6277eefade436421df';

abstract class _$LocationSelectInUserState
    extends $Notifier<List<LocationModel>> {
  List<LocationModel> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<List<LocationModel>, List<LocationModel>>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<List<LocationModel>, List<LocationModel>>,
        List<LocationModel>,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
