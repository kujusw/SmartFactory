// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'devicedeletehttpmanager.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(DeviceDeleteHttpManager)
const deviceDeleteHttpManagerProvider = DeviceDeleteHttpManagerProvider._();

final class DeviceDeleteHttpManagerProvider extends $NotifierProvider<
    DeviceDeleteHttpManager, DeleteDeviceResponseEntity> {
  const DeviceDeleteHttpManagerProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'deviceDeleteHttpManagerProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$deviceDeleteHttpManagerHash();

  @$internal
  @override
  DeviceDeleteHttpManager create() => DeviceDeleteHttpManager();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DeleteDeviceResponseEntity value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DeleteDeviceResponseEntity>(value),
    );
  }
}

String _$deviceDeleteHttpManagerHash() =>
    r'a89ee4086ca2c957d19cbca1bb1dd9ab0cc4cb65';

abstract class _$DeviceDeleteHttpManager
    extends $Notifier<DeleteDeviceResponseEntity> {
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
