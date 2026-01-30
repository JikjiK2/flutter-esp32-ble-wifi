import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_esp32_ble_wifi/features/ble/data/repositories/ble_repository_impl.dart';
import 'package:flutter_esp32_ble_wifi/features/ble/domain/repositories/ble_repository.dart';
import 'package:flutter_esp32_ble_wifi/features/ble/presentation/providers/ble_log_provider.dart';

part 'ble_repository_provider.g.dart';

@Riverpod(keepAlive: true)
BleRepository bleRepository(Ref ref) {
  final logger = BleLoggerAdapter(ref.read(bleDataLogProvider.notifier));
  return BleRepositoryImpl(ref.watch(blePlatformDataSourceProvider), logger);
}
