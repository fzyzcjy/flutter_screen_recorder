// ignore_for_file: unused_import, camel_case_types

// -------------------------------------------------------------
// AUTOMATICALLY GENERATED BY CODE GENERATOR, PLEASE DO NOT EDIT
// -------------------------------------------------------------

import 'dart:typed_data';
import 'dart:ui';

import 'package:screen_recorder/src/bytes_reader_writer.dart';
import 'package:screen_recorder/src/generated/serialization/serialization.dart';
import 'package:screen_recorder/src/serialization.dart';
import 'package:screen_recorder/src/temporary_clone.dart';
import 'package:screen_recorder/src/delegate_base/scene_builder.dart';

sealed class SceneBuilder_RecordBase<Ret> {
  SceneBuilder_RecordBase();

  static SceneBuilder_RecordBase fromBytes(ContextBytesReader reader) {
    final tag = fromBytesUint8(reader);
    switch (tag) {
      case 0:
        return SceneBuilder_PushTransform_Record.fromBytes(reader);
      case 1:
        return SceneBuilder_PushOffset_Record.fromBytes(reader);
      case 2:
        return SceneBuilder_PushClipRect_Record.fromBytes(reader);
      case 3:
        return SceneBuilder_PushClipRRect_Record.fromBytes(reader);
      case 4:
        return SceneBuilder_PushClipPath_Record.fromBytes(reader);
      case 5:
        return SceneBuilder_PushOpacity_Record.fromBytes(reader);
      case 6:
        return SceneBuilder_PushColorFilter_Record.fromBytes(reader);
      case 7:
        return SceneBuilder_PushImageFilter_Record.fromBytes(reader);
      case 8:
        return SceneBuilder_PushBackdropFilter_Record.fromBytes(reader);
      case 9:
        return SceneBuilder_PushShaderMask_Record.fromBytes(reader);
      case 10:
        return SceneBuilder_Pop_Record.fromBytes(reader);
      case 11:
        return SceneBuilder_AddRetained_Record.fromBytes(reader);
      case 12:
        return SceneBuilder_AddPerformanceOverlay_Record.fromBytes(reader);
      case 13:
        return SceneBuilder_AddPicture_Record.fromBytes(reader);
      case 14:
        return SceneBuilder_AddTexture_Record.fromBytes(reader);
      case 15:
        return SceneBuilder_AddPlatformView_Record.fromBytes(reader);
      default:
        throw UnimplementedError('unknown tag=$tag');
    }
  }

  Ret execute(SceneBuilder proxy, SceneBuilder_RecordExecuteContext executeContext);

  // TODO only a temporary workaround, should remove after implementing serialization
  SceneBuilder_RecordBase<Ret> temporaryClone();

  void toBytes(ContextBytesWriter writer) {
    toBytesUint8(writer, tag);
    toBytesWithoutTag(writer);
  }

  int get tag;

  void toBytesWithoutTag(ContextBytesWriter writer);
}

class SceneBuilder_PushTransform_Record extends SceneBuilder_RecordBase<TransformEngineLayer> {
  SceneBuilder_PushTransform_Record({
    required this.matrix4,
    required this.layerId,
  });

  factory SceneBuilder_PushTransform_Record.fromBytes(ContextBytesReader reader) =>
      fromBytesSceneBuilderPushTransformRecord(reader);

  final Float64List matrix4;

  final int layerId;

  @override
  TransformEngineLayer execute(
    SceneBuilder proxy,
    SceneBuilder_RecordExecuteContext executeContext,
  ) {
    final result = proxy.pushTransform(matrix4);
    executeContext.putEngineLayerId(layerId, result);
    return result;
  }

  @override
  int get tag => 0;
  @override
  void toBytesWithoutTag(ContextBytesWriter writer) => toBytesSceneBuilderPushTransformRecord(writer, this);
  @override
  SceneBuilder_PushTransform_Record temporaryClone() {
    return SceneBuilder_PushTransform_Record(
      matrix4: matrix4.temporaryClone(),
      layerId: layerId,
    );
  }
}

class SceneBuilder_PushOffset_Record extends SceneBuilder_RecordBase<OffsetEngineLayer> {
  SceneBuilder_PushOffset_Record({
    required this.dx,
    required this.dy,
    required this.layerId,
  });

