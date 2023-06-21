import 'dart:io';

import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';
import 'package:screen_recorder_code_generator/method_replayer/config.dart';
import 'package:screen_recorder_code_generator/method_replayer/config_data.dart';

final _dartfmt = DartFormatter(pageWidth: 120);

void generateAllMethodReplayer(String dirTarget) {
  for (final config in kConfigs) {
    _generate(config, dirTarget);
  }
}

void _generate(Config config, String dirTarget) {
  final text = '''
import 'dart:typed_data';
import 'dart:ui';

mixin ${config.generatedMixinName} implements ${config.originalClass} {
  ${config.originalClass} get proxy;

  ${config.methods.map((configMethod) => _generateMethod(config, configMethod)).join('\n\n')}
}
  ''';

  File('$dirTarget/${config.generatedFilename}').writeAsStringSync(_dartfmt.format(text));
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
