// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_state_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(DeviceManager)
const deviceManagerProvider = DeviceManagerProvider._();

final class DeviceManagerProvider
    extends $NotifierProvider<DeviceManager, List<DeviceModel>> {
  const DeviceManagerProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'deviceManagerProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$deviceManagerHash();

  @$internal
  @override
  DeviceManager create() => DeviceManager();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<DeviceModel> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<DeviceModel>>(value),
    );
  }
}

String _$deviceManagerHash() => r'52e37c9235707e193c332198212f0dc5056d082c';

abstract class _$DeviceManager extends $Notifier<List<DeviceModel>> {
  List<DeviceModel> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<List<DeviceModel>, List<DeviceModel>>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<List<DeviceModel>, List<DeviceModel>>,
        List<DeviceModel>,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