  factory SceneBuilder_PushOffset_Record.fromBytes(ContextBytesReader reader) =>
      fromBytesSceneBuilderPushOffsetRecord(reader);

  final double dx;

  final double dy;

  final int layerId;

  @override
  OffsetEngineLayer execute(
    SceneBuilder proxy,
    SceneBuilder_RecordExecuteContext executeContext,
  ) {
    final result = proxy.pushOffset(
      dx,
      dy,
    );
    executeContext.putEngineLayerId(layerId, result);
    return result;
  }

  @override
  int get tag => 1;
  @override
  void toBytesWithoutTag(ContextBytesWriter writer) => toBytesSceneBuilderPushOffsetRecord(writer, this);
  @override
  SceneBuilder_PushOffset_Record temporaryClone() {
    return SceneBuilder_PushOffset_Record(
      dx: dx,
      dy: dy,
      layerId: layerId,
    );
  }
}

class SceneBuilder_PushClipRect_Record extends SceneBuilder_RecordBase<ClipRectEngineLayer> {
  SceneBuilder_PushClipRect_Record({
    required this.rect,
    required this.clipBehavior,
    required this.layerId,
  });

  factory SceneBuilder_PushClipRect_Record.fromBytes(ContextBytesReader reader) =>
      fromBytesSceneBuilderPushClipRectRecord(reader);

  final Rect rect;

  final Clip clipBehavior;

  final int layerId;

  @override
  ClipRectEngineLayer execute(
    SceneBuilder proxy,
    SceneBuilder_RecordExecuteContext executeContext,
  ) {
    final result = proxy.pushClipRect(
      rect,
      clipBehavior: clipBehavior,
    );
    executeContext.putEngineLayerId(layerId, result);
    return result;
  }

  @override
  int get tag => 2;
  @override
  void toBytesWithoutTag(ContextBytesWriter writer) => toBytesSceneBuilderPushClipRectRecord(writer, this);
  @override
  SceneBuilder_PushClipRect_Record temporaryClone() {
    return SceneBuilder_PushClipRect_Record(
      rect: rect,
      clipBehavior: clipBehavior,
      layerId: layerId,
    );
  }
}

class SceneBuilder_PushClipRRect_Record extends SceneBuilder_RecordBase<ClipRRectEngineLayer> {
  SceneBuilder_PushClipRRect_Record({
    required this.rrect,
    required this.clipBehavior,
    required this.layerId,
  });

  factory SceneBuilder_PushClipRRect_Record.fromBytes(ContextBytesReader reader) =>
      fromBytesSceneBuilderPushClipRRectRecord(reader);

  final RRect rrect;

  final Clip clipBehavior;

  final int layerId;

  @override
  ClipRRectEngineLayer execute(
    SceneBuilder proxy,
    SceneBuilder_RecordExecuteContext executeContext,
  ) {
    final result = proxy.pushClipRRect(
      rrect,
      clipBehavior: clipBehavior,
    );
    executeContext.putEngineLayerId(layerId, result);
    return result;
  }

  @override
  int get tag => 3;
  @override
  void toBytesWithoutTag(ContextBytesWriter writer) => toBytesSceneBuilderPushClipRRectRecord(writer, this);
  @override
  SceneBuilder_PushClipRRect_Record temporaryClone() {
    return SceneBuilder_PushClipRRect_Record(
      rrect: rrect,
      clipBehavior: clipBehavior,
      layerId: layerId,
    );
  }
}

class SceneBuilder_PushClipPath_Record extends SceneBuilder_RecordBase<ClipPathEngineLayer> {
  SceneBuilder_PushClipPath_Record({
    required this.path,
    required this.clipBehavior,
    required this.layerId,
  });

  factory SceneBuilder_PushClipPath_Record.fromBytes(ContextBytesReader reader) =>
      fromBytesSceneBuilderPushClipPathRecord(reader);

  final Path path;

  final Clip clipBehavior;

  final int layerId;

  @override
  ClipPathEngineLayer execute(
    SceneBuilder proxy,
    SceneBuilder_RecordExecuteContext executeContext,
  ) {
    final result = proxy.pushClipPath(
      path,
      clipBehavior: clipBehavior,
    );
    executeContext.putEngineLayerId(layerId, result);
    return result;
  }

