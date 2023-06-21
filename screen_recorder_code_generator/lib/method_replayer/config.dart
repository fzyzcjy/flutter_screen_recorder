import 'package:recase/recase.dart';

class Config {
  final String originalClassName;

  const Config({
    required this.originalClassName,
  });

  String get delegateClassName => 'My$originalClassName';
 
  String get generatedFilename => '${ReCase(originalClassName).snakeCase}.dart';
}
