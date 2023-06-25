import 'package:collection/collection.dart';
import 'package:fast_screen_recorder/src/protobuf/extensions.dart';
import 'package:fast_screen_recorder/src/protobuf/generated/fast_screen_recorder.pb.dart' as proto;
import 'package:fixnum/fixnum.dart';
import 'package:flutter/material.dart';

class InteractionPlayer extends StatelessWidget {
  final proto.InteractionPack pack;
  final Duration wallclockTimestamp;

  const InteractionPlayer({
    super.key,
    required this.pack,
    required this.wallclockTimestamp,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _InteractionPainter(
        pack: pack,
        wallclockTimestamp: wallclockTimestamp,
      ),
    );
  }
}

class _InteractionPainter extends CustomPainter {
  final proto.InteractionPack pack;
  final Duration wallclockTimestamp;

  _InteractionPainter({
    required this.pack,
    required this.wallclockTimestamp,
  });

  @override
  void paint(Canvas canvas, Size size) {
    const backDuration = Duration(milliseconds: -1000);
    final startIndex = _lowerBoundIndex(backDuration).clamp(0, pack.pointerEvents.length - 1);
    final endIndex = _lowerBoundIndex(const Duration(milliseconds: 1)).clamp(0, pack.pointerEvents.length - 1);

    final painter = Paint()
      ..style = PaintingStyle.fill;

    for (var i = startIndex; i <= endIndex; ++i) {
      final event = pack.pointerEvents[i];

      painter.color = Colors.grey.withOpacity(
          (0.5 - 0.5 * (wallclockTimestamp - event.wallclockTimestamp).inMicroseconds / backDuration.inMicroseconds)
              .clamp(0, 1));

      canvas.drawCircle(event.position, 20, painter);
    }
  }

  int _lowerBoundIndex(Duration deltaTime) {
    return pack.pointerEvents
        .lowerBoundBy<num>(_createDummyEvent(wallclockTimestamp + deltaTime), (e) => e.flutterTimestampMicros.toInt());
  }

  // for simplicity, always shouldRepaint...
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

proto.PointerEvent _createDummyEvent(Duration wallclockTimestamp) =>
    proto.PointerEvent(flutterTimestampMicros: Int64(wallclockTimestamp.inMicroseconds));
