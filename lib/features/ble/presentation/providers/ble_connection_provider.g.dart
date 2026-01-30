// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ble_connection_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(bleDeviceState)
const bleDeviceStateProvider = BleDeviceStateFamily._();

final class BleDeviceStateProvider
    extends
        $FunctionalProvider<
          AsyncValue<BleDeviceConnectionState>,
          BleDeviceConnectionState,
          Stream<BleDeviceConnectionState>
        >
    with
        $FutureModifier<BleDeviceConnectionState>,
        $StreamProvider<BleDeviceConnectionState> {
  const BleDeviceStateProvider._({
    required BleDeviceStateFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'bleDeviceStateProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$bleDeviceStateHash();

  @override
  String toString() {
    return r'bleDeviceStateProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $StreamProviderElement<BleDeviceConnectionState> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<BleDeviceConnectionState> create(Ref ref) {
    final argument = this.argument as String;
    return bleDeviceState(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is BleDeviceStateProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$bleDeviceStateHash() => r'8ea2abc29e57512b83b8bdd974fec1551c1b636f';

final class BleDeviceStateFamily extends $Family
    with $FunctionalFamilyOverride<Stream<BleDeviceConnectionState>, String> {
  const BleDeviceStateFamily._()
    : super(
        retry: null,
        name: r'bleDeviceStateProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  BleDeviceStateProvider call(String macId) =>
      BleDeviceStateProvider._(argument: macId, from: this);

  @override
  String toString() => r'bleDeviceStateProvider';
}

@ProviderFor(BleConnection)
const bleConnectionProvider = BleConnectionProvider._();

final class BleConnectionProvider
    extends $AsyncNotifierProvider<BleConnection, String?> {
  const BleConnectionProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'bleConnectionProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$bleConnectionHash();

  @$internal
  @override
  BleConnection create() => BleConnection();
}

String _$bleConnectionHash() => r'22b66de96c618441106583a6d6e16ae3bd341a85';

abstract class _$BleConnection extends $AsyncNotifier<String?> {
  FutureOr<String?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<String?>, String?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<String?>, String?>,
              AsyncValue<String?>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
