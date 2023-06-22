import 'dart:io';

import 'package:code_builder/code_builder.dart';
import 'package:screen_recorder_code_generator/method_replayer/config.dart';
import 'package:screen_recorder_code_generator/method_replayer/generator/delegate.dart';
import 'package:screen_recorder_code_generator/utils.dart';

void generateRecord(Config config, String dirTarget) {
  final text = '''
// ignore_for_file: unused_import, camel_case_types

import 'dart:typed_data';
import 'dart:ui';

${config.methods.map((configMethod) => _generateRecordClass(config, configMethod)).join('\n\n')}
  ''';

  File('$dirTarget/record/${config.generatedFilename}').writeAsStringSync(dartfmt.format(text));
}

String _generateRecordClass(Config config, ConfigMethod configMethod) {
  if (!configMethod.enableRecord) return '';

  return Class(
    (b) => b
      ..name = configMethod.recordClassName(config)
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
      ..methods.add(_generateRecordClassMethodExecute(config, configMethod)),
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
      ..body = Code(body),
  );
}

extension ExtConfigMethodRecord on ConfigMethod {
  List<ConfigMethodParameter> get parametersForRecord => parameters.where((e) => e.enableRecord).toList();
}
