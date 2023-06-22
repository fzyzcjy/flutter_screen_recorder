import 'dart:io';

import 'package:recase/recase.dart';
import 'package:screen_recorder_code_generator/serialization/generator/generate_class.dart';
import 'package:screen_recorder_code_generator/serialization/generator/generate_enum.dart';
import 'package:screen_recorder_code_generator/utils.dart';

void generateAllSerialization(String dirTarget) {
  final text = '''
$kCommentHeader

import 'dart:ui';

import 'package:screen_recorder/src/bytes_reader_writer.dart';
import 'package:screen_recorder/src/delegate_base/paragraph.dart';
import 'package:screen_recorder/src/delegate_base/paragraph_builder.dart';
import 'package:screen_recorder/src/generated/record/canvas.dart';
import 'package:screen_recorder/src/generated/record/paragraph_builder.dart';
import 'package:screen_recorder/src/generated/record/scene_builder.dart';
import 'package:screen_recorder/src/record_list.dart';
import 'package:screen_recorder/src/serialization.dart';

${generateAllEnum()}

${generateAllClass()}
''';

  File('$dirTarget/serialization/serialization.dart').writeAsStringSync(dartfmt.format(text));
}

String getSerializationPartialName(String type) {
  return ReCase(type.replaceAll('?', '').replaceAll('<', '').replaceAll('>', '')).pascalCase;
}
