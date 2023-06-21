import 'dart:typed_data';
import 'dart:ui';

mixin SceneBuilderMixin implements SceneBuilder {
  SceneBuilder get proxy;

  @override
  TransformEngineLayer pushTransform(
    Float64List matrix4, {
    TransformEngineLayer? oldLayer,
  });

  @override
  OffsetEngineLayer pushOffset(
    double dx,
    double dy, {
    OffsetEngineLayer? oldLayer,
  });

  @override
  ClipRectEngineLayer pushClipRect(
    Rect rect, {
    Clip clipBehavior = Clip.antiAlias,
    ClipRectEngineLayer? oldLayer,
  });

  @override
  ClipRRectEngineLayer pushClipRRect(
    RRect rrect, {
    Clip clipBehavior = Clip.antiAlias,
    ClipRRectEngineLayer? oldLayer,
  });

  @override
  ClipPathEngineLayer pushClipPath(
    Path path, {
    Clip clipBehavior = Clip.antiAlias,
    ClipPathEngineLayer? oldLayer,
  });

  @override
  OpacityEngineLayer pushOpacity(
    int alpha, {
    Offset? offset = Offset.zero,
    OpacityEngineLayer? oldLayer,
  });

  @override
  ColorFilterEngineLayer pushColorFilter(
    ColorFilter filter, {
    ColorFilterEngineLayer? oldLayer,
  });

  @override
  ImageFilterEngineLayer pushImageFilter(
    ImageFilter filter, {
    Offset offset = Offset.zero,
    ImageFilterEngineLayer? oldLayer,
  });

  @override
  BackdropFilterEngineLayer pushBackdropFilter(
    ImageFilter filter, {
    BlendMode blendMode = BlendMode.srcOver,
    BackdropFilterEngineLayer? oldLayer,
  });

  @override
  ShaderMaskEngineLayer pushShaderMask(
    Shader shader,
    Rect maskRect,
    BlendMode blendMode, {
    FilterQuality filterQuality = FilterQuality.low,
    ShaderMaskEngineLayer? oldLayer,
  });

  @override
  void addPerformanceOverlay(
    int enabledOptions,
    Rect bounds,
  );

  @override
  void addPicture(
    Offset offset,
    Picture picture, {
    bool isComplexHint = false,
    bool willChangeHint = false,
  });

  @override
  void addTexture(
    int textureId, {
    Offset offset = Offset.zero,
    double width = 0.0,
    double height = 0.0,
    bool freeze = false,
    FilterQuality filterQuality = FilterQuality.low,
  });

  @override
  void addPlatformView(
    int viewId, {
    Offset offset = Offset.zero,
    double width = 0.0,
    double height = 0.0,
  });
}
