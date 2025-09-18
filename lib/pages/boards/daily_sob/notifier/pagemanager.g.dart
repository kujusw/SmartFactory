// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagemanager.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// ==================== Page 管理 ====================

@ProviderFor(Page)
const pageProvider = PageProvider._();

/// ==================== Page 管理 ====================
final class PageProvider extends $NotifierProvider<Page, List<BoardsTabModel>> {
  /// ==================== Page 管理 ====================
  const PageProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'pageProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$pageHash();

  @$internal
  @override
  Page create() => Page();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<BoardsTabModel> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<BoardsTabModel>>(value),
    );
  }
}

String _$pageHash() => r'40bd3cff55d2fb0e98b880ae66bafb5753c5c967';

/// ==================== Page 管理 ====================

abstract class _$Page extends $Notifier<List<BoardsTabModel>> {
  List<BoardsTabModel> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<List<BoardsTabModel>, List<BoardsTabModel>>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<List<BoardsTabModel>, List<BoardsTabModel>>,
        List<BoardsTabModel>,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
