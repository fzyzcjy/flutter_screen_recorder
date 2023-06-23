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
$enumName fromBytes${getSerializationPartialName(enumName)}(ContextBytesReader reader) {
  return $enumName.values[fromBytesUint8(reader)];
}
  ''';
}

String _generateToBytes(String enumName) {
  return '''
void toBytes${getSerializationPartialName(enumName)}(ContextBytesWriter writer, $enumName value) {
  toBytesUint8(writer, value.index);
}
  ''';
}
