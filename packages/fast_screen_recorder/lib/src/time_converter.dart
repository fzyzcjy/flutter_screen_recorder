import 'package:collection/collection.dart';
import 'package:fast_screen_recorder/src/protobuf/generated/fast_screen_recorder.pb.dart' as proto;

abstract class TimeConverter {
  static Duration videoToFlutterTime(Duration videoTime, proto.RecorderMetadataPack metadata) {
    final frameInfos = metadata.video.frameInfos;
    final interestIndex = frameInfos.lowerBoundBy<num>(
        proto.VideoFrameInfo(videoTimestampMicros: TODO), (e) => e.videoTimestampMicros.toInt());

    return TODO;
  }
}
