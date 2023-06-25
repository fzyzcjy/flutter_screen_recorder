import 'dart:ui';

import 'package:fast_screen_recorder/src/protobuf/generated/fast_screen_recorder.pb.dart' as proto;

extension ExtPointerEvent on proto.PointerEvent {
  Duration get flutterTimestamp => Duration(microseconds: flutterTimestampMicros.toInt());

  Offset get position => Offset(positionDx, positionDy);
}

extension ExtVideoFrameInfo on proto.VideoFrameInfo {
  Duration get flutterTimestamp => Duration(microseconds: flutterTimestampMicros.toInt());

  Duration get videoTimestamp => Duration(microseconds: videoTimestampMicros.toInt());
}
