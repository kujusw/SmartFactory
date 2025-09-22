// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'roleaddhttpmanager.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AddRoleName)
const addRoleNameProvider = AddRoleNameProvider._();

final class AddRoleNameProvider extends $NotifierProvider<AddRoleName, String> {
  const AddRoleNameProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'addRoleNameProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$addRoleNameHash();

  @$internal
  @override
  AddRoleName create() => AddRoleName();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$addRoleNameHash() => r'f66b748ad17df460db67c928d97d521ca42bf5bf';

abstract class _$AddRoleName extends $Notifier<String> {
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

@ProviderFor(RoleAddHttpManager)
const roleAddHttpManagerProvider = RoleAddHttpManagerProvider._();

final class RoleAddHttpManagerProvider
    extends $NotifierProvider<RoleAddHttpManager, AddRoleResponseEntity> {
  const RoleAddHttpManagerProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'roleAddHttpManagerProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$roleAddHttpManagerHash();

  @$internal
  @override
  RoleAddHttpManager create() => RoleAddHttpManager();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AddRoleResponseEntity value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AddRoleResponseEntity>(value),
    );
  }
}

String _$roleAddHttpManagerHash() =>
    r'b8f30b422018a1aa1512e5d750f61d4e54af73a6';

abstract class _$RoleAddHttpManager extends $Notifier<AddRoleResponseEntity> {
  AddRoleResponseEntity build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AddRoleResponseEntity, AddRoleResponseEntity>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AddRoleResponseEntity, AddRoleResponseEntity>,
        AddRoleResponseEntity,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
