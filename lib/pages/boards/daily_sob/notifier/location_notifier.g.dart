// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 原始数据

@ProviderFor(LocationList)
const locationListProvider = LocationListProvider._();

/// 原始数据
final class LocationListProvider
    extends $NotifierProvider<LocationList, List<LocationModel>> {
  /// 原始数据
  const LocationListProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'locationListProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$locationListHash();

  @$internal
  @override
  LocationList create() => LocationList();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<LocationModel> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<LocationModel>>(value),
    );
  }
}

String _$locationListHash() => r'a242a3f08ad7962b95a61002778384b30843963c';

/// 原始数据

abstract class _$LocationList extends $Notifier<List<LocationModel>> {
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

/// 过滤后的数据

@ProviderFor(LocationUIManager)
const locationUIManagerProvider = LocationUIManagerProvider._();

/// 过滤后的数据
final class LocationUIManagerProvider
    extends $NotifierProvider<LocationUIManager, List<LocationModel>> {
  /// 过滤后的数据
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

String _$locationUIManagerHash() => r'8a7dd4a5e4a10a1c8ee04aa81a19b493e8541449';

/// 过滤后的数据

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

/// 获取数据

@ProviderFor(getLocations)
const getLocationsProvider = GetLocationsProvider._();

/// 获取数据

final class GetLocationsProvider extends $FunctionalProvider<
        AsyncValue<List<LocationModel>>,
        List<LocationModel>,
        FutureOr<List<LocationModel>>>
    with
        $FutureModifier<List<LocationModel>>,
        $FutureProvider<List<LocationModel>> {
  /// 获取数据
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

String _$getLocationsHash() => r'94432a7eec51b67cac0c8ec7987eae34e6131266';
