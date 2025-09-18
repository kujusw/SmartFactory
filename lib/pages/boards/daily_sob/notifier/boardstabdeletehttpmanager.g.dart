// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'boardstabdeletehttpmanager.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(BoardsTabDelete)
const boardsTabDeleteProvider = BoardsTabDeleteProvider._();

final class BoardsTabDeleteProvider
    extends $NotifierProvider<BoardsTabDelete, DeleteBoardsTabResponseEntity> {
  const BoardsTabDeleteProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'boardsTabDeleteProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$boardsTabDeleteHash();

  @$internal
  @override
  BoardsTabDelete create() => BoardsTabDelete();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DeleteBoardsTabResponseEntity value) {
    return $ProviderOverride(
      origin: this,
      providerOverride:
          $SyncValueProvider<DeleteBoardsTabResponseEntity>(value),
    );
  }
}

String _$boardsTabDeleteHash() => r'0ac2cc156e82c006bb72ffa49e60bb050a834934';

abstract class _$BoardsTabDelete
    extends $Notifier<DeleteBoardsTabResponseEntity> {
  DeleteBoardsTabResponseEntity build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref
        as $Ref<DeleteBoardsTabResponseEntity, DeleteBoardsTabResponseEntity>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<DeleteBoardsTabResponseEntity,
            DeleteBoardsTabResponseEntity>,
        DeleteBoardsTabResponseEntity,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
