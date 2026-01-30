import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_esp32_ble_wifi/features/ble/domain/entities/lamp_status_entity.dart';
import 'package:flutter_esp32_ble_wifi/features/ble/presentation/providers/ble_repository_provider.dart';

part 'ble_status_providers.g.dart';

@Riverpod(keepAlive: true)
Stream<LampStatus> lampStatus(Ref ref, String macId) {
  return ref.watch(bleRepositoryProvider).statusStream(macId);
}

@riverpod
Stream<int> bleRssi(Ref ref, String macId) async* {
  final repository = ref.watch(bleRepositoryProvider);
  while (true) {
    yield await repository.readRssi(macId);
    await Future.delayed(const Duration(seconds: 2));
  }
}
