import 'package:screen_recorder_code_generator/method_replayer/config.dart';

ConfigMethod _createMethodPush({
  required String methodName,
  required List<ConfigMethodParameter> partialParameters,
}) {
  assert(methodName.startsWith('push'));
  final stem = methodName.substring('push'.length);

  return ConfigMethod(
    returnType: '${stem}EngineLayer',
    methodName: methodName,
    handlerName: 'handlePushOp',
    recordExecuteExtraBody: 'executeContext.putEngineLayerId(layerId, result);',
    parameters: [
      ...partialParameters,
      ConfigMethodParameter('${stem}EngineLayer? oldLayer', required: false, named: true, enableRecord: false),
      ConfigMethodParameter(
        'int layerId',
        synthesizedInRecord: true,
        recordConstructorArgument: 'result.getOrCreateLayerId()',
      ),
    ],
  );
}

final kConfigSceneBuilder = Config(
  originalClass: 'SceneBuilder',
  constructorParams: 'super.proxy',
  methods: [
    _createMethodPush(
      methodName: 'pushTransform',
      partialParameters: [
        ConfigMethodParameter('Float64List matrix4'),
      ],
    ),
    _createMethodPush(
      methodName: 'pushOffset',
      partialParameters: [
        ConfigMethodParameter('double dx'),
        ConfigMethodParameter('double dy'),
      ],
    ),
    _createMethodPush(
      methodName: 'pushClipRect',
      partialParameters: [
        ConfigMethodParameter('Rect rect'),
        ConfigMethodParameter('Clip clipBehavior', defaultTo: 'Clip.antiAlias'),
      ],
    ),
    _createMethodPush(
      methodName: 'pushClipRRect',
      partialParameters: [
        ConfigMethodParameter('RRect rrect'),
        ConfigMethodParameter('Clip clipBehavior', defaultTo: 'Clip.antiAlias'),
      ],
    ),
    _createMethodPush(
      methodName: 'pushClipPath',
      partialParameters: [
        ConfigMethodParameter('Path path'),
        ConfigMethodParameter('Clip clipBehavior', defaultTo: 'Clip.antiAlias'),
      ],
    ),
    _createMethodPush(
      methodName: 'pushOpacity',
      partialParameters: [
        ConfigMethodParameter('int alpha'),
        ConfigMethodParameter('Offset? offset', defaultTo: 'Offset.zero'),
      ],
    ),
    _createMethodPush(
      methodName: 'pushColorFilter',
      partialParameters: [
        ConfigMethodParameter('ColorFilter filter'),
      ],
    ),
    _createMethodPush(
      methodName: 'pushImageFilter',
      partialParameters: [
        ConfigMethodParameter('ImageFilter filter'),
        ConfigMethodParameter('Offset offset', defaultTo: 'Offset.zero'),
      ],
    ),
    _createMethodPush(
      methodName: 'pushBackdropFilter',
      partialParameters: [
        ConfigMethodParameter('ImageFilter filter'),
        ConfigMethodParameter('BlendMode blendMode', defaultTo: 'BlendMode.srcOver'),
      ],
    ),
    _createMethodPush(
      methodName: 'pushShaderMask',
      partialParameters: [
        ConfigMethodParameter('Shader shader'),
        ConfigMethodParameter('Rect maskRect'),
        ConfigMethodParameter('BlendMode blendMode'),
        ConfigMethodParameter('FilterQuality filterQuality', defaultTo: 'FilterQuality.low'),
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
      handlerName: 'handleMiscOp',
      recordExecuteExtraBody: 'executeContext.putRetainedEngineLayerId(retainedLayerId);',
      parameters: [
        ConfigMethodParameter('EngineLayer retainedLayer',
            enableRecord: false, recordExecuteArgument: 'executeContext.getEngineLayerById(retainedLayerId)'),
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
      handlerName: 'handleBuildOp',
      enableRecord: false,
      parameters: [],
    ),
  ],
);
