import 'dart:io';

import 'package:fast_screen_recorder/src/native_recorder/native_recorder.dart';

class FastScreenRecorder {
  static final instance = FastScreenRecorder._();

  FastScreenRecorder._();

  Future<void> start({
    required File path,
  }) async =>
      await NativeRecorder.instance.start(
        path: path,
      );

  Future<void> stop() async => await NativeRecorder.instance.stop();
}
