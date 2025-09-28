// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'things_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SelectedGroup)
const selectedGroupProvider = SelectedGroupProvider._();

final class SelectedGroupProvider
    extends $NotifierProvider<SelectedGroup, String> {
  const SelectedGroupProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'selectedGroupProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$selectedGroupHash();

  @$internal
  @override
  SelectedGroup create() => SelectedGroup();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$selectedGroupHash() => r'e7624f98cf04df38c53b35853809761a659d504b';

abstract class _$SelectedGroup extends $Notifier<String> {
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

@ProviderFor(SelectedDevice)
const selectedDeviceProvider = SelectedDeviceProvider._();

final class SelectedDeviceProvider
    extends $NotifierProvider<SelectedDevice, DeviceModel?> {
  const SelectedDeviceProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'selectedDeviceProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$selectedDeviceHash();

  @$internal
  @override
  SelectedDevice create() => SelectedDevice();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DeviceModel? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DeviceModel?>(value),
    );
  }
}

String _$selectedDeviceHash() => r'6807abcadd32be6f66d3c5ea83d3bf6dee50b184';

abstract class _$SelectedDevice extends $Notifier<DeviceModel?> {
  DeviceModel? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<DeviceModel?, DeviceModel?>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<DeviceModel?, DeviceModel?>,
        DeviceModel?,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}

@ProviderFor(addDevice)
const addDeviceProvider = AddDeviceFamily._();

