import 'package:code_builder/code_builder.dart';
import 'package:screen_recorder_code_generator/method_replayer/config.dart';

final kConfigParagraphBuilder = Config(
  originalClass: 'ParagraphBuilder',
  constructorParams: 'super.style',
  methods: [
    ConfigMethod(
      returnType: 'int',
      methodName: 'placeholderCount',
      handlerName: null,
      enableRecord: false,
      parameters: [],
      type: MethodType.getter,
    ),
    ConfigMethod(
      returnType: 'List<double>',
      handlerName: null,
      enableRecord: false,
      methodName: 'placeholderScales',
      parameters: [],
      type: MethodType.getter,
    ),
    ConfigMethod(
      returnType: 'void',
      methodName: 'pushStyle',
      parameters: [
        ConfigMethodParameter('TextStyle style'),
      ],
    ),
    ConfigMethod(
      returnType: 'void',
      methodName: 'pop',
      parameters: [],
    ),
    ConfigMethod(
      returnType: 'void',
      methodName: 'addText',
      parameters: [
        ConfigMethodParameter('String text'),
      ],
    ),
    ConfigMethod(
      returnType: 'void',
      methodName: 'addPlaceholder',
      parameters: [
        ConfigMethodParameter('double width'),
        ConfigMethodParameter('double height'),
        ConfigMethodParameter('PlaceholderAlignment alignment'),
        ConfigMethodParameter('double scale', defaultTo: '1.0', named: true, required: false),
        ConfigMethodParameter('double? baselineOffset', named: true, required: false),
        ConfigMethodParameter('TextBaseline? baseline', named: true, required: false),
      ],
    ),
    ConfigMethod(
      returnType: 'Paragraph',
      methodName: 'build',
      handlerName: 'handleBuildOp',
      enableRecord: false,
      parameters: [],
    ),
  ],
);
