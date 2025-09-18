// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resetpasswordmanager.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ResetPassword)
const resetPasswordProvider = ResetPasswordProvider._();

final class ResetPasswordProvider
    extends $NotifierProvider<ResetPassword, ResetPasswordResponseEntity> {
  const ResetPasswordProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'resetPasswordProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$resetPasswordHash();

  @$internal
  @override
  ResetPassword create() => ResetPassword();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ResetPasswordResponseEntity value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ResetPasswordResponseEntity>(value),
    );
  }
}

String _$resetPasswordHash() => r'9b4c5bef4a6a492dabaf230780d5176f65c8f8f7';

abstract class _$ResetPassword extends $Notifier<ResetPasswordResponseEntity> {
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
