import 'dart:typed_data';
import 'dart:ui';

import 'package:screen_recorder/scene_builder_record.dart';

class MySceneBuilder implements SceneBuilder {
  final SceneBuilder builder;
  final SceneBuilderData data;

  MySceneBuilder(this.builder, this.data);

  @override
  void addPerformanceOverlay(int enabledOptions, Rect bounds) {
    data.items.add(SBDAddPerformanceOverlay(enabledOptions: enabledOptions, bounds: bounds));
    builder.addPerformanceOverlay(enabledOptions, bounds);
  }

  @override
  void addPicture(Offset offset, Picture picture, {bool isComplexHint = false, bool willChangeHint = false}) {
    data.items.add(
        SBDAddPicture(offset: offset, picture: picture, isComplexHint: isComplexHint, willChangeHint: willChangeHint));
    builder.addPicture(offset, picture, isComplexHint: isComplexHint, willChangeHint: willChangeHint);
  }

  @override
  void addPlatformView(int viewId, {Offset offset = Offset.zero, double width = 0.0, double height = 0.0}) {
    data.items.add(SBDAddPlatformView(viewId: viewId, offset: offset, width: width, height: height));
    builder.addPlatformView(viewId, offset: offset, width: width, height: height);
  }

  @override
  void addRetained(EngineLayer retainedLayer) {
    // TODO
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
    data.items.add(SBDAddTexture(
      textureId: textureId,
      offset: offset,
      width: width,
      height: height,
      freeze: freeze,
      filterQuality: filterQuality,
    ));
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
    data.items.add(SBDPushBackdropFilter(blendMode: blendMode));
    return builder.pushBackdropFilter(filter, blendMode: blendMode, oldLayer: oldLayer);
  }

  @override
  ClipPathEngineLayer pushClipPath(Path path, {Clip clipBehavior = Clip.antiAlias, ClipPathEngineLayer? oldLayer}) {
    data.items.add(SBDPushClipPath(
      // TODO temporarily hack to make it immutable
      path: Path.from(path),
      clipBehavior: clipBehavior,
    ));
    return builder.pushClipPath(path, clipBehavior: clipBehavior, oldLayer: oldLayer);
  }

  @override
  ClipRRectEngineLayer pushClipRRect(RRect rrect,
      {Clip clipBehavior = Clip.antiAlias, ClipRRectEngineLayer? oldLayer}) {
    data.items.add(SBDPushClipRRect(rrect: rrect, clipBehavior: clipBehavior));
    return builder.pushClipRRect(rrect, clipBehavior: clipBehavior, oldLayer: oldLayer);
  }

  @override
  ClipRectEngineLayer pushClipRect(Rect rect, {Clip clipBehavior = Clip.antiAlias, ClipRectEngineLayer? oldLayer}) {
    data.items.add(SBDPushClipRect(rect: rect, clipBehavior: clipBehavior));
    return builder.pushClipRect(rect, clipBehavior: clipBehavior, oldLayer: oldLayer);
  }

  @override
  ColorFilterEngineLayer pushColorFilter(ColorFilter filter, {ColorFilterEngineLayer? oldLayer}) {
    data.items.add(SBDPushColorFilter(filter: filter));
    return builder.pushColorFilter(filter, oldLayer: oldLayer);
  }

  @override
  ImageFilterEngineLayer pushImageFilter(ImageFilter filter,
      {Offset offset = Offset.zero, ImageFilterEngineLayer? oldLayer}) {
    data.items.add(SBDPushImageFilter(filter: filter, offset: offset));
    return builder.pushImageFilter(filter, offset: offset, oldLayer: oldLayer);
  }

  @override
  OffsetEngineLayer pushOffset(double dx, double dy, {OffsetEngineLayer? oldLayer}) {
    data.items.add(SBDPushOffset(dx: dx, dy: dy));
    return builder.pushOffset(dx, dy, oldLayer: oldLayer);
  }

  @override
  OpacityEngineLayer pushOpacity(int alpha, {Offset? offset = Offset.zero, OpacityEngineLayer? oldLayer}) {
    data.items.add(SBDPushOpacity(alpha: alpha, offset: offset));
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
    data.items.add(SBDPushPhysicalShape(
      // TODO temporarily hack to make it immutable
      path: Path.from(path),
      elevation: elevation,
      color: color,
      shadowColor: shadowColor,
      clipBehavior: clipBehavior,
    ));
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
    data.items.add(SBDPushShaderMask(
      shader: shader,
      maskRect: maskRect,
      blendMode: blendMode,
      filterQuality: filterQuality,
    ));
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
    data.items.add(SBDPushTransform(
      // TODO temporarily hack to make it immutable
      matrix4: Float64List.fromList(matrix4),
    ));
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
