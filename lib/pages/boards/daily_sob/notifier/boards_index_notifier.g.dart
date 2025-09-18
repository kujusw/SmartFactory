// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'boards_index_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(BoardsIndex)
const boardsIndexProvider = BoardsIndexProvider._();

final class BoardsIndexProvider extends $NotifierProvider<BoardsIndex, int> {
  const BoardsIndexProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'boardsIndexProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$boardsIndexHash();

  @$internal
  @override
  BoardsIndex create() => BoardsIndex();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$boardsIndexHash() => r'ba4bc19bdba8c4759466a99673d219b7019b44a5';

abstract class _$BoardsIndex extends $Notifier<int> {
  int build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<int, int>;
    final element = ref.element
        as $ClassProviderElement<AnyNotifier<int, int>, int, Object?, Object?>;
    element.handleValue(ref, created);
  }
}
