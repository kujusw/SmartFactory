// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_detail_chart_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ChartDataType)
const chartDataTypeProvider = ChartDataTypeProvider._();

final class ChartDataTypeProvider
    extends $NotifierProvider<ChartDataType, String> {
  const ChartDataTypeProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'chartDataTypeProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$chartDataTypeHash();

  @$internal
  @override
  ChartDataType create() => ChartDataType();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$chartDataTypeHash() => r'cd608c80452c6972cb36a4fdf894cffeb53918d8';

abstract class _$ChartDataType extends $Notifier<String> {
  String build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<String, String>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<String, String>, String, Object?, Object?>;
    element.handleValue(ref, created);
  }
}

@ProviderFor(ChartDataStart)
const chartDataStartProvider = ChartDataStartProvider._();

final class ChartDataStartProvider
    extends $NotifierProvider<ChartDataStart, String?> {
  const ChartDataStartProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'chartDataStartProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$chartDataStartHash();

  @$internal
  @override
  ChartDataStart create() => ChartDataStart();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String?>(value),
    );
  }
}

String _$chartDataStartHash() => r'83bbc9558c269ce5c9bb6cdeb6dfe1d4ecfe99aa';

abstract class _$ChartDataStart extends $Notifier<String?> {
  String? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<String?, String?>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<String?, String?>, String?, Object?, Object?>;
    element.handleValue(ref, created);
  }
}

@ProviderFor(ChartDataEnd)
const chartDataEndProvider = ChartDataEndProvider._();

final class ChartDataEndProvider
    extends $NotifierProvider<ChartDataEnd, String?> {
  const ChartDataEndProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'chartDataEndProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$chartDataEndHash();

  @$internal
  @override
  ChartDataEnd create() => ChartDataEnd();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String?>(value),
    );
  }
}

String _$chartDataEndHash() => r'8ddd5e9ff7a08f69ba8be7d16c7dd626134a09a8';

abstract class _$ChartDataEnd extends $Notifier<String?> {
  String? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<String?, String?>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<String?, String?>, String?, Object?, Object?>;
    element.handleValue(ref, created);
  }
}
