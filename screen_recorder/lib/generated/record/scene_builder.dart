// ignore_for_file: unused_import, camel_case_types

// -------------------------------------------------------------
// AUTOMATICALLY GENERATED BY CODE GENERATOR, PLEASE DO NOT EDIT
// -------------------------------------------------------------

import 'dart:typed_data';
import 'dart:ui';

abstract class SceneBuilder_RecordBase<Ret> {
  Ret execute(SceneBuilder proxy);

  // TODO only a temporary workaround, should remove after implementing serialization
  SceneBuilder_RecordBase<Ret> temporaryClone();
}

class SceneBuilder_PushTransform_Record implements SceneBuilder_RecordBase<TransformEngineLayer> {
  SceneBuilder_PushTransform_Record({required this.matrix4});

  final Float64List matrix4;

  @override
  TransformEngineLayer execute(SceneBuilder proxy) {
    return proxy.pushTransform(matrix4);
  }

  @override
  SceneBuilder_PushTransform_Record temporaryClone() {
    return SceneBuilder_PushTransform_Record(matrix4: matrix4);
  }
}

class SceneBuilder_PushOffset_Record implements SceneBuilder_RecordBase<OffsetEngineLayer> {
  SceneBuilder_PushOffset_Record({
    required this.dx,
    required this.dy,
  });

  final double dx;

  final double dy;

  @override
  OffsetEngineLayer execute(SceneBuilder proxy) {
    return proxy.pushOffset(
      dx,
      dy,
    );
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

  final Rect rect;

  final Clip clipBehavior;

  @override
  ClipRectEngineLayer execute(SceneBuilder proxy) {
    return proxy.pushClipRect(
      rect,
      clipBehavior: clipBehavior,
    );
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

  final RRect rrect;

  final Clip clipBehavior;

  @override
  ClipRRectEngineLayer execute(SceneBuilder proxy) {
    return proxy.pushClipRRect(
      rrect,
      clipBehavior: clipBehavior,
    );
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

  final Path path;

  final Clip clipBehavior;

  @override
  ClipPathEngineLayer execute(SceneBuilder proxy) {
    return proxy.pushClipPath(
      path,
      clipBehavior: clipBehavior,
    );
  }

  @override
  SceneBuilder_PushClipPath_Record temporaryClone() {
    return SceneBuilder_PushClipPath_Record(
      path: path,
      clipBehavior: clipBehavior,
    );
  }
}

class SceneBuilder_PushOpacity_Record implements SceneBuilder_RecordBase<OpacityEngineLayer> {
  SceneBuilder_PushOpacity_Record({
    required this.alpha,
    required this.offset,
  });

  final int alpha;

  final Offset? offset;

  @override
  OpacityEngineLayer execute(SceneBuilder proxy) {
    return proxy.pushOpacity(
      alpha,
      offset: offset,
    );
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

  final ColorFilter filter;

  @override
  ColorFilterEngineLayer execute(SceneBuilder proxy) {
    return proxy.pushColorFilter(filter);
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

  final ImageFilter filter;

  final Offset offset;

  @override
  ImageFilterEngineLayer execute(SceneBuilder proxy) {
    return proxy.pushImageFilter(
      filter,
      offset: offset,
    );
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

  final ImageFilter filter;

  final BlendMode blendMode;

  @override
  BackdropFilterEngineLayer execute(SceneBuilder proxy) {
    return proxy.pushBackdropFilter(
      filter,
      blendMode: blendMode,
    );
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

  @override
  void execute(SceneBuilder proxy) {
    return proxy.pop();
  }

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

  final int enabledOptions;

  final Rect bounds;

  @override
  void execute(SceneBuilder proxy) {
    return proxy.addPerformanceOverlay(
      enabledOptions,
      bounds,
    );
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

  @override
  SceneBuilder_AddPicture_Record temporaryClone() {
    return SceneBuilder_AddPicture_Record(
      offset: offset,
      picture: picture,
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
