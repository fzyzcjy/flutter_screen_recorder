// ignore_for_file: unused_import

import 'dart:typed_data';
import 'dart:ui';

class MySceneBuilder implements SceneBuilder {
  final SceneBuilder proxy;

  MySceneBuilder(this.proxy);

  @override
  TransformEngineLayer pushTransform(
    Float64List matrix4, {
    TransformEngineLayer? oldLayer,
  }) {
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
