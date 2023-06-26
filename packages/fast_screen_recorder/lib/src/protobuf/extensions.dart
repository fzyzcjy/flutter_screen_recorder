import 'dart:ui';

import 'package:fast_screen_recorder/src/protobuf/generated/fast_screen_recorder.pb.dart' as proto;

extension ExtPointerEvent on proto.PointerEvent {
  Duration get wallclockTimestamp => Duration(microseconds: wallclockTimestampMicros.toInt());

  Offset get position => Offset(positionDx, positionDy);
}

extension ExtVideoFrameInfo on proto.VideoFrameInfo {
  Duration get wallclockTimestamp => Duration(microseconds: wallclockTimestampMicros.toInt());

  Duration get videoTimestamp => Duration(microseconds: videoTimestampMicros.toInt());
}

extension ExtDeviceMetadata on proto.DeviceMetadata {
  Size get physicalSize => Size(physicalWidth, physicalHeight);

  Size get size => physicalSize / devicePixelRatio;
}
