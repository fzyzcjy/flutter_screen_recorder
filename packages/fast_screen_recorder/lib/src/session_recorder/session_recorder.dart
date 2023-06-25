import 'dart:async';
import 'dart:io';

import 'package:clock/clock.dart';
import 'package:fast_screen_recorder/src/recorder/packed_recorder.dart';
import 'package:fast_screen_recorder/src/recorder/recorder.dart';
import 'package:synchronized/synchronized.dart';

class SessionRecorder {
  final Directory directory;

  SessionRecorder({
    required this.directory,
  });

  bool get recording => _recordingData != null;
  _RecordingData? _recordingData;

  final _lock = Lock();

  final _recorder = FastPackedScreenRecorder.instance;

  Future<void> start({
    Duration sectionDuration = const Duration(seconds: 60),
    VideoConfig videoConfig = const VideoConfig(),
  }) async =>
      await _lock.synchronized(() async {
        if (recording) throw ArgumentError('cannot start since already recording');

        if (!await directory.exists()) throw ArgumentError('Please ensure directory=$directory exists');

        _recordingData = _RecordingData(
          sectionizeTimer: Timer.periodic(sectionDuration, _handleSectionize),
          videoConfig: videoConfig,
        );

        await _startInnerRecorder();

        await _cleanupOldContent();
      });

  Future<void> stop() async => await _lock.synchronized(() async {
        if (!recording) throw ArgumentError('cannot stop since already not recording');

        final recordingData = _recordingData!;
        _recordingData = null;

        recordingData.sectionizeTimer.cancel();
        await _stopInnerRecorder();

        await _cleanupOldContent();
      });

  Future<void> _handleSectionize(Timer _) async => await _lock.synchronized(() async {
        await _stopInnerRecorder();
        await _startInnerRecorder();

        await _cleanupOldContent();
      });

  Future<void> _startInnerRecorder() async {
    await _recorder.start(
      path: _FileNamer.create(clock.now()),
      videoConfig: _recordingData!.videoConfig,
    );
  }

  Future<void> _stopInnerRecorder() async {
    await _recorder.stop();
  }

  Future<void> _cleanupOldContent() async {
    TODO;
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
  final VideoConfig videoConfig;

  _RecordingData({
    required this.sectionizeTimer,
    required this.videoConfig,
  });
}

class _FileNamer {
  static const _kSuffix = '.bin';

  static String create(DateTime time) {
    return time.microsecondsSinceEpoch.toString() + _kSuffix;
  }

  // need to "try", since if somehow the folder is corrupted with weird files, it should not crash
  static DateTime? tryParse(String name) {
    final timeString = name.stripSuffix(_kSuffix);
    if (timeString == null) return null;

    final timeInt = int.tryParse(timeString);
    if (timeInt == null) return null;

    return DateTime.fromMicrosecondsSinceEpoch(timeInt);
  }
}

extension on String {
  String? stripSuffix(String suffix) => endsWith(suffix) ? substring(0, length - suffix.length) : null;
}
