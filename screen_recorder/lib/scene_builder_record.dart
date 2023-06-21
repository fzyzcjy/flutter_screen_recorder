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

abstract class SceneBuilderDataAddItem implements SceneBuilderDataItem {}

abstract class SceneBuilderDataPushItem<L extends EngineLayer> implements SceneBuilderDataItem {
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
  SBDAddPerformanceOverlay safeClone() => SBDAddPerformanceOverlay(
        enabledOptions: enabledOptions,
        bounds: bounds,
      );

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
  SBDAddPicture safeClone() => SBDAddPicture(
        offset: offset,
        picture: picture,
        isComplexHint: isComplexHint,
        willChangeHint: willChangeHint,
      );

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

  const SBDAddPlatformView({
    required this.viewId,
    required this.offset,
    required this.width,
    required this.height,
  });

  @override
  SBDAddPlatformView safeClone() => SBDAddPlatformView(
        viewId: viewId,
        offset: offset,
        width: width,
        height: height,
      );

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
  SBDAddTexture safeClone() => SBDAddTexture(
        textureId: textureId,
        offset: offset,
        width: width,
        height: height,
        freeze: freeze,
        filterQuality: filterQuality,
      );

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
  SBDPushBackdropFilter safeClone() => SBDPushBackdropFilter(
        filter: filter,
        blendMode: blendMode,
      );

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
  SBDPushClipPath safeClone() => SBDPushClipPath(
        path: path,
        clipBehavior: clipBehavior,
      );

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
  SBDPushClipRRect safeClone() => SBDPushClipRRect(
        rrect: rrect,
        clipBehavior: clipBehavior,
      );

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
  SBDPushClipRect safeClone() => SBDPushClipRect(
        rect: rect,
        clipBehavior: clipBehavior,
      );

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

  const SBDPushColorFilter({
    required this.filter,
  });

  @override
  SBDPushColorFilter safeClone() => SBDPushColorFilter(
        filter: filter,
      );

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

  const SBDPushImageFilter({
    required this.filter,
    required this.offset,
  });

  @override
  SBDPushImageFilter safeClone() => SBDPushImageFilter(
        filter: filter,
        offset: offset,
      );

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

  const SBDPushOffset({
    required this.dx,
    required this.dy,
  });

  @override
  SBDPushOffset safeClone() => SBDPushOffset(
        dx: dx,
        dy: dy,
      );

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

  const SBDPushOpacity({
    required this.alpha,
    required this.offset,
  });

  @override
  SBDPushOpacity safeClone() => SBDPushOpacity(
        alpha: alpha,
        offset: offset,
      );

  @override
  OpacityEngineLayer execute(SceneBuilder builder, {OpacityEngineLayer? oldLayer}) {
    return builder.pushOpacity(
      alpha,
      offset: offset,
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
  SBDPushShaderMask safeClone() => SBDPushShaderMask(
        shader: shader,
        maskRect: maskRect,
        blendMode: blendMode,
        filterQuality: filterQuality,
      );

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
  SBDPushTransform safeClone() => SBDPushTransform(
        matrix4: matrix4,
      );

  @override
  TransformEngineLayer execute(SceneBuilder builder, {TransformEngineLayer? oldLayer}) {
    return builder.pushTransform(
      matrix4,
      oldLayer: oldLayer,
    );
  }
}
