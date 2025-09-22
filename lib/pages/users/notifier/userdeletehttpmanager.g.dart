// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userdeletehttpmanager.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(UserDeleteHttpManager)
const userDeleteHttpManagerProvider = UserDeleteHttpManagerProvider._();

final class UserDeleteHttpManagerProvider
    extends $NotifierProvider<UserDeleteHttpManager, DeleteUserResponseEntity> {
  const UserDeleteHttpManagerProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'userDeleteHttpManagerProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$userDeleteHttpManagerHash();

  @$internal
  @override
  UserDeleteHttpManager create() => UserDeleteHttpManager();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DeleteUserResponseEntity value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DeleteUserResponseEntity>(value),
    );
  }
}

String _$userDeleteHttpManagerHash() =>
    r'c77ef6498ce4c8b153758dc0a9d8eeeb7ee639cb';

abstract class _$UserDeleteHttpManager
    extends $Notifier<DeleteUserResponseEntity> {
  DeleteUserResponseEntity build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<DeleteUserResponseEntity, DeleteUserResponseEntity>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<DeleteUserResponseEntity, DeleteUserResponseEntity>,
        DeleteUserResponseEntity,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
