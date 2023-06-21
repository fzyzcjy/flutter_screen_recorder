import 'dart:io';

import 'package:screen_recorder_code_generator/method_replayer/config.dart';
import 'package:screen_recorder_code_generator/method_replayer/config_data.dart';

void generateAllMethodReplayer(String dirTarget) {
  for (final config in kConfigs) {
    generate(config, dirTarget);
  }
}

void generate(Config config, String dirTarget) {
  final text = '';

  File('$dirTarget/${config.generatedFilename}').writeAsStringSync(text);
}
