import 'package:screen_recorder_code_generator/method_replayer/config_data/canvas.dart';
import 'package:screen_recorder_code_generator/method_replayer/config_data/paragraph.dart';
import 'package:screen_recorder_code_generator/method_replayer/config_data/paragraph_builder.dart';
import 'package:screen_recorder_code_generator/method_replayer/config_data/scene_builder.dart';
import 'package:screen_recorder_code_generator/method_replayer/generator/delegate.dart';
import 'package:screen_recorder_code_generator/method_replayer/generator/record.dart';

final kConfigs = [
  kConfigSceneBuilder,
  kConfigCanvas,
  kConfigParagraphBuilder,
  kConfigParagraph,
];

void generateAllMethodReplayer(String dirTarget) {
  for (final config in kConfigs) {
    generateDelegate(config, dirTarget);
    generateRecord(config, dirTarget);
  }
}
