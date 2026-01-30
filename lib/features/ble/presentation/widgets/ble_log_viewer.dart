import 'package:flutter/material.dart';
import 'package:flutter_esp32_ble_wifi/features/ble/presentation/providers/ble_log_provider.dart';

class BleLogViewer extends StatefulWidget {
  final BleLogState logState;
  final bool initiallyExpanded;

  const BleLogViewer({
    super.key,
    required this.logState,
    this.initiallyExpanded = true,
  });

  @override
  State<BleLogViewer> createState() => _BleLogViewerState();
}

class _BleLogViewerState extends State<BleLogViewer> {
  late bool _isExpanded;

  @override
  void initState() {
    super.initState();
    _isExpanded = widget.initiallyExpanded;
  }

  @override
  Widget build(BuildContext context) {
    final filteredCommLogs = widget.logState.commLogs
        .where((log) => !log.contains('RX'))
        .toList();

    return Card(
      elevation: 1,
      clipBehavior: Clip.antiAlias,
      child: ExpansionTile(
        title: const Text(
          '분석 시스템 (실시간)',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        initiallyExpanded: _isExpanded,
        onExpansionChanged: (expanded) => setState(() => _isExpanded = expanded),
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                _buildLogPanel(
                  title: '실시간 데이터 변화 (센서)',
                  icon: Icons.analytics_outlined,
                  logs: widget.logState.dataLogs,
                  textColor: Colors.white,
                  bgColor: Colors.blueGrey.shade900,
                  height: 120,
                ),
                const SizedBox(height: 12),
                _buildLogPanel(
                  title: '앱 전송 명령 및 에러 (TX)',
                  icon: Icons.send_to_mobile,
                  logs: filteredCommLogs,
                  textColor: Colors.greenAccent,
                  bgColor: Colors.black,
                  height: 120,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLogPanel({
    required String title,
    required IconData icon,
    required List<String> logs,
    required Color textColor,
    required Color bgColor,
    required double height,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, size: 14, color: Colors.grey),
            const SizedBox(width: 4),
            Text(
              title,
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Container(
          height: height,
          width: double.infinity,
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(4),
          ),
          padding: const EdgeInsets.all(8),
          child: logs.isEmpty
              ? const Center(
                  child: Text(
                    '로그 없음',
                    style: TextStyle(color: Colors.white24, fontSize: 10),
                  ),
                )
              : ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: logs.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.only(bottom: 4.0),
                    child: Text(
                      logs[index],
                      style: TextStyle(
                        color: textColor,
                        fontSize: 9,
                        fontFamily: 'monospace',
                      ),
                    ),
                  ),
                ),
        ),
      ],
    );
  }
}
