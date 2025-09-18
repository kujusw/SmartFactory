// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chartwidgetmanager.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ChartWidget)
const chartWidgetProvider = ChartWidgetProvider._();

final class ChartWidgetProvider
    extends $NotifierProvider<ChartWidget, List<BoardsChartWidgetModel>> {
  const ChartWidgetProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'chartWidgetProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$chartWidgetHash();

  @$internal
  @override
  ChartWidget create() => ChartWidget();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<BoardsChartWidgetModel> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<BoardsChartWidgetModel>>(value),
    );
  }
}

String _$chartWidgetHash() => r'29f3ba178dc0fde55a5ba8e5658c79b7d88a1970';

abstract class _$ChartWidget extends $Notifier<List<BoardsChartWidgetModel>> {
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
