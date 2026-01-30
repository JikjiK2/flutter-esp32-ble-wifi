import 'package:go_router/go_router.dart';
import 'package:flutter_esp32_ble_wifi/features/ble/presentation/screens/ble_control_final_screen.dart';
import 'package:flutter_esp32_ble_wifi/features/ble/presentation/screens/ble_device_list_screen.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const BleDeviceListScreen(),
    ),
    GoRoute(
      path: '/ble_control/:macId',
      builder: (context, state) {
        final macId = state.pathParameters['macId']!;
        final deviceName = state.uri.queryParameters['name'] ?? '알 수 없는 기기';
        return BleControlScreen(
          macId: macId,
          deviceName: deviceName,
        );
      },
    ),
  ],
);
