import 'dart:ui';

import 'package:fast_screen_recorder/src/protobuf/generated/fast_screen_recorder.pb.dart' as proto;

extension ExtPointerEvent on proto.PointerEvent {
  Duration get timestamp => Duration(microseconds: timestampMicros.toInt());

  Offset get position => Offset(positionDx, positionDy);
}
