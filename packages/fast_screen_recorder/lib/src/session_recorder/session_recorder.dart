import 'dart:async';
import 'dart:io';

import 'package:clock/clock.dart';
import 'package:fast_screen_recorder/src/recorder/packed_recorder.dart';
import 'package:fast_screen_recorder/src/recorder/recorder.dart';
import 'package:fast_screen_recorder/src/utils/logger.dart';
import 'package:fast_screen_recorder/src/utils/time_named_directory_manager.dart';
import 'package:synchronized/synchronized.dart';

class SessionRecorder {
  static const _kTag = 'SessionRecorder';

  final String directory;
  final int maxKeepSize;

  SessionRecorder({
    required this.directory,
    this.maxKeepSize = 50 * 1000 * 1000,
  });

  bool get recording => _recordingData != null;
  _RecordingData? _recordingData;

  final _lock = Lock();

  final _recorder = FastPackedScreenRecorder.instance;

  late final _directoryManager = TimeNamedDirectoryManager(extension: 'bin', directory: directory);

  Future<void> start({
    Duration sectionDuration = const Duration(seconds: 60),
    VideoConfig videoConfig = const VideoConfig(),
  }) async =>
      await _lock.synchronized(() async {
        FastScreenRecorderLogger.log(_kTag, 'start() begin');

        if (recording) throw ArgumentError('cannot start since already recording');

        if (!await Directory(directory).exists()) throw ArgumentError('Please ensure directory=$directory exists');

        _recordingData = _RecordingData(
          sectionizeTimer: Timer.periodic(sectionDuration, _handleSectionizeTimerCall),
          videoConfig: videoConfig,
        );

        await _startInnerRecorder();

        await _pruneDirectory();
      });

  Future<void> stop() async => await _lock.synchronized(() async {
        FastScreenRecorderLogger.log(_kTag, 'stop() begin');

        if (!recording) throw ArgumentError('cannot stop since already not recording');

        final recordingData = _recordingData!;
        _recordingData = null;

        recordingData.sectionizeTimer.cancel();
        await _stopInnerRecorder();

        await _pruneDirectory();
      });

  Future<void> flush() async => await _lock.synchronized(() async {
        FastScreenRecorderLogger.log(_kTag, 'flush() begin');

        if (!recording) {
          // no need to flush anything
          return;
        }

        await _sectionize();
      });

  Future<void> _handleSectionizeTimerCall(Timer _) async => await _lock.synchronized(() async {
        await _sectionize();
      });

  Future<void> _sectionize() async {
    await _stopInnerRecorder();
    await _startInnerRecorder();

    await _pruneDirectory();
  }

  Future<void> _pruneDirectory() async {
    await _directoryManager.prune(maxKeepSize: maxKeepSize);
  }

  Future<void> _startInnerRecorder() async {
    await _recorder.start(
      path: _directoryManager.getPathForTime(clock.now()),
      videoConfig: _recordingData!.videoConfig,
    );
  }

  Future<void> _stopInnerRecorder() async {
    await _recorder.stop();
  }

  Future<List<FileAndTimeInfo>> getRecords({
    required DateTime startTime,
    required DateTime endTime,
    int? roughMaxSize,
  }) async {
    return await _directoryManager.getRange(
      startTime: startTime,
      endTime: endTime,
      roughMaxSize: roughMaxSize,
    );
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
