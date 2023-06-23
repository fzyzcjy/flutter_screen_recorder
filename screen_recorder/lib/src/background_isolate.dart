import 'dart:isolate';

class MainIsolate {
  static Future<void> setup() async {
    final receivePort = ReceivePort();
    Isolate.spawn(BackgroundIsolate._entrypoint, receivePort.sendPort);
    final sendPort = await receivePort.first;
   
    TODO;
  }
}

class BackgroundIsolate {
  static void _entrypoint(SendPort sendPort) {
    final receivePort = ReceivePort();
    sendPort.send(receivePort.sendPort);

    TODO;
  }
}
