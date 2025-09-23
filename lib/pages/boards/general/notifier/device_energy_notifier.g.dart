// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_energy_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(DeviceEnergy)
const deviceEnergyProvider = DeviceEnergyFamily._();

final class DeviceEnergyProvider
    extends $AsyncNotifierProvider<DeviceEnergy, DeviceEnergyResponseEntity> {
  const DeviceEnergyProvider._(
      {required DeviceEnergyFamily super.from,
      required (
        String,
        String,
      )
          super.argument})
      : super(
          retry: null,
          name: r'deviceEnergyProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$deviceEnergyHash();

  @override
  String toString() {
    return r'deviceEnergyProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  DeviceEnergy create() => DeviceEnergy();

  @override
  bool operator ==(Object other) {
    return other is DeviceEnergyProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$deviceEnergyHash() => r'6b3c39a68f07890e69915e2243d90f94a0e11442';

final class DeviceEnergyFamily extends $Family
    with
        $ClassFamilyOverride<
            DeviceEnergy,
            AsyncValue<DeviceEnergyResponseEntity>,
            DeviceEnergyResponseEntity,
            FutureOr<DeviceEnergyResponseEntity>,
            (
              String,
              String,
            )> {
  const DeviceEnergyFamily._()
      : super(
          retry: null,
          name: r'deviceEnergyProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  DeviceEnergyProvider call(
    String deviceId,
    String token,
  ) =>
      DeviceEnergyProvider._(argument: (
        deviceId,
        token,
      ), from: this);

  @override
  String toString() => r'deviceEnergyProvider';
}

abstract class _$DeviceEnergy
    extends $AsyncNotifier<DeviceEnergyResponseEntity> {
  late final _$args = ref.$arg as (
    String,
    String,
  );
  String get deviceId => _$args.$1;
  String get token => _$args.$2;

  FutureOr<DeviceEnergyResponseEntity> build(
    String deviceId,
    String token,
  );
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(
      _$args.$1,
      _$args.$2,
    );
    final ref = this.ref as $Ref<AsyncValue<DeviceEnergyResponseEntity>,
        DeviceEnergyResponseEntity>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<DeviceEnergyResponseEntity>,
            DeviceEnergyResponseEntity>,
        AsyncValue<DeviceEnergyResponseEntity>,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}

@ProviderFor(generalDeviceEnergy)
const generalDeviceEnergyProvider = GeneralDeviceEnergyFamily._();

final class GeneralDeviceEnergyProvider extends $FunctionalProvider<
    List<GeneralDeviceInfoModel>,
    List<GeneralDeviceInfoModel>,
    List<GeneralDeviceInfoModel>> with $Provider<List<GeneralDeviceInfoModel>> {
  const GeneralDeviceEnergyProvider._(
      {required GeneralDeviceEnergyFamily super.from,
      required (
        DeviceModel,
        String,
      )
          super.argument})
      : super(
          retry: null,
          name: r'generalDeviceEnergyProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$generalDeviceEnergyHash();

  @override
  String toString() {
    return r'generalDeviceEnergyProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $ProviderElement<List<GeneralDeviceInfoModel>> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<GeneralDeviceInfoModel> create(Ref ref) {
    final argument = this.argument as (
      DeviceModel,
      String,
    );
    return generalDeviceEnergy(
      ref,
      argument.$1,
      argument.$2,
    );
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<GeneralDeviceInfoModel> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<GeneralDeviceInfoModel>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is GeneralDeviceEnergyProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$generalDeviceEnergyHash() =>
    r'6e9aac71c39e82fce82ec472651d98798179f1b2';

final class GeneralDeviceEnergyFamily extends $Family
    with
        $FunctionalFamilyOverride<
            List<GeneralDeviceInfoModel>,
            (
              DeviceModel,
              String,
            )> {
  const GeneralDeviceEnergyFamily._()
      : super(
          retry: null,
          name: r'generalDeviceEnergyProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  GeneralDeviceEnergyProvider call(
    DeviceModel selectedDevice,
    String token,
  ) =>
      GeneralDeviceEnergyProvider._(argument: (
        selectedDevice,
        token,
      ), from: this);

  @override
  String toString() => r'generalDeviceEnergyProvider';
}
