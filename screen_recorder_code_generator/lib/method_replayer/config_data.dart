import 'package:code_builder/code_builder.dart';
import 'package:screen_recorder_code_generator/method_replayer/config.dart';

final _kConfigSceneBuilder = Config(
  originalClass: 'SceneBuilder',
  generatedMixinName: 'SceneBuilderMixin',
  methods: [
    ConfigMethod(
      returnType: 'TransformEngineLayer',
      methodName: 'pushTransform',
      parameters: [
        ConfigMethodParameter('Float64List matrix4'),
        ConfigMethodParameter('TransformEngineLayer? oldLayer', required: false, named: true),
      ],
    ),
    ConfigMethod(
      returnType: 'OffsetEngineLayer',
      methodName: 'pushOffset',
      parameters: [
        ConfigMethodParameter('double dx'),
        ConfigMethodParameter('double dy'),
        ConfigMethodParameter('OffsetEngineLayer? oldLayer', required: false, named: true),
      ],
    ),
    ConfigMethod(
      returnType: 'ClipRectEngineLayer',
      methodName: 'pushClipRect',
      parameters: [
        ConfigMethodParameter('Rect rect'),
        ConfigMethodParameter('Clip clipBehavior', defaultTo: 'Clip.antiAlias'),
        ConfigMethodParameter('ClipRectEngineLayer? oldLayer', required: false, named: true),
      ],
    ),
    ConfigMethod(
      returnType: 'ClipRRectEngineLayer',
      methodName: 'pushClipRRect',
      parameters: [
        ConfigMethodParameter('RRect rrect'),
        ConfigMethodParameter('Clip clipBehavior', defaultTo: 'Clip.antiAlias'),
        ConfigMethodParameter('ClipRRectEngineLayer? oldLayer', required: false, named: true),
      ],
    ),
    ConfigMethod(
      returnType: 'ClipPathEngineLayer',
      methodName: 'pushClipPath',
      parameters: [
        ConfigMethodParameter('Path path'),
        ConfigMethodParameter('Clip clipBehavior', defaultTo: 'Clip.antiAlias'),
        ConfigMethodParameter('ClipPathEngineLayer? oldLayer', required: false, named: true),
      ],
    ),
    ConfigMethod(
      returnType: 'OpacityEngineLayer',
      methodName: 'pushOpacity',
      parameters: [
        ConfigMethodParameter('int alpha'),
        ConfigMethodParameter('Offset? offset', defaultTo: 'Offset.zero'),
        ConfigMethodParameter('OpacityEngineLayer? oldLayer', required: false, named: true),
      ],
    ),
    ConfigMethod(
      returnType: 'ColorFilterEngineLayer',
      methodName: 'pushColorFilter',
      parameters: [
        ConfigMethodParameter('ColorFilter filter'),
        ConfigMethodParameter('ColorFilterEngineLayer? oldLayer', required: false, named: true),
      ],
    ),
    ConfigMethod(
      returnType: 'ImageFilterEngineLayer',
      methodName: 'pushImageFilter',
      parameters: [
        ConfigMethodParameter('ImageFilter filter'),
        ConfigMethodParameter('Offset offset', defaultTo: 'Offset.zero'),
        ConfigMethodParameter('ImageFilterEngineLayer? oldLayer', required: false, named: true),
      ],
    ),
    ConfigMethod(
      returnType: 'BackdropFilterEngineLayer',
      methodName: 'pushBackdropFilter',
      parameters: [
        ConfigMethodParameter('ImageFilter filter'),
        ConfigMethodParameter('BlendMode blendMode', defaultTo: 'BlendMode.srcOver'),
        ConfigMethodParameter('BackdropFilterEngineLayer? oldLayer', required: false, named: true),
      ],
    ),
    ConfigMethod(
      returnType: 'ShaderMaskEngineLayer',
      methodName: 'pushShaderMask',
      parameters: [
        ConfigMethodParameter('Shader shader'),
        ConfigMethodParameter('Rect maskRect'),
        ConfigMethodParameter('BlendMode blendMode'),
        ConfigMethodParameter('FilterQuality filterQuality', defaultTo: 'FilterQuality.low'),
        ConfigMethodParameter('ShaderMaskEngineLayer? oldLayer', required: false, named: true),
      ],
    ),
    ConfigMethod(
      returnType: 'void',
      methodName: 'pop',
      parameters: [],
    ),
    ConfigMethod(
      returnType: 'void',
      methodName: 'addRetained',
      parameters: [
        ConfigMethodParameter('EngineLayer retainedLayer'),
      ],
    ),
    ConfigMethod(
      returnType: 'void',
      methodName: 'addPerformanceOverlay',
      parameters: [
        ConfigMethodParameter('int enabledOptions'),
        ConfigMethodParameter('Rect bounds'),
      ],
    ),
    ConfigMethod(
      returnType: 'void',
      methodName: 'addPicture',
      parameters: [
        ConfigMethodParameter('Offset offset'),
        ConfigMethodParameter('Picture picture'),
        ConfigMethodParameter('bool isComplexHint', defaultTo: 'false'),
        ConfigMethodParameter('bool willChangeHint', defaultTo: 'false'),
      ],
    ),
    ConfigMethod(
      returnType: 'void',
      methodName: 'addTexture',
      parameters: [
        ConfigMethodParameter('int textureId'),
        ConfigMethodParameter('Offset offset', defaultTo: 'Offset.zero'),
        ConfigMethodParameter('double width', defaultTo: '0.0'),
        ConfigMethodParameter('double height', defaultTo: '0.0'),
        ConfigMethodParameter('bool freeze', defaultTo: 'false'),
        ConfigMethodParameter('FilterQuality filterQuality', defaultTo: 'FilterQuality.low'),
      ],
    ),
    ConfigMethod(
      returnType: 'void',
      methodName: 'addPlatformView',
      parameters: [
        ConfigMethodParameter('int viewId'),
        ConfigMethodParameter('Offset offset', defaultTo: 'Offset.zero'),
        ConfigMethodParameter('double width', defaultTo: '0.0'),
        ConfigMethodParameter('double height', defaultTo: '0.0'),
      ],
    ),
    ConfigMethod(
      returnType: 'void',
      methodName: 'setRasterizerTracingThreshold',
      parameters: [
        ConfigMethodParameter('int frameInterval'),
      ],
    ),
    ConfigMethod(
      returnType: 'void',
      methodName: 'setCheckerboardRasterCacheImages',
      parameters: [
        ConfigMethodParameter('bool checkerboard'),
      ],
    ),
    ConfigMethod(
      returnType: 'void',
      methodName: 'setCheckerboardOffscreenLayers',
      parameters: [
        ConfigMethodParameter('bool checkerboard'),
      ],
    ),
    ConfigMethod(
      returnType: 'Scene',
      methodName: 'build',
      parameters: [],
    ),
  ],
);

final _kConfigCanvas = Config(
  originalClass: 'Canvas',
  generatedMixinName: 'CanvasMixin',
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
      parameters: [],
    ),
    ConfigMethod(
      returnType: 'Rect',
      methodName: 'getDestinationClipBounds',
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

final _kConfigParagraphBuilder = Config(
  originalClass: 'ParagraphBuilder',
  generatedMixinName: 'ParagraphBuilderMixin',
  methods: [
    ConfigMethod(
      returnType: 'int',
      methodName: 'placeholderCount',
      parameters: [],
      type: MethodType.getter,
    ),
    ConfigMethod(
      returnType: 'List<double>',
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
      parameters: [],
    ),
  ],
);

final kConfigs = [
  _kConfigSceneBuilder,
  _kConfigCanvas,
  _kConfigParagraphBuilder,
];
