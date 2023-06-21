import 'package:screen_recorder_code_generator/method_replayer/config.dart';

final kConfigs = [
  Config(
    originalClass: 'SceneBuilder',
    generatedMixinName: 'SceneBuilderMixin',
    methods: [
      ConfigMethod(
        returnType: 'void',
        methodName: 'addPicture',
        parameters: [
          ConfigMethodParameter('Offset', 'offset'),
          ConfigMethodParameter('Picture', 'picture'),
          ConfigMethodParameter('bool', 'isComplexHint', named: true, defaultTo: 'false'),
          ConfigMethodParameter('bool', 'willChangeHint', named: true, defaultTo: 'false'),
        ],
      ),
    ],
  ),
];
