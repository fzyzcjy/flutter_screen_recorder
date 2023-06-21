import 'dart:typed_data';
import 'dart:ui';

class MySceneBuilder implements SceneBuilder {
  final SceneBuilder builder;

  MySceneBuilder(this.builder);

  @override
  void addPerformanceOverlay(int enabledOptions, Rect bounds) {
    builder.addPerformanceOverlay(enabledOptions, bounds);
  }

  @override
  void addPicture(Offset offset, Picture picture, {bool isComplexHint = false, bool willChangeHint = false}) {
    builder.addPicture(offset, picture, isComplexHint: isComplexHint, willChangeHint: willChangeHint);
  }

  @override
  void addPlatformView(int viewId, {Offset offset = Offset.zero, double width = 0.0, double height = 0.0}) {
    builder.addPlatformView(viewId, offset: offset, width: width, height: height);
  }

  @override
  void addRetained(EngineLayer retainedLayer) {
    builder.addRetained(retainedLayer);
  }

  @override
  void addTexture(
    int textureId, {
    Offset offset = Offset.zero,
    double width = 0.0,
    double height = 0.0,
    bool freeze = false,
    FilterQuality filterQuality = FilterQuality.low,
  }) {
    builder.addTexture(
      textureId,
      offset: offset,
      width: width,
      height: height,
      freeze: freeze,
      filterQuality: filterQuality,
    );
  }

  @override
  Scene build() {
    return builder.build();
  }

  @override
  void pop() {
    builder.pop();
  }

  @override
  BackdropFilterEngineLayer pushBackdropFilter(ImageFilter filter,
      {BlendMode blendMode = BlendMode.srcOver, BackdropFilterEngineLayer? oldLayer}) {
    return builder.pushBackdropFilter(filter, blendMode: blendMode, oldLayer: oldLayer);
  }

  @override
  ClipPathEngineLayer pushClipPath(Path path, {Clip clipBehavior = Clip.antiAlias, ClipPathEngineLayer? oldLayer}) {
    return builder.pushClipPath(path, clipBehavior: clipBehavior, oldLayer: oldLayer);
  }

  @override
  ClipRRectEngineLayer pushClipRRect(RRect rrect,
      {Clip clipBehavior = Clip.antiAlias, ClipRRectEngineLayer? oldLayer}) {
    return builder.pushClipRRect(rrect, clipBehavior: clipBehavior, oldLayer: oldLayer);
  }

  @override
  ClipRectEngineLayer pushClipRect(Rect rect, {Clip clipBehavior = Clip.antiAlias, ClipRectEngineLayer? oldLayer}) {
    return builder.pushClipRect(rect, clipBehavior: clipBehavior, oldLayer: oldLayer);
  }

  @override
  ColorFilterEngineLayer pushColorFilter(ColorFilter filter, {ColorFilterEngineLayer? oldLayer}) {
    return builder.pushColorFilter(filter, oldLayer: oldLayer);
  }

  @override
  ImageFilterEngineLayer pushImageFilter(ImageFilter filter,
      {Offset offset = Offset.zero, ImageFilterEngineLayer? oldLayer}) {
    return builder.pushImageFilter(filter, offset: offset, oldLayer: oldLayer);
    throw UnimplementedError();
  }

  @override
  OffsetEngineLayer pushOffset(double dx, double dy, {OffsetEngineLayer? oldLayer}) {
    return builder.pushOffset(dx, dy, oldLayer: oldLayer);
  }

  @override
  OpacityEngineLayer pushOpacity(int alpha, {Offset? offset = Offset.zero, OpacityEngineLayer? oldLayer}) {
    return builder.pushOpacity(alpha, offset: offset, oldLayer: oldLayer);
  }

  @override
  PhysicalShapeEngineLayer pushPhysicalShape({
    required Path path,
    required double elevation,
    required Color color,
    Color? shadowColor,
    Clip clipBehavior = Clip.none,
    PhysicalShapeEngineLayer? oldLayer,
  }) {
    // ignore: deprecated_member_use
    return builder.pushPhysicalShape(
      path: path,
      elevation: elevation,
      color: color,
      shadowColor: shadowColor,
      clipBehavior: clipBehavior,
      oldLayer: oldLayer,
    );
  }

  @override
  ShaderMaskEngineLayer pushShaderMask(
    Shader shader,
    Rect maskRect,
    BlendMode blendMode, {
    ShaderMaskEngineLayer? oldLayer,
    FilterQuality filterQuality = FilterQuality.low,
  }) {
    return builder.pushShaderMask(
      shader,
      maskRect,
      blendMode,
      oldLayer: oldLayer,
      filterQuality: filterQuality,
    );
  }

  @override
  TransformEngineLayer pushTransform(Float64List matrix4, {TransformEngineLayer? oldLayer}) {
    return builder.pushTransform(matrix4, oldLayer: oldLayer);
  }

  @override
  void setCheckerboardOffscreenLayers(bool checkerboard) {
    builder.setCheckerboardOffscreenLayers(checkerboard);
  }

  @override
  void setCheckerboardRasterCacheImages(bool checkerboard) {
    builder.setCheckerboardRasterCacheImages(checkerboard);
  }

  @override
  void setRasterizerTracingThreshold(int frameInterval) {
    builder.setRasterizerTracingThreshold(frameInterval);
  }
}
