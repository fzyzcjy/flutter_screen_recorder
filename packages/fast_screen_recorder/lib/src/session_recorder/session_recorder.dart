import 'dart:io';
import 'dart:ui';

import 'package:fast_screen_recorder/src/recorder/recorder.dart';
import 'package:synchronized/synchronized.dart';

class SessionRecorder {
  static final instance = SessionRecorder._();

  SessionRecorder._();

  bool get recording => _recordingData != null;
  _RecordingData? _recordingData;

  final _lock = Lock();

  final _recorder = FastScreenRecorder.instance;

  Future<void> start({
    required Directory directory,
    Size outputSize = const Size(360, 720),
    int fps = 2,
    int bitrate = 80 * 1000,
    int iFrameInterval = 10,
  }) async =>
      await _lock.synchronized(() async {
        if (recording) throw ArgumentError('cannot start since already recording');

        if (!await directory.exists()) throw ArgumentError('Please ensure directory=$directory exists');

        await _recorder.start(
          pathVideo: pathVideo,
          pathMetadata: pathMetadata,
          outputSize: outputSize,
          fps: fps,
          bitrate: bitrate,
          iFrameInterval: iFrameInterval,
        );

        _recordingData = _RecordingData(
          directory: directory,
        );

        TODO_auto_stop_start;
      });

  Future<void> stop() async => await _lock.synchronized(() async {
        if (!recording) throw ArgumentError('cannot stop since already not recording');

        _recordingData = null;

        await _recorder.stop();
      });

  Future<List<File>> getRecords({
    required DateTime startTime,
    required DateTime endTime,
  }) async =>
      throw UnimplementedError();
}

class _RecordingData {
  final Directory directory;

  _RecordingData({
    required this.directory,
  });
}
