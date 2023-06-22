// ignore_for_file: unused_import

import 'dart:typed_data';
import 'dart:ui';

import 'package:screen_recorder/generated/record/scene_builder.dart';
import 'package:screen_recorder/manual/scene_builder.dart';

class MySceneBuilder with MySceneBuilderMixin implements SceneBuilder {
  @override
  final SceneBuilder proxy;

  MySceneBuilder(this.proxy);

  @override
  TransformEngineLayer pushTransform(
    Float64List matrix4, {
    TransformEngineLayer? oldLayer,
  }) {
    SceneBuilder_PushTransform_Record(matrix4: matrix4);
    return proxy.pushTransform(
      matrix4,
      oldLayer: oldLayer,
    );
  }

  @override
  OffsetEngineLayer pushOffset(
    double dx,
    double dy, {
    OffsetEngineLayer? oldLayer,
  }) {
    SceneBuilder_PushOffset_Record(
      dx: dx,
      dy: dy,
    );
    return proxy.pushOffset(
      dx,
      dy,
      oldLayer: oldLayer,
    );
  }

  @override
  ClipRectEngineLayer pushClipRect(
    Rect rect, {
    Clip clipBehavior = Clip.antiAlias,
    ClipRectEngineLayer? oldLayer,
  }) {
    SceneBuilder_PushClipRect_Record(
      rect: rect,
      clipBehavior: clipBehavior,
    );
    return proxy.pushClipRect(
      rect,
      clipBehavior: clipBehavior,
      oldLayer: oldLayer,
    );
  }

  @override
  ClipRRectEngineLayer pushClipRRect(
    RRect rrect, {
    Clip clipBehavior = Clip.antiAlias,
    ClipRRectEngineLayer? oldLayer,
  }) {
    SceneBuilder_PushClipRRect_Record(
      rrect: rrect,
      clipBehavior: clipBehavior,
    );
    return proxy.pushClipRRect(
      rrect,
      clipBehavior: clipBehavior,
      oldLayer: oldLayer,
    );
  }

  @override
  ClipPathEngineLayer pushClipPath(
    Path path, {
    Clip clipBehavior = Clip.antiAlias,
    ClipPathEngineLayer? oldLayer,
  }) {
    SceneBuilder_PushClipPath_Record(
      path: path,
      clipBehavior: clipBehavior,
    );
    return proxy.pushClipPath(
      path,
      clipBehavior: clipBehavior,
      oldLayer: oldLayer,
    );
  }

  @override
  OpacityEngineLayer pushOpacity(
    int alpha, {
    Offset? offset = Offset.zero,
    OpacityEngineLayer? oldLayer,
  }) {
    SceneBuilder_PushOpacity_Record(
      alpha: alpha,
      offset: offset,
    );
    return proxy.pushOpacity(
      alpha,
      offset: offset,
      oldLayer: oldLayer,
    );
  }

  @override
  ColorFilterEngineLayer pushColorFilter(
    ColorFilter filter, {
    ColorFilterEngineLayer? oldLayer,
  }) {
    SceneBuilder_PushColorFilter_Record(filter: filter);
    return proxy.pushColorFilter(
      filter,
      oldLayer: oldLayer,
    );
  }

  @override
  ImageFilterEngineLayer pushImageFilter(
    ImageFilter filter, {
    Offset offset = Offset.zero,
    ImageFilterEngineLayer? oldLayer,
  }) {
    SceneBuilder_PushImageFilter_Record(
      filter: filter,
      offset: offset,
    );
    return proxy.pushImageFilter(
      filter,
      offset: offset,
      oldLayer: oldLayer,
    );
  }

  @override
  BackdropFilterEngineLayer pushBackdropFilter(
    ImageFilter filter, {
    BlendMode blendMode = BlendMode.srcOver,
    BackdropFilterEngineLayer? oldLayer,
  }) {
    SceneBuilder_PushBackdropFilter_Record(
      filter: filter,
      blendMode: blendMode,
    );
    return proxy.pushBackdropFilter(
      filter,
      blendMode: blendMode,
      oldLayer: oldLayer,
    );
  }

  @override
  ShaderMaskEngineLayer pushShaderMask(
    Shader shader,
    Rect maskRect,
    BlendMode blendMode, {
    FilterQuality filterQuality = FilterQuality.low,
    ShaderMaskEngineLayer? oldLayer,
  }) {
    SceneBuilder_PushShaderMask_Record(
      shader: shader,
      maskRect: maskRect,
      blendMode: blendMode,
      filterQuality: filterQuality,
    );
    return proxy.pushShaderMask(
      shader,
      maskRect,
      blendMode,
      filterQuality: filterQuality,
      oldLayer: oldLayer,
    );
  }

  @override
  void pop() {
    SceneBuilder_Pop_Record();
    return proxy.pop();
  }

  @override
  void addRetained(EngineLayer retainedLayer) {
    return proxy.addRetained(retainedLayer);
  }

  @override
  void addPerformanceOverlay(
    int enabledOptions,
    Rect bounds,
  ) {
    SceneBuilder_AddPerformanceOverlay_Record(
      enabledOptions: enabledOptions,
      bounds: bounds,
    );
    return proxy.addPerformanceOverlay(
      enabledOptions,
      bounds,
    );
  }

  @override
  void addPicture(
    Offset offset,
    Picture picture, {
    bool isComplexHint = false,
    bool willChangeHint = false,
  }) {
    SceneBuilder_AddPicture_Record(
      offset: offset,
      picture: picture,
      isComplexHint: isComplexHint,
      willChangeHint: willChangeHint,
    );
    return proxy.addPicture(
      offset,
      picture,
      isComplexHint: isComplexHint,
      willChangeHint: willChangeHint,
    );
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
    SceneBuilder_AddTexture_Record(
      textureId: textureId,
      offset: offset,
      width: width,
      height: height,
      freeze: freeze,
      filterQuality: filterQuality,
    );
    return proxy.addTexture(
      textureId,
      offset: offset,
      width: width,
      height: height,
      freeze: freeze,
      filterQuality: filterQuality,
    );
  }

  @override
  void addPlatformView(
    int viewId, {
    Offset offset = Offset.zero,
    double width = 0.0,
    double height = 0.0,
  }) {
    SceneBuilder_AddPlatformView_Record(
      viewId: viewId,
      offset: offset,
      width: width,
      height: height,
    );
    return proxy.addPlatformView(
      viewId,
      offset: offset,
      width: width,
      height: height,
    );
  }

  @override
  void setRasterizerTracingThreshold(int frameInterval) {
    return proxy.setRasterizerTracingThreshold(frameInterval);
  }

  @override
  void setCheckerboardRasterCacheImages(bool checkerboard) {
    return proxy.setCheckerboardRasterCacheImages(checkerboard);
  }

  @override
  void setCheckerboardOffscreenLayers(bool checkerboard) {
    return proxy.setCheckerboardOffscreenLayers(checkerboard);
  }

  @override
  Scene build() {
    return proxy.build();
  }
}
