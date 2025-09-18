// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'widgetmanager.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(WidgetManager)
const widgetManagerProvider = WidgetManagerProvider._();

final class WidgetManagerProvider
    extends $NotifierProvider<WidgetManager, List<WidgetModel>> {
  const WidgetManagerProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'widgetManagerProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$widgetManagerHash();

  @$internal
  @override
  WidgetManager create() => WidgetManager();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<WidgetModel> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<WidgetModel>>(value),
    );
  }
}

String _$widgetManagerHash() => r'0cb0ad1c95668ad6e63b1abffb5e5cd58d93e775';

abstract class _$WidgetManager extends $Notifier<List<WidgetModel>> {
  List<WidgetModel> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<List<WidgetModel>, List<WidgetModel>>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<List<WidgetModel>, List<WidgetModel>>,
        List<WidgetModel>,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
