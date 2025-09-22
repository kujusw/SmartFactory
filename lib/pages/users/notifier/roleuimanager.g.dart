// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'roleuimanager.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(RoleUIManager)
const roleUIManagerProvider = RoleUIManagerProvider._();

final class RoleUIManagerProvider
    extends $NotifierProvider<RoleUIManager, List<RoleModel>> {
  const RoleUIManagerProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'roleUIManagerProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$roleUIManagerHash();

  @$internal
  @override
  RoleUIManager create() => RoleUIManager();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<RoleModel> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<RoleModel>>(value),
    );
  }
}

String _$roleUIManagerHash() => r'0e4c0bbc326d609be70a7ac8494a52026d47dde3';

abstract class _$RoleUIManager extends $Notifier<List<RoleModel>> {
  List<RoleModel> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<List<RoleModel>, List<RoleModel>>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<List<RoleModel>, List<RoleModel>>,
        List<RoleModel>,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
