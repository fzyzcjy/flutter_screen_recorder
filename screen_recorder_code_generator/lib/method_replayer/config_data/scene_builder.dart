import 'package:screen_recorder_code_generator/method_replayer/config.dart';

final _parameterSynthesizedLayerId = ConfigMethodParameter(
  'int layerId',
  synthesizedInRecord: true,
  recordConstructorArgument: 'result.getOrCreateLayerId()',
);

final kConfigSceneBuilder = Config(
  originalClass: 'SceneBuilder',
  constructorParams: 'super.proxy',
  methods: [
    ConfigMethod(
      returnType: 'TransformEngineLayer',
      methodName: 'pushTransform',
      handlerName: 'handlePushOp',
      parameters: [
        ConfigMethodParameter('Float64List matrix4'),
        ConfigMethodParameter('TransformEngineLayer? oldLayer', required: false, named: true, enableRecord: false),
        _parameterSynthesizedLayerId,
      ],
    ),
    ConfigMethod(
      returnType: 'OffsetEngineLayer',
      methodName: 'pushOffset',
      handlerName: 'handlePushOp',
      parameters: [
        ConfigMethodParameter('double dx'),
        ConfigMethodParameter('double dy'),
        ConfigMethodParameter('OffsetEngineLayer? oldLayer', required: false, named: true, enableRecord: false),
        _parameterSynthesizedLayerId,
      ],
    ),
    ConfigMethod(
      returnType: 'ClipRectEngineLayer',
      methodName: 'pushClipRect',
      handlerName: 'handlePushOp',
      parameters: [
        ConfigMethodParameter('Rect rect'),
        ConfigMethodParameter('Clip clipBehavior', defaultTo: 'Clip.antiAlias'),
        ConfigMethodParameter('ClipRectEngineLayer? oldLayer', required: false, named: true, enableRecord: false),
        _parameterSynthesizedLayerId,
      ],
    ),
    ConfigMethod(
      returnType: 'ClipRRectEngineLayer',
      methodName: 'pushClipRRect',
      handlerName: 'handlePushOp',
      parameters: [
        ConfigMethodParameter('RRect rrect'),
        ConfigMethodParameter('Clip clipBehavior', defaultTo: 'Clip.antiAlias'),
        ConfigMethodParameter('ClipRRectEngineLayer? oldLayer', required: false, named: true, enableRecord: false),
        _parameterSynthesizedLayerId,
      ],
    ),
    ConfigMethod(
      returnType: 'ClipPathEngineLayer',
      methodName: 'pushClipPath',
      handlerName: 'handlePushOp',
      parameters: [
        ConfigMethodParameter('Path path'),
        ConfigMethodParameter('Clip clipBehavior', defaultTo: 'Clip.antiAlias'),
        ConfigMethodParameter('ClipPathEngineLayer? oldLayer', required: false, named: true, enableRecord: false),
        _parameterSynthesizedLayerId,
      ],
    ),
    ConfigMethod(
      returnType: 'OpacityEngineLayer',
      methodName: 'pushOpacity',
      handlerName: 'handlePushOp',
      parameters: [
        ConfigMethodParameter('int alpha'),
        ConfigMethodParameter('Offset? offset', defaultTo: 'Offset.zero'),
        ConfigMethodParameter('OpacityEngineLayer? oldLayer', required: false, named: true, enableRecord: false),
        _parameterSynthesizedLayerId,
      ],
    ),
    ConfigMethod(
      returnType: 'ColorFilterEngineLayer',
      methodName: 'pushColorFilter',
      handlerName: 'handlePushOp',
      parameters: [
        ConfigMethodParameter('ColorFilter filter'),
        ConfigMethodParameter('ColorFilterEngineLayer? oldLayer', required: false, named: true, enableRecord: false),
        _parameterSynthesizedLayerId,
      ],
    ),
    ConfigMethod(
      returnType: 'ImageFilterEngineLayer',
      methodName: 'pushImageFilter',
      handlerName: 'handlePushOp',
      parameters: [
        ConfigMethodParameter('ImageFilter filter'),
        ConfigMethodParameter('Offset offset', defaultTo: 'Offset.zero'),
        ConfigMethodParameter('ImageFilterEngineLayer? oldLayer', required: false, named: true, enableRecord: false),
        _parameterSynthesizedLayerId,
      ],
    ),
    ConfigMethod(
      returnType: 'BackdropFilterEngineLayer',
      methodName: 'pushBackdropFilter',
      handlerName: 'handlePushOp',
      parameters: [
        ConfigMethodParameter('ImageFilter filter'),
        ConfigMethodParameter('BlendMode blendMode', defaultTo: 'BlendMode.srcOver'),
        ConfigMethodParameter('BackdropFilterEngineLayer? oldLayer', required: false, named: true, enableRecord: false),
        _parameterSynthesizedLayerId,
      ],
    ),
    ConfigMethod(
      returnType: 'ShaderMaskEngineLayer',
      methodName: 'pushShaderMask',
      handlerName: 'handlePushOp',
      parameters: [
        ConfigMethodParameter('Shader shader'),
        ConfigMethodParameter('Rect maskRect'),
        ConfigMethodParameter('BlendMode blendMode'),
        ConfigMethodParameter('FilterQuality filterQuality', defaultTo: 'FilterQuality.low'),
        ConfigMethodParameter('ShaderMaskEngineLayer? oldLayer', required: false, named: true, enableRecord: false),
        _parameterSynthesizedLayerId,
      ],
    ),
    ConfigMethod(
      returnType: 'void',
      methodName: 'pop',
      handlerName: 'handleMiscOp',
      parameters: [],
    ),
    ConfigMethod(
      returnType: 'void',
      methodName: 'addRetained',
      handlerName: 'handleAddRetainedOp',
      parameters: [
        ConfigMethodParameter('EngineLayer retainedLayer', enableRecord: false),
        ConfigMethodParameter('int retainedLayerId',
            synthesizedInRecord: true, recordConstructorArgument: 'retainedLayer.layerId!'),
      ],
    ),
    ConfigMethod(
      returnType: 'void',
      methodName: 'addPerformanceOverlay',
      handlerName: 'handleMiscOp',
      parameters: [
        ConfigMethodParameter('int enabledOptions'),
        ConfigMethodParameter('Rect bounds'),
      ],
    ),
    ConfigMethod(
      returnType: 'void',
      methodName: 'addPicture',
      handlerName: 'handleMiscOp',
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
      handlerName: 'handleMiscOp',
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
      handlerName: 'handleMiscOp',
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
      handlerName: null,
      enableRecord: false,
      parameters: [
        ConfigMethodParameter('int frameInterval'),
      ],
    ),
    ConfigMethod(
      returnType: 'void',
      methodName: 'setCheckerboardRasterCacheImages',
      handlerName: null,
      enableRecord: false,
      parameters: [
        ConfigMethodParameter('bool checkerboard'),
      ],
    ),
    ConfigMethod(
      returnType: 'void',
      methodName: 'setCheckerboardOffscreenLayers',
      handlerName: null,
      enableRecord: false,
      parameters: [
        ConfigMethodParameter('bool checkerboard'),
      ],
    ),
    ConfigMethod(
      returnType: 'Scene',
      methodName: 'build',
      handlerName: null,
      enableRecord: false,
      parameters: [],
    ),
  ],
);
