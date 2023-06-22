import 'package:code_builder/code_builder.dart';
import 'package:recase/recase.dart';

class Config {
  final String originalClass;
  final String constructorParams;
  final List<ConfigMethod> methods;

  const Config({
    required this.originalClass,
    required this.constructorParams,
    required this.methods,
  });

  String get generatedClass => 'My$originalClass';

  String get superClass => 'My${originalClass}Base';

  String get generatedFilename => '${ReCase(originalClass.toString()).snakeCase}.dart';

  String get recordBaseClass => '${originalClass}_RecordBase';

  String get recordExecuteContextClass => '${originalClass}_RecordExecuteContext';
}

class ConfigMethod {
  final String methodName;
  final String returnType;
  final List<ConfigMethodParameter> parameters;
  final MethodType? type;

  final String? handlerName;
  final String? handlerParams;
  final bool handlerReturn;
  final bool enableRecord;

  final String? proxyCallParams;

  const ConfigMethod({
    required this.returnType,
    required this.methodName,
    required this.parameters,
    this.type,
    this.handlerName = 'handleOp',
    this.handlerParams,
    this.handlerReturn = false,
    this.enableRecord = true,
    this.proxyCallParams,
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

  final bool synthesizedInRecord;
  final String? recordConstructorArgument;
  final String? recordExecuteArgument;

  ConfigMethodParameter(
    String typeAndName, {
    bool? required,
    bool? named,
    this.defaultTo,
    this.enableRecord = true,
    this.synthesizedInRecord = false,
    this.recordConstructorArgument,
    this.recordExecuteArgument,
  })  : assert(typeAndName.split(' ').length == 2),
        type = typeAndName.split(' ')[0],
        name = typeAndName.split(' ')[1],
        named = named ?? (defaultTo != null),
        required = required ?? (defaultTo == null);
}
