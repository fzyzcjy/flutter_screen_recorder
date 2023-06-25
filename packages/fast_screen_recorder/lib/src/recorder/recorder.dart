import 'dart:async';
import 'dart:io';
import 'dart:ui';

import 'package:clock/clock.dart';
import 'package:fast_screen_recorder/src/interaction/interaction_recorder.dart';
import 'package:fast_screen_recorder/src/messages.dart';
import 'package:fast_screen_recorder/src/native_recorder/native_recorder.dart';
import 'package:fast_screen_recorder/src/protobuf/generated/fast_screen_recorder.pb.dart' as proto;
import 'package:fast_screen_recorder/src/recorder/metadata_pack_codec.dart';
import 'package:fixnum/fixnum.dart';
import 'package:synchronized/synchronized.dart';

class FastScreenRecorder {
  static final instance = FastScreenRecorder._();

  FastScreenRecorder._();

  bool get recording => _recordingData != null;
  _RecordingData? _recordingData;

  final _lock = Lock();

  final _nativeRecorder = NativeRecorder.instance;
  final _interactionRecorder = InteractionRecorder.instance;

  Future<void> start({
    required String pathVideo,
    required String pathMetadata,
    VideoConfig videoConfig = const VideoConfig(),
  }) async =>
      await _lock.synchronized(() async {
        if (recording) throw ArgumentError('cannot start since already recording');

        await _nativeRecorder.start(StartRequest(
          path: pathVideo,
          outputWidth: videoConfig.outputSize.width.round(),
          outputHeight: videoConfig.outputSize.height.round(),
          frameRate: videoConfig.fps.toDouble(),
          bitrate: videoConfig.bitrate,
          iFrameInterval: videoConfig.iFrameInterval,
        ));

        _recordingData = _RecordingData(
          captureTimer: Timer.periodic(Duration(milliseconds: 1000 ~/ videoConfig.fps), _handleCaptureCall),
          videoMetadataPack: proto.VideoMetadataPack(),
          // static info
          pathMetadata: pathMetadata,
          fps: videoConfig.fps,
        );

        _interactionRecorder.start();
      });

  Future<void> stop() async => await _lock.synchronized(() async {
        if (!recording) throw ArgumentError('cannot start since already recording');

        final recordingData = _recordingData!;
        _recordingData = null;

        await _nativeRecorder.stop();
        recordingData.captureTimer.cancel();

        final interactionPack = _interactionRecorder.stop();

        final metadataPack = proto.RecorderMetadataPack(
          interaction: interactionPack,
          video: recordingData.videoMetadataPack,
        );

        await File(recordingData.pathMetadata).writeAsBytes(metadataPackCodec.encode(metadataPack));
      });

  void _handleCaptureCall(Timer _) async => await _lock.synchronized(() async {
        // this can happen because lock delays execution
        // https://github.com/fzyzcjy/yplusplus/issues/9664#issuecomment-1605290418
        if (!recording) return;

        final currCaptureIndex = _recordingData!.captureIndex++;

        _recordingData!.videoMetadataPack.frameInfos.add(proto.VideoFrameInfo(
          wallclockTimestampMicros: Int64(clock.now().microsecondsSinceEpoch),
          videoTimestampMicros: Int64(1000000 ~/ _recordingData!.fps * currCaptureIndex),
        ));

        await _nativeRecorder.capture();
      });
}

class _RecordingData {
  final Timer captureTimer;
  final String pathMetadata;
  final proto.VideoMetadataPack videoMetadataPack;
  final int fps;

  var captureIndex = 0;

  _RecordingData({
    required this.captureTimer,
    required this.pathMetadata,
    required this.videoMetadataPack,
    required this.fps,
  });
}

class VideoConfig {
  final Size outputSize;
  final int fps;
  final int bitrate;
  final int iFrameInterval;

  const VideoConfig({
    this.outputSize = const Size(360, 720),
    this.fps = 2,
    this.bitrate = 80 * 1000,
    this.iFrameInterval = 10,
  });
}
