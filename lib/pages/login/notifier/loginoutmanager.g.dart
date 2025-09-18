// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loginoutmanager.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(LoginOut)
const loginOutProvider = LoginOutProvider._();

final class LoginOutProvider
    extends $NotifierProvider<LoginOut, LoginOutResponseEntity> {
  const LoginOutProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'loginOutProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$loginOutHash();

  @$internal
  @override
  LoginOut create() => LoginOut();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LoginOutResponseEntity value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LoginOutResponseEntity>(value),
    );
  }
}

String _$loginOutHash() => r'ec0e7c506303eece855c3fbc2d3fc14e0d9b4398';

abstract class _$LoginOut extends $Notifier<LoginOutResponseEntity> {
  LoginOutResponseEntity build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<LoginOutResponseEntity, LoginOutResponseEntity>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<LoginOutResponseEntity, LoginOutResponseEntity>,
        LoginOutResponseEntity,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
