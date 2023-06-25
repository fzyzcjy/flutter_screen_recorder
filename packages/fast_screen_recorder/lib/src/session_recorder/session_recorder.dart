import 'dart:io';
import 'dart:ui';

import 'package:fast_screen_recorder/src/recorder/recorder.dart';

class SessionRecorder {
  static final instance = SessionRecorder._();

  SessionRecorder._();

  final _recorder = FastScreenRecorder.instance;

  Future<void> start({
    required Directory directory,
    Size outputSize = const Size(360, 720),
    int fps = 2,
    int bitrate = 80 * 1000,
    int iFrameInterval = 10,
  }) async {
    if (!await directory.exists()) throw ArgumentError('Please ensure directory=$directory exists');

    await _recorder.start(
      pathVideo: pathVideo,
      pathMetadata: pathMetadata,
      outputSize: outputSize,
      fps: fps,
      bitrate: bitrate,
      iFrameInterval: iFrameInterval,
    );
   
    TODO_auto_stop_start;
  }

  Future<void> stop() async {
    await _recorder.stop();
  }

  Future<List<File>> getRecords({
    required DateTime startTime,
    required DateTime endTime,
  }) async =>
      throw UnimplementedError();
}
