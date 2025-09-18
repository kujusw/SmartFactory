// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'floatbuttonmanager.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(FloatButton)
const floatButtonProvider = FloatButtonProvider._();

final class FloatButtonProvider extends $NotifierProvider<FloatButton, String> {
  const FloatButtonProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'floatButtonProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$floatButtonHash();

  @$internal
  @override
  FloatButton create() => FloatButton();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$floatButtonHash() => r'2476b8b07f6a2ec870d739306f671192250c6d16';

abstract class _$FloatButton extends $Notifier<String> {
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
