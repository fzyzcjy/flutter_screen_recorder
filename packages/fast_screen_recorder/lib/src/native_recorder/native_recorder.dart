import 'dart:io';

import 'package:fast_screen_recorder/src/messages.dart';

class NativeRecorder {
  static final instance = NativeRecorder._();

  final _hostApi = FastScreenRecorderHostApi();

  NativeRecorder._();

  Future<void> start({
    required File path,
  }) async =>
      await _hostApi.start(StartRequest(path: path.path));

  Future<void> stop() async => await _hostApi.stop();
}
