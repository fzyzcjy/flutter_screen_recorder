import 'dart:io';

import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';
import 'package:recase/recase.dart';
import 'package:screen_recorder_code_generator/method_replayer/config.dart';
import 'package:screen_recorder_code_generator/method_replayer/config_data/canvas.dart';
import 'package:screen_recorder_code_generator/method_replayer/config_data/paragraph_builder.dart';
import 'package:screen_recorder_code_generator/method_replayer/config_data/scene_builder.dart';

final _dartfmt = DartFormatter(pageWidth: 120);

final kConfigs = [
  kConfigSceneBuilder,
  kConfigCanvas,
  kConfigParagraphBuilder,
];

void generateAllMethodReplayer(String dirTarget) {
  for (final config in kConfigs) {
    _generateDelegate(config, dirTarget);
    _generateRecord(config, dirTarget);
  }
}

void _generateDelegate(Config config, String dirTarget) {
  final text = '''
// ignore_for_file: unused_import

import 'dart:typed_data';
import 'dart:ui';

import 'package:screen_recorder/manual/${config.generatedFilename}';

class ${config.generatedClass} with ${config.manualMixin} implements ${config.originalClass} {
  final ${config.originalClass} proxy;

  ${config.generatedClass}(this.proxy);

  ${config.methods.map((configMethod) => _generateDelegateMethod(config, configMethod)).join('\n\n')}
}
  ''';

  File('$dirTarget/delegate/${config.generatedFilename}').writeAsStringSync(_dartfmt.format(text));
}

String _generateDelegateMethod(Config config, ConfigMethod configMethod) {
  final bodyCallProxy = () {
    final callMethodName = 'proxy.${configMethod.methodName}';
    return configMethod.type == MethodType.getter
        ? '$callMethodName;'
        : refer(callMethodName).call(configMethod.positionalArguments, configMethod.namedArguments).statement.dartCode;
  }();
  final body = 'return $bodyCallProxy';

  return Method(
    (b) => b
      ..name = configMethod.methodName
      ..annotations.add(refer('override'))
      ..type = configMethod.type
      ..returns = refer(configMethod.returnType)
      ..requiredParameters.addAll(configMethod.requiredParameters)
      ..optionalParameters.addAll(configMethod.optionalParameters)
      ..body = Code(body),
  ).dartCode;
}

void _generateRecord(Config config, String dirTarget) {
  final text = '''
// ignore_for_file: unused_import, camel_case_types

import 'dart:typed_data';
import 'dart:ui';

${config.methods.map((configMethod) => _generateRecordClass(config, configMethod)).join('\n\n')}
  ''';

  File('$dirTarget/record/${config.generatedFilename}').writeAsStringSync(_dartfmt.format(text));
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

extension on Spec {
  String get dartCode => accept(DartEmitter()).toString();
}
