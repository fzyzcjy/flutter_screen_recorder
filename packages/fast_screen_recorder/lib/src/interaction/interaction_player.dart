import 'package:fast_screen_recorder/src/protobuf/generated/fast_screen_recorder.pb.dart' as proto;
import 'package:flutter/material.dart';

class InteractionPlayer extends StatelessWidget {
  final proto.InteractionPack pack;
  final Duration timestamp;

  const InteractionPlayer({
    super.key,
    required this.pack,
    required this.timestamp,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _InteractionPainter(
        pack: pack,
        timestamp: timestamp,
      ),
    );
  }
}

class _InteractionPainter extends CustomPainter {
  final proto.InteractionPack pack;
  final Duration timestamp;

  _InteractionPainter({
    required this.pack,
    required this.timestamp,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final painter = Paint()
      ..color = Colors.grey.withAlpha(100)
      ..style = PaintingStyle.fill;

    for (final position in framePacket.touch.positions) {
      canvas.drawCircle(position, 20, painter);
    }
  }

  // for simplicity, always shouldRepaint...
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
