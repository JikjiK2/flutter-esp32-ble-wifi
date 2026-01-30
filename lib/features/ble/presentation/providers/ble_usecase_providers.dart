import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_esp32_ble_wifi/features/ble/domain/usecases/connect_device_usecase.dart';
import 'package:flutter_esp32_ble_wifi/features/ble/presentation/providers/ble_repository_provider.dart';

part 'ble_usecase_providers.g.dart';

@riverpod
ConnectDeviceUseCase connectDeviceUseCase(Ref ref) {
  final repository = ref.watch(bleRepositoryProvider);
  return ConnectDeviceUseCase(repository);
}
