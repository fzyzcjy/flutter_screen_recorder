import 'dart:typed_data';
import 'dart:ui';

class SceneBuilderData {
  final items = <SceneBuilderDataItem>[];
}

sealed class SceneBuilderDataItem {}

class SBDAddPerformanceOverlay implements SceneBuilderDataItem {
  final int enabledOptions;
  final Rect bounds;

  const SBDAddPerformanceOverlay({
    required this.enabledOptions,
    required this.bounds,
  });
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
}

class SBDPushBackdropFilter implements SceneBuilderDataItem {
  final BlendMode blendMode;

  const SBDPushBackdropFilter({required this.blendMode});
}

class SBDPushClipPath implements SceneBuilderDataItem {
  final Path path;
  final Clip clipBehavior;

  const SBDPushClipPath({required this.path, required this.clipBehavior});
}

class SBDPushClipRRect implements SceneBuilderDataItem {
  final RRect rrect;
  final Clip clipBehavior;

  const SBDPushClipRRect({required this.rrect, required this.clipBehavior});
}

class SBDPushClipRect implements SceneBuilderDataItem {
  final Rect rect;
  final Clip clipBehavior;

  const SBDPushClipRect({required this.rect, required this.clipBehavior});
}

class SBDPushColorFilter implements SceneBuilderDataItem {
  final ColorFilter filter;

  SBDPushColorFilter({required this.filter});
}

class SBDPushImageFilter implements SceneBuilderDataItem {
  final ImageFilter filter;
  final Offset offset;

  SBDPushImageFilter({required this.filter, required this.offset});
}

class SBDPushOffset implements SceneBuilderDataItem {
  final double dx;
  final double dy;

  SBDPushOffset({required this.dx, required this.dy});
}

class SBDPushOpacity implements SceneBuilderDataItem {
  final int alpha;
  final Offset? offset;

  SBDPushOpacity({required this.alpha, required this.offset});
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
}

class SBDPushTransform implements SceneBuilderDataItem {
  final Float64List matrix4;

  const SBDPushTransform({
    required this.matrix4,
  });
}
