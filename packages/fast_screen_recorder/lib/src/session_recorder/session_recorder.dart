import 'dart:io';

class SessionRecorder {
  static final instance = SessionRecorder._();

  SessionRecorder._();

  Future<void> start({
    required Directory directory,
  }) async {
    if (!await directory.exists()) throw ArgumentError('Please ensure directory=$directory exists');

    throw UnimplementedError();
  }

  Future<void> stop() async => throw UnimplementedError();

  Future<List<File>> getRecord({
    required DateTime startTime,
    required DateTime endTime,
  }) async =>
      throw UnimplementedError();
}
