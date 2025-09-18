// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'boardstabaddhttpmanager.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(BoardsTabAdd)
const boardsTabAddProvider = BoardsTabAddProvider._();

final class BoardsTabAddProvider
    extends $NotifierProvider<BoardsTabAdd, AddBoardsTabResponseEntity> {
  const BoardsTabAddProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'boardsTabAddProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$boardsTabAddHash();

  @$internal
  @override
  BoardsTabAdd create() => BoardsTabAdd();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AddBoardsTabResponseEntity value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AddBoardsTabResponseEntity>(value),
    );
  }
}

String _$boardsTabAddHash() => r'245c020cd5bc14ca46c70a545cfbde7b2f18a9a4';

abstract class _$BoardsTabAdd extends $Notifier<AddBoardsTabResponseEntity> {
  AddBoardsTabResponseEntity build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref
        as $Ref<AddBoardsTabResponseEntity, AddBoardsTabResponseEntity>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AddBoardsTabResponseEntity, AddBoardsTabResponseEntity>,
        AddBoardsTabResponseEntity,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
