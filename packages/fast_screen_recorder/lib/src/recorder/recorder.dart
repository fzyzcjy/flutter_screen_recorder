import 'dart:async';
import 'dart:io';
import 'dart:ui';

import 'package:fast_screen_recorder/src/interaction/interaction_recorder.dart';
import 'package:fast_screen_recorder/src/messages.dart';
import 'package:fast_screen_recorder/src/native_recorder/native_recorder.dart';
import 'package:fast_screen_recorder/src/protobuf/generated/fast_screen_recorder.pb.dart' as proto;
import 'package:synchronized/synchronized.dart';

class FastScreenRecorder {
  static final instance = FastScreenRecorder._();

  FastScreenRecorder._();

  bool get recording => _recording;
  var _recording = false;

  Timer? _captureTimer;

  final _lock = Lock();

  final _nativeRecorder = NativeRecorder.instance;
  final _interactionRecorder = InteractionRecorder.instance;

  Future<void> start({
    required String pathVideo,
    required String pathMetadata,
    required Size outputSize,
    required int fps,
    required int bitrate,
    required int iFrameInterval,
  }) async =>
      await _lock.synchronized(() async {
        if (_recording) throw ArgumentError('cannot start since already recording');
        _recording = true;

        await _nativeRecorder.start(StartRequest(
          path: pathVideo,
          outputWidth: outputSize.width.round(),
          outputHeight: outputSize.height.round(),
          frameRate: fps.toDouble(),
          bitrate: bitrate,
          iFrameInterval: iFrameInterval,
        ));
        _captureTimer = Timer.periodic(Duration(milliseconds: 1000 ~/ fps), _handleCaptureCall);

        _interactionRecorder.start();
      });

  Future<void> stop() async => await _lock.synchronized(() async {
        if (!_recording) throw ArgumentError('cannot start since already recording');
        _recording = false;

        await _nativeRecorder.stop();
        _captureTimer?.cancel();
        _captureTimer = null;

        final interactionPack = _interactionRecorder.stop();

        final metadataPack = proto.RecorderMetadataPack(
          interaction: interactionPack,
        );
      });

  void _handleCaptureCall(Timer _) async => await _lock.synchronized(() async {
        // this can happen because lock delays execution
        // https://github.com/fzyzcjy/yplusplus/issues/9664#issuecomment-1605290418
        if (!_recording) return;

        await _nativeRecorder.capture();
      });
}
