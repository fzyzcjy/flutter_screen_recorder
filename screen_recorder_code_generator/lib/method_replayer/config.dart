import 'package:code_builder/code_builder.dart';
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

  List<Parameter> get requiredParameters => parameters.where((e) => e.required).map((e) => e.toParameter()).toList();

  List<Parameter> get optionalParameters => parameters.where((e) => !e.required).map((e) => e.toParameter()).toList();
}

class ConfigMethodParameter {
  final String type;
  final String name;
  final bool required;
  final bool named;
  final String? defaultTo;

  const ConfigMethodParameter(
    this.type,
    this.name, {
    bool? required,
    this.named = false,
    this.defaultTo,
  }) : required = required ?? (defaultTo == null);

  Parameter toParameter() => Parameter(
        (b) => b
          ..name = name
          ..type = refer(type)
          ..named = named
          ..defaultTo = defaultTo == null ? null : Code(defaultTo!),
      );
}
