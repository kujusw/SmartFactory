// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setpermissionmanager.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SetPermissionManager)
const setPermissionManagerProvider = SetPermissionManagerProvider._();

final class SetPermissionManagerProvider
    extends $NotifierProvider<SetPermissionManager, List<RolePermissionModel>> {
  const SetPermissionManagerProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'setPermissionManagerProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$setPermissionManagerHash();

  @$internal
  @override
  SetPermissionManager create() => SetPermissionManager();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<RolePermissionModel> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<RolePermissionModel>>(value),
    );
  }
}

String _$setPermissionManagerHash() =>
    r'633c59c145fe0b32b47f1664976d0fe4a40fe425';

abstract class _$SetPermissionManager
    extends $Notifier<List<RolePermissionModel>> {
  List<RolePermissionModel> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<List<RolePermissionModel>, List<RolePermissionModel>>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<List<RolePermissionModel>, List<RolePermissionModel>>,
        List<RolePermissionModel>,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
