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
          isAutoDispose: true,
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

String _$addDeviceNameHash() => r'51f47277a6bd08cb30b01e4a25fe67ae3b0223f1';

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
