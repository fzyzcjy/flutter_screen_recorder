// ignore_for_file: unused_import, camel_case_types

// -------------------------------------------------------------
// AUTOMATICALLY GENERATED BY CODE GENERATOR, PLEASE DO NOT EDIT
// -------------------------------------------------------------

import 'dart:typed_data';
import 'dart:ui';

import 'package:screen_recorder/bytes_reader.dart';
import 'package:screen_recorder/serialization_utils.dart';
import 'package:screen_recorder/temporary_clone.dart';

abstract class SceneBuilder_RecordBase<Ret> {
  Ret execute(SceneBuilder proxy);

  // TODO only a temporary workaround, should remove after implementing serialization
  SceneBuilder_RecordBase<Ret> temporaryClone();
}

class SceneBuilder_PushTransform_Record implements SceneBuilder_RecordBase<TransformEngineLayer> {
  SceneBuilder_PushTransform_Record({required this.matrix4});

  factory SceneBuilder_PushTransform_Record.fromBytes(BytesReader reader) {
    final matrix4 = fromBytesFloat64List(reader);
    return SceneBuilder_PushTransform_Record(matrix4: matrix4);
  }

  final Float64List matrix4;

  @override
  TransformEngineLayer execute(SceneBuilder proxy) {
    return proxy.pushTransform(matrix4);
  }

