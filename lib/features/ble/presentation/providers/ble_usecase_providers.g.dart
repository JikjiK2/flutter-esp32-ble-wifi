// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ble_usecase_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(connectDeviceUseCase)
const connectDeviceUseCaseProvider = ConnectDeviceUseCaseProvider._();

final class ConnectDeviceUseCaseProvider
    extends
        $FunctionalProvider<
          ConnectDeviceUseCase,
          ConnectDeviceUseCase,
          ConnectDeviceUseCase
        >
    with $Provider<ConnectDeviceUseCase> {
  const ConnectDeviceUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'connectDeviceUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$connectDeviceUseCaseHash();

  @$internal
  @override
  $ProviderElement<ConnectDeviceUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ConnectDeviceUseCase create(Ref ref) {
    return connectDeviceUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ConnectDeviceUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ConnectDeviceUseCase>(value),
    );
  }
}

String _$connectDeviceUseCaseHash() =>
    r'd909b5ac046c57695df36082dde90dabb443bdf1';
