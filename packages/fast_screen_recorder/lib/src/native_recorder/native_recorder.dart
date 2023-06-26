import 'dart:io';

import 'package:fast_screen_recorder/fast_screen_recorder.dart';
import 'package:fast_screen_recorder/src/messages.dart';

abstract class NativeRecorder {
  static final instance = NativeRecorder._();

  // ignore: avoid-global-state
  static bool? debugDisableNativeRecorder;

  factory NativeRecorder._() {
    if (Platform.isAndroid && debugDisableNativeRecorder != true) return _NativeRecorderReal._();
    return _NativeRecorderFake();
  }

  Future<void> start(StartRequest request);

  Future<void> capture();

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
  Future<void> capture() async => await _hostApi.capture();

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
  Future<void> capture() async {}

  @override
  Future<void> stop() async {}
}
