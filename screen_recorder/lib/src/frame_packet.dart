import 'package:screen_recorder/src/record_list.dart';
import 'package:screen_recorder/src/touch/touch_data.dart';

class FramePacket {
  final SceneBuilderRecordList scene;
  final TouchPerFrameData touch;

  const FramePacket({
    required this.scene,
    required this.touch,
  });
}
