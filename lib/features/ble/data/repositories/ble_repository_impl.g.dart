// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ble_repository_impl.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(blePlatformDataSource)
const blePlatformDataSourceProvider = BlePlatformDataSourceProvider._();

final class BlePlatformDataSourceProvider
    extends
        $FunctionalProvider<
          BlePlatformDataSource,
          BlePlatformDataSource,
          BlePlatformDataSource
        >
    with $Provider<BlePlatformDataSource> {
  const BlePlatformDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'blePlatformDataSourceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$blePlatformDataSourceHash();

  @$internal
  @override
  $ProviderElement<BlePlatformDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  BlePlatformDataSource create(Ref ref) {
    return blePlatformDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BlePlatformDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BlePlatformDataSource>(value),
    );
  }
}

String _$blePlatformDataSourceHash() =>
    r'6f649a8f09249db9d900d44ab8fe7a24f8b08538';
