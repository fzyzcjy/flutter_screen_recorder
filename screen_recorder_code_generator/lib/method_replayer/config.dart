import 'package:code_builder/code_builder.dart';
import 'package:recase/recase.dart';

class Config {
  final String originalClass;
  final List<ConfigMethod> methods;

  const Config({
    required this.originalClass,
    required this.methods,
  });

  String get generatedClass => 'My$originalClass';

  String get manualMixin => 'My${originalClass}Mixin';

  String get generatedFilename => '${ReCase(originalClass.toString()).snakeCase}.dart';
}

class ConfigMethod {
  final String methodName;
  final String returnType;
  final List<ConfigMethodParameter> parameters;
  final MethodType? type;

  final String handlerName;
  final bool enableRecord;

  const ConfigMethod({
    required this.returnType,
    required this.methodName,
    required this.parameters,
    this.type,
    this.handlerName = 'handleOp',
    this.enableRecord = true,
  });

  String recordClassName(Config config) => '${config.originalClass}_${ReCase(methodName).pascalCase}_Record';
}

class ConfigMethodParameter {
  final String type;
  final String name;
  final bool required;
  final bool named;
  final String? defaultTo;

  final bool enableRecord;

  ConfigMethodParameter(
    String typeAndName, {
    bool? required,
    bool? named,
    this.defaultTo,
    this.enableRecord = true,
  })  : assert(typeAndName.split(' ').length == 2),
        type = typeAndName.split(' ')[0],
        name = typeAndName.split(' ')[1],
        named = named ?? (defaultTo != null),
        required = required ?? (defaultTo == null);
}
