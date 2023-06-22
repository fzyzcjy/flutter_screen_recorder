import 'package:screen_recorder_code_generator/serialization/generator.dart';

const kEnumNames = [
  'Clip',
  'ClipOp',
  'BlendMode',
  'FilterQuality',
  'PointMode',
  'PlaceholderAlignment',
  'TextBaseline',
  'TextAlign',
  'TextDirection',
  'TextLeadingDistribution',
  'TextDecorationStyle',
  'FontStyle',
  'FontWeight',
];

String generateAllEnum() {
  final lines = <String>[];
  for (final enumName in kEnumNames) {
    lines.addAll([
      _generateFromBytes(enumName),
      _generateToBytes(enumName),
    ]);
  }
  return lines.join('\n');
}

String _generateFromBytes(String enumName) {
  return '''
$enumName fromBytes${getSerializationPartialName(enumName)}(BytesReader reader) {
  return $enumName.values[reader.readByte()];
}
  ''';
}

String _generateToBytes(String enumName) {
  return '''
void toBytes${getSerializationPartialName(enumName)}(BytesBuilder writer, $enumName value) {
  writer.addByte(value.index);
}
  ''';
}
