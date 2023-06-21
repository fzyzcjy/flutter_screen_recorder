import 'dart:io';

import 'package:screen_recorder_code_generator/method_replayer/config.dart';
import 'package:screen_recorder_code_generator/method_replayer/config_data.dart';

void generateAllMethodReplayer(String dirTarget) {
  for (final config in kConfigs) {
    _generate(config, dirTarget);
  }
}

void _generate(Config config, String dirTarget) {
  final text = '''
mixin ${config.generatedMixinName} implements ${config.originalClass} {
  ${config.originalClass} get proxy;

  ${config.methods.map((configMethod) => _generateMethod(config, configMethod)).join('\n\n')}
}
  ''';

  File('$dirTarget/${config.generatedFilename}').writeAsStringSync(text);
}

String _generateMethod(Config config, ConfigMethod configMethod) {
  return '''
  @override
  ${configMethod.returnType} ${configMethod.methodName}(${_generateParameters(configMethod.parameters)}) {
    $TODO;
    return proxy.${configMethod.methodName}(${_generateArguments(configMethod.parameters)});
  }
  ''';
}

String _generateParameters(List<ConfigMethodParameter> parameters) {
  return TODO;
}

String _generateArguments(List<ConfigMethodParameter> parameters) {
  return TODO;
}
