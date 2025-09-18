// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deviceaddhttpmanager.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(DeviceAddHttpManager)
const deviceAddHttpManagerProvider = DeviceAddHttpManagerProvider._();

final class DeviceAddHttpManagerProvider
    extends $NotifierProvider<DeviceAddHttpManager, AddDeviceResponseEntity> {
  const DeviceAddHttpManagerProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'deviceAddHttpManagerProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$deviceAddHttpManagerHash();

  @$internal
  @override
  DeviceAddHttpManager create() => DeviceAddHttpManager();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AddDeviceResponseEntity value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AddDeviceResponseEntity>(value),
    );
  }
}

String _$deviceAddHttpManagerHash() =>
    r'891c397ebaf116930632644fb83b1209a6825acd';

abstract class _$DeviceAddHttpManager
    extends $Notifier<AddDeviceResponseEntity> {
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