final class AddDeviceProvider extends $FunctionalProvider<
        AsyncValue<AddDeviceResponseEntity>,
        AddDeviceResponseEntity,
        FutureOr<AddDeviceResponseEntity>>
    with
        $FutureModifier<AddDeviceResponseEntity>,
        $FutureProvider<AddDeviceResponseEntity> {
  const AddDeviceProvider._(
      {required AddDeviceFamily super.from,
      required (
        AddDeviceModelRequestEntity,
        String,
      )
          super.argument})
      : super(
          retry: null,
          name: r'addDeviceProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$addDeviceHash();

  @override
  String toString() {
    return r'addDeviceProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<AddDeviceResponseEntity> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<AddDeviceResponseEntity> create(Ref ref) {
    final argument = this.argument as (
      AddDeviceModelRequestEntity,
      String,
    );
    return addDevice(
      ref,
      argument.$1,
      argument.$2,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is AddDeviceProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$addDeviceHash() => r'fb1926b27014a08c1376d4a9f7e02dd2e4bb4b01';

final class AddDeviceFamily extends $Family
    with
        $FunctionalFamilyOverride<
            FutureOr<AddDeviceResponseEntity>,
            (
              AddDeviceModelRequestEntity,
              String,
            )> {
  const AddDeviceFamily._()
      : super(
          retry: null,
          name: r'addDeviceProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  AddDeviceProvider call(
    AddDeviceModelRequestEntity params,
    String token,
  ) =>
      AddDeviceProvider._(argument: (
        params,
        token,
      ), from: this);

  @override
  String toString() => r'addDeviceProvider';
}

@ProviderFor(updateDevice)
const updateDeviceProvider = UpdateDeviceFamily._();

final class UpdateDeviceProvider extends $FunctionalProvider<
        AsyncValue<UpdateDeviceLocationResponseEntity>,
        UpdateDeviceLocationResponseEntity,
        FutureOr<UpdateDeviceLocationResponseEntity>>
    with
        $FutureModifier<UpdateDeviceLocationResponseEntity>,
        $FutureProvider<UpdateDeviceLocationResponseEntity> {
  const UpdateDeviceProvider._(
      {required UpdateDeviceFamily super.from,
      required (
        String,
        AddDeviceModelRequestEntity,
        String,
      )
          super.argument})
      : super(
          retry: null,
          name: r'updateDeviceProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$updateDeviceHash();

  @override
  String toString() {
    return r'updateDeviceProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<UpdateDeviceLocationResponseEntity> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<UpdateDeviceLocationResponseEntity> create(Ref ref) {
    final argument = this.argument as (
      String,
      AddDeviceModelRequestEntity,
      String,
    );
    return updateDevice(
      ref,
      argument.$1,
      argument.$2,
      argument.$3,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is UpdateDeviceProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$updateDeviceHash() => r'ce40762e8fb103d92d51bfddfadd2985226327b5';

final class UpdateDeviceFamily extends $Family
    with
        $FunctionalFamilyOverride<
            FutureOr<UpdateDeviceLocationResponseEntity>,
            (
              String,
              AddDeviceModelRequestEntity,
              String,
            )> {
  const UpdateDeviceFamily._()
      : super(
          retry: null,
          name: r'updateDeviceProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  UpdateDeviceProvider call(
    String deviceId,
    AddDeviceModelRequestEntity params,
    String token,
  ) =>
      UpdateDeviceProvider._(argument: (
        deviceId,
        params,
        token,
      ), from: this);

  @override
  String toString() => r'updateDeviceProvider';
}

@ProviderFor(deleteDevice)
const deleteDeviceProvider = DeleteDeviceFamily._();

final class DeleteDeviceProvider extends $FunctionalProvider<
        AsyncValue<DeleteDeviceResponseEntity>,
        DeleteDeviceResponseEntity,
        FutureOr<DeleteDeviceResponseEntity>>
    with
        $FutureModifier<DeleteDeviceResponseEntity>,
        $FutureProvider<DeleteDeviceResponseEntity> {
  const DeleteDeviceProvider._(
      {required DeleteDeviceFamily super.from,
      required (
        String,
        String,
      )
          super.argument})
      : super(
          retry: null,
          name: r'deleteDeviceProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$deleteDeviceHash();

  @override
  String toString() {
    return r'deleteDeviceProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<DeleteDeviceResponseEntity> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<DeleteDeviceResponseEntity> create(Ref ref) {
    final argument = this.argument as (
      String,
      String,
    );
    return deleteDevice(
      ref,
      argument.$1,
      argument.$2,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is DeleteDeviceProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$deleteDeviceHash() => r'faac11d519ff81d35ff4cfddf41f28f7cb839369';

final class DeleteDeviceFamily extends $Family
    with
        $FunctionalFamilyOverride<
            FutureOr<DeleteDeviceResponseEntity>,
            (
              String,
              String,
            )> {
  const DeleteDeviceFamily._()
      : super(
          retry: null,
          name: r'deleteDeviceProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  DeleteDeviceProvider call(
    String deviceId,
    String token,
  ) =>
      DeleteDeviceProvider._(argument: (
        deviceId,
        token,
      ), from: this);

  @override
  String toString() => r'deleteDeviceProvider';
}

@ProviderFor(SearchValueInThings)
const searchValueInThingsProvider = SearchValueInThingsProvider._();

final class SearchValueInThingsProvider
    extends $NotifierProvider<SearchValueInThings, String> {
  const SearchValueInThingsProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'searchValueInThingsProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$searchValueInThingsHash();

  @$internal
  @override
  SearchValueInThings create() => SearchValueInThings();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$searchValueInThingsHash() =>
    r'd18e222a5e687e51dbdd49d19273a5e1fa35daaa';

abstract class _$SearchValueInThings extends $Notifier<String> {
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

@ProviderFor(searchDevicesInThings)
const searchDevicesInThingsProvider = SearchDevicesInThingsProvider._();

final class SearchDevicesInThingsProvider extends $FunctionalProvider<
    List<DeviceModel>,
    List<DeviceModel>,
    List<DeviceModel>> with $Provider<List<DeviceModel>> {
  const SearchDevicesInThingsProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'searchDevicesInThingsProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$searchDevicesInThingsHash();

  @$internal
  @override
  $ProviderElement<List<DeviceModel>> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<DeviceModel> create(Ref ref) {
    return searchDevicesInThings(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<DeviceModel> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<DeviceModel>>(value),
    );
  }
}

String _$searchDevicesInThingsHash() =>
    r'68e503f9f154942dd26104ee24b52d9fb5e6f2ff';

@ProviderFor(selectedDevicesInThings)
const selectedDevicesInThingsProvider = SelectedDevicesInThingsProvider._();

final class SelectedDevicesInThingsProvider extends $FunctionalProvider<
    List<DeviceModel>,
    List<DeviceModel>,
    List<DeviceModel>> with $Provider<List<DeviceModel>> {
  const SelectedDevicesInThingsProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'selectedDevicesInThingsProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$selectedDevicesInThingsHash();

  @$internal
  @override
  $ProviderElement<List<DeviceModel>> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<DeviceModel> create(Ref ref) {
    return selectedDevicesInThings(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<DeviceModel> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<DeviceModel>>(value),
    );
  }
}

String _$selectedDevicesInThingsHash() =>
    r'57ae3ce46a16226a978f1a1084789fd5098cf133';

@ProviderFor(UpdateDeviceName)
const updateDeviceNameProvider = UpdateDeviceNameProvider._();

final class UpdateDeviceNameProvider
    extends $NotifierProvider<UpdateDeviceName, String> {
  const UpdateDeviceNameProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'updateDeviceNameProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$updateDeviceNameHash();

  @$internal
  @override
  UpdateDeviceName create() => UpdateDeviceName();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$updateDeviceNameHash() => r'de288eafb79c9ce595fc81c81fd0528f29ba3dcc';

abstract class _$UpdateDeviceName extends $Notifier<String> {
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

@ProviderFor(SelectedLocationInThings)
const selectedLocationInThingsProvider = SelectedLocationInThingsProvider._();

final class SelectedLocationInThingsProvider
    extends $NotifierProvider<SelectedLocationInThings, LocationModel?> {
  const SelectedLocationInThingsProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'selectedLocationInThingsProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$selectedLocationInThingsHash();

  @$internal
  @override
  SelectedLocationInThings create() => SelectedLocationInThings();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LocationModel? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LocationModel?>(value),
    );
  }
}

String _$selectedLocationInThingsHash() =>
    r'4aed06408afb515b385a0c3bd3ec59f958c1b411';

abstract class _$SelectedLocationInThings extends $Notifier<LocationModel?> {
  LocationModel? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<LocationModel?, LocationModel?>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<LocationModel?, LocationModel?>,
        LocationModel?,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}

@ProviderFor(SearchValueForMenuInThings)
const searchValueForMenuInThingsProvider =
    SearchValueForMenuInThingsProvider._();

final class SearchValueForMenuInThingsProvider
    extends $NotifierProvider<SearchValueForMenuInThings, String> {
  const SearchValueForMenuInThingsProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'searchValueForMenuInThingsProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$searchValueForMenuInThingsHash();

  @$internal
  @override
  SearchValueForMenuInThings create() => SearchValueForMenuInThings();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$searchValueForMenuInThingsHash() =>
    r'62f1d16d264ab96db86daeebe452fa4e4264b156';

abstract class _$SearchValueForMenuInThings extends $Notifier<String> {
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

@ProviderFor(filteredDevicesInThings)
const filteredDevicesInThingsProvider = FilteredDevicesInThingsProvider._();

final class FilteredDevicesInThingsProvider extends $FunctionalProvider<
    List<DeviceModel>,
    List<DeviceModel>,
    List<DeviceModel>> with $Provider<List<DeviceModel>> {
  const FilteredDevicesInThingsProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'filteredDevicesInThingsProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$filteredDevicesInThingsHash();

  @$internal
  @override
  $ProviderElement<List<DeviceModel>> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<DeviceModel> create(Ref ref) {
    return filteredDevicesInThings(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<DeviceModel> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<DeviceModel>>(value),
    );
  }
}

String _$filteredDevicesInThingsHash() =>
    r'3c329c63ca343c72d8f5e037f945731b9e10583b';
