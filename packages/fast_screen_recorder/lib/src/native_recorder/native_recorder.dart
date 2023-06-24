import 'dart:io';

class NativeRecorder {
  static final instance = NativeRecorder._();

  NativeRecorder._();

  Future<void> start({
    required File path,
  }) async =>
      throw UnimplementedError();

  Future<void> stop() async => throw UnimplementedError();
}
