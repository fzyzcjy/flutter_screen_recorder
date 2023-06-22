import 'dart:io';

import 'package:code_builder/code_builder.dart';
import 'package:recase/recase.dart';
import 'package:screen_recorder_code_generator/method_replayer/generator.dart' as method_replayer;
import 'package:screen_recorder_code_generator/serialization/config.dart';
import 'package:screen_recorder_code_generator/serialization/config_data/from_method_replayer.dart';
import 'package:screen_recorder_code_generator/serialization/config_data/manual.dart';
import 'package:screen_recorder_code_generator/utils.dart';

final kConfigs = [
  ...kManualConfigs,
  ...createConfigsFromMethodReplayer(method_replayer.kConfigs),
];

void generateAllSerialization(String dirTarget) {
  final lines = <String>[];

  lines.add('''
$kCommentHeader

import 'dart:typed_data';
import 'dart:ui';

import 'package:screen_recorder/bytes_reader.dart';
import 'package:screen_recorder/generated/record/canvas.dart';
import 'package:screen_recorder/generated/record/paragraph_builder.dart';
import 'package:screen_recorder/generated/record/scene_builder.dart';
  ''');

  for (final config in kConfigs) {
    lines.addAll([
      generateFromBytes(config),
      generateToBytes(config),
    ]);
  }

  File('$dirTarget/serialization/serialization.dart').writeAsStringSync(dartfmt.format(lines.join('\n')));
}

String generateFromBytes(Config config) {
  final constructorCall = refer(config.className)
      .call(
        config.nonNamedFields.map((e) => refer(e.name)),
        Map.fromEntries(config.namedFields.map((e) => MapEntry(e.name, refer(e.name)))),
      )
      .statement
      .dartCode;

  return '''
${config.className} fromBytes${getSerializationPartialName(config.className)}(BytesReader reader) {
  ${config.fields.map((e) => _generateFromBytesField(config, e)).join('\n')}
  return $constructorCall
}
  ''';
}

String _generateFromBytesField(Config config, ConfigField configField) {
  return 'final ${configField.name} = fromBytes${getSerializationPartialName(configField.type)}(reader);';
}

String generateToBytes(Config config) {
  return '''
void toBytes${getSerializationPartialName(config.className)}(BytesBuilder writer, ${config.className} value) {
  ${config.fields.map((e) => _generateToBytesField(config, e)).join('\n')}
}
  ''';
}

String _generateToBytesField(Config config, ConfigField configField) {
  return 'toBytes${getSerializationPartialName(configField.type)}(writer, value.${configField.name});';
}

String getSerializationPartialName(String type) {
  return ReCase(type.replaceAll('?', '').replaceAll('<', '').replaceAll('>', '')).pascalCase;
}
