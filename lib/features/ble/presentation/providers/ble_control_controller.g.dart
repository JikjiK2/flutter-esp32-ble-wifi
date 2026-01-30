// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ble_control_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(BleControlController)
const bleControlControllerProvider = BleControlControllerFamily._();

final class BleControlControllerProvider
    extends $NotifierProvider<BleControlController, BleControlState> {
  const BleControlControllerProvider._({
    required BleControlControllerFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'bleControlControllerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$bleControlControllerHash();

  @override
  String toString() {
    return r'bleControlControllerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  BleControlController create() => BleControlController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BleControlState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BleControlState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is BleControlControllerProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$bleControlControllerHash() =>
    r'6d868509ba3e4b98035b968db43f1353dcd34f63';

final class BleControlControllerFamily extends $Family
    with
        $ClassFamilyOverride<
          BleControlController,
          BleControlState,
          BleControlState,
          BleControlState,
          String
        > {
  const BleControlControllerFamily._()
    : super(
        retry: null,
        name: r'bleControlControllerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  BleControlControllerProvider call(String macId) =>
      BleControlControllerProvider._(argument: macId, from: this);

  @override
  String toString() => r'bleControlControllerProvider';
}

abstract class _$BleControlController extends $Notifier<BleControlState> {
  late final _$args = ref.$arg as String;
  String get macId => _$args;

  BleControlState build(String macId);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<BleControlState, BleControlState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<BleControlState, BleControlState>,
              BleControlState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