  @override
  int get tag => 4;
  @override
  void toBytesWithoutTag(ContextBytesWriter writer) => toBytesSceneBuilderPushClipPathRecord(writer, this);
  @override
  SceneBuilder_PushClipPath_Record temporaryClone() {
    return SceneBuilder_PushClipPath_Record(
      path: path.temporaryClone(),
      clipBehavior: clipBehavior,
      layerId: layerId,
    );
  }
}

class SceneBuilder_PushOpacity_Record extends SceneBuilder_RecordBase<OpacityEngineLayer> {
  SceneBuilder_PushOpacity_Record({
    required this.alpha,
    required this.offset,
    required this.layerId,
  });

  factory SceneBuilder_PushOpacity_Record.fromBytes(ContextBytesReader reader) =>
      fromBytesSceneBuilderPushOpacityRecord(reader);

  final int alpha;

  final Offset? offset;

  final int layerId;

  @override
  OpacityEngineLayer execute(
    SceneBuilder proxy,
    SceneBuilder_RecordExecuteContext executeContext,
  ) {
    final result = proxy.pushOpacity(
      alpha,
      offset: offset,
    );
    executeContext.putEngineLayerId(layerId, result);
    return result;
  }

  @override
  int get tag => 5;
  @override
  void toBytesWithoutTag(ContextBytesWriter writer) => toBytesSceneBuilderPushOpacityRecord(writer, this);
  @override
  SceneBuilder_PushOpacity_Record temporaryClone() {
    return SceneBuilder_PushOpacity_Record(
      alpha: alpha,
      offset: offset,
      layerId: layerId,
    );
  }
}

class SceneBuilder_PushColorFilter_Record extends SceneBuilder_RecordBase<ColorFilterEngineLayer> {
  SceneBuilder_PushColorFilter_Record({
    required this.filter,
    required this.layerId,
  });

  factory SceneBuilder_PushColorFilter_Record.fromBytes(ContextBytesReader reader) =>
      fromBytesSceneBuilderPushColorFilterRecord(reader);

  final ColorFilter filter;

  final int layerId;

  @override
  ColorFilterEngineLayer execute(
    SceneBuilder proxy,
    SceneBuilder_RecordExecuteContext executeContext,
  ) {
    final result = proxy.pushColorFilter(filter);
    executeContext.putEngineLayerId(layerId, result);
    return result;
  }

  @override
  int get tag => 6;
  @override
  void toBytesWithoutTag(ContextBytesWriter writer) => toBytesSceneBuilderPushColorFilterRecord(writer, this);
  @override
  SceneBuilder_PushColorFilter_Record temporaryClone() {
    return SceneBuilder_PushColorFilter_Record(
      filter: filter,
      layerId: layerId,
    );
  }
}

class SceneBuilder_PushImageFilter_Record extends SceneBuilder_RecordBase<ImageFilterEngineLayer> {
  SceneBuilder_PushImageFilter_Record({
    required this.filter,
    required this.offset,
    required this.layerId,
  });

  factory SceneBuilder_PushImageFilter_Record.fromBytes(ContextBytesReader reader) =>
      fromBytesSceneBuilderPushImageFilterRecord(reader);

  final ImageFilter filter;

  final Offset offset;

  final int layerId;

  @override
  ImageFilterEngineLayer execute(
    SceneBuilder proxy,
    SceneBuilder_RecordExecuteContext executeContext,
  ) {
    final result = proxy.pushImageFilter(
      filter,
      offset: offset,
    );
    executeContext.putEngineLayerId(layerId, result);
    return result;
  }

  @override
  int get tag => 7;
  @override
  void toBytesWithoutTag(ContextBytesWriter writer) => toBytesSceneBuilderPushImageFilterRecord(writer, this);
  @override
  SceneBuilder_PushImageFilter_Record temporaryClone() {
    return SceneBuilder_PushImageFilter_Record(
      filter: filter,
      offset: offset,
      layerId: layerId,
    );
  }
}

class SceneBuilder_PushBackdropFilter_Record extends SceneBuilder_RecordBase<BackdropFilterEngineLayer> {
  SceneBuilder_PushBackdropFilter_Record({
    required this.filter,
    required this.blendMode,
    required this.layerId,
  });

