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
          isAutoDispose: true,
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

String _$selectedDeviceHash() => r'76a4f914568e8277fe8704cddefaa4976087b461';

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

@ProviderFor(AddDevice)
const addDeviceProvider = AddDeviceProvider._();

final class AddDeviceProvider
    extends $NotifierProvider<AddDevice, AddDeviceResponseEntity> {
  const AddDeviceProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'addDeviceProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$addDeviceHash();

  @$internal
  @override
  AddDevice create() => AddDevice();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AddDeviceResponseEntity value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AddDeviceResponseEntity>(value),
    );
  }
}

String _$addDeviceHash() => r'55d3847558da85622fbdc81837d0062077f6e445';

abstract class _$AddDevice extends $Notifier<AddDeviceResponseEntity> {
  AddDeviceResponseEntity build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<AddDeviceResponseEntity, AddDeviceResponseEntity>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AddDeviceResponseEntity, AddDeviceResponseEntity>,
        AddDeviceResponseEntity,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}

@ProviderFor(DeleteDevice)
const deleteDeviceProvider = DeleteDeviceProvider._();

final class DeleteDeviceProvider
    extends $NotifierProvider<DeleteDevice, DeleteDeviceResponseEntity> {
  const DeleteDeviceProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'deleteDeviceProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$deleteDeviceHash();

  @$internal
  @override
  DeleteDevice create() => DeleteDevice();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DeleteDeviceResponseEntity value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DeleteDeviceResponseEntity>(value),
    );
  }
}

String _$deleteDeviceHash() => r'c14efd9dce177955fddd787488fdffd5329cf7f1';

abstract class _$DeleteDevice extends $Notifier<DeleteDeviceResponseEntity> {
  DeleteDeviceResponseEntity build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref
        as $Ref<DeleteDeviceResponseEntity, DeleteDeviceResponseEntity>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<DeleteDeviceResponseEntity, DeleteDeviceResponseEntity>,
        DeleteDeviceResponseEntity,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
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
    r'f822117bc8db44fb88a786ba452a256ea08e84d6';

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
          isAutoDispose: true,
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
    r'93f721a40aef52796cfc750fc1a3a374cf6621f3';

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
          isAutoDispose: true,
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

String _$updateDeviceNameHash() => r'4412875d0b4935b494d7a138ab50aba292f687b1';

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
          isAutoDispose: true,
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
    r'87d80e12f911bdd5faa586e134091a457c1a9dc7';

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

@ProviderFor(SelectedLocationsInUsers)
const selectedLocationsInUsersProvider = SelectedLocationsInUsersProvider._();

final class SelectedLocationsInUsersProvider
    extends $NotifierProvider<SelectedLocationsInUsers, List<LocationModel>> {
  const SelectedLocationsInUsersProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'selectedLocationsInUsersProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$selectedLocationsInUsersHash();

  @$internal
  @override
  SelectedLocationsInUsers create() => SelectedLocationsInUsers();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<LocationModel> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<LocationModel>>(value),
    );
  }
}

String _$selectedLocationsInUsersHash() =>
    r'f0f787ad9403089e45a4fe031d70a37dd198fb89';

abstract class _$SelectedLocationsInUsers
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

@ProviderFor(GeneralDevicesInThings)
const generalDevicesInThingsProvider = GeneralDevicesInThingsProvider._();

final class GeneralDevicesInThingsProvider extends $NotifierProvider<
    GeneralDevicesInThings, List<GeneralDeviceInfoModel>> {
  const GeneralDevicesInThingsProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'generalDevicesInThingsProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$generalDevicesInThingsHash();

  @$internal
  @override
  GeneralDevicesInThings create() => GeneralDevicesInThings();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<GeneralDeviceInfoModel> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<GeneralDeviceInfoModel>>(value),
    );
  }
}

String _$generalDevicesInThingsHash() =>
    r'de89e22205b3141d3d533ab4396519d32b223ad1';

abstract class _$GeneralDevicesInThings
    extends $Notifier<List<GeneralDeviceInfoModel>> {
  List<GeneralDeviceInfoModel> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref
        as $Ref<List<GeneralDeviceInfoModel>, List<GeneralDeviceInfoModel>>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<List<GeneralDeviceInfoModel>, List<GeneralDeviceInfoModel>>,
        List<GeneralDeviceInfoModel>,
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
