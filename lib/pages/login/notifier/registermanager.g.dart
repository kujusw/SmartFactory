// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registermanager.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ObscureText)
const obscureTextProvider = ObscureTextProvider._();

final class ObscureTextProvider extends $NotifierProvider<ObscureText, bool> {
  const ObscureTextProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'obscureTextProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$obscureTextHash();

  @$internal
  @override
  ObscureText create() => ObscureText();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$obscureTextHash() => r'92c848a1e2b1b178c0771ff83c5187b093a89b1e';

abstract class _$ObscureText extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<bool, bool>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<bool, bool>, bool, Object?, Object?>;
    element.handleValue(ref, created);
  }
}

@ProviderFor(RegisterTips)
const registerTipsProvider = RegisterTipsProvider._();

final class RegisterTipsProvider
    extends $NotifierProvider<RegisterTips, String> {
  const RegisterTipsProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'registerTipsProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$registerTipsHash();

  @$internal
  @override
  RegisterTips create() => RegisterTips();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$registerTipsHash() => r'0f700c052decbc63de075eb92902ba7dd0b12ec6';

abstract class _$RegisterTips extends $Notifier<String> {
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

@ProviderFor(Register)
const registerProvider = RegisterProvider._();

final class RegisterProvider
    extends $NotifierProvider<Register, RegisterResponseEntity> {
  const RegisterProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'registerProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$registerHash();

  @$internal
  @override
  Register create() => Register();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RegisterResponseEntity value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RegisterResponseEntity>(value),
    );
  }
}

String _$registerHash() => r'43cd83f96af7996e9f39560e193740018ab8a17d';

abstract class _$Register extends $Notifier<RegisterResponseEntity> {
  RegisterResponseEntity build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<RegisterResponseEntity, RegisterResponseEntity>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<RegisterResponseEntity, RegisterResponseEntity>,
        RegisterResponseEntity,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
