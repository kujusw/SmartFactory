// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'permissionselectuimanager.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PermissionSelectUIManager)
const permissionSelectUIManagerProvider = PermissionSelectUIManagerProvider._();

final class PermissionSelectUIManagerProvider extends $NotifierProvider<
    PermissionSelectUIManager, List<PermissionSelect>> {
  const PermissionSelectUIManagerProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'permissionSelectUIManagerProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$permissionSelectUIManagerHash();

  @$internal
  @override
  PermissionSelectUIManager create() => PermissionSelectUIManager();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<PermissionSelect> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<PermissionSelect>>(value),
    );
  }
}

String _$permissionSelectUIManagerHash() =>
    r'4a7f3d949786f6a11bd65f3852398f04de24736e';

abstract class _$PermissionSelectUIManager
    extends $Notifier<List<PermissionSelect>> {
  List<PermissionSelect> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<List<PermissionSelect>, List<PermissionSelect>>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<List<PermissionSelect>, List<PermissionSelect>>,
        List<PermissionSelect>,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
