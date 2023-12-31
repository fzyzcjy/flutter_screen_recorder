import 'package:screen_recorder_code_generator/method_replayer/config.dart';

final kConfigCanvas = Config(
  originalClass: 'Canvas',
  constructorParams: 'super.recorder',
  methods: [
    ConfigMethod(
      returnType: 'void',
      methodName: 'save',
      parameters: [],
    ),
    ConfigMethod(
      returnType: 'void',
      methodName: 'saveLayer',
      parameters: [
        ConfigMethodParameter('Rect? bounds'),
        ConfigMethodParameter('Paint paint'),
      ],
    ),
    ConfigMethod(
      returnType: 'void',
      methodName: 'restore',
      parameters: [],
    ),
    ConfigMethod(
      returnType: 'void',
      methodName: 'restoreToCount',
      parameters: [
        ConfigMethodParameter('int count'),
      ],
    ),
    ConfigMethod(
      returnType: 'int',
      methodName: 'getSaveCount',
      handlerName: null,
      enableRecord: false,
      parameters: [],
    ),
    ConfigMethod(
      returnType: 'void',
      methodName: 'translate',
      parameters: [
        ConfigMethodParameter('double dx'),
        ConfigMethodParameter('double dy'),
      ],
    ),
    ConfigMethod(
      returnType: 'void',
      methodName: 'scale',
      parameters: [
        ConfigMethodParameter('double sx'),
        ConfigMethodParameter('double? sy', required: false),
      ],
    ),
    ConfigMethod(
      returnType: 'void',
      methodName: 'rotate',
      parameters: [
        ConfigMethodParameter('double radians'),
      ],
    ),
    ConfigMethod(
      returnType: 'void',
      methodName: 'skew',
      parameters: [
        ConfigMethodParameter('double sx'),
        ConfigMethodParameter('double sy'),
      ],
    ),
    ConfigMethod(
      returnType: 'void',
      methodName: 'transform',
      parameters: [
        ConfigMethodParameter('Float64List matrix4'),
      ],
    ),
    ConfigMethod(
      returnType: 'Float64List',
      methodName: 'getTransform',
      handlerName: null,
      enableRecord: false,
      parameters: [],
    ),
    ConfigMethod(
      returnType: 'void',
      methodName: 'clipRect',
      parameters: [
        ConfigMethodParameter('Rect rect'),
        ConfigMethodParameter('ClipOp clipOp', defaultTo: 'ClipOp.intersect'),
        ConfigMethodParameter('bool doAntiAlias', defaultTo: 'true'),
      ],
    ),
    ConfigMethod(
      returnType: 'void',
      methodName: 'clipRRect',
      parameters: [
        ConfigMethodParameter('RRect rrect'),
        ConfigMethodParameter('bool doAntiAlias', defaultTo: 'true'),
      ],
    ),
    ConfigMethod(
      returnType: 'void',
      methodName: 'clipPath',
      parameters: [
        ConfigMethodParameter('Path path'),
        ConfigMethodParameter('bool doAntiAlias', defaultTo: 'true'),
      ],
    ),
    ConfigMethod(
      returnType: 'Rect',
      methodName: 'getLocalClipBounds',
      handlerName: null,
      enableRecord: false,
      parameters: [],
    ),
    ConfigMethod(
      returnType: 'Rect',
      methodName: 'getDestinationClipBounds',
      handlerName: null,
      enableRecord: false,
      parameters: [],
    ),
    ConfigMethod(
      returnType: 'void',
      methodName: 'drawColor',
      parameters: [
        ConfigMethodParameter('Color color'),
        ConfigMethodParameter('BlendMode blendMode'),
      ],
    ),
    ConfigMethod(
      returnType: 'void',
      methodName: 'drawLine',
      parameters: [
        ConfigMethodParameter('Offset p1'),
        ConfigMethodParameter('Offset p2'),
        ConfigMethodParameter('Paint paint'),
      ],
    ),
    ConfigMethod(
      returnType: 'void',
      methodName: 'drawPaint',
      parameters: [
        ConfigMethodParameter('Paint paint'),
      ],
    ),
    ConfigMethod(
      returnType: 'void',
      methodName: 'drawRect',
      parameters: [
        ConfigMethodParameter('Rect rect'),
        ConfigMethodParameter('Paint paint'),
      ],
    ),
    ConfigMethod(
      returnType: 'void',
      methodName: 'drawRRect',
      parameters: [
        ConfigMethodParameter('RRect rrect'),
        ConfigMethodParameter('Paint paint'),
      ],
    ),
    ConfigMethod(
      returnType: 'void',
      methodName: 'drawDRRect',
      parameters: [
        ConfigMethodParameter('RRect outer'),
        ConfigMethodParameter('RRect inner'),
        ConfigMethodParameter('Paint paint'),
      ],
    ),
    ConfigMethod(
      returnType: 'void',
      methodName: 'drawOval',
      parameters: [
        ConfigMethodParameter('Rect rect'),
        ConfigMethodParameter('Paint paint'),
      ],
    ),
    ConfigMethod(
      returnType: 'void',
      methodName: 'drawCircle',
      parameters: [
        ConfigMethodParameter('Offset c'),
        ConfigMethodParameter('double radius'),
        ConfigMethodParameter('Paint paint'),
      ],
    ),
    ConfigMethod(
      returnType: 'void',
      methodName: 'drawArc',
      parameters: [
        ConfigMethodParameter('Rect rect'),
        ConfigMethodParameter('double startAngle'),
        ConfigMethodParameter('double sweepAngle'),
        ConfigMethodParameter('bool useCenter'),
        ConfigMethodParameter('Paint paint'),
      ],
    ),
    ConfigMethod(
      returnType: 'void',
      methodName: 'drawPath',
      parameters: [
        ConfigMethodParameter('Path path'),
        ConfigMethodParameter('Paint paint'),
      ],
    ),
    ConfigMethod(
      returnType: 'void',
      methodName: 'drawImage',
      parameters: [
        ConfigMethodParameter('Image image'),
        ConfigMethodParameter('Offset offset'),
        ConfigMethodParameter('Paint paint'),
      ],
    ),
    ConfigMethod(
      returnType: 'void',
      methodName: 'drawImageRect',
      parameters: [
        ConfigMethodParameter('Image image'),
        ConfigMethodParameter('Rect src'),
        ConfigMethodParameter('Rect dst'),
        ConfigMethodParameter('Paint paint'),
      ],
    ),
    ConfigMethod(
      returnType: 'void',
      methodName: 'drawImageNine',
      parameters: [
        ConfigMethodParameter('Image image'),
        ConfigMethodParameter('Rect center'),
        ConfigMethodParameter('Rect dst'),
        ConfigMethodParameter('Paint paint'),
      ],
    ),
    ConfigMethod(
      returnType: 'void',
      methodName: 'drawPicture',
      parameters: [
        ConfigMethodParameter('Picture picture'),
      ],
    ),
    ConfigMethod(
      returnType: 'void',
      methodName: 'drawParagraph',
      proxyCallParams: '// need to use _NativeParagraph, otherwise it errors\n'
          'paragraph.nativeParagraph,\n'
          'offset,',
      parameters: [
        ConfigMethodParameter('Paragraph paragraph'),
        ConfigMethodParameter('Offset offset'),
      ],
    ),
    ConfigMethod(
      returnType: 'void',
      methodName: 'drawPoints',
      parameters: [
        ConfigMethodParameter('PointMode pointMode'),
        ConfigMethodParameter('List<Offset> points'),
        ConfigMethodParameter('Paint paint'),
      ],
    ),
    ConfigMethod(
      returnType: 'void',
      methodName: 'drawRawPoints',
      parameters: [
        ConfigMethodParameter('PointMode pointMode'),
        ConfigMethodParameter('Float32List points'),
        ConfigMethodParameter('Paint paint'),
      ],
    ),
    ConfigMethod(
      returnType: 'void',
      methodName: 'drawVertices',
      parameters: [
        ConfigMethodParameter('Vertices vertices'),
        ConfigMethodParameter('BlendMode blendMode'),
        ConfigMethodParameter('Paint paint'),
      ],
    ),
    ConfigMethod(
      returnType: 'void',
      methodName: 'drawAtlas',
      parameters: [
        ConfigMethodParameter('Image atlas'),
        ConfigMethodParameter('List<RSTransform> transforms'),
        ConfigMethodParameter('List<Rect> rects'),
        ConfigMethodParameter('List<Color>? colors'),
        ConfigMethodParameter('BlendMode? blendMode'),
        ConfigMethodParameter('Rect? cullRect'),
        ConfigMethodParameter('Paint paint'),
      ],
    ),
    ConfigMethod(
      returnType: 'void',
      methodName: 'drawRawAtlas',
      parameters: [
        ConfigMethodParameter('Image atlas'),
        ConfigMethodParameter('Float32List rstTransforms'),
        ConfigMethodParameter('Float32List rects'),
        ConfigMethodParameter('Int32List? colors'),
        ConfigMethodParameter('BlendMode? blendMode'),
        ConfigMethodParameter('Rect? cullRect'),
        ConfigMethodParameter('Paint paint'),
      ],
    ),
    ConfigMethod(
      returnType: 'void',
      methodName: 'drawShadow',
      parameters: [
        ConfigMethodParameter('Path path'),
        ConfigMethodParameter('Color color'),
        ConfigMethodParameter('double elevation'),
        ConfigMethodParameter('bool transparentOccluder'),
      ],
    ),
  ],
);
