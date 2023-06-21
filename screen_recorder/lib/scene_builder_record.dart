import 'dart:typed_data';
import 'dart:ui';

class SceneBuilderData {
  final items = <SceneBuilderDataItem>[];
}

sealed class SceneBuilderDataItem {
  void execute(SceneBuilder builder);
}

class SBDAddPerformanceOverlay implements SceneBuilderDataItem {
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

class SBDAddPicture implements SceneBuilderDataItem {
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

class SBDAddPlatformView implements SceneBuilderDataItem {
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

class SBDAddTexture implements SceneBuilderDataItem {
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

class SBDPushBackdropFilter implements SceneBuilderDataItem {
  final ImageFilter filter;
  final BlendMode blendMode;

  const SBDPushBackdropFilter({
    required this.filter,
    required this.blendMode,
  });

  @override
  void execute(SceneBuilder builder) {
    builder.pushBackdropFilter(
      filter,
      blendMode: blendMode,
    );
  }
}

class SBDPushClipPath implements SceneBuilderDataItem {
  final Path path;
  final Clip clipBehavior;

  const SBDPushClipPath({
    required this.path,
    required this.clipBehavior,
  });

  @override
  void execute(SceneBuilder builder) {
    builder.pushClipPath(
      path,
      clipBehavior: clipBehavior,
    );
  }
}

class SBDPushClipRRect implements SceneBuilderDataItem {
  final RRect rrect;
  final Clip clipBehavior;

  const SBDPushClipRRect({
    required this.rrect,
    required this.clipBehavior,
  });

  @override
  void execute(SceneBuilder builder) {
    builder.pushClipRRect(
      rrect,
      clipBehavior: clipBehavior,
    );
  }
}

class SBDPushClipRect implements SceneBuilderDataItem {
  final Rect rect;
  final Clip clipBehavior;

  const SBDPushClipRect({
    required this.rect,
    required this.clipBehavior,
  });

  @override
  void execute(SceneBuilder builder) {
    builder.pushClipRect(
      rect,
      clipBehavior: clipBehavior,
    );
  }
}

class SBDPushColorFilter implements SceneBuilderDataItem {
  final ColorFilter filter;

  SBDPushColorFilter({
    required this.filter,
  });

  @override
  void execute(SceneBuilder builder) {
    builder.pushColorFilter(
      filter,
    );
  }
}

class SBDPushImageFilter implements SceneBuilderDataItem {
  final ImageFilter filter;
  final Offset offset;

  SBDPushImageFilter({
    required this.filter,
    required this.offset,
  });

  @override
  void execute(SceneBuilder builder) {
    builder.pushImageFilter(
      filter,
      offset: offset,
    );
  }
}

class SBDPushOffset implements SceneBuilderDataItem {
  final double dx;
  final double dy;

  SBDPushOffset({
    required this.dx,
    required this.dy,
  });

  @override
  void execute(SceneBuilder builder) {
    builder.pushOffset(
      dx,
      dy,
    );
  }
}

class SBDPushOpacity implements SceneBuilderDataItem {
  final int alpha;
  final Offset? offset;

  SBDPushOpacity({
    required this.alpha,
    required this.offset,
  });

  @override
  void execute(SceneBuilder builder) {
    builder.pushOpacity(
      alpha,
      offset: offset,
    );
  }
}

class SBDPushPhysicalShape implements SceneBuilderDataItem {
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
  void execute(SceneBuilder builder) {
    builder.pushPhysicalShape(
      path: path,
      elevation: elevation,
      color: color,
      shadowColor: shadowColor,
      clipBehavior: clipBehavior,
    );
  }
}

class SBDPushShaderMask implements SceneBuilderDataItem {
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
  void execute(SceneBuilder builder) {
    builder.pushShaderMask(
      shader,
      maskRect,
      blendMode,
      filterQuality: filterQuality,
    );
  }
}

class SBDPushTransform implements SceneBuilderDataItem {
  final Float64List matrix4;

  const SBDPushTransform({
    required this.matrix4,
  });

  @override
  void execute(SceneBuilder builder) {
    builder.pushTransform(
      matrix4,
    );
  }
}
