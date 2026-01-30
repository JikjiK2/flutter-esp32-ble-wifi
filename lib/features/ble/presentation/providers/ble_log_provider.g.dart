// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ble_log_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(BleDataLog)
const bleDataLogProvider = BleDataLogProvider._();

final class BleDataLogProvider
    extends $NotifierProvider<BleDataLog, BleLogState> {
  const BleDataLogProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'bleDataLogProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$bleDataLogHash();

  @$internal
  @override
  BleDataLog create() => BleDataLog();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BleLogState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BleLogState>(value),
    );
  }
}

String _$bleDataLogHash() => r'6ac13d69ee04512fe71f2b7594b99317987cd423';

abstract class _$BleDataLog extends $Notifier<BleLogState> {
  BleLogState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<BleLogState, BleLogState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<BleLogState, BleLogState>,
              BleLogState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
