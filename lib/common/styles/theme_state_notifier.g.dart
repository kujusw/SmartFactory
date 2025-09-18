// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_state_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 是否启用深色模式

@ProviderFor(DarkTheme)
const darkThemeProvider = DarkThemeProvider._();

/// 是否启用深色模式
final class DarkThemeProvider extends $NotifierProvider<DarkTheme, bool> {
  /// 是否启用深色模式
  const DarkThemeProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'darkThemeProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$darkThemeHash();

  @$internal
  @override
  DarkTheme create() => DarkTheme();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$darkThemeHash() => r'9ef54ec059d8e0a0092abcce4b943ae70ff8108d';

/// 是否启用深色模式

abstract class _$DarkTheme extends $Notifier<bool> {
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

/// 颜色主题

@ProviderFor(color)
const colorProvider = ColorProvider._();

/// 颜色主题

final class ColorProvider extends $FunctionalProvider<Map<String, Color>,
    Map<String, Color>, Map<String, Color>> with $Provider<Map<String, Color>> {
  /// 颜色主题
  const ColorProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'colorProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$colorHash();

  @$internal
  @override
  $ProviderElement<Map<String, Color>> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Map<String, Color> create(Ref ref) {
    return color(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Map<String, Color> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Map<String, Color>>(value),
    );
  }
}

String _$colorHash() => r'0e2bcb1dfe47bcdd7560500094f3299a6efbf5d0';
