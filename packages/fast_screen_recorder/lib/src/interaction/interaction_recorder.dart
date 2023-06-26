import 'package:clock/clock.dart';
import 'package:collection/collection.dart';
import 'package:fast_screen_recorder/src/protobuf/generated/fast_screen_recorder.pb.dart' as proto;
import 'package:fixnum/fixnum.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class InteractionRecorder {
  static final instance = InteractionRecorder._();

  InteractionRecorder._();

  proto.InteractionPack? _pack;

  void start() {
    assert(_pack == null);
    _pack = proto.InteractionPack();
  }

  proto.InteractionPack stop() {
    assert(_pack != null);

    final ans = _pack!;
    _pack = null;

    _postprocessPack(ans);

    return ans;
  }

  static void _postprocessPack(proto.InteractionPack pack) {
    // make it sorted by time, thus easier to use
    pack.pointerEvents.sortBy<num>((x) => x.flutterTimestampMicros.toInt());
  }
}

class InteractionRecorderWidget extends StatelessWidget {
  final Widget child;

  const InteractionRecorderWidget({super.key, required this.child});

  void _handlePointer(PointerEvent e) {
    final pack = InteractionRecorder.instance._pack;
    if (pack == null) return; // not recording

    pack.pointerEvents.add(proto.PointerEvent(
      type: e.type,
      pointer: e.pointer,
      flutterTimestampMicros: Int64(e.timeStamp.inMicroseconds),
      wallclockTimestampMicros: Int64(clock.now().microsecondsSinceEpoch),
      positionDx: e.position.dx,
      positionDy: e.position.dy,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: _handlePointer,
      onPointerMove: _handlePointer,
      onPointerUp: _handlePointer,
      onPointerHover: _handlePointer,
      onPointerCancel: _handlePointer,
      onPointerPanZoomStart: _handlePointer,
      onPointerPanZoomUpdate: _handlePointer,
      onPointerPanZoomEnd: _handlePointer,
      onPointerSignal: _handlePointer,
      child: child,
    );
  }
}

extension on PointerEvent {
  proto.PointerEventType get type {
    final event = this;

    // ref: PointerPanZoomStartEvent
    if (event is PointerDownEvent) return proto.PointerEventType.DOWN;
    if (event is PointerMoveEvent) return proto.PointerEventType.MOVE;
    if (event is PointerUpEvent) return proto.PointerEventType.UP;
    if (event is PointerHoverEvent) return proto.PointerEventType.HOVER;
    if (event is PointerCancelEvent) return proto.PointerEventType.CANCEL;
    if (event is PointerPanZoomStartEvent) return proto.PointerEventType.PAN_ZOOM_START;
    if (event is PointerPanZoomUpdateEvent) return proto.PointerEventType.PAN_ZOOM_UPDATE;
    if (event is PointerPanZoomEndEvent) return proto.PointerEventType.PAN_ZOOM_END;
    if (event is PointerSignalEvent) return proto.PointerEventType.SIGNAL;

    return proto.PointerEventType.UNKNOWN;
  }
}
