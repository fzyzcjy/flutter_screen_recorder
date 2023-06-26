import 'package:fast_screen_recorder/fast_screen_recorder.dart';
import 'package:fast_screen_recorder/src/messages.dart';

class NativeRecorder {
  static final instance = NativeRecorder._();

  final _hostApi = FastScreenRecorderHostApi();

  NativeRecorder._() {
    _FlutterApiHandler.init();
  }

  Future<void> start(StartRequest request) async => await _hostApi.start(request);

  Future<void> capture() async => await _hostApi.capture();

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
