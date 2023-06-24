import 'package:code_builder/code_builder.dart';
import 'package:screen_recorder_code_generator/method_replayer/config.dart';

final kConfigParagraph = Config(
  originalClass: 'Paragraph',
  constructorParams: 'super.proxy',
  methods: [
    _createGetter(returnType: 'double', methodName: 'width'),
    _createGetter(returnType: 'double', methodName: 'height'),
    _createGetter(returnType: 'double', methodName: 'longestLine'),
    _createGetter(returnType: 'double', methodName: 'minIntrinsicWidth'),
    _createGetter(returnType: 'double', methodName: 'maxIntrinsicWidth'),
    _createGetter(returnType: 'double', methodName: 'alphabeticBaseline'),
    _createGetter(returnType: 'double', methodName: 'ideographicBaseline'),
    _createGetter(returnType: 'bool', methodName: 'didExceedMaxLines'),
    ConfigMethod(
      returnType: 'void',
      methodName: 'layout',
      handlerName: 'handleLayoutOp',
      handlerParams: 'constraints',
      enableRecord: false,
      parameters: [
        ConfigMethodParameter('ParagraphConstraints constraints'),
      ],
    ),
    ConfigMethod(
      returnType: 'List<TextBox>',
      methodName: 'getBoxesForRange',
      handlerName: null,
      enableRecord: false,
      parameters: [
        ConfigMethodParameter('int start'),
        ConfigMethodParameter('int end'),
        ConfigMethodParameter('BoxHeightStyle boxHeightStyle', defaultTo: 'BoxHeightStyle.tight'),
        ConfigMethodParameter('BoxWidthStyle boxWidthStyle', defaultTo: 'BoxWidthStyle.tight'),
      ],
    ),
    ConfigMethod(
      returnType: 'List<TextBox>',
      methodName: 'getBoxesForPlaceholders',
      handlerName: null,
      enableRecord: false,
      parameters: [],
    ),
    ConfigMethod(
      returnType: 'TextPosition',
      methodName: 'getPositionForOffset',
      handlerName: null,
      enableRecord: false,
      parameters: [
        ConfigMethodParameter('Offset offset'),
      ],
    ),
    ConfigMethod(
      returnType: 'TextRange',
      methodName: 'getWordBoundary',
      handlerName: null,
      enableRecord: false,
      parameters: [
        ConfigMethodParameter('TextPosition position'),
      ],
    ),
    ConfigMethod(
      returnType: 'TextRange',
      methodName: 'getLineBoundary',
      handlerName: null,
      enableRecord: false,
      parameters: [
        ConfigMethodParameter('TextPosition position'),
      ],
    ),
    ConfigMethod(
      returnType: 'List<LineMetrics>',
      methodName: 'computeLineMetrics',
      handlerName: null,
      enableRecord: false,
      parameters: [],
    ),
    ConfigMethod(
      returnType: 'void',
      methodName: 'dispose',
      handlerName: null,
      enableRecord: false,
      parameters: [],
    ),
    _createGetter(returnType: 'bool', methodName: 'debugDisposed'),
  ],
);

ConfigMethod _createGetter({
  required String returnType,
  required String methodName,
}) =>
    ConfigMethod(
      returnType: returnType,
      methodName: methodName,
      handlerName: null,
      enableRecord: false,
      parameters: [],
      type: MethodType.getter,
    );
