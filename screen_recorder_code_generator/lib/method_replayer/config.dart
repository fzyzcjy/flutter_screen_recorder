import 'package:recase/recase.dart';

class Config {
  final Type originalClass;
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
  final Type returnType;
  final List<ConfigMethodParameter> parameters;

  const ConfigMethod({
    required this.returnType,
    required this.methodName,
    required this.parameters,
  });
}

class ConfigMethodParameter {
  final Type type;
  final String name;
  final bool required;
  final String? defaultValue;

  const ConfigMethodParameter({
    required this.type,
    required this.name,
    required this.required,
    this.defaultValue,
  });
}
