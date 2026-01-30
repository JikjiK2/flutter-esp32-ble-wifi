import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_esp32_ble_wifi/features/ble/domain/entities/ble_device_entity.dart';
import 'package:flutter_esp32_ble_wifi/features/ble/domain/entities/lamp_status_entity.dart';
import 'package:flutter_esp32_ble_wifi/features/ble/presentation/providers/ble_repository_provider.dart';
import 'package:flutter_esp32_ble_wifi/features/ble/presentation/providers/ble_usecase_providers.dart';

part 'ble_connection_provider.g.dart';

@riverpod
Stream<BleDeviceConnectionState> bleDeviceState(Ref ref, String macId) {
  return ref.watch(bleRepositoryProvider).deviceStateStream(macId);
}

@riverpod
class BleConnection extends _$BleConnection {
  @override
  FutureOr<String?> build() => null;

  Future<void> connect(String macId) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final useCase = ref.read(connectDeviceUseCaseProvider);
      await useCase.execute(macId);
      return macId;
    });
  }

  Future<void> disconnect(String macId) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await ref.read(bleRepositoryProvider).disconnectDevice();
      return null;
    });
  }

  Future<void> sendLampStatus(String macId, LampStatus status, {String? description}) async {
    await ref.read(bleRepositoryProvider).sendLampStatus(macId, status, description: description);
  }
}
