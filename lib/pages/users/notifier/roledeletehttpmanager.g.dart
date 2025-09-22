// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'roledeletehttpmanager.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(RoleDeleteHttpManager)
const roleDeleteHttpManagerProvider = RoleDeleteHttpManagerProvider._();

final class RoleDeleteHttpManagerProvider
    extends $NotifierProvider<RoleDeleteHttpManager, DeleteRoleResponseEntity> {
  const RoleDeleteHttpManagerProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'roleDeleteHttpManagerProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$roleDeleteHttpManagerHash();

  @$internal
  @override
  RoleDeleteHttpManager create() => RoleDeleteHttpManager();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DeleteRoleResponseEntity value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DeleteRoleResponseEntity>(value),
    );
  }
}

String _$roleDeleteHttpManagerHash() =>
    r'f10e371a6a5022066de44eed7517497bcee50cda';

abstract class _$RoleDeleteHttpManager
    extends $Notifier<DeleteRoleResponseEntity> {
  DeleteRoleResponseEntity build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<DeleteRoleResponseEntity, DeleteRoleResponseEntity>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<DeleteRoleResponseEntity, DeleteRoleResponseEntity>,
        DeleteRoleResponseEntity,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
