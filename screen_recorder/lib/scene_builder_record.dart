import 'dart:typed_data';
import 'dart:ui';

class SceneBuilderData {
  final items = <SceneBuilderDataItem>[];
}

sealed class SceneBuilderDataItem {
  void execute(SceneBuilder builder);
}

abstract class SceneBuilderDataAddItem extends SceneBuilderDataItem {}

abstract class SceneBuilderDataPushItem<L extends EngineLayer> extends SceneBuilderDataItem {
  @override
  L execute(SceneBuilder builder, {L? oldLayer});
}

class SBDAddPerformanceOverlay implements SceneBuilderDataAddItem {
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

class SBDAddPicture implements SceneBuilderDataAddItem {
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

class SBDAddPlatformView implements SceneBuilderDataAddItem {
  final int viewId;
  final Offset offset;
  final double width;
  final double height;

  SBDAddPlatformView({
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

class SBDAddTexture implements SceneBuilderDataAddItem {
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

class SBDPushBackdropFilter implements SceneBuilderDataPushItem<BackdropFilterEngineLayer> {
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

class SBDPushClipPath implements SceneBuilderDataPushItem<ClipPathEngineLayer> {
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

class SBDPushClipRRect implements SceneBuilderDataPushItem<ClipRRectEngineLayer> {
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

class SBDPushClipRect implements SceneBuilderDataPushItem<ClipRectEngineLayer> {
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

class SBDPushColorFilter implements SceneBuilderDataPushItem<ColorFilterEngineLayer> {
  final ColorFilter filter;

  SBDPushColorFilter({
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

class SBDPushImageFilter implements SceneBuilderDataPushItem<ImageFilterEngineLayer> {
  final ImageFilter filter;
  final Offset offset;

  SBDPushImageFilter({
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

class SBDPushOffset implements SceneBuilderDataPushItem<OffsetEngineLayer> {
  final double dx;
  final double dy;

  SBDPushOffset({
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

class SBDPushOpacity implements SceneBuilderDataPushItem<OpacityEngineLayer> {
  final int alpha;
  final Offset? offset;

  SBDPushOpacity({
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

class SBDPushPhysicalShape implements SceneBuilderDataPushItem<PhysicalShapeEngineLayer> {
  final Path path;
  final double elevation;
  final Color color;
  final Color? shadowColor;
  final Clip clipBehavior;

  SBDPushPhysicalShape({
    required this.path,
    required this.elevation,
    required this.color,
    required this.shadowColor,
    required this.clipBehavior,
  });

  @override
  PhysicalShapeEngineLayer execute(SceneBuilder builder, {PhysicalShapeEngineLayer? oldLayer}) {
    // ignore: deprecated_member_use
    return builder.pushPhysicalShape(
      path: path,
      elevation: elevation,
      color: color,
      shadowColor: shadowColor,
      clipBehavior: clipBehavior,
      oldLayer: oldLayer,
    );
  }
}

class SBDPushShaderMask implements SceneBuilderDataPushItem<ShaderMaskEngineLayer> {
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

class SBDPushTransform implements SceneBuilderDataPushItem<TransformEngineLayer> {
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
