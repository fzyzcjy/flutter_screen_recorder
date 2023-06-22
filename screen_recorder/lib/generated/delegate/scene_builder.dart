// ignore_for_file: unused_import

// -------------------------------------------------------------
// AUTOMATICALLY GENERATED BY CODE GENERATOR, PLEASE DO NOT EDIT
// -------------------------------------------------------------

import 'dart:typed_data';
import 'dart:ui';

import 'package:screen_recorder/delegate_base/scene_builder.dart';
import 'package:screen_recorder/generated/record/scene_builder.dart';

class MySceneBuilder extends MySceneBuilderBase implements SceneBuilder {
  MySceneBuilder(super.proxy);

  @override
  TransformEngineLayer pushTransform(
    Float64List matrix4, {
    TransformEngineLayer? oldLayer,
  }) {
    final result = proxy.pushTransform(
      matrix4,
      oldLayer: oldLayer,
    );
    final record = SceneBuilder_PushTransform_Record(matrix4: matrix4);
    handlePushOp(result, record);
    return result;
  }

  @override
  OffsetEngineLayer pushOffset(
    double dx,
    double dy, {
    OffsetEngineLayer? oldLayer,
  }) {
    final result = proxy.pushOffset(
      dx,
      dy,
      oldLayer: oldLayer,
    );
    final record = SceneBuilder_PushOffset_Record(
      dx: dx,
      dy: dy,
    );
    handlePushOp(result, record);
    return result;
  }

  @override
  ClipRectEngineLayer pushClipRect(
    Rect rect, {
    Clip clipBehavior = Clip.antiAlias,
    ClipRectEngineLayer? oldLayer,
  }) {
    final result = proxy.pushClipRect(
      rect,
      clipBehavior: clipBehavior,
      oldLayer: oldLayer,
    );
    final record = SceneBuilder_PushClipRect_Record(
      rect: rect,
      clipBehavior: clipBehavior,
    );
    handlePushOp(result, record);
    return result;
  }

  @override
  ClipRRectEngineLayer pushClipRRect(
    RRect rrect, {
    Clip clipBehavior = Clip.antiAlias,
    ClipRRectEngineLayer? oldLayer,
  }) {
    final result = proxy.pushClipRRect(
      rrect,
      clipBehavior: clipBehavior,
      oldLayer: oldLayer,
    );
    final record = SceneBuilder_PushClipRRect_Record(
      rrect: rrect,
      clipBehavior: clipBehavior,
    );
    handlePushOp(result, record);
    return result;
  }

  @override
  ClipPathEngineLayer pushClipPath(
    Path path, {
    Clip clipBehavior = Clip.antiAlias,
    ClipPathEngineLayer? oldLayer,
  }) {
    final result = proxy.pushClipPath(
      path,
      clipBehavior: clipBehavior,
      oldLayer: oldLayer,
    );
    final record = SceneBuilder_PushClipPath_Record(
      path: path,
      clipBehavior: clipBehavior,
    );
    handlePushOp(result, record);
    return result;
  }

  @override
  OpacityEngineLayer pushOpacity(
    int alpha, {
    Offset? offset = Offset.zero,
    OpacityEngineLayer? oldLayer,
  }) {
    final result = proxy.pushOpacity(
      alpha,
      offset: offset,
      oldLayer: oldLayer,
    );
    final record = SceneBuilder_PushOpacity_Record(
      alpha: alpha,
      offset: offset,
    );
    handlePushOp(result, record);
    return result;
  }

  @override
  ColorFilterEngineLayer pushColorFilter(
    ColorFilter filter, {
    ColorFilterEngineLayer? oldLayer,
  }) {
    final result = proxy.pushColorFilter(
      filter,
      oldLayer: oldLayer,
    );
    final record = SceneBuilder_PushColorFilter_Record(filter: filter);
    handlePushOp(result, record);
    return result;
  }

  @override
  ImageFilterEngineLayer pushImageFilter(
    ImageFilter filter, {
    Offset offset = Offset.zero,
    ImageFilterEngineLayer? oldLayer,
  }) {
    final result = proxy.pushImageFilter(
      filter,
      offset: offset,
      oldLayer: oldLayer,
    );
    final record = SceneBuilder_PushImageFilter_Record(
      filter: filter,
      offset: offset,
    );
    handlePushOp(result, record);
    return result;
  }

