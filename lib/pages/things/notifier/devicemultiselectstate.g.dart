// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'devicemultiselectstate.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(DeviceMultiSelectsState)
const deviceMultiSelectsStateProvider = DeviceMultiSelectsStateProvider._();

final class DeviceMultiSelectsStateProvider
    extends $NotifierProvider<DeviceMultiSelectsState, List<DeviceModel>> {
  const DeviceMultiSelectsStateProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'deviceMultiSelectsStateProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$deviceMultiSelectsStateHash();

  @$internal
  @override
  DeviceMultiSelectsState create() => DeviceMultiSelectsState();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<DeviceModel> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<DeviceModel>>(value),
    );
  }
}

String _$deviceMultiSelectsStateHash() =>
    r'ce2caa00efe4d107e3f59d88c107ad2fa7c12377';

abstract class _$DeviceMultiSelectsState extends $Notifier<List<DeviceModel>> {
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
