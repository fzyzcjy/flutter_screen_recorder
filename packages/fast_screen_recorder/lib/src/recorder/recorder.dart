import 'dart:async';
import 'dart:io';

import 'package:clock/clock.dart';
import 'package:fast_screen_recorder/fast_screen_recorder.dart';
import 'package:fast_screen_recorder/src/interaction/interaction_recorder.dart';
import 'package:fast_screen_recorder/src/messages.dart';
import 'package:fast_screen_recorder/src/native_recorder/native_recorder.dart';
import 'package:fast_screen_recorder/src/protobuf/generated/fast_screen_recorder.pb.dart' as proto;
import 'package:fast_screen_recorder/src/recorder/metadata_pack_codec.dart';
import 'package:fast_screen_recorder/src/utils/errors.dart';
import 'package:fixnum/fixnum.dart';
import 'package:flutter/material.dart';
import 'package:synchronized/synchronized.dart';

class FastScreenRecorder {
  static const _kTag = 'FastScreenRecorder';

  static final instance = FastScreenRecorder._();

  FastScreenRecorder._();

  static var verbose = false;

  bool get _recording => _recordingData != null;
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
        FastScreenRecorderLogger.log(_kTag, 'start() begin');

        if (_recording) {
          FastScreenRecorderLogger.log(_kTag, 'start() skip since already recording');
          return;
        }

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
        FastScreenRecorderLogger.log(_kTag, 'stop() begin');

        if (!_recording) {
          FastScreenRecorderLogger.log(_kTag, 'stop() skip since already not recording');
          return;
        }

        final recordingData = _recordingData!;
        _recordingData = null;

        recordingData.captureTimer.cancel();
        await _nativeRecorder.stop();

        final interactionPack = _interactionRecorder.stop();

        final metadataPack = proto.RecorderMetadataPack(
          interaction: interactionPack,
          video: recordingData.videoMetadataPack,
          device: _createDeviceMetadata(),
        );

        await File(recordingData.pathMetadata).writeAsBytes(metadataPackCodec.encode(metadataPack));
      });

  Future<void> _handleCaptureCall(Timer _) async => await _lock.synchronized(() async {
        // catch exception to avoid having uncaught exceptions, because this is called by Timer, not by user code
        await withCaptureException(() async {
          if (verbose) FastScreenRecorderLogger.log(_kTag, 'handleCaptureCall() begin');

          // this can happen because lock delays execution
          // https://github.com/fzyzcjy/yplusplus/issues/9664#issuecomment-1605290418
          if (!_recording) return;

          final nowAtStart = clock.now();

          final status = await _nativeRecorder.capture();
          if (status == CaptureStatus.skipped) {
            // p.s. not only status==skipped, but also when `capture` throws, it should halt
            return;
          }

          // NOTE update metadata *after* native capture, including `captureIndex++`,
          // because native `capture` can fail. when it fails, the frame is not captured,
          // thus we should not save any metadata
          final currCaptureIndex = _recordingData!.captureIndex++;
          _recordingData!.videoMetadataPack.frameInfos.add(proto.VideoFrameInfo(
            wallclockTimestampMicros: Int64(nowAtStart.microsecondsSinceEpoch),
            videoTimestampMicros: Int64(1000000 ~/ _recordingData!.fps * currCaptureIndex),
          ));
        });
      });

  static proto.DeviceMetadata _createDeviceMetadata() {
    final view = WidgetsBinding.instance.platformDispatcher.views.first;

    return proto.DeviceMetadata(
      physicalWidth: view.physicalSize.width,
      physicalHeight: view.physicalSize.height,
      devicePixelRatio: view.devicePixelRatio,
    );
  }
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
