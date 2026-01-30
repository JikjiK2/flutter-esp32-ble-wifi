import 'package:flutter/material.dart';

class RssiBadge extends StatelessWidget {
  final int rssi;

  const RssiBadge({super.key, required this.rssi});

  @override
  Widget build(BuildContext context) {
    IconData iconData;
    Color color;
    String text;
    if (rssi >= -50) {
      text = '연결 최상';
      iconData = Icons.signal_cellular_alt;
      color = Colors.greenAccent;
    } else if (rssi >= -80) {
      text = '연결 원활';
      iconData = Icons.signal_cellular_alt;
      color = Colors.blueAccent;
    } else {
      text = '연결 불안정';
      iconData = Icons.signal_cellular_connected_no_internet_0_bar;
      color = Colors.redAccent;
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: 11,
            color: color,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 2),
        Icon(iconData, size: 12, color: color),
        const SizedBox(width: 4),
        Text(
          '$rssi dBm',
          style: TextStyle(
            fontSize: 11,
            color: color,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
