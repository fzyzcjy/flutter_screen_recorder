import 'dart:io';

import 'package:screen_recorder_code_generator/serialization/config.dart';
import 'package:screen_recorder_code_generator/utils.dart';

import 'config_data.dart';

void generateAllSerialization(String dirTarget) {
  final lines = <String>[];
  for (final config in kConfigs) {
    lines.addAll([
      generateFromBytes(config),
      generateToBytes(config),
    ]);
  }
  File('$dirTarget/serialization/serialization.dart').writeAsStringSync(dartfmt.format(lines.join('\n')));
}

String generateFromBytes(Config config) {
  return TODO;
}

String generateToBytes(Config config) {
  return TODO;
}
