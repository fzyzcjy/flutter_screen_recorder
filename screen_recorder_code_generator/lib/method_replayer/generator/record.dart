import 'dart:io';

import 'package:code_builder/code_builder.dart';
import 'package:screen_recorder_code_generator/method_replayer/config.dart';
import 'package:screen_recorder_code_generator/method_replayer/generator/delegate.dart';
import 'package:screen_recorder_code_generator/serialization/generator.dart';
import 'package:screen_recorder_code_generator/utils.dart';

void generateRecord(Config config, String dirTarget) {
  final text = '''
// ignore_for_file: unused_import, camel_case_types

$kCommentHeader

import 'dart:typed_data';
import 'dart:ui';

import 'package:screen_recorder/bytes_reader.dart';
import 'package:screen_recorder/generated/serialization/serialization.dart';
import 'package:screen_recorder/serialization.dart';
import 'package:screen_recorder/temporary_clone.dart';

abstract class ${config.recordBaseClass}<Ret> {
  Ret execute(${config.originalClass} proxy);
  
  // TODO only a temporary workaround, should remove after implementing serialization
  ${config.recordBaseClass}<Ret> temporaryClone();
}

${config.methods.map((configMethod) => _generateRecordClass(config, configMethod)).join('\n\n')}
  ''';

  File('$dirTarget/record/${config.generatedFilename}').writeAsStringSync(dartfmt.format(text));
}

String _generateRecordClass(Config config, ConfigMethod configMethod) {
  if (!configMethod.enableRecord) return '';

  return Class(
    (b) => b
      ..name = configMethod.recordClassName(config)
      ..implements.add(refer('${config.recordBaseClass}<${configMethod.returnType}>'))
      ..fields.addAll(configMethod.parametersForRecord.map((e) => Field(
            (b) => b
              ..name = e.name
              ..type = refer(e.type)
              ..modifier = FieldModifier.final$,
          )))
      ..constructors.add(Constructor(
        (b) => b
          ..optionalParameters.addAll(configMethod.parametersForRecord.map((e) => Parameter(
                (b) => b
                  ..name = e.name
                  ..toThis = true
                  ..named = true
                  ..required = true,
              ))),
      ))
      ..methods.add(_generateRecordClassMethodExecute(config, configMethod))
      ..constructors.add(_generateRecordClassMethodFromBytes(config, configMethod))
      ..methods.add(_generateRecordClassMethodToBytes(config, configMethod))
      ..methods.add(_generateRecordClassMethodClone(config, configMethod)),
  ).dartCode;
}

Method _generateRecordClassMethodExecute(Config config, ConfigMethod configMethod) {
  final bodyCallProxy = refer(configMethod.methodName)
      .call(configMethod.parametersForRecord.positionalArguments, configMethod.parametersForRecord.namedArguments)
      .statement
      .dartCode;
  final body = 'return proxy.$bodyCallProxy';

  return Method(
    (b) => b
      ..name = 'execute'
      ..returns = refer(configMethod.returnType)
      ..requiredParameters.add(Parameter(
        (b) => b
          ..name = 'proxy'
          ..type = refer(config.originalClass),
      ))
      ..annotations.add(refer('override'))
      ..body = Code(body),
  );
}

Constructor _generateRecordClassMethodFromBytes(Config config, ConfigMethod configMethod) {
  return Constructor(
    (b) => b
      ..name = 'fromBytes'
      ..factory = true
      ..lambda = true
      ..requiredParameters.add(Parameter(
        (b) => b
          ..name = 'reader'
          ..type = refer('BytesReader'),
      ))
      ..body = Code('fromBytes${getSerializationPartialName(configMethod.recordClassName(config))}(reader)'),
  );
}

Method _generateRecordClassMethodToBytes(Config config, ConfigMethod configMethod) {
  return Method.returnsVoid(
    (b) => b
      ..name = 'toBytes'
      ..lambda = true
      ..requiredParameters.add(Parameter(
        (b) => b
          ..name = 'writer'
          ..type = refer('BytesBuilder'),
      ))
      ..body = Code('toBytes${getSerializationPartialName(configMethod.recordClassName(config))}(writer, this)'),
  );
}

Method _generateRecordClassMethodClone(Config config, ConfigMethod configMethod) {
  final bodyCall = refer(configMethod.recordClassName(config))
      .call(
          [],
          Map.fromEntries(configMethod.parametersForRecord.map(
            (e) => MapEntry(e.name, refer(e.name + (_shouldTemporaryClone(e.type) ? '.temporaryClone()' : ''))),
          )))
      .statement
      .dartCode;
  final body = 'return $bodyCall';

  return Method(
    (b) => b
      ..name = 'temporaryClone'
      ..returns = refer(configMethod.recordClassName(config))
      ..annotations.add(refer('override'))
      ..body = Code(body),
  );
}

bool _shouldTemporaryClone(String type) {
  return const {
    'Path',
    'Picture',
    'Float32List',
    'Float64List',
  }.contains(type);
}

extension ExtConfigMethodRecord on ConfigMethod {
  List<ConfigMethodParameter> get parametersForRecord => parameters.where((e) => e.enableRecord).toList();
}
