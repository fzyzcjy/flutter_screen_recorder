import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(PigeonOptions(
  dartOut: '../lib/src/messages.dart',
  kotlinOut: '../android/src/main/kotlin/com/cjy/fast_screen_recorder/Messages.kt',
  swiftOut: '../ios/Classes/messages.swift',
  kotlinOptions: KotlinOptions(
    package: 'com.cjy.fast_screen_recorder',
  ),
  dartOptions: DartOptions(copyrightHeader: [
    'ignore_for_file: avoid-non-null-assertion, prefer_constructors_over_static_methods, unused_field, combinators_ordering'
  ]),
))
class StartRequest {
  late String path;
  late int outputWidth;
  late int outputHeight;
  late double frameRate;
  late int bitrate;
  late int iFrameInterval;
}

@HostApi()
abstract class FastScreenRecorderHostApi {
  void start(StartRequest request);

  @async
  void capture();

  void stop();
}

class LogArg {
  String? tag;
  String? message;
  String? throwable;

  // NOTE need to know time of *native* log
  String? time;
}

@FlutterApi()
abstract class FastScreenRecorderFlutterApi {
  void log(LogArg arg);
}
