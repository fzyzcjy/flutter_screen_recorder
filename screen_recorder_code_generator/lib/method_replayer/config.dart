import 'package:recase/recase.dart';

class Config {
  final String originalClass;
  final String generatedMixinName;
  final List<ConfigMethod> methods;

  const Config({
    required this.originalClass,
    required this.generatedMixinName,
    required this.methods,
  });

  String get generatedFilename => '${ReCase(originalClass.toString()).snakeCase}.dart';
}

class ConfigMethod {
  final String methodName;
  final String returnType;
  final List<ConfigMethodParameter> parameters;

  const ConfigMethod({
    required this.returnType,
    required this.methodName,
    required this.parameters,
  });
}

class ConfigMethodParameter {
  final String type;
  final String name;
  final bool named;
  final String? defaultTo;

  const ConfigMethodParameter(
    this.type,
    this.name, {
    this.named = false,
    this.defaultTo,
  });
}
