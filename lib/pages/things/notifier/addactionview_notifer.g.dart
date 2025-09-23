// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'addactionview_notifer.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AddDeviceName)
const addDeviceNameProvider = AddDeviceNameProvider._();

final class AddDeviceNameProvider
    extends $NotifierProvider<AddDeviceName, String> {
  const AddDeviceNameProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'addDeviceNameProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$addDeviceNameHash();

  @$internal
  @override
  AddDeviceName create() => AddDeviceName();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$addDeviceNameHash() => r'e21ef4c7201c0a1e8a62f7934364992b78dbb784';

abstract class _$AddDeviceName extends $Notifier<String> {
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

@ProviderFor(AddWarningYellowThreshold)
const addWarningYellowThresholdProvider = AddWarningYellowThresholdProvider._();

final class AddWarningYellowThresholdProvider
    extends $NotifierProvider<AddWarningYellowThreshold, double> {
  const AddWarningYellowThresholdProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'addWarningYellowThresholdProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$addWarningYellowThresholdHash();

  @$internal
  @override
  AddWarningYellowThreshold create() => AddWarningYellowThreshold();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(double value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<double>(value),
    );
  }
}

String _$addWarningYellowThresholdHash() =>
    r'c291608225bedd4b4d568c1ab877bbe7be664cfd';

abstract class _$AddWarningYellowThreshold extends $Notifier<double> {
  double build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<double, double>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<double, double>, double, Object?, Object?>;
    element.handleValue(ref, created);
  }
}

@ProviderFor(AddWarningRedThreshold)
const addWarningRedThresholdProvider = AddWarningRedThresholdProvider._();

final class AddWarningRedThresholdProvider
    extends $NotifierProvider<AddWarningRedThreshold, double> {
  const AddWarningRedThresholdProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'addWarningRedThresholdProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$addWarningRedThresholdHash();

  @$internal
  @override
  AddWarningRedThreshold create() => AddWarningRedThreshold();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(double value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<double>(value),
    );
  }
}

String _$addWarningRedThresholdHash() =>
    r'6244d09fe575c98dfa83d4d0b5369075e0466f57';

abstract class _$AddWarningRedThreshold extends $Notifier<double> {
  double build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<double, double>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<double, double>, double, Object?, Object?>;
    element.handleValue(ref, created);
  }
}
