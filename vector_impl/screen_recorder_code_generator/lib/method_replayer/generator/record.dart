import 'dart:io';

import 'package:code_builder/code_builder.dart';
import 'package:collection/collection.dart';
import 'package:screen_recorder_code_generator/method_replayer/config.dart';
import 'package:screen_recorder_code_generator/serialization/generator.dart';
import 'package:screen_recorder_code_generator/utils.dart';

void generateRecord(Config config, String dirTarget) {
  final text = '''
// ignore_for_file: unused_import, camel_case_types

$kCommentHeader

import 'dart:typed_data';
import 'dart:ui';

import 'package:screen_recorder/src/bytes_reader_writer.dart';
import 'package:screen_recorder/src/generated/serialization/serialization.dart';
import 'package:screen_recorder/src/serialization.dart';
import 'package:screen_recorder/src/temporary_clone.dart';
import 'package:screen_recorder/src/delegate_base/${config.generatedFilename}';

${_generateBaseClass(config)}

${config.methodsForRecord.mapIndexed((index, configMethod) => _generateRecordClass(config, configMethod, index)).join('\n\n')}
  ''';

  File('$dirTarget/record/${config.generatedFilename}').writeAsStringSync(dartfmt.format(text));
}

String _generateBaseClass(Config config) {
  return '''
sealed class ${config.recordBaseClass}<Ret> {
  ${config.recordBaseClass}();
  
  ${_generateBaseClassFromBytes(config)}
  
  Ret execute(${config.originalClass} proxy, ${config.recordExecuteContextClass} executeContext);
  
  // TODO only a temporary workaround, should remove after implementing serialization
  ${config.recordBaseClass}<Ret> temporaryClone();
  
  void toBytes(ContextBytesWriter writer) {
    toBytesUint8(writer, tag);
    toBytesWithoutTag(writer);
  }
  
  int get tag;

  void toBytesWithoutTag(ContextBytesWriter writer);
}
  ''';
}

String _generateBaseClassFromBytes(Config config) {
  return '''
  static ${config.recordBaseClass} fromBytes(ContextBytesReader reader) {
    final tag = fromBytesUint8(reader);
    switch (tag) {
      ${config.methodsForRecord.mapIndexed((index, configMethod) => _generateBaseClassFromBytesCase(config, configMethod, index)).join('\n')}
      default: throw UnimplementedError('unknown tag=\$tag');
    }
  }
  ''';
}

String _generateBaseClassFromBytesCase(Config config, ConfigMethod configMethod, int index) {
  return 'case $index: return ${configMethod.recordClassName(config)}.fromBytes(reader);';
}

String _generateRecordClass(Config config, ConfigMethod configMethod, int index) {
  return Class(
    (b) => b
      ..name = configMethod.recordClassName(config)
      ..extend = refer('${config.recordBaseClass}<${configMethod.returnType}>')
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
      ..methods.add(Method(
        (b) => b
          ..name = 'tag'
          ..returns = refer('int')
          ..type = MethodType.getter
          ..lambda = true
          ..annotations.add(refer('override'))
          ..body = Code('$index'),
      ))
      ..methods.add(_generateRecordClassMethodToBytes(config, configMethod))
      ..methods.add(_generateRecordClassMethodClone(config, configMethod)),
  ).dartCode;
}

Method _generateRecordClassMethodExecute(Config config, ConfigMethod configMethod) {
  final interestParameters = configMethod.parameters
      .where((e) => (e.enableRecord || e.recordExecuteArgument != null) && !e.synthesizedInRecord)
      .toList();
  final bodyCallProxy = refer(configMethod.methodName)
      .call(
        interestParameters.where((e) => !e.named).map((e) => refer(e.recordExecuteArgument ?? e.name)).toList(),
        Map.fromEntries(interestParameters
            .where((e) => e.named)
            .map((e) => MapEntry(e.name, refer(e.recordExecuteArgument ?? e.name)))),
      )
      .statement
      .dartCode;
  final body = 'final result = proxy.$bodyCallProxy'
      '${configMethod.recordExecuteExtraBody ?? ""}'
      'return result;';

  return Method(
    (b) => b
      ..name = 'execute'
      ..returns = refer(configMethod.returnType)
      ..requiredParameters.add(Parameter((b) => b
        ..name = 'proxy'
        ..type = refer(config.originalClass)))
      ..requiredParameters.add(Parameter((b) => b
        ..name = 'executeContext'
        ..type = refer(config.recordExecuteContextClass)))
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
          ..type = refer('ContextBytesReader'),
      ))
      ..body = Code('fromBytes${getSerializationPartialName(configMethod.recordClassName(config))}(reader)'),
  );
}

Method _generateRecordClassMethodToBytes(Config config, ConfigMethod configMethod) {
  return Method.returnsVoid(
    (b) => b
      ..name = 'toBytesWithoutTag'
      ..lambda = true
      ..annotations.add(refer('override'))
      ..requiredParameters.add(Parameter(
        (b) => b
          ..name = 'writer'
          ..type = refer('ContextBytesWriter'),
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
    // https://github.com/fzyzcjy/yplusplus/issues/9604#issuecomment-1602260628
    // 'Picture',
    'Float32List',
    'Float64List',
  }.contains(type);
}

extension on Config {
  List<ConfigMethod> get methodsForRecord => methods.where((e) => e.enableRecord).toList();
}

extension ExtConfigMethodRecord on ConfigMethod {
  List<ConfigMethodParameter> get parametersForRecord => parameters.where((e) => e.enableRecord).toList();
}
