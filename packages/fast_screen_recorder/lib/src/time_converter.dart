import 'package:collection/collection.dart';
import 'package:fast_screen_recorder/src/protobuf/extensions.dart';
import 'package:fast_screen_recorder/src/protobuf/generated/fast_screen_recorder.pb.dart' as proto;
import 'package:fixnum/fixnum.dart';

abstract class TimeConverter {
  static DateTime videoToWallclockTime(Duration videoTime, proto.RecorderMetadataPack metadata) {
    final frameInfos = metadata.video.frameInfos;
    final interestIndex = (-1 +
            frameInfos.lowerBoundBy<num>(proto.VideoFrameInfo(videoTimestampMicros: Int64(videoTime.inMicroseconds)),
                (e) => e.videoTimestampMicros.toInt()))
        .clamp(0, frameInfos.length - 1);
    final interestInfo = frameInfos[interestIndex];

    return interestInfo.wallclockTimestamp.add(videoTime - interestInfo.videoTimestamp);
  }
}
