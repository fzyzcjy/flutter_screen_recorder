import 'dart:ui';

import 'package:fast_screen_recorder/src/recorder/recorder.dart';
import 'package:fast_screen_recorder/src/session_recorder/session_recorder_inner.dart';
import 'package:fast_screen_recorder/src/utils/app_lifecycle_state_observer.dart';
import 'package:fast_screen_recorder/src/utils/errors.dart';
import 'package:fast_screen_recorder/src/utils/logger.dart';
import 'package:fast_screen_recorder/src/utils/time_named_directory_manager.dart';
import 'package:synchronized/synchronized.dart';

class SessionRecorder {
  static const _kTag = 'SessionRecorder';

  final SessionRecorderInner _inner;

  bool get _callerSpecifiedRecording => _recordingData != null;
  _RecordingData? _recordingData;

  late final _appLifecycleListener = AppLifecycleStateListener();

  final _lock = Lock();

  String get directory => _inner.directory;

  SessionRecorder({
    required String directory,
    int maxKeepSize = 50 * 1000 * 1000,
    // should not be too much, because when NativeRecorder is fake implementation, the result "video" is tiny
    // thus maxKeepSize will not cause any pruning
    int maxKeepNumFile = 100,
  }) : _inner = SessionRecorderInner(
          directory: directory,
          maxKeepSize: maxKeepSize,
          maxKeepNumFile: maxKeepNumFile,
        ) {
    _appLifecycleListener.addListener(_handleAppLifecycleChanged);
  }

  void dispose() {
    _appLifecycleListener.removeListener(_handleAppLifecycleChanged);
    _appLifecycleListener.dispose();
  }

  /// Synchronously dispose things that will make test fails, e.g. pending Timers
  /// However, this should only be used in tests, since it can make states inconsistent
  void disposeForTests() {
    dispose();
    _inner.disposeForTests();
  }

  Future<void> start({
    Duration sectionDuration = const Duration(seconds: 60),
    VideoConfig videoConfig = const VideoConfig(),
  }) async =>
      await _lock.synchronized(() async {
        _recordingData = _RecordingData(sectionDuration: sectionDuration, videoConfig: videoConfig);
        await _inner.start(sectionDuration: sectionDuration, videoConfig: videoConfig);
      });

  Future<void> stop() async => await _lock.synchronized(() async {
        _recordingData = null;
        await _inner.stop();
      });

  Future<void> flush() async => await _lock.synchronized(() async {
        await _inner.flush();
      });

  Future<List<FileAndTimeInfo>> getRecords({
    required DateTime startTime,
    required DateTime endTime,
    int? roughMaxSize,
  }) async =>
      await _lock.synchronized(() async {
        return _inner.getRecords(
          startTime: startTime,
          endTime: endTime,
          roughMaxSize: roughMaxSize,
        );
      });

  Future<void> _handleAppLifecycleChanged() async => await _lock.synchronized(() async {
        await withCaptureException(() async {
          final appActive = _appLifecycleListener.value == AppLifecycleState.resumed;

          FastScreenRecorderLogger.log(
              _kTag,
              'handleAppLifecycleChanged() begin '
              'appActive=$appActive recording=${_inner.recording}');

          if (!appActive && _inner.recording) {
            FastScreenRecorderLogger.log(_kTag, 'handleAppLifecycleChanged() stop inner');
            await _inner.stop();
          }

          if (appActive && !_inner.recording && _callerSpecifiedRecording) {
            FastScreenRecorderLogger.log(_kTag, 'handleAppLifecycleChanged() start inner');
            await _inner.start(
              sectionDuration: _recordingData!.sectionDuration,
              videoConfig: _recordingData!.videoConfig,
            );
          }
        });
      });
}

class _RecordingData {
  final Duration sectionDuration;
  final VideoConfig videoConfig;

  _RecordingData({
    required this.sectionDuration,
    required this.videoConfig,
  });
}
