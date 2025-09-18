// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'boardswidgetdeletehttpmanager.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(BoardsWidgetDelete)
const boardsWidgetDeleteProvider = BoardsWidgetDeleteProvider._();

final class BoardsWidgetDeleteProvider extends $NotifierProvider<
    BoardsWidgetDelete, DeleteBoardsWidgetResponseEntity> {
  const BoardsWidgetDeleteProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'boardsWidgetDeleteProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$boardsWidgetDeleteHash();

  @$internal
  @override
  BoardsWidgetDelete create() => BoardsWidgetDelete();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DeleteBoardsWidgetResponseEntity value) {
    return $ProviderOverride(
      origin: this,
      providerOverride:
          $SyncValueProvider<DeleteBoardsWidgetResponseEntity>(value),
    );
  }
}

String _$boardsWidgetDeleteHash() =>
    r'62ca198f1289f8360d86fb714622b2d2941c5054';

abstract class _$BoardsWidgetDelete
    extends $Notifier<DeleteBoardsWidgetResponseEntity> {
  DeleteBoardsWidgetResponseEntity build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<DeleteBoardsWidgetResponseEntity,
        DeleteBoardsWidgetResponseEntity>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<DeleteBoardsWidgetResponseEntity,
            DeleteBoardsWidgetResponseEntity>,
        DeleteBoardsWidgetResponseEntity,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
