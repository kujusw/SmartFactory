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
          isAutoDispose: false,
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

String _$locationHash() => r'8f5785e8a09defad6c38cff5995cf6bb04e130ed';

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
          isAutoDispose: false,
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

String _$buildingHash() => r'ba212cad83e96dc5e9d05e7ce2d2ead84f6689a9';

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
          isAutoDispose: false,
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

String _$tenantHash() => r'd1b7828e2a75b402fb8bb255e96502ac2f73d27c';

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
          isAutoDispose: false,
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

String _$areaHash() => r'db36c82a1cd98c36bd75a1d4fa3251fda198663c';

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

/// -------------------- Locations --------------------

@ProviderFor(addLocation)
const addLocationProvider = AddLocationFamily._();

/// -------------------- Locations --------------------

final class AddLocationProvider extends $FunctionalProvider<
        AsyncValue<AddLocationResponseEntity>,
        AddLocationResponseEntity,
        FutureOr<AddLocationResponseEntity>>
    with
        $FutureModifier<AddLocationResponseEntity>,
        $FutureProvider<AddLocationResponseEntity> {
  /// -------------------- Locations --------------------
  const AddLocationProvider._(
      {required AddLocationFamily super.from,
      required (
        AddLocationModelRequestEntity,
        String,
      )
          super.argument})
      : super(
          retry: null,
          name: r'addLocationProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$addLocationHash();

  @override
  String toString() {
    return r'addLocationProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<AddLocationResponseEntity> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<AddLocationResponseEntity> create(Ref ref) {
    final argument = this.argument as (
      AddLocationModelRequestEntity,
      String,
    );
    return addLocation(
      ref,
      argument.$1,
      argument.$2,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is AddLocationProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$addLocationHash() => r'2430f234ec41704d141da8f272e7e2492756a612';

/// -------------------- Locations --------------------

final class AddLocationFamily extends $Family
    with
        $FunctionalFamilyOverride<
            FutureOr<AddLocationResponseEntity>,
            (
              AddLocationModelRequestEntity,
              String,
            )> {
  const AddLocationFamily._()
      : super(
          retry: null,
          name: r'addLocationProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  /// -------------------- Locations --------------------

  AddLocationProvider call(
    AddLocationModelRequestEntity params,
    String token,
  ) =>
      AddLocationProvider._(argument: (
        params,
        token,
      ), from: this);

  @override
  String toString() => r'addLocationProvider';
}

@ProviderFor(deleteLocation)
const deleteLocationProvider = DeleteLocationFamily._();

final class DeleteLocationProvider extends $FunctionalProvider<
        AsyncValue<DeleteLocationResponseEntity>,
        DeleteLocationResponseEntity,
        FutureOr<DeleteLocationResponseEntity>>
    with
        $FutureModifier<DeleteLocationResponseEntity>,
        $FutureProvider<DeleteLocationResponseEntity> {
  const DeleteLocationProvider._(
      {required DeleteLocationFamily super.from,
      required (
        int,
        String,
      )
          super.argument})
      : super(
          retry: null,
          name: r'deleteLocationProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$deleteLocationHash();

  @override
  String toString() {
    return r'deleteLocationProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<DeleteLocationResponseEntity> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<DeleteLocationResponseEntity> create(Ref ref) {
    final argument = this.argument as (
      int,
      String,
    );
    return deleteLocation(
      ref,
      argument.$1,
      argument.$2,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is DeleteLocationProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$deleteLocationHash() => r'9a220157aeab0e9d6f195571d2be504af37a7755';

final class DeleteLocationFamily extends $Family
    with
        $FunctionalFamilyOverride<
            FutureOr<DeleteLocationResponseEntity>,
            (
              int,
              String,
            )> {
  const DeleteLocationFamily._()
      : super(
          retry: null,
          name: r'deleteLocationProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  DeleteLocationProvider call(
    int id,
    String token,
  ) =>
      DeleteLocationProvider._(argument: (
        id,
        token,
      ), from: this);

  @override
  String toString() => r'deleteLocationProvider';
}

@ProviderFor(updateLocation)
const updateLocationProvider = UpdateLocationFamily._();

final class UpdateLocationProvider extends $FunctionalProvider<
        AsyncValue<AddLocationResponseEntity>,
        AddLocationResponseEntity,
        FutureOr<AddLocationResponseEntity>>
    with
        $FutureModifier<AddLocationResponseEntity>,
        $FutureProvider<AddLocationResponseEntity> {
  const UpdateLocationProvider._(
      {required UpdateLocationFamily super.from,
      required (
        int,
        AddLocationModelRequestEntity,
        String,
      )
          super.argument})
      : super(
          retry: null,
          name: r'updateLocationProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$updateLocationHash();

  @override
  String toString() {
    return r'updateLocationProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<AddLocationResponseEntity> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<AddLocationResponseEntity> create(Ref ref) {
    final argument = this.argument as (
      int,
      AddLocationModelRequestEntity,
      String,
    );
    return updateLocation(
      ref,
      argument.$1,
      argument.$2,
      argument.$3,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is UpdateLocationProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$updateLocationHash() => r'390f446e95edeca6d8e7824e304a6f2f0767f77f';

final class UpdateLocationFamily extends $Family
    with
        $FunctionalFamilyOverride<
            FutureOr<AddLocationResponseEntity>,
            (
              int,
              AddLocationModelRequestEntity,
              String,
            )> {
  const UpdateLocationFamily._()
      : super(
          retry: null,
          name: r'updateLocationProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  UpdateLocationProvider call(
    int id,
    AddLocationModelRequestEntity params,
    String token,
  ) =>
      UpdateLocationProvider._(argument: (
        id,
        params,
        token,
      ), from: this);

  @override
  String toString() => r'updateLocationProvider';
}
