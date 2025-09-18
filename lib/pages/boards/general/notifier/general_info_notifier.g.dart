// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'general_info_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getGeneralGlobalInfo)
const getGeneralGlobalInfoProvider = GetGeneralGlobalInfoProvider._();

final class GetGeneralGlobalInfoProvider extends $FunctionalProvider<
        AsyncValue<Overview>, Overview, FutureOr<Overview>>
    with $FutureModifier<Overview>, $FutureProvider<Overview> {
  const GetGeneralGlobalInfoProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'getGeneralGlobalInfoProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$getGeneralGlobalInfoHash();

  @$internal
  @override
  $FutureProviderElement<Overview> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Overview> create(Ref ref) {
    return getGeneralGlobalInfo(ref);
  }
}

String _$getGeneralGlobalInfoHash() =>
    r'0cbfded6ee0bcd2a57fe6a2b9aa4f77b15bd31f8';
