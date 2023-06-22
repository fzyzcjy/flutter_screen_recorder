// ignore_for_file: unused_import, camel_case_types

// -------------------------------------------------------------
// AUTOMATICALLY GENERATED BY CODE GENERATOR, PLEASE DO NOT EDIT
// -------------------------------------------------------------

import 'dart:typed_data';
import 'dart:ui';

import 'package:screen_recorder/temporary_clone.dart';

abstract class SceneBuilder_RecordBase<Ret> {
  Ret execute(SceneBuilder proxy);

  // TODO only a temporary workaround, should remove after implementing serialization
  SceneBuilder_RecordBase<Ret> temporaryClone();
}

class SceneBuilder_PushTransform_Record implements SceneBuilder_RecordBase<TransformEngineLayer> {
  SceneBuilder_PushTransform_Record({required this.matrix4});

  factory SceneBuilder_PushTransform_Record.fromBytes(Uint8List bytes) {
    return SceneBuilder_PushTransform_Record(matrix4: TODO);
  }

  final Float64List matrix4;

  @override
  TransformEngineLayer execute(SceneBuilder proxy) {
    return proxy.pushTransform(matrix4);
  }

  void toBytes(BytesBuilder builder) {
    matrix4.toBytes(builder);
  }

  @override
  SceneBuilder_PushTransform_Record temporaryClone() {
    return SceneBuilder_PushTransform_Record(matrix4: matrix4.temporaryClone());
  }
}

class SceneBuilder_PushOffset_Record implements SceneBuilder_RecordBase<OffsetEngineLayer> {
  SceneBuilder_PushOffset_Record({
    required this.dx,
    required this.dy,
  });

  factory SceneBuilder_PushOffset_Record.fromBytes(Uint8List bytes) {
    return SceneBuilder_PushOffset_Record(
      dx: TODO,
      dy: TODO,
    );
  }

  final double dx;

  final double dy;

  @override
  OffsetEngineLayer execute(SceneBuilder proxy) {
    return proxy.pushOffset(
      dx,
      dy,
    );
  }

  void toBytes(BytesBuilder builder) {
    dx.toBytes(builder);
    dy.toBytes(builder);
  }

  @override
  SceneBuilder_PushOffset_Record temporaryClone() {
    return SceneBuilder_PushOffset_Record(
      dx: dx,
      dy: dy,
    );
  }
}

class SceneBuilder_PushClipRect_Record implements SceneBuilder_RecordBase<ClipRectEngineLayer> {
  SceneBuilder_PushClipRect_Record({
    required this.rect,
    required this.clipBehavior,
  });

  factory SceneBuilder_PushClipRect_Record.fromBytes(Uint8List bytes) {
    return SceneBuilder_PushClipRect_Record(
      rect: TODO,
      clipBehavior: TODO,
    );
  }

  final Rect rect;

  final Clip clipBehavior;

  @override
  ClipRectEngineLayer execute(SceneBuilder proxy) {
    return proxy.pushClipRect(
      rect,
      clipBehavior: clipBehavior,
    );
  }

  void toBytes(BytesBuilder builder) {
    rect.toBytes(builder);
    clipBehavior.toBytes(builder);
  }

  @override
  SceneBuilder_PushClipRect_Record temporaryClone() {
    return SceneBuilder_PushClipRect_Record(
      rect: rect,
      clipBehavior: clipBehavior,
    );
  }
}

class SceneBuilder_PushClipRRect_Record implements SceneBuilder_RecordBase<ClipRRectEngineLayer> {
  SceneBuilder_PushClipRRect_Record({
    required this.rrect,
    required this.clipBehavior,
  });

  factory SceneBuilder_PushClipRRect_Record.fromBytes(Uint8List bytes) {
    return SceneBuilder_PushClipRRect_Record(
      rrect: TODO,
      clipBehavior: TODO,
    );
  }

  final RRect rrect;

  final Clip clipBehavior;

  @override
  ClipRRectEngineLayer execute(SceneBuilder proxy) {
    return proxy.pushClipRRect(
      rrect,
      clipBehavior: clipBehavior,
    );
  }

