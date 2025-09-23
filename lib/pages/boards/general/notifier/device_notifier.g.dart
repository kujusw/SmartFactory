// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 获取设备列表

@ProviderFor(devices)
const devicesProvider = DevicesProvider._();

/// 获取设备列表

final class DevicesProvider extends $FunctionalProvider<
        AsyncValue<List<DeviceModel>>,
        List<DeviceModel>,
        FutureOr<List<DeviceModel>>>
    with
        $FutureModifier<List<DeviceModel>>,
        $FutureProvider<List<DeviceModel>> {
  /// 获取设备列表
  const DevicesProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'devicesProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$devicesHash();

  @$internal
  @override
  $FutureProviderElement<List<DeviceModel>> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<DeviceModel>> create(Ref ref) {
    return devices(ref);
  }
}

String _$devicesHash() => r'02d173cbcdd289f7718c07fd47cf743fe7e6ca7b';

/// 当前选中的设备

@ProviderFor(CurrentDevice)
const currentDeviceProvider = CurrentDeviceProvider._();

/// 当前选中的设备
final class CurrentDeviceProvider
    extends $NotifierProvider<CurrentDevice, DeviceModel?> {
  /// 当前选中的设备
  const CurrentDeviceProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'currentDeviceProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$currentDeviceHash();

  @$internal
  @override
  CurrentDevice create() => CurrentDevice();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DeviceModel? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DeviceModel?>(value),
    );
  }
}

String _$currentDeviceHash() => r'20514ea5965e38ed4034789cda8a18f4f8b644a5';

/// 当前选中的设备

abstract class _$CurrentDevice extends $Notifier<DeviceModel?> {
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

/// 搜索值

@ProviderFor(VualeSearch)
const vualeSearchProvider = VualeSearchProvider._();

/// 搜索值
final class VualeSearchProvider extends $NotifierProvider<VualeSearch, String> {
  /// 搜索值
  const VualeSearchProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'vualeSearchProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$vualeSearchHash();

  @$internal
  @override
  VualeSearch create() => VualeSearch();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$vualeSearchHash() => r'ea59b07fad7d9e053f8685aeea49200639c0f911';

/// 搜索值

abstract class _$VualeSearch extends $Notifier<String> {
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

/// 显示 menu 的设备列表 ID

@ProviderFor(ShowMenuDeviceList)
const showMenuDeviceListProvider = ShowMenuDeviceListProvider._();

/// 显示 menu 的设备列表 ID
final class ShowMenuDeviceListProvider
    extends $NotifierProvider<ShowMenuDeviceList, int> {
  /// 显示 menu 的设备列表 ID
  const ShowMenuDeviceListProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'showMenuDeviceListProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$showMenuDeviceListHash();

  @$internal
  @override
  ShowMenuDeviceList create() => ShowMenuDeviceList();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$showMenuDeviceListHash() =>
    r'a5421761d6008136e9805897868f661ab10bcf47';

/// 显示 menu 的设备列表 ID

abstract class _$ShowMenuDeviceList extends $Notifier<int> {
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

/// 搜索结果设备

@ProviderFor(itemsSearchDeviceModelInDevice)
const itemsSearchDeviceModelInDeviceProvider =
    ItemsSearchDeviceModelInDeviceProvider._();

/// 搜索结果设备

final class ItemsSearchDeviceModelInDeviceProvider extends $FunctionalProvider<
    List<DeviceModel>?,
    List<DeviceModel>?,
    List<DeviceModel>?> with $Provider<List<DeviceModel>?> {
  /// 搜索结果设备
  const ItemsSearchDeviceModelInDeviceProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'itemsSearchDeviceModelInDeviceProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$itemsSearchDeviceModelInDeviceHash();

  @$internal
  @override
  $ProviderElement<List<DeviceModel>?> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<DeviceModel>? create(Ref ref) {
    return itemsSearchDeviceModelInDevice(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<DeviceModel>? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<DeviceModel>?>(value),
    );
  }
}

String _$itemsSearchDeviceModelInDeviceHash() =>
    r'68a66d524af47912f771691702f6d34aae46d6cb';

/// 主页GeneralDevice 的状态管理 注意跟设备列表 设备详情区分

@ProviderFor(ItemsGeneralDevice)
const itemsGeneralDeviceProvider = ItemsGeneralDeviceProvider._();

/// 主页GeneralDevice 的状态管理 注意跟设备列表 设备详情区分
final class ItemsGeneralDeviceProvider extends $NotifierProvider<
    ItemsGeneralDevice, List<GeneralDeviceInfoModel>> {
  /// 主页GeneralDevice 的状态管理 注意跟设备列表 设备详情区分
  const ItemsGeneralDeviceProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'itemsGeneralDeviceProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$itemsGeneralDeviceHash();

  @$internal
  @override
  ItemsGeneralDevice create() => ItemsGeneralDevice();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<GeneralDeviceInfoModel> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<GeneralDeviceInfoModel>>(value),
    );
  }
}

String _$itemsGeneralDeviceHash() =>
    r'f01b9a8400cc5f91a6a90182710923ea096c627a';

/// 主页GeneralDevice 的状态管理 注意跟设备列表 设备详情区分

abstract class _$ItemsGeneralDevice
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
