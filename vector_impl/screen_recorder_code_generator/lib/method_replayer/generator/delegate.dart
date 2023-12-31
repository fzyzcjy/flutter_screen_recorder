import 'dart:io';

import 'package:code_builder/code_builder.dart';
import 'package:screen_recorder_code_generator/method_replayer/config.dart';
import 'package:screen_recorder_code_generator/method_replayer/generator/record.dart';
import 'package:screen_recorder_code_generator/utils.dart';

void generateDelegate(Config config, String dirTarget) {
  final text = '''
// ignore_for_file: unused_import

$kCommentHeader

import 'dart:typed_data';
import 'dart:ui';

import 'package:screen_recorder/src/delegate_base/${config.generatedFilename}';
import 'package:screen_recorder/src/delegate_base/paragraph.dart';
import 'package:screen_recorder/src/expandos.dart';
import 'package:screen_recorder/src/generated/record/${config.generatedFilename}';

class ${config.generatedClass} extends ${config.superClass} implements ${config.originalClass} {
  ${config.generatedClass}(${config.constructorParams});

  ${config.methods.map((configMethod) => _generateDelegateMethod(config, configMethod)).join('\n\n')}
}
  ''';

  File('$dirTarget/delegate/${config.generatedFilename}').writeAsStringSync(dartfmt.format(text));
}

String _generateDelegateMethod(Config config, ConfigMethod configMethod) {
  final bodyConstructRecord = configMethod.enableRecord
      ? refer(configMethod.recordClassName(config))
          .call(
              [],
              Map.fromEntries(configMethod.parametersForRecord
                  .map((e) => MapEntry(e.name, refer(e.recordConstructorArgument ?? e.name)))))
          .statement
          .dartCode
      : '';

  final bodyCallProxy = () {
    final callMethodName = 'proxy.${configMethod.methodName}';
    if (configMethod.proxyCallParams != null) {
      return '$callMethodName(${configMethod.proxyCallParams});';
    }
    return configMethod.type == MethodType.getter
        ? '$callMethodName;'
        : refer(callMethodName)
            .call(configMethod.parametersForDelegate.positionalArguments,
                configMethod.parametersForDelegate.namedArguments)
            .statement
            .dartCode;
  }();

  final handlerParams = configMethod.handlerParams ?? 'result${configMethod.enableRecord ? ", record" : ""}';

  final bodyLines = [
    'final result = $bodyCallProxy',
    if (configMethod.enableRecord) ...[
      'final record = $bodyConstructRecord',
    ],
    if (configMethod.handlerName != null) ...[
      '${configMethod.handlerReturn ? "return " : ""}${configMethod.handlerName}($handlerParams);',
    ],
    if (!configMethod.handlerReturn) 'return result;',
  ];

  return Method(
    (b) => b
      ..name = configMethod.methodName
      ..annotations.add(refer('override'))
      ..type = configMethod.type
      ..returns = refer(configMethod.returnType)
      ..requiredParameters.addAll(configMethod.parametersForDelegate.requiredParameters)
      ..optionalParameters.addAll(configMethod.parametersForDelegate.optionalParameters)
      ..body = Code(bodyLines.join('\n')),
  ).dartCode;
}

extension ExtConfigMethodRecord on ConfigMethod {
  List<ConfigMethodParameter> get parametersForDelegate => parameters.where((e) => !e.synthesizedInRecord).toList();
}

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
