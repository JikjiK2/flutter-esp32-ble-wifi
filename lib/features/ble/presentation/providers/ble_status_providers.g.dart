// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ble_status_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(lampStatus)
const lampStatusProvider = LampStatusFamily._();

final class LampStatusProvider
    extends
        $FunctionalProvider<
          AsyncValue<LampStatus>,
          LampStatus,
          Stream<LampStatus>
        >
    with $FutureModifier<LampStatus>, $StreamProvider<LampStatus> {
  const LampStatusProvider._({
    required LampStatusFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'lampStatusProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$lampStatusHash();

  @override
  String toString() {
    return r'lampStatusProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $StreamProviderElement<LampStatus> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<LampStatus> create(Ref ref) {
    final argument = this.argument as String;
    return lampStatus(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is LampStatusProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$lampStatusHash() => r'a302dea6ab9656b724e565ab516666c007d47b3f';

final class LampStatusFamily extends $Family
    with $FunctionalFamilyOverride<Stream<LampStatus>, String> {
  const LampStatusFamily._()
    : super(
        retry: null,
        name: r'lampStatusProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  LampStatusProvider call(String macId) =>
      LampStatusProvider._(argument: macId, from: this);

  @override
  String toString() => r'lampStatusProvider';
}

@ProviderFor(bleRssi)
const bleRssiProvider = BleRssiFamily._();

final class BleRssiProvider
    extends $FunctionalProvider<AsyncValue<int>, int, Stream<int>>
    with $FutureModifier<int>, $StreamProvider<int> {
  const BleRssiProvider._({
    required BleRssiFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'bleRssiProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$bleRssiHash();

  @override
  String toString() {
    return r'bleRssiProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $StreamProviderElement<int> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<int> create(Ref ref) {
    final argument = this.argument as String;
    return bleRssi(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is BleRssiProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$bleRssiHash() => r'6e0743f650564f7e8efd18ca02264d1b0725ea40';

final class BleRssiFamily extends $Family
    with $FunctionalFamilyOverride<Stream<int>, String> {
  const BleRssiFamily._()
    : super(
        retry: null,
        name: r'bleRssiProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  BleRssiProvider call(String macId) =>
      BleRssiProvider._(argument: macId, from: this);

  @override
  String toString() => r'bleRssiProvider';
}
