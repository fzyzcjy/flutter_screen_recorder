import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'fast_screen_recorder_platform_interface.dart';

/// An implementation of [FastScreenRecorderPlatform] that uses method channels.
class MethodChannelFastScreenRecorder extends FastScreenRecorderPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('fast_screen_recorder');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
