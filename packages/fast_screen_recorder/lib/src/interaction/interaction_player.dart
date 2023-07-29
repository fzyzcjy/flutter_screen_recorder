import 'package:collection/collection.dart';
import 'package:fast_screen_recorder/src/protobuf/extensions.dart';
import 'package:fast_screen_recorder/src/protobuf/generated/fast_screen_recorder.pb.dart' as proto;
import 'package:fixnum/fixnum.dart';
import 'package:flutter/material.dart';

class InteractionPlayer extends StatefulWidget {
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
  State<InteractionPlayer> createState() => _InteractionPlayerState();
}

class _InteractionPlayerState extends State<InteractionPlayer> {
  late List<proto.PointerEvent> sortedPointerEvents;

  @override
  void initState() {
    super.initState();
    _computeSortedPointerEvents();
  }

  @override
  void didUpdateWidget(covariant InteractionPlayer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.pack != widget.pack) _computeSortedPointerEvents();
  }

  void _computeSortedPointerEvents() {
    // 实测见过乱序，所以sort一下
    // https://github.com/fzyzcjy/yplusplus/issues/10227#issuecomment-1656531266
    sortedPointerEvents = widget.pack.pointerEvents.sortedBy<num>((e) => e.wallclockTimestampMicros.toInt());
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _InteractionPainter(
        sortedPointerEvents: sortedPointerEvents,
        wallclockTimestamp: widget.wallclockTimestamp,
        displayScale: widget.displayScale,
      ),
    );
  }
}

class _InteractionPainter extends CustomPainter {
  final List<proto.PointerEvent> sortedPointerEvents;
  final DateTime wallclockTimestamp;
  final double displayScale;

  _InteractionPainter({
    required this.sortedPointerEvents,
    required this.wallclockTimestamp,
    required this.displayScale,
  });

  @override
  void paint(Canvas canvas, Size size) {
    const backDuration = Duration(milliseconds: 400);
    final startIndex = _lowerBoundIndex(-backDuration).clamp(0, sortedPointerEvents.length - 1);
    final endIndex = _lowerBoundIndex(Duration.zero).clamp(0, sortedPointerEvents.length);
    // print('hi startIndex=$startIndex endIndex=$endIndex wallclockTimestamp=${wallclockTimestamp.inMicroseconds} '
    //     'firstEvent=${sortedPointerEvents.first} lastEvent=${sortedPointerEvents.last}');

    final painter = Paint()..style = PaintingStyle.fill;

    for (var i = startIndex; i < endIndex; ++i) {
      final event = sortedPointerEvents[i];
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
    assert(sortedPointerEvents.isSortedBy<num>((e) => e.wallclockTimestampMicros.toInt()));
    return sortedPointerEvents.lowerBoundBy<num>(
        _createDummyEvent(wallclockTimestamp.add(deltaTime)), (e) => e.wallclockTimestampMicros.toInt());
  }

  // for simplicity, always shouldRepaint...
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

proto.PointerEvent _createDummyEvent(DateTime wallclockTimestamp) =>
    proto.PointerEvent(wallclockTimestampMicros: Int64(wallclockTimestamp.microsecondsSinceEpoch));