  void toBytes(BytesBuilder builder) {
    rrect.toBytes(builder);
    clipBehavior.toBytes(builder);
  }

  @override
  SceneBuilder_PushClipRRect_Record temporaryClone() {
    return SceneBuilder_PushClipRRect_Record(
      rrect: rrect,
      clipBehavior: clipBehavior,
    );
  }
}

class SceneBuilder_PushClipPath_Record implements SceneBuilder_RecordBase<ClipPathEngineLayer> {
  SceneBuilder_PushClipPath_Record({
    required this.path,
    required this.clipBehavior,
  });

  factory SceneBuilder_PushClipPath_Record.fromBytes(Uint8List bytes) {
    return SceneBuilder_PushClipPath_Record(
      path: TODO,
      clipBehavior: TODO,
    );
  }

  final Path path;

  final Clip clipBehavior;

  @override
  ClipPathEngineLayer execute(SceneBuilder proxy) {
    return proxy.pushClipPath(
      path,
      clipBehavior: clipBehavior,
    );
  }

  void toBytes(BytesBuilder builder) {
    path.toBytes(builder);
    clipBehavior.toBytes(builder);
  }

  @override
  SceneBuilder_PushClipPath_Record temporaryClone() {
    return SceneBuilder_PushClipPath_Record(
      path: path.temporaryClone(),
      clipBehavior: clipBehavior,
    );
  }
}

class SceneBuilder_PushOpacity_Record implements SceneBuilder_RecordBase<OpacityEngineLayer> {
  SceneBuilder_PushOpacity_Record({
    required this.alpha,
    required this.offset,
  });

  factory SceneBuilder_PushOpacity_Record.fromBytes(Uint8List bytes) {
    return SceneBuilder_PushOpacity_Record(
      alpha: TODO,
      offset: TODO,
    );
  }

  final int alpha;

  final Offset? offset;

  @override
  OpacityEngineLayer execute(SceneBuilder proxy) {
    return proxy.pushOpacity(
      alpha,
      offset: offset,
    );
  }

  void toBytes(BytesBuilder builder) {
    alpha.toBytes(builder);
    offset.toBytes(builder);
  }

  @override
  SceneBuilder_PushOpacity_Record temporaryClone() {
    return SceneBuilder_PushOpacity_Record(
      alpha: alpha,
      offset: offset,
    );
  }
}

class SceneBuilder_PushColorFilter_Record implements SceneBuilder_RecordBase<ColorFilterEngineLayer> {
  SceneBuilder_PushColorFilter_Record({required this.filter});

  factory SceneBuilder_PushColorFilter_Record.fromBytes(Uint8List bytes) {
    return SceneBuilder_PushColorFilter_Record(filter: TODO);
  }

  final ColorFilter filter;

  @override
  ColorFilterEngineLayer execute(SceneBuilder proxy) {
    return proxy.pushColorFilter(filter);
  }

  void toBytes(BytesBuilder builder) {
    filter.toBytes(builder);
  }

  @override
  SceneBuilder_PushColorFilter_Record temporaryClone() {
    return SceneBuilder_PushColorFilter_Record(filter: filter);
  }
}

class SceneBuilder_PushImageFilter_Record implements SceneBuilder_RecordBase<ImageFilterEngineLayer> {
  SceneBuilder_PushImageFilter_Record({
    required this.filter,
    required this.offset,
  });

  factory SceneBuilder_PushImageFilter_Record.fromBytes(Uint8List bytes) {
    return SceneBuilder_PushImageFilter_Record(
      filter: TODO,
      offset: TODO,
    );
  }

  final ImageFilter filter;

  final Offset offset;

  @override
  ImageFilterEngineLayer execute(SceneBuilder proxy) {
    return proxy.pushImageFilter(
      filter,
      offset: offset,
    );
  }

  void toBytes(BytesBuilder builder) {
    filter.toBytes(builder);
    offset.toBytes(builder);
  }

