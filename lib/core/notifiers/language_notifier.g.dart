// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'language_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(LanguageNotifier)
const languageProvider = LanguageNotifierProvider._();

final class LanguageNotifierProvider
    extends $AsyncNotifierProvider<LanguageNotifier, Locale?> {
  const LanguageNotifierProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'languageProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$languageNotifierHash();

  @$internal
  @override
  LanguageNotifier create() => LanguageNotifier();
}

String _$languageNotifierHash() => r'8fbfd7fe774440d15fc819ed6a4eeb8a65acf94d';

abstract class _$LanguageNotifier extends $AsyncNotifier<Locale?> {
  FutureOr<Locale?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<Locale?>, Locale?>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<Locale?>, Locale?>,
        AsyncValue<Locale?>,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
