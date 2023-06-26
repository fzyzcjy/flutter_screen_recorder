import 'package:collection/collection.dart';
import 'package:fast_screen_recorder/src/protobuf/extensions.dart';
import 'package:fast_screen_recorder/src/protobuf/generated/fast_screen_recorder.pb.dart' as proto;
import 'package:fixnum/fixnum.dart';
import 'package:flutter/material.dart';

class InteractionPlayer extends StatelessWidget {
  final proto.InteractionPack pack;
  final DateTime wallclockTimestamp;
  final double displayScale;

  const InteractionPlayer({
    super.key,
    required this.pack,
    required this.wallclockTimestamp,
    required this.displayScale,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _InteractionPainter(
        pack: pack,
        wallclockTimestamp: wallclockTimestamp,
        displayScale: displayScale,
      ),
    );
  }
}

class _InteractionPainter extends CustomPainter {
  final proto.InteractionPack pack;
  final DateTime wallclockTimestamp;
  final double displayScale;

  _InteractionPainter({
    required this.pack,
    required this.wallclockTimestamp,
    required this.displayScale,
  });

  @override
  void paint(Canvas canvas, Size size) {
    const backDuration = Duration(milliseconds: 400);
    final startIndex = _lowerBoundIndex(-backDuration).clamp(0, pack.pointerEvents.length - 1);
    final endIndex = _lowerBoundIndex(Duration.zero).clamp(0, pack.pointerEvents.length);
    // print('hi startIndex=$startIndex endIndex=$endIndex wallclockTimestamp=${wallclockTimestamp.inMicroseconds} '
    //     'firstEvent=${pack.pointerEvents.first} lastEvent=${pack.pointerEvents.last}');

    final painter = Paint()..style = PaintingStyle.fill;

    for (var i = startIndex; i < endIndex; ++i) {
      final event = pack.pointerEvents[i];
      assert(event.wallclockTimestamp.isBefore(wallclockTimestamp),
          'i=$i wallclockTimestamp=$wallclockTimestamp event=$event');

      final double opacity = (0.5 -
              0.5 *
                  (wallclockTimestamp.difference(event.wallclockTimestamp)).inMicroseconds /
                  backDuration.inMicroseconds)
          .clamp(0, 1);
      painter.color = Colors.grey.withOpacity(opacity);

      // print('i=$i opacity=$opacity');

      canvas.drawCircle(event.position * displayScale, 20, painter);
    }
  }

  int _lowerBoundIndex(Duration deltaTime) {
    assert(pack.pointerEvents.isSortedBy<num>((e) => e.wallclockTimestampMicros.toInt()));
    return pack.pointerEvents.lowerBoundBy<num>(
        _createDummyEvent(wallclockTimestamp.add(deltaTime)), (e) => e.wallclockTimestampMicros.toInt());
  }

  // for simplicity, always shouldRepaint...
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

proto.PointerEvent _createDummyEvent(DateTime wallclockTimestamp) =>
    proto.PointerEvent(wallclockTimestampMicros: Int64(wallclockTimestamp.microsecondsSinceEpoch));