  @override
  SceneBuilder_PushImageFilter_Record temporaryClone() {
    return SceneBuilder_PushImageFilter_Record(
      filter: filter,
      offset: offset,
    );
  }
}

class SceneBuilder_PushBackdropFilter_Record implements SceneBuilder_RecordBase<BackdropFilterEngineLayer> {
  SceneBuilder_PushBackdropFilter_Record({
    required this.filter,
    required this.blendMode,
  });

  factory SceneBuilder_PushBackdropFilter_Record.fromBytes(Uint8List bytes) {
    return SceneBuilder_PushBackdropFilter_Record(
      filter: TODO,
      blendMode: TODO,
    );
  }

  final ImageFilter filter;

  final BlendMode blendMode;

  @override
  BackdropFilterEngineLayer execute(SceneBuilder proxy) {
    return proxy.pushBackdropFilter(
      filter,
      blendMode: blendMode,
    );
  }

  void toBytes(BytesBuilder builder) {
    filter.toBytes(builder);
    blendMode.toBytes(builder);
  }

  @override
  SceneBuilder_PushBackdropFilter_Record temporaryClone() {
    return SceneBuilder_PushBackdropFilter_Record(
      filter: filter,
      blendMode: blendMode,
    );
  }
}

class SceneBuilder_PushShaderMask_Record implements SceneBuilder_RecordBase<ShaderMaskEngineLayer> {
  SceneBuilder_PushShaderMask_Record({
    required this.shader,
    required this.maskRect,
    required this.blendMode,
    required this.filterQuality,
  });

  factory SceneBuilder_PushShaderMask_Record.fromBytes(Uint8List bytes) {
    return SceneBuilder_PushShaderMask_Record(
      shader: TODO,
      maskRect: TODO,
      blendMode: TODO,
      filterQuality: TODO,
    );
  }

  final Shader shader;

  final Rect maskRect;

  final BlendMode blendMode;

  final FilterQuality filterQuality;

  @override
  ShaderMaskEngineLayer execute(SceneBuilder proxy) {
    return proxy.pushShaderMask(
      shader,
      maskRect,
      blendMode,
      filterQuality: filterQuality,
    );
  }

  void toBytes(BytesBuilder builder) {
    shader.toBytes(builder);
    maskRect.toBytes(builder);
    blendMode.toBytes(builder);
    filterQuality.toBytes(builder);
  }

  @override
  SceneBuilder_PushShaderMask_Record temporaryClone() {
    return SceneBuilder_PushShaderMask_Record(
      shader: shader,
      maskRect: maskRect,
      blendMode: blendMode,
      filterQuality: filterQuality,
    );
  }
}

class SceneBuilder_Pop_Record implements SceneBuilder_RecordBase<void> {
  SceneBuilder_Pop_Record();

  factory SceneBuilder_Pop_Record.fromBytes(Uint8List bytes) {
    return SceneBuilder_Pop_Record();
  }

  @override
  void execute(SceneBuilder proxy) {
    return proxy.pop();
  }

  void toBytes(BytesBuilder builder) {}
  @override
  SceneBuilder_Pop_Record temporaryClone() {
    return SceneBuilder_Pop_Record();
  }
}

class SceneBuilder_AddPerformanceOverlay_Record implements SceneBuilder_RecordBase<void> {
  SceneBuilder_AddPerformanceOverlay_Record({
    required this.enabledOptions,
    required this.bounds,
  });

  factory SceneBuilder_AddPerformanceOverlay_Record.fromBytes(Uint8List bytes) {
    return SceneBuilder_AddPerformanceOverlay_Record(
      enabledOptions: TODO,
      bounds: TODO,
    );
  }

  final int enabledOptions;

  final Rect bounds;

  @override
  void execute(SceneBuilder proxy) {
    return proxy.addPerformanceOverlay(
      enabledOptions,
      bounds,
    );
  }

  void toBytes(BytesBuilder builder) {
    enabledOptions.toBytes(builder);
    bounds.toBytes(builder);
  }

  @override
  SceneBuilder_AddPerformanceOverlay_Record temporaryClone() {
    return SceneBuilder_AddPerformanceOverlay_Record(
      enabledOptions: enabledOptions,
      bounds: bounds,
    );
  }
}

