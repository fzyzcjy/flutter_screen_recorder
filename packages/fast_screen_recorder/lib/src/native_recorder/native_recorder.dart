import 'dart:io';

import 'package:fast_screen_recorder/fast_screen_recorder.dart';
import 'package:fast_screen_recorder/src/messages.dart';

enum CaptureStatus {
  succeeded,

  /// The capture is skipped, but it is (mostly) expected.
  /// If it is an unexpected error, an Exception will be thrown instead.
  skipped,
}

abstract class NativeRecorder {
  static final instance = NativeRecorder._();

  // ignore: avoid-global-state
  static bool? debugDisableNativeRecorder;

  factory NativeRecorder._() {
    if (Platform.isAndroid && debugDisableNativeRecorder != true) return _NativeRecorderReal._();
    return _NativeRecorderFake();
  }

  Future<void> start(StartRequest request);

  Future<CaptureStatus> capture();

  Future<void> stop();
}

class _NativeRecorderReal implements NativeRecorder {
  final _hostApi = FastScreenRecorderHostApi();

  _NativeRecorderReal._() {
    _FlutterApiHandler.init();
  }

  @override
  Future<void> start(StartRequest request) async => await _hostApi.start(request);

  @override
  Future<CaptureStatus> capture() async {
    final response = await _hostApi.capture();
    return response.succeedOrSkipped ? CaptureStatus.succeeded : CaptureStatus.skipped;
  }

  @override
  Future<void> stop() async => await _hostApi.stop();
}

class _FlutterApiHandler implements FastScreenRecorderFlutterApi {
  static _FlutterApiHandler? _instance;

  static void init() {
    if (_instance == null) {
      _instance = _FlutterApiHandler();
      FastScreenRecorderFlutterApi.setup(_instance);
    }
  }

  @override
  void log(LogArg arg) {
    final throwable = arg.throwable;

    final effectiveTag = 'Native::${arg.tag ?? 'NoTag'}';
    final effectiveMsg =
        '[native_time=${arg.time}] ${arg.message ?? 'NoMessage'}${throwable != null ? '; throwable=$throwable' : ''}';

    FastScreenRecorderLogger.log(effectiveTag, effectiveMsg);
  }
}

class _NativeRecorderFake implements NativeRecorder {
  @override
  Future<void> start(StartRequest request) async {
    await File(request.path).writeAsString('FAKE_CONTENT');
  }

  @override
  Future<CaptureStatus> capture() async => CaptureStatus.skipped;

  @override
  Future<void> stop() async {}
}
