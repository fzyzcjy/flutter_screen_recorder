import 'package:collection/collection.dart';
import 'package:fast_screen_recorder/src/protobuf/extensions.dart';
import 'package:fast_screen_recorder/src/protobuf/generated/fast_screen_recorder.pb.dart' as proto;
import 'package:fixnum/fixnum.dart';
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
    const backDuration = Duration(milliseconds: -1000);
    final startIndex = 1 + _lowerBoundIndex(backDuration);
    final endIndex = 1 + _lowerBoundIndex(const Duration(milliseconds: 1));

    final painter = Paint()..style = PaintingStyle.fill;

    for (var i = startIndex; i <= endIndex; ++i) {
      final event = pack.pointerEvents[i];

      painter.color = Colors.grey
          .withOpacity(0.5 - 0.5 * (timestamp - event.flutterTimestamp).inMicroseconds / backDuration.inMicroseconds);

      canvas.drawCircle(event.position, 20, painter);
    }
  }

  int _lowerBoundIndex(Duration deltaTime) {
    return pack.pointerEvents
        .lowerBoundBy<num>(_createDummyEvent(timestamp + deltaTime), (e) => e.flutterTimestampMicros.toInt());
  }

  // for simplicity, always shouldRepaint...
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

proto.PointerEvent _createDummyEvent(Duration timestamp) =>
    proto.PointerEvent(flutterTimestampMicros: Int64(timestamp.inMicroseconds));
