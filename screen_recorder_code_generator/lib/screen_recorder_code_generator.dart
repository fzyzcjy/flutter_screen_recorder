import 'dart:io';

import 'package:path/path.dart';
import 'package:screen_recorder_code_generator/method_replayer/generator.dart';
import 'package:screen_recorder_code_generator/serialization/generator.dart';

void main() {
  final dirTarget = dirname(Platform.script.path) + '/../../screen_recorder/lib/generated';
  generateAllMethodReplayer(dirTarget);
  generateAllSerialization(dirTarget);
}
