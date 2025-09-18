// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'boardswidgetaddhttpmanager.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(BoardsWidgetAdd)
const boardsWidgetAddProvider = BoardsWidgetAddProvider._();

final class BoardsWidgetAddProvider
    extends $NotifierProvider<BoardsWidgetAdd, AddBoardsWidgetResponseEntity> {
  const BoardsWidgetAddProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'boardsWidgetAddProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$boardsWidgetAddHash();

  @$internal
  @override
  BoardsWidgetAdd create() => BoardsWidgetAdd();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AddBoardsWidgetResponseEntity value) {
    return $ProviderOverride(
      origin: this,
      providerOverride:
          $SyncValueProvider<AddBoardsWidgetResponseEntity>(value),
    );
  }
}

String _$boardsWidgetAddHash() => r'453e56b0109648112b9c8ff6c626ae95663e2fd6';

abstract class _$BoardsWidgetAdd
    extends $Notifier<AddBoardsWidgetResponseEntity> {
  AddBoardsWidgetResponseEntity build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref
        as $Ref<AddBoardsWidgetResponseEntity, AddBoardsWidgetResponseEntity>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AddBoardsWidgetResponseEntity,
            AddBoardsWidgetResponseEntity>,
        AddBoardsWidgetResponseEntity,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
