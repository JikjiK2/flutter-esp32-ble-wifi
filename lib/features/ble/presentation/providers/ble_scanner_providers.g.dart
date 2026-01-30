// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ble_scanner_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(bluetoothAdapterState)
const bluetoothAdapterStateProvider = BluetoothAdapterStateProvider._();

final class BluetoothAdapterStateProvider
    extends
        $FunctionalProvider<
          AsyncValue<BleAdapterState>,
          BleAdapterState,
          Stream<BleAdapterState>
        >
    with $FutureModifier<BleAdapterState>, $StreamProvider<BleAdapterState> {
  const BluetoothAdapterStateProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'bluetoothAdapterStateProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$bluetoothAdapterStateHash();

  @$internal
  @override
  $StreamProviderElement<BleAdapterState> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<BleAdapterState> create(Ref ref) {
    return bluetoothAdapterState(ref);
  }
}

String _$bluetoothAdapterStateHash() =>
    r'f7b5e06b9bd1a235085f4f87ab4ac2ab218c4d5e';

@ProviderFor(isScanning)
const isScanningProvider = IsScanningProvider._();

final class IsScanningProvider
    extends $FunctionalProvider<AsyncValue<bool>, bool, Stream<bool>>
    with $FutureModifier<bool>, $StreamProvider<bool> {
  const IsScanningProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'isScanningProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$isScanningHash();

  @$internal
  @override
  $StreamProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<bool> create(Ref ref) {
    return isScanning(ref);
  }
}

String _$isScanningHash() => r'dc040a44917994b711fa817a37f95fc2a7f8d520';

@ProviderFor(scanResults)
const scanResultsProvider = ScanResultsProvider._();

final class ScanResultsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<BleDevice>>,
          List<BleDevice>,
          Stream<List<BleDevice>>
        >
    with $FutureModifier<List<BleDevice>>, $StreamProvider<List<BleDevice>> {
  const ScanResultsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'scanResultsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$scanResultsHash();

  @$internal
  @override
  $StreamProviderElement<List<BleDevice>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<BleDevice>> create(Ref ref) {
    return scanResults(ref);
  }
}

String _$scanResultsHash() => r'946594bcbc8dfb2527886454d1da39ff852fcdc7';
