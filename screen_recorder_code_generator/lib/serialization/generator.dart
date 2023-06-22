import 'dart:io';

import 'package:recase/recase.dart';
import 'package:screen_recorder_code_generator/serialization/generator/generate_class.dart';
import 'package:screen_recorder_code_generator/utils.dart';

void generateAllSerialization(String dirTarget) {
  final text = '''
$kCommentHeader

import 'dart:typed_data';
import 'dart:ui';

import 'package:screen_recorder/bytes_reader.dart';
import 'package:screen_recorder/generated/record/canvas.dart';
import 'package:screen_recorder/generated/record/paragraph_builder.dart';
import 'package:screen_recorder/generated/record/scene_builder.dart';

${generateAllClass()}
''';

  File('$dirTarget/serialization/serialization.dart').writeAsStringSync(dartfmt.format(text));
}

String getSerializationPartialName(String type) {
  return ReCase(type.replaceAll('?', '').replaceAll('<', '').replaceAll('>', '')).pascalCase;
}
