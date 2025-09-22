// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'useruimanager.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(UserUIManager)
const userUIManagerProvider = UserUIManagerProvider._();

final class UserUIManagerProvider
    extends $NotifierProvider<UserUIManager, List<UserModel>> {
  const UserUIManagerProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'userUIManagerProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$userUIManagerHash();

  @$internal
  @override
  UserUIManager create() => UserUIManager();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<UserModel> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<UserModel>>(value),
    );
  }
}

String _$userUIManagerHash() => r'64ca6cad6d76cce9e0a1a4ca9431a774320a30bb';

abstract class _$UserUIManager extends $Notifier<List<UserModel>> {
  List<UserModel> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<List<UserModel>, List<UserModel>>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<List<UserModel>, List<UserModel>>,
        List<UserModel>,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
