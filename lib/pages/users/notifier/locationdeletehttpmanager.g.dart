// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'locationdeletehttpmanager.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(LocationDeleteHttpManager)
const locationDeleteHttpManagerProvider = LocationDeleteHttpManagerProvider._();

final class LocationDeleteHttpManagerProvider extends $NotifierProvider<
    LocationDeleteHttpManager, DeleteLocationResponseEntity> {
  const LocationDeleteHttpManagerProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'locationDeleteHttpManagerProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$locationDeleteHttpManagerHash();

  @$internal
  @override
  LocationDeleteHttpManager create() => LocationDeleteHttpManager();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DeleteLocationResponseEntity value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DeleteLocationResponseEntity>(value),
    );
  }
}

String _$locationDeleteHttpManagerHash() =>
    r'8016d9126f8afd68f843c92cd43a6a3a0baad98d';

abstract class _$LocationDeleteHttpManager
    extends $Notifier<DeleteLocationResponseEntity> {
  DeleteLocationResponseEntity build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref
        as $Ref<DeleteLocationResponseEntity, DeleteLocationResponseEntity>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<DeleteLocationResponseEntity, DeleteLocationResponseEntity>,
        DeleteLocationResponseEntity,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
