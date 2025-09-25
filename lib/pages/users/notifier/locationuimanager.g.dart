// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'locationuimanager.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(LocationUIManager)
const locationUIManagerProvider = LocationUIManagerProvider._();

final class LocationUIManagerProvider
    extends $NotifierProvider<LocationUIManager, List<LocationModel>> {
  const LocationUIManagerProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'locationUIManagerProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$locationUIManagerHash();

  @$internal
  @override
  LocationUIManager create() => LocationUIManager();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<LocationModel> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<LocationModel>>(value),
    );
  }
}

String _$locationUIManagerHash() => r'64217399ca1de6a54b3d79d315e1e9f6b289647e';

abstract class _$LocationUIManager extends $Notifier<List<LocationModel>> {
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

@ProviderFor(getLocations)
const getLocationsProvider = GetLocationsProvider._();

final class GetLocationsProvider extends $FunctionalProvider<
        AsyncValue<List<LocationModel>>,
        List<LocationModel>,
        FutureOr<List<LocationModel>>>
    with
        $FutureModifier<List<LocationModel>>,
        $FutureProvider<List<LocationModel>> {
  const GetLocationsProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'getLocationsProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$getLocationsHash();

  @$internal
  @override
  $FutureProviderElement<List<LocationModel>> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<LocationModel>> create(Ref ref) {
    return getLocations(ref);
  }
}

String _$getLocationsHash() => r'58bbf7465f0874e1e7b5fb5a3ea063be5850cb51';