  factory SceneBuilder_PushBackdropFilter_Record.fromBytes(ContextBytesReader reader) =>
      fromBytesSceneBuilderPushBackdropFilterRecord(reader);

  final ImageFilter filter;

  final BlendMode blendMode;

  final int layerId;

  @override
  BackdropFilterEngineLayer execute(
    SceneBuilder proxy,
    SceneBuilder_RecordExecuteContext executeContext,
  ) {
    final result = proxy.pushBackdropFilter(
      filter,
      blendMode: blendMode,
    );
    executeContext.putEngineLayerId(layerId, result);
    return result;
  }

  @override
  int get tag => 8;
  @override
  void toBytesWithoutTag(ContextBytesWriter writer) => toBytesSceneBuilderPushBackdropFilterRecord(writer, this);
  @override
  SceneBuilder_PushBackdropFilter_Record temporaryClone() {
    return SceneBuilder_PushBackdropFilter_Record(
      filter: filter,
      blendMode: blendMode,
      layerId: layerId,
    );
  }
}

class SceneBuilder_PushShaderMask_Record extends SceneBuilder_RecordBase<ShaderMaskEngineLayer> {
  SceneBuilder_PushShaderMask_Record({
    required this.shader,
    required this.maskRect,
    required this.blendMode,
    required this.filterQuality,
    required this.layerId,
  });

  factory SceneBuilder_PushShaderMask_Record.fromBytes(ContextBytesReader reader) =>
      fromBytesSceneBuilderPushShaderMaskRecord(reader);

  final Shader shader;

  final Rect maskRect;

  final BlendMode blendMode;

  final FilterQuality filterQuality;

  final int layerId;

  @override
  ShaderMaskEngineLayer execute(
    SceneBuilder proxy,
    SceneBuilder_RecordExecuteContext executeContext,
  ) {
    final result = proxy.pushShaderMask(
      shader,
      maskRect,
      blendMode,
      filterQuality: filterQuality,
    );
    executeContext.putEngineLayerId(layerId, result);
    return result;
  }

  @override
  int get tag => 9;
  @override
  void toBytesWithoutTag(ContextBytesWriter writer) => toBytesSceneBuilderPushShaderMaskRecord(writer, this);
  @override
  SceneBuilder_PushShaderMask_Record temporaryClone() {
    return SceneBuilder_PushShaderMask_Record(
      shader: shader,
      maskRect: maskRect,
      blendMode: blendMode,
      filterQuality: filterQuality,
      layerId: layerId,
    );
  }
}

class SceneBuilder_Pop_Record extends SceneBuilder_RecordBase<void> {
  SceneBuilder_Pop_Record();

  factory SceneBuilder_Pop_Record.fromBytes(ContextBytesReader reader) => fromBytesSceneBuilderPopRecord(reader);

  @override
  void execute(
    SceneBuilder proxy,
    SceneBuilder_RecordExecuteContext executeContext,
  ) {
    final result = proxy.pop();
    return result;
  }

  @override
  int get tag => 10;
  @override
  void toBytesWithoutTag(ContextBytesWriter writer) => toBytesSceneBuilderPopRecord(writer, this);
  @override
  SceneBuilder_Pop_Record temporaryClone() {
    return SceneBuilder_Pop_Record();
  }
}

class SceneBuilder_AddRetained_Record extends SceneBuilder_RecordBase<void> {
  SceneBuilder_AddRetained_Record({required this.retainedLayerId});

  factory SceneBuilder_AddRetained_Record.fromBytes(ContextBytesReader reader) =>
      fromBytesSceneBuilderAddRetainedRecord(reader);

  final int retainedLayerId;

  @override
  void execute(
    SceneBuilder proxy,
    SceneBuilder_RecordExecuteContext executeContext,
  ) {
    final result = proxy.addRetained(executeContext.getEngineLayerById(retainedLayerId));
    executeContext.putRetainedEngineLayerId(retainedLayerId);
    return result;
  }

  @override
  int get tag => 11;
  @override
  void toBytesWithoutTag(ContextBytesWriter writer) => toBytesSceneBuilderAddRetainedRecord(writer, this);
  @override
  SceneBuilder_AddRetained_Record temporaryClone() {
    return SceneBuilder_AddRetained_Record(retainedLayerId: retainedLayerId);
  }
}