  void toBytes(BytesBuilder writer) {
    toBytesFloat64List(writer, matrix4);
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

  factory SceneBuilder_PushOffset_Record.fromBytes(BytesReader reader) {
    final dx = fromBytesDouble(reader);
    final dy = fromBytesDouble(reader);
    return SceneBuilder_PushOffset_Record(
      dx: dx,
      dy: dy,
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

  void toBytes(BytesBuilder writer) {
    toBytesDouble(writer, dx);
    toBytesDouble(writer, dy);
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

  factory SceneBuilder_PushClipRect_Record.fromBytes(BytesReader reader) {
    final rect = fromBytesRect(reader);
    final clipBehavior = fromBytesEnum(reader);
    return SceneBuilder_PushClipRect_Record(
      rect: rect,
      clipBehavior: clipBehavior,
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

  void toBytes(BytesBuilder writer) {
    toBytesRect(writer, rect);
    toBytesEnum(writer, clipBehavior);
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

  factory SceneBuilder_PushClipRRect_Record.fromBytes(BytesReader reader) {
    final rrect = fromBytesRRect(reader);
    final clipBehavior = fromBytesEnum(reader);
    return SceneBuilder_PushClipRRect_Record(
      rrect: rrect,
      clipBehavior: clipBehavior,
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

  void toBytes(BytesBuilder writer) {
    toBytesRRect(writer, rrect);
    toBytesEnum(writer, clipBehavior);
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

  factory SceneBuilder_PushClipPath_Record.fromBytes(BytesReader reader) {
    final path = fromBytesPath(reader);
    final clipBehavior = fromBytesEnum(reader);
    return SceneBuilder_PushClipPath_Record(
      path: path,
      clipBehavior: clipBehavior,
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

  void toBytes(BytesBuilder writer) {
    toBytesPath(writer, path);
    toBytesEnum(writer, clipBehavior);
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

  factory SceneBuilder_PushOpacity_Record.fromBytes(BytesReader reader) {
    final alpha = fromBytesInt(reader);
    final offset = fromBytesOffset(reader);
    return SceneBuilder_PushOpacity_Record(
      alpha: alpha,
      offset: offset,
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

  void toBytes(BytesBuilder writer) {
    toBytesInt(writer, alpha);
    toBytesOffset(writer, offset);
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

  factory SceneBuilder_PushColorFilter_Record.fromBytes(BytesReader reader) {
    final filter = fromBytesColorFilter(reader);
    return SceneBuilder_PushColorFilter_Record(filter: filter);
  }

  final ColorFilter filter;

  @override
  ColorFilterEngineLayer execute(SceneBuilder proxy) {
    return proxy.pushColorFilter(filter);
  }

  void toBytes(BytesBuilder writer) {
    toBytesColorFilter(writer, filter);
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

  factory SceneBuilder_PushImageFilter_Record.fromBytes(BytesReader reader) {
    final filter = fromBytesImageFilter(reader);
    final offset = fromBytesOffset(reader);
    return SceneBuilder_PushImageFilter_Record(
      filter: filter,
      offset: offset,
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

  void toBytes(BytesBuilder writer) {
    toBytesImageFilter(writer, filter);
    toBytesOffset(writer, offset);
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

  factory SceneBuilder_PushBackdropFilter_Record.fromBytes(BytesReader reader) {
    final filter = fromBytesImageFilter(reader);
    final blendMode = fromBytesEnum(reader);
    return SceneBuilder_PushBackdropFilter_Record(
      filter: filter,
      blendMode: blendMode,
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

  void toBytes(BytesBuilder writer) {
    toBytesImageFilter(writer, filter);
    toBytesEnum(writer, blendMode);
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

  factory SceneBuilder_PushShaderMask_Record.fromBytes(BytesReader reader) {
    final shader = fromBytesShader(reader);
    final maskRect = fromBytesRect(reader);
    final blendMode = fromBytesEnum(reader);
    final filterQuality = fromBytesEnum(reader);
    return SceneBuilder_PushShaderMask_Record(
      shader: shader,
      maskRect: maskRect,
      blendMode: blendMode,
      filterQuality: filterQuality,
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

  void toBytes(BytesBuilder writer) {
    toBytesShader(writer, shader);
    toBytesRect(writer, maskRect);
    toBytesEnum(writer, blendMode);
    toBytesEnum(writer, filterQuality);
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

  factory SceneBuilder_Pop_Record.fromBytes(BytesReader reader) {
    return SceneBuilder_Pop_Record();
  }

  @override
  void execute(SceneBuilder proxy) {
    return proxy.pop();
  }

  void toBytes(BytesBuilder writer) {}
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

  factory SceneBuilder_AddPerformanceOverlay_Record.fromBytes(BytesReader reader) {
    final enabledOptions = fromBytesInt(reader);
    final bounds = fromBytesRect(reader);
    return SceneBuilder_AddPerformanceOverlay_Record(
      enabledOptions: enabledOptions,
      bounds: bounds,
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

  void toBytes(BytesBuilder writer) {
    toBytesInt(writer, enabledOptions);
    toBytesRect(writer, bounds);
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

  factory SceneBuilder_AddPicture_Record.fromBytes(BytesReader reader) {
    final offset = fromBytesOffset(reader);
    final picture = fromBytesPicture(reader);
    final isComplexHint = fromBytesBool(reader);
    final willChangeHint = fromBytesBool(reader);
    return SceneBuilder_AddPicture_Record(
      offset: offset,
      picture: picture,
      isComplexHint: isComplexHint,
      willChangeHint: willChangeHint,
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

  void toBytes(BytesBuilder writer) {
    toBytesOffset(writer, offset);
    toBytesPicture(writer, picture);
    toBytesBool(writer, isComplexHint);
    toBytesBool(writer, willChangeHint);
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

  factory SceneBuilder_AddTexture_Record.fromBytes(BytesReader reader) {
    final textureId = fromBytesInt(reader);
    final offset = fromBytesOffset(reader);
    final width = fromBytesDouble(reader);
    final height = fromBytesDouble(reader);
    final freeze = fromBytesBool(reader);
    final filterQuality = fromBytesEnum(reader);
    return SceneBuilder_AddTexture_Record(
      textureId: textureId,
      offset: offset,
      width: width,
      height: height,
      freeze: freeze,
      filterQuality: filterQuality,
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

  void toBytes(BytesBuilder writer) {
    toBytesInt(writer, textureId);
    toBytesOffset(writer, offset);
    toBytesDouble(writer, width);
    toBytesDouble(writer, height);
    toBytesBool(writer, freeze);
    toBytesEnum(writer, filterQuality);
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

  factory SceneBuilder_AddPlatformView_Record.fromBytes(BytesReader reader) {
    final viewId = fromBytesInt(reader);
    final offset = fromBytesOffset(reader);
    final width = fromBytesDouble(reader);
    final height = fromBytesDouble(reader);
    return SceneBuilder_AddPlatformView_Record(
      viewId: viewId,
      offset: offset,
      width: width,
      height: height,
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

  void toBytes(BytesBuilder writer) {
    toBytesInt(writer, viewId);
    toBytesOffset(writer, offset);
    toBytesDouble(writer, width);
    toBytesDouble(writer, height);
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
