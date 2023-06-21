import 'dart:ui';

import 'package:flutter/foundation.dart';

class SceneBuilderData {
  final items = <SceneBuilderDataItem>[];
}

@immutable
sealed class SceneBuilderDataItem {
  void execute(SceneBuilder builder);

  // TODO will be replaced by serialize/deserialize
  void safeClone();
}

abstract class SceneBuilderDataAddItem extends SceneBuilderDataItem {}

abstract class SceneBuilderDataPushItem<L extends EngineLayer> extends SceneBuilderDataItem {
  @override
  L execute(SceneBuilder builder, {L? oldLayer});
}

class SBDAddPerformanceOverlay extends SceneBuilderDataAddItem {
  final int enabledOptions;
  final Rect bounds;

  const SBDAddPerformanceOverlay({
    required this.enabledOptions,
    required this.bounds,
  });

  @override
  void execute(SceneBuilder builder) {
    builder.addPerformanceOverlay(
      enabledOptions,
      bounds,
    );
  }
}

class SBDAddPicture extends SceneBuilderDataAddItem {
  final Offset offset;
  final Picture picture;
  final bool isComplexHint;
  final bool willChangeHint;

  const SBDAddPicture({
    required this.offset,
    required this.picture,
    required this.isComplexHint,
    required this.willChangeHint,
  });

  @override
  void execute(SceneBuilder builder) {
    builder.addPicture(
      offset,
      picture,
      isComplexHint: isComplexHint,
      willChangeHint: willChangeHint,
    );
  }
}

class SBDAddPlatformView extends SceneBuilderDataAddItem {
  final int viewId;
  final Offset offset;
  final double width;
  final double height;

  const SBDAddPlatformView({
    required this.viewId,
    required this.offset,
    required this.width,
    required this.height,
  });

  @override
  void execute(SceneBuilder builder) {
    builder.addPlatformView(
      viewId,
      offset: offset,
      width: width,
      height: height,
    );
  }
}

class SBDAddTexture extends SceneBuilderDataAddItem {
  final int textureId;
  final Offset offset;
  final double width;
  final double height;
  final bool freeze;
  final FilterQuality filterQuality;

  const SBDAddTexture({
    required this.textureId,
    required this.offset,
    required this.width,
    required this.height,
    required this.freeze,
    required this.filterQuality,
  });

  @override
  void execute(SceneBuilder builder) {
    builder.addTexture(
      textureId,
      offset: offset,
      width: width,
      height: height,
      freeze: freeze,
      filterQuality: filterQuality,
    );
  }
}

class SBDPushBackdropFilter extends SceneBuilderDataPushItem<BackdropFilterEngineLayer> {
  final ImageFilter filter;
  final BlendMode blendMode;

  const SBDPushBackdropFilter({
    required this.filter,
    required this.blendMode,
  });

  @override
  BackdropFilterEngineLayer execute(SceneBuilder builder, {BackdropFilterEngineLayer? oldLayer}) {
    return builder.pushBackdropFilter(
      filter,
      blendMode: blendMode,
      oldLayer: oldLayer,
    );
  }
}

class SBDPushClipPath extends SceneBuilderDataPushItem<ClipPathEngineLayer> {
  final Path path;
  final Clip clipBehavior;

  const SBDPushClipPath({
    required this.path,
    required this.clipBehavior,
  });

  @override
  ClipPathEngineLayer execute(SceneBuilder builder, {ClipPathEngineLayer? oldLayer}) {
    return builder.pushClipPath(
      path,
      clipBehavior: clipBehavior,
      oldLayer: oldLayer,
    );
  }
}

class SBDPushClipRRect extends SceneBuilderDataPushItem<ClipRRectEngineLayer> {
  final RRect rrect;
  final Clip clipBehavior;

  const SBDPushClipRRect({
    required this.rrect,
    required this.clipBehavior,
  });

  @override
  ClipRRectEngineLayer execute(SceneBuilder builder, {ClipRRectEngineLayer? oldLayer}) {
    return builder.pushClipRRect(
      rrect,
      clipBehavior: clipBehavior,
      oldLayer: oldLayer,
    );
  }
}

class SBDPushClipRect extends SceneBuilderDataPushItem<ClipRectEngineLayer> {
  final Rect rect;
  final Clip clipBehavior;

  const SBDPushClipRect({
    required this.rect,
    required this.clipBehavior,
  });

  @override
  ClipRectEngineLayer execute(SceneBuilder builder, {ClipRectEngineLayer? oldLayer}) {
    return builder.pushClipRect(
      rect,
      clipBehavior: clipBehavior,
      oldLayer: oldLayer,
    );
  }
}

class SBDPushColorFilter extends SceneBuilderDataPushItem<ColorFilterEngineLayer> {
  final ColorFilter filter;

  const SBDPushColorFilter({
    required this.filter,
  });

  @override
  ColorFilterEngineLayer execute(SceneBuilder builder, {ColorFilterEngineLayer? oldLayer}) {
    return builder.pushColorFilter(
      filter,
      oldLayer: oldLayer,
    );
  }
}

class SBDPushImageFilter extends SceneBuilderDataPushItem<ImageFilterEngineLayer> {
  final ImageFilter filter;
  final Offset offset;

  const SBDPushImageFilter({
    required this.filter,
    required this.offset,
  });

  @override
  ImageFilterEngineLayer execute(SceneBuilder builder, {ImageFilterEngineLayer? oldLayer}) {
    return builder.pushImageFilter(
      filter,
      offset: offset,
      oldLayer: oldLayer,
    );
  }
}

class SBDPushOffset extends SceneBuilderDataPushItem<OffsetEngineLayer> {
  final double dx;
  final double dy;

  const SBDPushOffset({
    required this.dx,
    required this.dy,
  });

  @override
  OffsetEngineLayer execute(SceneBuilder builder, {OffsetEngineLayer? oldLayer}) {
    return builder.pushOffset(
      dx,
      dy,
      oldLayer: oldLayer,
    );
  }
}

class SBDPushOpacity extends SceneBuilderDataPushItem<OpacityEngineLayer> {
  final int alpha;
  final Offset? offset;

  const SBDPushOpacity({
    required this.alpha,
    required this.offset,
  });

  @override
  OpacityEngineLayer execute(SceneBuilder builder, {OpacityEngineLayer? oldLayer}) {
    return builder.pushOpacity(
      alpha,
      offset: offset,
      oldLayer: oldLayer,
    );
  }
}

class SBDPushShaderMask extends SceneBuilderDataPushItem<ShaderMaskEngineLayer> {
  final Shader shader;
  final Rect maskRect;
  final BlendMode blendMode;
  final FilterQuality filterQuality;

  const SBDPushShaderMask({
    required this.shader,
    required this.maskRect,
    required this.blendMode,
    required this.filterQuality,
  });

  @override
  ShaderMaskEngineLayer execute(SceneBuilder builder, {ShaderMaskEngineLayer? oldLayer}) {
    return builder.pushShaderMask(
      shader,
      maskRect,
      blendMode,
      filterQuality: filterQuality,
      oldLayer: oldLayer,
    );
  }
}

class SBDPushTransform extends SceneBuilderDataPushItem<TransformEngineLayer> {
  final Float64List matrix4;

  const SBDPushTransform({
    required this.matrix4,
  });

  @override
  TransformEngineLayer execute(SceneBuilder builder, {TransformEngineLayer? oldLayer}) {
    return builder.pushTransform(
      matrix4,
      oldLayer: oldLayer,
    );
  }
}
