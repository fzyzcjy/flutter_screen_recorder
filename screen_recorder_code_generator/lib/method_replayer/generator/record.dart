import 'dart:io';

import 'package:code_builder/code_builder.dart';
import 'package:recase/recase.dart';
import 'package:screen_recorder_code_generator/method_replayer/config.dart';
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
  return Class(
    (b) => b
      ..name = '${config.originalClass}_${ReCase(configMethod.methodName).pascalCase}_Record'
      ..fields.addAll(configMethod.parameters.map((e) => Field(
            (b) => b
              ..name = e.name
              ..type = refer(e.type)
              ..modifier = FieldModifier.final$,
          )))
      ..constructors.add(Constructor(
        (b) => b
          ..optionalParameters.addAll(configMethod.parameters.map((e) => Parameter(
                (b) => b
                  ..name = e.name
                  ..toThis = true
                  ..named = true
                  ..required = true,
              ))),
      )),
  ).dartCode;
}
