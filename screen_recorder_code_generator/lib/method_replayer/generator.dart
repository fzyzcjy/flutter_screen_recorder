import 'dart:io';

import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';
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
    _generate(config, dirTarget);
  }
}

void _generate(Config config, String dirTarget) {
  final text = '''
// ignore_for_file: unused_import

import 'dart:typed_data';
import 'dart:ui';

import 'package:screen_recorder/manual/${config.generatedFilename}';

class ${config.generatedClass} with ${config.manualMixin} implements ${config.originalClass} {
  final ${config.originalClass} proxy;

  ${config.generatedClass}(this.proxy);

  ${config.methods.map((configMethod) => _generateMethod(config, configMethod)).join('\n\n')}
}
  ''';

  File('$dirTarget/delegate/${config.generatedFilename}').writeAsStringSync(_dartfmt.format(text));
}

String _generateMethod(Config config, ConfigMethod configMethod) {
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

extension on Spec {
  String get dartCode => accept(DartEmitter()).toString();
}
