// ignore_for_file: unused_import, camel_case_types

import 'dart:typed_data';
import 'dart:ui';

class SceneBuilder_PushTransform_Record {
  SceneBuilder_PushTransform_Record({
    required this.matrix4,
    required this.oldLayer,
  });

  final Float64List matrix4;

  final TransformEngineLayer? oldLayer;

  TransformEngineLayer execute(SceneBuilder proxy) {
    return proxy.pushTransform(
      matrix4,
      oldLayer: oldLayer,
    );
  }
}

class SceneBuilder_PushOffset_Record {
  SceneBuilder_PushOffset_Record({
    required this.dx,
    required this.dy,
    required this.oldLayer,
  });

  final double dx;

  final double dy;

  final OffsetEngineLayer? oldLayer;

  OffsetEngineLayer execute(SceneBuilder proxy) {
    return proxy.pushOffset(
      dx,
      dy,
      oldLayer: oldLayer,
    );
  }
}

class SceneBuilder_PushClipRect_Record {
  SceneBuilder_PushClipRect_Record({
    required this.rect,
    required this.clipBehavior,
    required this.oldLayer,
  });

  final Rect rect;

  final Clip clipBehavior;

  final ClipRectEngineLayer? oldLayer;

  ClipRectEngineLayer execute(SceneBuilder proxy) {
    return proxy.pushClipRect(
      rect,
      clipBehavior: clipBehavior,
      oldLayer: oldLayer,
    );
  }
}

class SceneBuilder_PushClipRRect_Record {
  SceneBuilder_PushClipRRect_Record({
    required this.rrect,
    required this.clipBehavior,
    required this.oldLayer,
  });

  final RRect rrect;

  final Clip clipBehavior;

  final ClipRRectEngineLayer? oldLayer;

  ClipRRectEngineLayer execute(SceneBuilder proxy) {
    return proxy.pushClipRRect(
      rrect,
      clipBehavior: clipBehavior,
      oldLayer: oldLayer,
    );
  }
}

class SceneBuilder_PushClipPath_Record {
  SceneBuilder_PushClipPath_Record({
    required this.path,
    required this.clipBehavior,
    required this.oldLayer,
  });

  final Path path;

  final Clip clipBehavior;

  final ClipPathEngineLayer? oldLayer;

  ClipPathEngineLayer execute(SceneBuilder proxy) {
    return proxy.pushClipPath(
      path,
      clipBehavior: clipBehavior,
      oldLayer: oldLayer,
    );
  }
}

class SceneBuilder_PushOpacity_Record {
  SceneBuilder_PushOpacity_Record({
    required this.alpha,
    required this.offset,
    required this.oldLayer,
  });

  final int alpha;

  final Offset? offset;

  final OpacityEngineLayer? oldLayer;

  OpacityEngineLayer execute(SceneBuilder proxy) {
    return proxy.pushOpacity(
      alpha,
      offset: offset,
      oldLayer: oldLayer,
    );
  }
}

class SceneBuilder_PushColorFilter_Record {
  SceneBuilder_PushColorFilter_Record({
    required this.filter,
    required this.oldLayer,
  });

  final ColorFilter filter;

  final ColorFilterEngineLayer? oldLayer;

  ColorFilterEngineLayer execute(SceneBuilder proxy) {
    return proxy.pushColorFilter(
      filter,
      oldLayer: oldLayer,
    );
  }
}

class SceneBuilder_PushImageFilter_Record {
  SceneBuilder_PushImageFilter_Record({
    required this.filter,
    required this.offset,
    required this.oldLayer,
  });

  final ImageFilter filter;

  final Offset offset;

  final ImageFilterEngineLayer? oldLayer;

  ImageFilterEngineLayer execute(SceneBuilder proxy) {
    return proxy.pushImageFilter(
      filter,
      offset: offset,
      oldLayer: oldLayer,
    );
  }
}

class SceneBuilder_PushBackdropFilter_Record {
  SceneBuilder_PushBackdropFilter_Record({
    required this.filter,
    required this.blendMode,
    required this.oldLayer,
  });

  final ImageFilter filter;

  final BlendMode blendMode;

  final BackdropFilterEngineLayer? oldLayer;

  BackdropFilterEngineLayer execute(SceneBuilder proxy) {
    return proxy.pushBackdropFilter(
      filter,
      blendMode: blendMode,
      oldLayer: oldLayer,
    );
  }
}

class SceneBuilder_PushShaderMask_Record {
  SceneBuilder_PushShaderMask_Record({
    required this.shader,
    required this.maskRect,
    required this.blendMode,
    required this.filterQuality,
    required this.oldLayer,
  });

  final Shader shader;

  final Rect maskRect;

  final BlendMode blendMode;

  final FilterQuality filterQuality;

  final ShaderMaskEngineLayer? oldLayer;

  ShaderMaskEngineLayer execute(SceneBuilder proxy) {
    return proxy.pushShaderMask(
      shader,
      maskRect,
      blendMode,
      filterQuality: filterQuality,
      oldLayer: oldLayer,
    );
  }
}

class SceneBuilder_Pop_Record {
  SceneBuilder_Pop_Record();

  void execute(SceneBuilder proxy) {
    return proxy.pop();
  }
}

class SceneBuilder_AddRetained_Record {
  SceneBuilder_AddRetained_Record({required this.retainedLayer});

  final EngineLayer retainedLayer;

  void execute(SceneBuilder proxy) {
    return proxy.addRetained(retainedLayer);
  }
}

class SceneBuilder_AddPerformanceOverlay_Record {
  SceneBuilder_AddPerformanceOverlay_Record({
    required this.enabledOptions,
    required this.bounds,
  });

  final int enabledOptions;

  final Rect bounds;

  void execute(SceneBuilder proxy) {
    return proxy.addPerformanceOverlay(
      enabledOptions,
      bounds,
    );
  }
}

class SceneBuilder_AddPicture_Record {
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

  void execute(SceneBuilder proxy) {
    return proxy.addPicture(
      offset,
      picture,
      isComplexHint: isComplexHint,
      willChangeHint: willChangeHint,
    );
  }
}

class SceneBuilder_AddTexture_Record {
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
}

class SceneBuilder_AddPlatformView_Record {
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

  void execute(SceneBuilder proxy) {
    return proxy.addPlatformView(
      viewId,
      offset: offset,
      width: width,
      height: height,
    );
  }
}

class SceneBuilder_SetRasterizerTracingThreshold_Record {
  SceneBuilder_SetRasterizerTracingThreshold_Record({required this.frameInterval});

  final int frameInterval;

  void execute(SceneBuilder proxy) {
    return proxy.setRasterizerTracingThreshold(frameInterval);
  }
}

class SceneBuilder_SetCheckerboardRasterCacheImages_Record {
  SceneBuilder_SetCheckerboardRasterCacheImages_Record({required this.checkerboard});

  final bool checkerboard;

  void execute(SceneBuilder proxy) {
    return proxy.setCheckerboardRasterCacheImages(checkerboard);
  }
}

class SceneBuilder_SetCheckerboardOffscreenLayers_Record {
  SceneBuilder_SetCheckerboardOffscreenLayers_Record({required this.checkerboard});

  final bool checkerboard;

  void execute(SceneBuilder proxy) {
    return proxy.setCheckerboardOffscreenLayers(checkerboard);
  }
}

class SceneBuilder_Build_Record {
  SceneBuilder_Build_Record();

  Scene execute(SceneBuilder proxy) {
    return proxy.build();
  }
}
