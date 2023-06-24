
import 'fast_screen_recorder_platform_interface.dart';

class FastScreenRecorder {
  Future<String?> getPlatformVersion() {
    return FastScreenRecorderPlatform.instance.getPlatformVersion();
  }
}
