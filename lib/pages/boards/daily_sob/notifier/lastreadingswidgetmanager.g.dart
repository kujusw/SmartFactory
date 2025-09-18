// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lastreadingswidgetmanager.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(LastReadingsWidget)
const lastReadingsWidgetProvider = LastReadingsWidgetProvider._();

final class LastReadingsWidgetProvider extends $NotifierProvider<
    LastReadingsWidget, List<BoardsChartWidgetModel>> {
  const LastReadingsWidgetProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'lastReadingsWidgetProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$lastReadingsWidgetHash();

  @$internal
  @override
  LastReadingsWidget create() => LastReadingsWidget();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<BoardsChartWidgetModel> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<BoardsChartWidgetModel>>(value),
    );
  }
}

String _$lastReadingsWidgetHash() =>
    r'471c5631e0970beea87dd939049eaf6dbe61ff86';

abstract class _$LastReadingsWidget
    extends $Notifier<List<BoardsChartWidgetModel>> {
  List<BoardsChartWidgetModel> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref
        as $Ref<List<BoardsChartWidgetModel>, List<BoardsChartWidgetModel>>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<List<BoardsChartWidgetModel>, List<BoardsChartWidgetModel>>,
        List<BoardsChartWidgetModel>,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
