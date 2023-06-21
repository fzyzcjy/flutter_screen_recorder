import 'dart:typed_data';
import 'dart:ui';

import 'package:screen_recorder/data_per_frame.dart';
import 'package:screen_recorder/expandos.dart';
import 'package:screen_recorder/scene_builder_record.dart';

SceneBuilderRecord get _data => DataPerFrame.instance.sceneBuilderData;

class MySceneBuilder implements SceneBuilder {
  final SceneBuilder builder;

  MySceneBuilder(this.builder);

  void _addOp(SceneBuilderOpAddRecord opRecord) {
    _data.ops.add(opRecord.safeClone());
    opRecord.execute(builder);
  }

  T _pushOp<T extends EngineLayer>(SceneBuilderOpPushRecord<T> opRecord, {required T? oldLayer}) {
    _data.ops.add(opRecord.safeClone());
    final innerResult = opRecord.execute(builder, oldLayer: oldLayer);

    innerResult.opRecord = opRecord;

    return innerResult;
  }

  // ========= Special =========

  @override
  void addRetained(EngineLayer retainedLayer) {
    // NOTE use the stored opRecord
    _data.ops.add(retainedLayer.opRecord!);
    builder.addRetained(retainedLayer);
  }

  // ========= Add =========

  @override
  void addPerformanceOverlay(
    int enabledOptions,
    Rect bounds,
  ) {
    _addOp(SBDAddPerformanceOverlay(
      enabledOptions: enabledOptions,
      bounds: bounds,
    ));
  }

  @override
  void addPicture(
    Offset offset,
    Picture picture, {
    bool isComplexHint = false,
    bool willChangeHint = false,
  }) {
    _addOp(SBDAddPicture(
      offset: offset,
      picture: picture,
      isComplexHint: isComplexHint,
      willChangeHint: willChangeHint,
    ));
  }

  @override
  void addPlatformView(
    int viewId, {
    Offset offset = Offset.zero,
    double width = 0.0,
    double height = 0.0,
  }) {
    _addOp(SBDAddPlatformView(
      viewId: viewId,
      offset: offset,
      width: width,
      height: height,
    ));
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
    _addOp(SBDAddTexture(
      textureId: textureId,
      offset: offset,
      width: width,
      height: height,
      freeze: freeze,
      filterQuality: filterQuality,
    ));
  }

  // ========= Push =========

  @override
  BackdropFilterEngineLayer pushBackdropFilter(
    ImageFilter filter, {
    BlendMode blendMode = BlendMode.srcOver,
    BackdropFilterEngineLayer? oldLayer,
  }) {
    return _pushOp(
      SBDPushBackdropFilter(
        filter: filter,
        blendMode: blendMode,
      ),
      oldLayer: oldLayer,
    );
  }

  @override
  ClipPathEngineLayer pushClipPath(
    Path path, {
    Clip clipBehavior = Clip.antiAlias,
    ClipPathEngineLayer? oldLayer,
  }) {
    return _pushOp(
      SBDPushClipPath(
        path: path,
        clipBehavior: clipBehavior,
      ),
      oldLayer: oldLayer,
    );
  }

  @override
  ClipRRectEngineLayer pushClipRRect(
    RRect rrect, {
    Clip clipBehavior = Clip.antiAlias,
    ClipRRectEngineLayer? oldLayer,
  }) {
    return _pushOp(
      SBDPushClipRRect(
        rrect: rrect,
        clipBehavior: clipBehavior,
      ),
      oldLayer: oldLayer,
    );
  }

  @override
  ClipRectEngineLayer pushClipRect(
    Rect rect, {
    Clip clipBehavior = Clip.antiAlias,
    ClipRectEngineLayer? oldLayer,
  }) {
    return _pushOp(
      SBDPushClipRect(
        rect: rect,
        clipBehavior: clipBehavior,
      ),
      oldLayer: oldLayer,
    );
  }

  @override
  ColorFilterEngineLayer pushColorFilter(
    ColorFilter filter, {
    ColorFilterEngineLayer? oldLayer,
  }) {
    return _pushOp(
      SBDPushColorFilter(
        filter: filter,
      ),
      oldLayer: oldLayer,
    );
  }

  @override
  ImageFilterEngineLayer pushImageFilter(
    ImageFilter filter, {
    Offset offset = Offset.zero,
    ImageFilterEngineLayer? oldLayer,
  }) {
    return _pushOp(
      SBDPushImageFilter(
        filter: filter,
        offset: offset,
      ),
      oldLayer: oldLayer,
    );
  }

  @override
  OffsetEngineLayer pushOffset(
    double dx,
    double dy, {
    OffsetEngineLayer? oldLayer,
  }) {
    return _pushOp(
      SBDPushOffset(
        dx: dx,
        dy: dy,
      ),
      oldLayer: oldLayer,
    );
  }

  @override
  OpacityEngineLayer pushOpacity(
    int alpha, {
    Offset? offset = Offset.zero,
    OpacityEngineLayer? oldLayer,
  }) {
    return _pushOp(
      SBDPushOpacity(
        alpha: alpha,
        offset: offset,
      ),
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
    return _pushOp(
      SBDPushShaderMask(
        shader: shader,
        maskRect: maskRect,
        blendMode: blendMode,
        filterQuality: filterQuality,
      ),
      oldLayer: oldLayer,
    );
  }

  @override
  TransformEngineLayer pushTransform(
    Float64List matrix4, {
    TransformEngineLayer? oldLayer,
  }) {
    return _pushOp(
      SBDPushTransform(
        matrix4: matrix4,
      ),
      oldLayer: oldLayer,
    );
  }

  // ========= Misc =========

  @override
  Scene build() {
    return builder.build();
  }

  @override
  void pop() {
    builder.pop();
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
