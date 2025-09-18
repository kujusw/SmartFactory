// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'boards_delete_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(BoardsDelete)
const boardsDeleteProvider = BoardsDeleteProvider._();

final class BoardsDeleteProvider extends $NotifierProvider<BoardsDelete, bool> {
  const BoardsDeleteProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'boardsDeleteProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$boardsDeleteHash();

  @$internal
  @override
  BoardsDelete create() => BoardsDelete();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$boardsDeleteHash() => r'27b964badb4ffa1a9fbe83ea36210aef7e01cb9a';

abstract class _$BoardsDelete extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<bool, bool>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<bool, bool>, bool, Object?, Object?>;
    element.handleValue(ref, created);
  }
}
