import 'dart:async';
import 'dart:io';
import 'dart:ui';

import 'package:fast_screen_recorder/src/recorder/packed_recorder.dart';
import 'package:fast_screen_recorder/src/recorder/recorder.dart';
import 'package:synchronized/synchronized.dart';

class SessionRecorder {
  static final instance = SessionRecorder._();

  SessionRecorder._();

  bool get recording => _recordingData != null;
  _RecordingData? _recordingData;

  final _lock = Lock();

  final _recorder = FastPackedScreenRecorder.instance;

  Future<void> start({
    required Directory directory,
    Duration sectionDuration = const Duration(seconds: 60),
    VideoConfig videoConfig = const VideoConfig(),
  }) async =>
      await _lock.synchronized(() async {
        if (recording) throw ArgumentError('cannot start since already recording');

        if (!await directory.exists()) throw ArgumentError('Please ensure directory=$directory exists');

        _recordingData = _RecordingData(
          sectionizeTimer: Timer.periodic(sectionDuration, _handleSectionize),
          directory: directory,
          videoConfig: videoConfig,
        );

        await _startInnerRecorder();
      });

  Future<void> stop() async => await _lock.synchronized(() async {
        if (!recording) throw ArgumentError('cannot stop since already not recording');

        final recordingData = _recordingData!;
        _recordingData = null;

        recordingData.sectionizeTimer.cancel();
        await _stopInnerRecorder();
      });

  Future<void> _handleSectionize(Timer _) async => await _lock.synchronized(() async {
        await _stopInnerRecorder();
        await _startInnerRecorder();
      });

  Future<void> _startInnerRecorder() async {
    await _recorder.start(
      path: TODO,
      videoConfig: _recordingData!.videoConfig,
    );
  }

  Future<void> _stopInnerRecorder() async {
    await _recorder.stop();
  }

  Future<List<File>> getRecords({
    required DateTime startTime,
    required DateTime endTime,
  }) async {
    TODO;
  }
}

class _RecordingData {
  final Timer sectionizeTimer;
  final Directory directory;
  final VideoConfig videoConfig;

  _RecordingData({
    required this.sectionizeTimer,
    required this.directory,
    required this.videoConfig,
  });
}
