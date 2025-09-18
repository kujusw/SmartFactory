// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'useraddhttpmanager.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(UserAddHttp)
const userAddHttpProvider = UserAddHttpProvider._();

final class UserAddHttpProvider
    extends $NotifierProvider<UserAddHttp, AddUserResponseEntity> {
  const UserAddHttpProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'userAddHttpProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$userAddHttpHash();

  @$internal
  @override
  UserAddHttp create() => UserAddHttp();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AddUserResponseEntity value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AddUserResponseEntity>(value),
    );
  }
}

String _$userAddHttpHash() => r'2a937a72e5c134230e91b6a0cb2ce31596b0b83e';

abstract class _$UserAddHttp extends $Notifier<AddUserResponseEntity> {
  AddUserResponseEntity build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AddUserResponseEntity, AddUserResponseEntity>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AddUserResponseEntity, AddUserResponseEntity>,
        AddUserResponseEntity,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
