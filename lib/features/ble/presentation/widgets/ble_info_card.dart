import 'package:flutter/material.dart';
import 'package:flutter_esp32_ble_wifi/features/ble/domain/entities/lamp_status_entity.dart';

class BleInfoCard extends StatelessWidget {
  final LampStatus status;

  const BleInfoCard({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildSensorItem(
                  Icons.thermostat,
                  '온도',
                  '${status.temperature.toStringAsFixed(1)} °C',
                  Colors.orange,
                ),
                _buildSensorItem(
                  Icons.water_drop,
                  '습도',
                  '${status.humidity.toStringAsFixed(1)} %',
                  Colors.blue,
                ),
                _buildSensorItem(
                  Icons.wb_incandescent_rounded,
                  '밝기',
                  '${status.brightness}',
                  Colors.amber,
                ),
              ],
            ),
            const Divider(height: 24),
            const Text(
              '데이터 갱신 주기: 2초',
              style: TextStyle(fontSize: 11, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSensorItem(
    IconData icon,
    String label,
    String value,
    Color color,
  ) {
    return Column(
      children: [
        Icon(icon, color: color, size: 28),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
        Text(
          value,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
