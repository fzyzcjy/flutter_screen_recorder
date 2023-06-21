import 'dart:typed_data';
import 'dart:ui';

import 'package:screen_recorder/scene_builder_record.dart';

extension ExtEngineLayerExpando on EngineLayer {
  static final _expando = Expando<SceneBuilderDataItem>('EngineLayerDataItem');

  SceneBuilderDataItem? get dataItem => _expando[this];

  set dataItem(SceneBuilderDataItem? value) => _expando[this] = value;
}

class MySceneBuilder implements SceneBuilder {
  final SceneBuilder builder;
  final SceneBuilderData data;

  MySceneBuilder(this.builder, this.data);

  T _pushOp<T extends EngineLayer>(T innerResult, SceneBuilderDataItem dataItem) {
    data.items.add(dataItem);
    innerResult.dataItem = dataItem;
    return innerResult;
  }

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
    // NOTE use the stored dataItem
    data.items.add(retainedLayer.dataItem!);
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
    return _pushOp(
      builder.pushBackdropFilter(filter, blendMode: blendMode, oldLayer: oldLayer),
      SBDPushBackdropFilter(blendMode: blendMode),
    );
  }

  @override
  ClipPathEngineLayer pushClipPath(Path path, {Clip clipBehavior = Clip.antiAlias, ClipPathEngineLayer? oldLayer}) {
    return _pushOp(
      builder.pushClipPath(path, clipBehavior: clipBehavior, oldLayer: oldLayer),
      SBDPushClipPath(
        // TODO temporarily hack to make it immutable
        path: Path.from(path),
        clipBehavior: clipBehavior,
      ),
    );
  }

  @override
  ClipRRectEngineLayer pushClipRRect(RRect rrect,
      {Clip clipBehavior = Clip.antiAlias, ClipRRectEngineLayer? oldLayer}) {
    return _pushOp(
      builder.pushClipRRect(rrect, clipBehavior: clipBehavior, oldLayer: oldLayer),
      SBDPushClipRRect(rrect: rrect, clipBehavior: clipBehavior),
    );
  }

  @override
  ClipRectEngineLayer pushClipRect(Rect rect, {Clip clipBehavior = Clip.antiAlias, ClipRectEngineLayer? oldLayer}) {
    return _pushOp(
      builder.pushClipRect(rect, clipBehavior: clipBehavior, oldLayer: oldLayer),
      SBDPushClipRect(rect: rect, clipBehavior: clipBehavior),
    );
  }

  @override
  ColorFilterEngineLayer pushColorFilter(ColorFilter filter, {ColorFilterEngineLayer? oldLayer}) {
    return _pushOp(
      builder.pushColorFilter(filter, oldLayer: oldLayer),
      SBDPushColorFilter(filter: filter),
    );
  }

  @override
  ImageFilterEngineLayer pushImageFilter(ImageFilter filter,
      {Offset offset = Offset.zero, ImageFilterEngineLayer? oldLayer}) {
    return _pushOp(
      builder.pushImageFilter(filter, offset: offset, oldLayer: oldLayer),
      SBDPushImageFilter(filter: filter, offset: offset),
    );
  }

  @override
  OffsetEngineLayer pushOffset(double dx, double dy, {OffsetEngineLayer? oldLayer}) {
    return _pushOp(
      builder.pushOffset(dx, dy, oldLayer: oldLayer),
      SBDPushOffset(dx: dx, dy: dy),
    );
  }

  @override
  OpacityEngineLayer pushOpacity(int alpha, {Offset? offset = Offset.zero, OpacityEngineLayer? oldLayer}) {
    return _pushOp(
      builder.pushOpacity(alpha, offset: offset, oldLayer: oldLayer),
      SBDPushOpacity(alpha: alpha, offset: offset),
    );
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
    return _pushOp(
      // ignore: deprecated_member_use
      builder.pushPhysicalShape(
        path: path,
        elevation: elevation,
        color: color,
        shadowColor: shadowColor,
        clipBehavior: clipBehavior,
        oldLayer: oldLayer,
      ),
      SBDPushPhysicalShape(
        // TODO temporarily hack to make it immutable
        path: Path.from(path),
        elevation: elevation,
        color: color,
        shadowColor: shadowColor,
        clipBehavior: clipBehavior,
      ),
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
    return _pushOp(
      builder.pushShaderMask(
        shader,
        maskRect,
        blendMode,
        oldLayer: oldLayer,
        filterQuality: filterQuality,
      ),
      SBDPushShaderMask(
        shader: shader,
        maskRect: maskRect,
        blendMode: blendMode,
        filterQuality: filterQuality,
      ),
    );
  }

  @override
  TransformEngineLayer pushTransform(Float64List matrix4, {TransformEngineLayer? oldLayer}) {
    return _pushOp(
      builder.pushTransform(matrix4, oldLayer: oldLayer),
      SBDPushTransform(
        // TODO temporarily hack to make it immutable
        matrix4: Float64List.fromList(matrix4),
      ),
    );
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
