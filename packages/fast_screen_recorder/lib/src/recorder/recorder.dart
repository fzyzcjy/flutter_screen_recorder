import 'dart:async';
import 'dart:io';
import 'dart:ui';

import 'package:fast_screen_recorder/src/messages.dart';
import 'package:fast_screen_recorder/src/native_recorder/native_recorder.dart';
import 'package:synchronized/synchronized.dart.dart';

class FastScreenRecorder {
  static final instance = FastScreenRecorder._();

  FastScreenRecorder._();

  bool get recording => _recording;
  var _recording = false;

  Timer? _timer;

  final _lock = Lock();

  Future<void> start({
    required File path,
    required Size outputSize,
    int fps = 2,
  }) async =>
      await _lock.synchronized(() async {
        if (_recording) throw ArgumentError('cannot start since already recording');
        _recording = true;

        await NativeRecorder.instance.start(StartRequest(
          path: path.path,
          outputWidth: outputSize.width.round(),
          outputHeight: outputSize.height.round(),
        ));
        _timer = Timer.periodic(Duration(milliseconds: 1000 ~/ fps), _handlePeriodicCall);
      });

  Future<void> stop() async => await _lock.synchronized(() async {
        if (!_recording) throw ArgumentError('cannot start since already recording');
        _recording = false;

        await NativeRecorder.instance.stop();
        _timer?.cancel();
        _timer = null;
      });

  void _handlePeriodicCall(Timer _) async => await _lock.synchronized(() async {
        await NativeRecorder.instance.capture();
      });
}
