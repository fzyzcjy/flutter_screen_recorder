import 'package:fast_screen_recorder/src/protobuf/generated/fast_screen_recorder.pb.dart' as proto;

abstract class TimeConverter {
  static Duration videoToSystemTime(Duration videoTime, proto.RecorderMetadataPack metadata) {
    return TODO;
  }
}