class SceneBuilder_AddPerformanceOverlay_Record extends SceneBuilder_RecordBase<void> {
  SceneBuilder_AddPerformanceOverlay_Record({
    required this.enabledOptions,
    required this.bounds,
  });

  factory SceneBuilder_AddPerformanceOverlay_Record.fromBytes(ContextBytesReader reader) =>
      fromBytesSceneBuilderAddPerformanceOverlayRecord(reader);

  final int enabledOptions;

  final Rect bounds;

  @override
  void execute(
    SceneBuilder proxy,
    SceneBuilder_RecordExecuteContext executeContext,
  ) {
    final result = proxy.addPerformanceOverlay(
      enabledOptions,
      bounds,
    );
    return result;
  }

  @override
  int get tag => 12;
  @override
  void toBytesWithoutTag(ContextBytesWriter writer) => toBytesSceneBuilderAddPerformanceOverlayRecord(writer, this);
  @override
  SceneBuilder_AddPerformanceOverlay_Record temporaryClone() {
    return SceneBuilder_AddPerformanceOverlay_Record(
      enabledOptions: enabledOptions,
      bounds: bounds,
    );
  }
}

class SceneBuilder_AddPicture_Record extends SceneBuilder_RecordBase<void> {
  SceneBuilder_AddPicture_Record({
    required this.offset,
    required this.picture,
    required this.isComplexHint,
    required this.willChangeHint,
  });

  factory SceneBuilder_AddPicture_Record.fromBytes(ContextBytesReader reader) =>
      fromBytesSceneBuilderAddPictureRecord(reader);

  final Offset offset;

  final Picture picture;

  final bool isComplexHint;

  final bool willChangeHint;

  @override
  void execute(
    SceneBuilder proxy,
    SceneBuilder_RecordExecuteContext executeContext,
  ) {
    final result = proxy.addPicture(
      offset,
      picture,
      isComplexHint: isComplexHint,
      willChangeHint: willChangeHint,
    );
    return result;
  }

  @override
  int get tag => 13;
  @override
  void toBytesWithoutTag(ContextBytesWriter writer) => toBytesSceneBuilderAddPictureRecord(writer, this);
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

class SceneBuilder_AddTexture_Record extends SceneBuilder_RecordBase<void> {
  SceneBuilder_AddTexture_Record({
    required this.textureId,
    required this.offset,
    required this.width,
    required this.height,
    required this.freeze,
    required this.filterQuality,
  });

  factory SceneBuilder_AddTexture_Record.fromBytes(ContextBytesReader reader) =>
      fromBytesSceneBuilderAddTextureRecord(reader);

  final int textureId;

  final Offset offset;

  final double width;

  final double height;

  final bool freeze;

  final FilterQuality filterQuality;

  @override
  void execute(
    SceneBuilder proxy,
    SceneBuilder_RecordExecuteContext executeContext,
  ) {
    final result = proxy.addTexture(
      textureId,
      offset: offset,
      width: width,
      height: height,
      freeze: freeze,
      filterQuality: filterQuality,
    );
    return result;
  }

  @override
  int get tag => 14;
  @override
  void toBytesWithoutTag(ContextBytesWriter writer) => toBytesSceneBuilderAddTextureRecord(writer, this);
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

class SceneBuilder_AddPlatformView_Record extends SceneBuilder_RecordBase<void> {
  SceneBuilder_AddPlatformView_Record({
    required this.viewId,
    required this.offset,
    required this.width,
    required this.height,
  });

  factory SceneBuilder_AddPlatformView_Record.fromBytes(ContextBytesReader reader) =>
      fromBytesSceneBuilderAddPlatformViewRecord(reader);

  final int viewId;

  final Offset offset;

  final double width;

  final double height;

  @override
  void execute(
    SceneBuilder proxy,
    SceneBuilder_RecordExecuteContext executeContext,
  ) {
    final result = proxy.addPlatformView(
      viewId,
      offset: offset,
      width: width,
      height: height,
    );
    return result;
  }

  @override
  int get tag => 15;
  @override
  void toBytesWithoutTag(ContextBytesWriter writer) => toBytesSceneBuilderAddPlatformViewRecord(writer, this);
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