  @override
  BackdropFilterEngineLayer pushBackdropFilter(
    ImageFilter filter, {
    BlendMode blendMode = BlendMode.srcOver,
    BackdropFilterEngineLayer? oldLayer,
  }) {
    final result = proxy.pushBackdropFilter(
      filter,
      blendMode: blendMode,
      oldLayer: oldLayer,
    );
    final record = SceneBuilder_PushBackdropFilter_Record(
      filter: filter,
      blendMode: blendMode,
    );
    handlePushOp(result, record);
    return result;
  }

  @override
  ShaderMaskEngineLayer pushShaderMask(
    Shader shader,
    Rect maskRect,
    BlendMode blendMode, {
    FilterQuality filterQuality = FilterQuality.low,
    ShaderMaskEngineLayer? oldLayer,
  }) {
    final result = proxy.pushShaderMask(
      shader,
      maskRect,
      blendMode,
      filterQuality: filterQuality,
      oldLayer: oldLayer,
    );
    final record = SceneBuilder_PushShaderMask_Record(
      shader: shader,
      maskRect: maskRect,
      blendMode: blendMode,
      filterQuality: filterQuality,
    );
    handlePushOp(result, record);
    return result;
  }

  @override
  void pop() {
    final result = proxy.pop();
    final record = SceneBuilder_Pop_Record();
    handleMiscOp(result, record);
    return result;
  }

  @override
  void addRetained(EngineLayer retainedLayer) {
    final result = proxy.addRetained(retainedLayer);
    handleAddRetainedOp(retainedLayer);
    return result;
  }

  @override
  void addPerformanceOverlay(
    int enabledOptions,
    Rect bounds,
  ) {
    final result = proxy.addPerformanceOverlay(
      enabledOptions,
      bounds,
    );
    final record = SceneBuilder_AddPerformanceOverlay_Record(
      enabledOptions: enabledOptions,
      bounds: bounds,
    );
    handleMiscOp(result, record);
    return result;
  }

  @override
  void addPicture(
    Offset offset,
    Picture picture, {
    bool isComplexHint = false,
    bool willChangeHint = false,
  }) {
    final result = proxy.addPicture(
      offset,
      picture,
      isComplexHint: isComplexHint,
      willChangeHint: willChangeHint,
    );
    final record = SceneBuilder_AddPicture_Record(
      offset: offset,
      picture: picture,
      isComplexHint: isComplexHint,
      willChangeHint: willChangeHint,
    );
    handleMiscOp(result, record);
    return result;
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
    final result = proxy.addTexture(
      textureId,
      offset: offset,
      width: width,
      height: height,
      freeze: freeze,
      filterQuality: filterQuality,
    );
    final record = SceneBuilder_AddTexture_Record(
      textureId: textureId,
      offset: offset,
      width: width,
      height: height,
      freeze: freeze,
      filterQuality: filterQuality,
    );
    handleMiscOp(result, record);
    return result;
  }

  @override
  void addPlatformView(
    int viewId, {
    Offset offset = Offset.zero,
    double width = 0.0,
    double height = 0.0,
  }) {
    final result = proxy.addPlatformView(
      viewId,
      offset: offset,
      width: width,
      height: height,
    );
    final record = SceneBuilder_AddPlatformView_Record(
      viewId: viewId,
      offset: offset,
      width: width,
      height: height,
    );
    handleMiscOp(result, record);
    return result;
  }

  @override
  void setRasterizerTracingThreshold(int frameInterval) {
    final result = proxy.setRasterizerTracingThreshold(frameInterval);
    return result;
  }

  @override
  void setCheckerboardRasterCacheImages(bool checkerboard) {
    final result = proxy.setCheckerboardRasterCacheImages(checkerboard);
    return result;
  }

  @override
  void setCheckerboardOffscreenLayers(bool checkerboard) {
    final result = proxy.setCheckerboardOffscreenLayers(checkerboard);
    return result;
  }

  @override
  Scene build() {
    final result = proxy.build();
    return result;
  }
}
