import 'package:flutter_test/flutter_test.dart';
import 'package:fast_screen_recorder/fast_screen_recorder.dart';
import 'package:fast_screen_recorder/fast_screen_recorder_platform_interface.dart';
import 'package:fast_screen_recorder/fast_screen_recorder_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFastScreenRecorderPlatform
    with MockPlatformInterfaceMixin
    implements FastScreenRecorderPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FastScreenRecorderPlatform initialPlatform = FastScreenRecorderPlatform.instance;

  test('$MethodChannelFastScreenRecorder is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFastScreenRecorder>());
  });

  test('getPlatformVersion', () async {
    FastScreenRecorder fastScreenRecorderPlugin = FastScreenRecorder();
    MockFastScreenRecorderPlatform fakePlatform = MockFastScreenRecorderPlatform();
    FastScreenRecorderPlatform.instance = fakePlatform;

    expect(await fastScreenRecorderPlugin.getPlatformVersion(), '42');
  });
}
