import 'dart:async';
import 'dart:io';

import 'package:fast_screen_recorder/src/native_recorder/native_recorder.dart';

class FastScreenRecorder {
  static final instance = FastScreenRecorder._();

  FastScreenRecorder._();

  bool get recording => _recording;
  var _recording = false;

  Timer? _timer;

  Future<void> start({
    required File path,
    int fps = 2,
  }) async {
    if (_recording) throw ArgumentError('cannot start since already recording');
    _recording = true;

    await NativeRecorder.instance.start(path: path);
    _timer = Timer.periodic(Duration(milliseconds: 1000 ~/ fps), _handlePeriodicCall);
  }

  Future<void> stop() async {
    if (!_recording) throw ArgumentError('cannot start since already recording');
    _recording = false;

    await NativeRecorder.instance.stop();
    _timer?.cancel();
    _timer = null;
  }

  void _handlePeriodicCall(Timer _) {
    NativeRecorder.instance.capture();
  }
}
