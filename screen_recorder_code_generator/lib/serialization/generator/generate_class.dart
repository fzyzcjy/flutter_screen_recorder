import 'package:code_builder/code_builder.dart';
import 'package:screen_recorder_code_generator/method_replayer/generator.dart' as method_replayer;
import 'package:screen_recorder_code_generator/serialization/config.dart';
import 'package:screen_recorder_code_generator/serialization/config_data/from_method_replayer.dart';
import 'package:screen_recorder_code_generator/serialization/config_data/manual.dart';
import 'package:screen_recorder_code_generator/serialization/generator.dart';
import 'package:screen_recorder_code_generator/utils.dart';

final kConfigs = [
  ...kManualConfigs,
  ...createConfigsFromMethodReplayer(method_replayer.kConfigs),
];

String generateAllClass() {
  final lines = <String>[];
  for (final config in kConfigs) {
    lines.addAll([
      _generateFromBytes(config),
      _generateToBytes(config),
    ]);
  }
  return lines.join('\n');
}

String _generateFromBytes(Config config) {
  final constructorName = '${config.className}${config.constructorName != null ? '.${config.constructorName}' : ''}';
  final constructorCall = config.constructorParams != null
      ? '$constructorName(${config.constructorParams});'
      : refer(constructorName)
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

String _generateToBytes(Config config) {
  return '''
void toBytes${getSerializationPartialName(config.className)}(BytesBuilder writer, ${config.className} value) {
  ${config.fields.map((e) => _generateToBytesField(config, e)).join('\n')}
}
  ''';
}

String _generateToBytesField(Config config, ConfigField configField) {
  return 'toBytes${getSerializationPartialName(configField.type)}(writer, value.${configField.name});';
}
