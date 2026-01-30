import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_esp32_ble_wifi/features/ble/domain/entities/lamp_status_entity.dart';
import 'package:flutter_esp32_ble_wifi/features/ble/presentation/providers/ble_control_controller.dart';

class BleColorCard extends StatelessWidget {
  final LampStatus status;
  final BleControlController controller;

  const BleColorCard({
    super.key,
    required this.status,
    required this.controller,
  });

  static final List<Map<String, dynamic>> _presetColors = [
    {'name': '빨강', 'color': const Color(0xFFFF0000), 'r': 255, 'g': 0, 'b': 0},
    {'name': '초록', 'color': const Color(0xFF00FF00), 'r': 0, 'g': 255, 'b': 0},
    {'name': '파랑', 'color': const Color(0xFF0000FF), 'r': 0, 'g': 0, 'b': 255},
    {
      'name': '노랑',
      'color': const Color(0xFFFFFF00),
      'r': 255,
      'g': 255,
      'b': 0,
    },
    {
      'name': '청록',
      'color': const Color(0xFF00FFFF),
      'r': 0,
      'g': 255,
      'b': 255,
    },
    {
      'name': '보라',
      'color': const Color(0xFFFF00FF),
      'r': 255,
      'g': 0,
      'b': 255,
    },
    {
      'name': '하양',
      'color': const Color(0xFFFFFFFF),
      'r': 255,
      'g': 255,
      'b': 255,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final bool isManualMode = status.ledMode == 1;

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              isManualMode ? '무드등 색상 선택' : '현재 색상 (자동 모드)',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            if (!isManualMode) ...[
              _buildLegendSection(context),
              const SizedBox(height: 16),
            ],
            _buildColorPreview(),
            if (isManualMode) ...[
              const SizedBox(height: 24),
              const Text(
                '추천 테마 색상',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              _buildColorPresetsGrid(),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildLegendSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.info_outline, size: 18, color: Colors.blue),
              const SizedBox(width: 8),
              Text(
                '현재 상태: ${status.weatherColorDescription}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Text(
            '실내 온도별 색상 기준(겨울철)',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          _buildLegendItem(Colors.blue, '18°C 이하', '추움'),
          _buildLegendItem(Colors.green, '18°C ~ 28°C', '적당함'),
          _buildLegendItem(Colors.red, '28°C 이상', '더움'),
        ],
      ),
    );
  }

  Widget _buildLegendItem(Color color, String range, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          ),
          const SizedBox(width: 8),
          Text(range, style: const TextStyle(fontSize: 11)),
          const SizedBox(width: 8),
          Text(label, style: const TextStyle(fontSize: 11, color: Colors.grey)),
        ],
      ),
    );
  }

  Widget _buildColorPreview() {
    return Row(
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            color: Color.fromARGB(
              255,
              status.red > 0 ? 255 : 0,
              status.green > 0 ? 255 : 0,
              status.blue > 0 ? 255 : 0,
            ),
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: 3),
            boxShadow: const [
              BoxShadow(color: Colors.black12, blurRadius: 10, spreadRadius: 2),
            ],
          ),
        ),
        const SizedBox(width: 24),
        const Text(
          '현재 LED 색상',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildColorPresetsGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: _presetColors.length,
      itemBuilder: (context, index) {
        final preset = _presetColors[index];
        final isSelected =
            status.red == preset['r'] &&
            status.green == preset['g'] &&
            status.blue == preset['b'];

        return GestureDetector(
          onTap: () {
            HapticFeedback.selectionClick();
            controller.updateControl(
              r: preset['r'],
              g: preset['g'],
              b: preset['b'],
            );
          },
          child: Container(
            decoration: BoxDecoration(
              color: preset['color'],
              shape: BoxShape.circle,
              border: Border.all(
                color: isSelected ? Colors.blueAccent : Colors.grey.shade300,
                width: isSelected ? 3 : 1,
              ),
              boxShadow: isSelected
                  ? [
                      BoxShadow(
                        color: Colors.blueAccent.withValues(alpha: 0.5),
                        blurRadius: 8,
                      ),
                    ]
                  : null,
            ),
            child: isSelected
                ? const Icon(Icons.check, color: Colors.white, size: 20)
                : null,
          ),
        );
      },
    );
  }
}
