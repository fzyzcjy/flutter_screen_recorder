import 'package:fast_screen_recorder/src/messages.dart';

class NativeRecorder {
  static final instance = NativeRecorder._();

  final _hostApi = FastScreenRecorderHostApi();

  NativeRecorder._();

  Future<void> start(StartRequest request) async => await _hostApi.start(request);

  Future<void> capture() async => await _hostApi.capture();

  Future<void> stop() async => await _hostApi.stop();
}
