// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'locationaddhttpmanager.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Location)
const locationProvider = LocationProvider._();

final class LocationProvider extends $NotifierProvider<Location, String> {
  const LocationProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'locationProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$locationHash();

  @$internal
  @override
  Location create() => Location();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$locationHash() => r'd8d808e3450fa6589e01f2ba85ca31e07b588fa8';

abstract class _$Location extends $Notifier<String> {
  String build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<String, String>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<String, String>, String, Object?, Object?>;
    element.handleValue(ref, created);
  }
}

@ProviderFor(Building)
const buildingProvider = BuildingProvider._();

final class BuildingProvider extends $NotifierProvider<Building, String> {
  const BuildingProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'buildingProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$buildingHash();

  @$internal
  @override
  Building create() => Building();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$buildingHash() => r'aaf39919890ba03b65a88efd09eaf91cc3c51982';

abstract class _$Building extends $Notifier<String> {
  String build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<String, String>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<String, String>, String, Object?, Object?>;
    element.handleValue(ref, created);
  }
}

@ProviderFor(Tenant)
const tenantProvider = TenantProvider._();

final class TenantProvider extends $NotifierProvider<Tenant, String> {
  const TenantProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'tenantProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$tenantHash();

  @$internal
  @override
  Tenant create() => Tenant();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$tenantHash() => r'0ff9926ffffb79c77e2c4de94d16eb614afaee3b';

abstract class _$Tenant extends $Notifier<String> {
  String build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<String, String>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<String, String>, String, Object?, Object?>;
    element.handleValue(ref, created);
  }
}

@ProviderFor(Area)
const areaProvider = AreaProvider._();

final class AreaProvider extends $NotifierProvider<Area, int> {
  const AreaProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'areaProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$areaHash();

  @$internal
  @override
  Area create() => Area();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$areaHash() => r'741d3b8ee2340626325fa587795712d3908f1849';

abstract class _$Area extends $Notifier<int> {
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

@ProviderFor(LocationAddHttpManager)
const locationAddHttpManagerProvider = LocationAddHttpManagerProvider._();

final class LocationAddHttpManagerProvider extends $NotifierProvider<
    LocationAddHttpManager, AddLocationResponseEntity> {
  const LocationAddHttpManagerProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'locationAddHttpManagerProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$locationAddHttpManagerHash();

  @$internal
  @override
  LocationAddHttpManager create() => LocationAddHttpManager();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AddLocationResponseEntity value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AddLocationResponseEntity>(value),
    );
  }
}

String _$locationAddHttpManagerHash() =>
    r'1c64d0bddfbf95500f23bdb04ac60558003975a7';

abstract class _$LocationAddHttpManager
    extends $Notifier<AddLocationResponseEntity> {
  AddLocationResponseEntity build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<AddLocationResponseEntity, AddLocationResponseEntity>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AddLocationResponseEntity, AddLocationResponseEntity>,
        AddLocationResponseEntity,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
