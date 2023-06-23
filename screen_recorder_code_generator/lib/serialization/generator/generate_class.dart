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

  var body = '''
  ${config.fields.map((e) => _generateFromBytesField(config, e)).join('\n')}
  return $constructorCall
  ''';

  if (config.enableReferable) body = _wrapFromBytesReferable(config, body);

  return '''
${config.className} fromBytes${getSerializationPartialName(config.className)}(ContextBytesReader reader) {
  $body
}
  ''';
}

String _generateFromBytesField(Config config, ConfigField configField) {
  final listInnerType = typeListInnerType(configField.type);
  final innerFunctionName = 'fromBytes${getSerializationPartialName(listInnerType ?? configField.type)}';
  final lhs = 'final ${configField.name}';
  final outerFunctionPartialName = _getSerializationOuterPartialName(configField.type);

  return outerFunctionPartialName != null
      ? '$lhs = fromBytes$outerFunctionPartialName(reader, $innerFunctionName);'
      : '$lhs = $innerFunctionName(reader);';
}

String _wrapFromBytesReferable(Config config, String innerBody) {
  return '''
    return fromBytesReferable(reader, reader.context.referableContext${config.className}, () {
      $innerBody
    });
  ''';
}

String _generateToBytes(Config config) {
  var body = config.fields.map((e) => _generateToBytesField(config, e)).join('\n');

  if (config.enableReferable) body = _wrapToBytesReferable(config, body);

  return '''
void toBytes${getSerializationPartialName(config.className)}(ContextBytesWriter writer, ${config.className} value) {
  $body
}
  ''';
}

String _generateToBytesField(Config config, ConfigField configField) {
  final listInnerType = typeListInnerType(configField.type);
  final innerFunctionName = 'toBytes${getSerializationPartialName(listInnerType ?? configField.type)}';
  final valueName = 'value.${configField.name}';
  final outerFunctionPartialName = _getSerializationOuterPartialName(configField.type);

  return outerFunctionPartialName != null
      ? 'toBytes$outerFunctionPartialName(writer, $valueName, $innerFunctionName);'
      : '$innerFunctionName(writer, $valueName);';
}

String _wrapToBytesReferable(Config config, String innerBody) {
  return '''
    toBytesReferable(writer, writer.context.referableContext${config.className}, value, () {
      $innerBody
    });
  ''';
}

String? typeListInnerType(String type) =>
    type.startsWith('List<') ? type.replaceAll('List<', '').replaceAll('>', '') : null;

bool typeIsNullable(String type) => type.endsWith('?');

String? _getSerializationOuterPartialName(String type) {
  final listInnerType = typeListInnerType(type);
  final nullable = typeIsNullable(type);

  if (listInnerType != null) return nullable ? 'NullableList' : 'List';
  return nullable ? 'Nullable' : null;
}
