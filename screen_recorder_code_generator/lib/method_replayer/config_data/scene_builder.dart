import 'package:screen_recorder_code_generator/method_replayer/config.dart';

final kConfigSceneBuilder = Config(
  originalClass: 'SceneBuilder',
  methods: [
    ConfigMethod(
      returnType: 'TransformEngineLayer',
      methodName: 'pushTransform',
      parameters: [
        ConfigMethodParameter('Float64List matrix4'),
        ConfigMethodParameter('TransformEngineLayer? oldLayer', required: false, named: true, enableRecord: false),
      ],
    ),
    ConfigMethod(
      returnType: 'OffsetEngineLayer',
      methodName: 'pushOffset',
      parameters: [
        ConfigMethodParameter('double dx'),
        ConfigMethodParameter('double dy'),
        ConfigMethodParameter('OffsetEngineLayer? oldLayer', required: false, named: true, enableRecord: false),
      ],
    ),
    ConfigMethod(
      returnType: 'ClipRectEngineLayer',
      methodName: 'pushClipRect',
      parameters: [
        ConfigMethodParameter('Rect rect'),
        ConfigMethodParameter('Clip clipBehavior', defaultTo: 'Clip.antiAlias'),
        ConfigMethodParameter('ClipRectEngineLayer? oldLayer', required: false, named: true, enableRecord: false),
      ],
    ),
    ConfigMethod(
      returnType: 'ClipRRectEngineLayer',
      methodName: 'pushClipRRect',
      parameters: [
        ConfigMethodParameter('RRect rrect'),
        ConfigMethodParameter('Clip clipBehavior', defaultTo: 'Clip.antiAlias'),
        ConfigMethodParameter('ClipRRectEngineLayer? oldLayer', required: false, named: true, enableRecord: false),
      ],
    ),
    ConfigMethod(
      returnType: 'ClipPathEngineLayer',
      methodName: 'pushClipPath',
      parameters: [
        ConfigMethodParameter('Path path'),
        ConfigMethodParameter('Clip clipBehavior', defaultTo: 'Clip.antiAlias'),
        ConfigMethodParameter('ClipPathEngineLayer? oldLayer', required: false, named: true, enableRecord: false),
      ],
    ),
    ConfigMethod(
      returnType: 'OpacityEngineLayer',
      methodName: 'pushOpacity',
      parameters: [
        ConfigMethodParameter('int alpha'),
        ConfigMethodParameter('Offset? offset', defaultTo: 'Offset.zero'),
        ConfigMethodParameter('OpacityEngineLayer? oldLayer', required: false, named: true, enableRecord: false),
      ],
    ),
    ConfigMethod(
      returnType: 'ColorFilterEngineLayer',
      methodName: 'pushColorFilter',
      parameters: [
        ConfigMethodParameter('ColorFilter filter'),
        ConfigMethodParameter('ColorFilterEngineLayer? oldLayer', required: false, named: true, enableRecord: false),
      ],
    ),
    ConfigMethod(
      returnType: 'ImageFilterEngineLayer',
      methodName: 'pushImageFilter',
      parameters: [
        ConfigMethodParameter('ImageFilter filter'),
        ConfigMethodParameter('Offset offset', defaultTo: 'Offset.zero'),
        ConfigMethodParameter('ImageFilterEngineLayer? oldLayer', required: false, named: true, enableRecord: false),
      ],
    ),
    ConfigMethod(
      returnType: 'BackdropFilterEngineLayer',
      methodName: 'pushBackdropFilter',
      parameters: [
        ConfigMethodParameter('ImageFilter filter'),
        ConfigMethodParameter('BlendMode blendMode', defaultTo: 'BlendMode.srcOver'),
        ConfigMethodParameter('BackdropFilterEngineLayer? oldLayer', required: false, named: true, enableRecord: false),
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
        ConfigMethodParameter('ShaderMaskEngineLayer? oldLayer', required: false, named: true, enableRecord: false),
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
