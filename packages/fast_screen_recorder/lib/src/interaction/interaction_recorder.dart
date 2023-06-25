import 'package:collection/collection.dart';
import 'package:fast_screen_recorder/src/protobuf/generated/fast_screen_recorder.pb.dart' as proto;
import 'package:fixnum/fixnum.dart';
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

  static _postprocessPack(proto.InteractionPack pack) {
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
      flutterTimestampMicros: Int64(e.timeStamp.inMicroseconds),
      positionDx: e.position.dx,
      positionDy: e.position.dy,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: _handlePointer,
      onPointerMove: _handlePointer,
      child: child,
    );
  }
}
