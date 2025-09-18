// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'updatedevicelocationhttpmanager.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(UpdateDeviceLocation)
const updateDeviceLocationProvider = UpdateDeviceLocationProvider._();

final class UpdateDeviceLocationProvider extends $NotifierProvider<
    UpdateDeviceLocation, UpdateDeviceLocationResponseEntity> {
  const UpdateDeviceLocationProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'updateDeviceLocationProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$updateDeviceLocationHash();

  @$internal
  @override
  UpdateDeviceLocation create() => UpdateDeviceLocation();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UpdateDeviceLocationResponseEntity value) {
    return $ProviderOverride(
      origin: this,
      providerOverride:
          $SyncValueProvider<UpdateDeviceLocationResponseEntity>(value),
    );
  }
}

String _$updateDeviceLocationHash() =>
    r'8ca6ca8962dcd079366c49e7347f8858aa04168c';

abstract class _$UpdateDeviceLocation
    extends $Notifier<UpdateDeviceLocationResponseEntity> {
  UpdateDeviceLocationResponseEntity build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<UpdateDeviceLocationResponseEntity,
        UpdateDeviceLocationResponseEntity>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<UpdateDeviceLocationResponseEntity,
            UpdateDeviceLocationResponseEntity>,
        UpdateDeviceLocationResponseEntity,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
