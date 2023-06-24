import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'fast_screen_recorder_method_channel.dart';

abstract class FastScreenRecorderPlatform extends PlatformInterface {
  /// Constructs a FastScreenRecorderPlatform.
  FastScreenRecorderPlatform() : super(token: _token);

  static final Object _token = Object();

  static FastScreenRecorderPlatform _instance = MethodChannelFastScreenRecorder();

  /// The default instance of [FastScreenRecorderPlatform] to use.
  ///
  /// Defaults to [MethodChannelFastScreenRecorder].
  static FastScreenRecorderPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FastScreenRecorderPlatform] when
  /// they register themselves.
  static set instance(FastScreenRecorderPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
