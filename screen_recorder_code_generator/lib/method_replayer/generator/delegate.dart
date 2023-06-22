import 'dart:io';

import 'package:code_builder/code_builder.dart';
import 'package:screen_recorder_code_generator/method_replayer/config.dart';
import 'package:screen_recorder_code_generator/method_replayer/generator/record.dart';
import 'package:screen_recorder_code_generator/utils.dart';

void generateDelegate(Config config, String dirTarget) {
  final text = '''
// ignore_for_file: unused_import

import 'dart:typed_data';
import 'dart:ui';

import 'package:screen_recorder/generated/record/${config.generatedFilename}';
import 'package:screen_recorder/manual/${config.generatedFilename}';

class ${config.generatedClass} with ${config.manualMixin} implements ${config.originalClass} {
  @override
  final ${config.originalClass} proxy;

  ${config.generatedClass}(this.proxy);

  ${config.methods.map((configMethod) => _generateDelegateMethod(config, configMethod)).join('\n\n')}
}
  ''';

  File('$dirTarget/delegate/${config.generatedFilename}').writeAsStringSync(dartfmt.format(text));
}

String _generateDelegateMethod(Config config, ConfigMethod configMethod) {
  final bodyConstructRecord = refer(configMethod.recordClassName(config))
      .call([], Map.fromEntries(configMethod.parametersForRecord.map((e) => MapEntry(e.name, refer(e.name)))))
      .statement
      .dartCode;

  final bodyCallProxy = () {
    final callMethodName = 'proxy.${configMethod.methodName}';
    return configMethod.type == MethodType.getter
        ? '$callMethodName;'
        : refer(callMethodName)
            .call(configMethod.parameters.positionalArguments, configMethod.parameters.namedArguments)
            .statement
            .dartCode;
  }();

  final body = '$bodyConstructRecord'
      'return $bodyCallProxy';

  return Method(
    (b) => b
      ..name = configMethod.methodName
      ..annotations.add(refer('override'))
      ..type = configMethod.type
      ..returns = refer(configMethod.returnType)
      ..requiredParameters.addAll(configMethod.parameters.requiredParameters)
      ..optionalParameters.addAll(configMethod.parameters.optionalParameters)
      ..body = Code(body),
  ).dartCode;
}

extension ExtConfigMethod on ConfigMethod {}

extension ExtListConfigMethodParameter on List<ConfigMethodParameter> {
  List<Parameter> get requiredParameters => where((e) => e.required).map((e) => e.toParameter()).toList();

  List<Parameter> get optionalParameters => where((e) => !e.required).map((e) => e.toParameter()).toList();

  List<Expression> get positionalArguments => where((e) => !e.named).map((e) => refer(e.name)).toList();

  Map<String, Expression> get namedArguments =>
      Map.fromEntries(where((e) => e.named).map((e) => MapEntry(e.name, refer(e.name))));
}

extension on ConfigMethodParameter {
  Parameter toParameter() => Parameter(
        (b) => b
          ..name = name
          ..type = refer(type)
          ..named = named
          ..defaultTo = defaultTo == null ? null : Code(defaultTo!),
      );
}