class SceneBuilder_AddPicture_Record implements SceneBuilder_RecordBase<void> {
  SceneBuilder_AddPicture_Record({
    required this.offset,
    required this.picture,
    required this.isComplexHint,
    required this.willChangeHint,
  });

  factory SceneBuilder_AddPicture_Record.fromBytes(Uint8List bytes) {
    return SceneBuilder_AddPicture_Record(
      offset: TODO,
      picture: TODO,
      isComplexHint: TODO,
      willChangeHint: TODO,
    );
  }

  final Offset offset;

  final Picture picture;

  final bool isComplexHint;

  final bool willChangeHint;

  @override
  void execute(SceneBuilder proxy) {
    return proxy.addPicture(
      offset,
      picture,
      isComplexHint: isComplexHint,
      willChangeHint: willChangeHint,
    );
  }

  void toBytes(BytesBuilder builder) {
    offset.toBytes(builder);
    picture.toBytes(builder);
    isComplexHint.toBytes(builder);
    willChangeHint.toBytes(builder);
  }

  @override
  SceneBuilder_AddPicture_Record temporaryClone() {
    return SceneBuilder_AddPicture_Record(
      offset: offset,
      picture: picture.temporaryClone(),
      isComplexHint: isComplexHint,
      willChangeHint: willChangeHint,
    );
  }
}

class SceneBuilder_AddTexture_Record implements SceneBuilder_RecordBase<void> {
  SceneBuilder_AddTexture_Record({
    required this.textureId,
    required this.offset,
    required this.width,
    required this.height,
    required this.freeze,
    required this.filterQuality,
  });

  factory SceneBuilder_AddTexture_Record.fromBytes(Uint8List bytes) {
    return SceneBuilder_AddTexture_Record(
      textureId: TODO,
      offset: TODO,
      width: TODO,
      height: TODO,
      freeze: TODO,
      filterQuality: TODO,
    );
  }

  final int textureId;

  final Offset offset;

  final double width;

  final double height;

  final bool freeze;

  final FilterQuality filterQuality;

  @override
  void execute(SceneBuilder proxy) {
    return proxy.addTexture(
      textureId,
      offset: offset,
      width: width,
      height: height,
      freeze: freeze,
      filterQuality: filterQuality,
    );
  }

  void toBytes(BytesBuilder builder) {
    textureId.toBytes(builder);
    offset.toBytes(builder);
    width.toBytes(builder);
    height.toBytes(builder);
    freeze.toBytes(builder);
    filterQuality.toBytes(builder);
  }

  @override
  SceneBuilder_AddTexture_Record temporaryClone() {
    return SceneBuilder_AddTexture_Record(
      textureId: textureId,
      offset: offset,
      width: width,
      height: height,
      freeze: freeze,
      filterQuality: filterQuality,
    );
  }
}

class SceneBuilder_AddPlatformView_Record implements SceneBuilder_RecordBase<void> {
  SceneBuilder_AddPlatformView_Record({
    required this.viewId,
    required this.offset,
    required this.width,
    required this.height,
  });

  factory SceneBuilder_AddPlatformView_Record.fromBytes(Uint8List bytes) {
    return SceneBuilder_AddPlatformView_Record(
      viewId: TODO,
      offset: TODO,
      width: TODO,
      height: TODO,
    );
  }

  final int viewId;

  final Offset offset;

  final double width;

  final double height;

  @override
  void execute(SceneBuilder proxy) {
    return proxy.addPlatformView(
      viewId,
      offset: offset,
      width: width,
      height: height,
    );
  }

  void toBytes(BytesBuilder builder) {
    viewId.toBytes(builder);
    offset.toBytes(builder);
    width.toBytes(builder);
    height.toBytes(builder);
  }

  @override
  SceneBuilder_AddPlatformView_Record temporaryClone() {
    return SceneBuilder_AddPlatformView_Record(
      viewId: viewId,
      offset: offset,
      width: width,
      height: height,
    );
  }
}
