// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loginmanager.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Login)
const loginProvider = LoginProvider._();

final class LoginProvider
    extends $NotifierProvider<Login, LoginResponseEntity> {
  const LoginProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'loginProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$loginHash();

  @$internal
  @override
  Login create() => Login();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LoginResponseEntity value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LoginResponseEntity>(value),
    );
  }
}

String _$loginHash() => r'74a8aaccd5388309e74eb5547d7d6abf5cc18981';

abstract class _$Login extends $Notifier<LoginResponseEntity> {
  LoginResponseEntity build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<LoginResponseEntity, LoginResponseEntity>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<LoginResponseEntity, LoginResponseEntity>,
        LoginResponseEntity,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
