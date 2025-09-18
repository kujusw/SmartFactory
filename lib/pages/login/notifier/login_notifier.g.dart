// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Signin)
const signinProvider = SigninProvider._();

final class SigninProvider extends $NotifierProvider<Signin, String> {
  const SigninProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'signinProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$signinHash();

  @$internal
  @override
  Signin create() => Signin();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$signinHash() => r'0327207f2e86712006e20433253aacdad64c7a78';

abstract class _$Signin extends $Notifier<String> {
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

@ProviderFor(LoginUserName)
const loginUserNameProvider = LoginUserNameProvider._();

final class LoginUserNameProvider
    extends $NotifierProvider<LoginUserName, String> {
  const LoginUserNameProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'loginUserNameProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$loginUserNameHash();

  @$internal
  @override
  LoginUserName create() => LoginUserName();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$loginUserNameHash() => r'02ab6ac3072b8edf9159bf154181ca89d4322363';

abstract class _$LoginUserName extends $Notifier<String> {
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

@ProviderFor(LoginTime)
const loginTimeProvider = LoginTimeProvider._();

final class LoginTimeProvider extends $NotifierProvider<LoginTime, String> {
  const LoginTimeProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'loginTimeProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$loginTimeHash();

  @$internal
  @override
  LoginTime create() => LoginTime();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$loginTimeHash() => r'e20892a4585d1fb13752f97a01187775f9be9e82';

abstract class _$LoginTime extends $Notifier<String> {
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

@ProviderFor(LoginTips)
const loginTipsProvider = LoginTipsProvider._();

final class LoginTipsProvider extends $NotifierProvider<LoginTips, String> {
  const LoginTipsProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'loginTipsProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$loginTipsHash();

  @$internal
  @override
  LoginTips create() => LoginTips();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$loginTipsHash() => r'98da8f5bf343208023fec0fa0efc63a143974e5c';

abstract class _$LoginTips extends $Notifier<String> {
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

String _$loginHash() => r'334d30183e806e7ce0f4e12403d4ad6886c1da99';

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

String _$registerHash() => r'285fd85791f26b4e981b41830fe527f53ee0548e';

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

@ProviderFor(ResetPasswordr)
const resetPasswordrProvider = ResetPasswordrProvider._();

final class ResetPasswordrProvider
    extends $NotifierProvider<ResetPasswordr, ResetPasswordResponseEntity> {
  const ResetPasswordrProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'resetPasswordrProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$resetPasswordrHash();

  @$internal
  @override
  ResetPasswordr create() => ResetPasswordr();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ResetPasswordResponseEntity value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ResetPasswordResponseEntity>(value),
    );
  }
}

String _$resetPasswordrHash() => r'd81a865b742597b536b2c6fea54ba7ced36a48df';

abstract class _$ResetPasswordr extends $Notifier<ResetPasswordResponseEntity> {
  ResetPasswordResponseEntity build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref
        as $Ref<ResetPasswordResponseEntity, ResetPasswordResponseEntity>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<ResetPasswordResponseEntity, ResetPasswordResponseEntity>,
        ResetPasswordResponseEntity,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}

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

String _$loginOutHash() => r'2c1fe8076df977420619e6ea9b202308af35202d';

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
