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

  const ConfigMethod({
    required this.returnType,
  });
}
