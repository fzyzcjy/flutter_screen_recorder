// ignore_for_file: unused_import, camel_case_types

import 'dart:typed_data';
import 'dart:ui';

class SceneBuilder_PushTransform_Record {
  SceneBuilder_PushTransform_Record({required this.matrix4});

  final Float64List matrix4;

  TransformEngineLayer execute(SceneBuilder proxy) {
    return proxy.pushTransform(matrix4);
  }
}

class SceneBuilder_PushOffset_Record {
  SceneBuilder_PushOffset_Record({
    required this.dx,
    required this.dy,
  });

  final double dx;

  final double dy;

  OffsetEngineLayer execute(SceneBuilder proxy) {
    return proxy.pushOffset(
      dx,
      dy,
    );
  }
}

class SceneBuilder_PushClipRect_Record {
  SceneBuilder_PushClipRect_Record({
    required this.rect,
    required this.clipBehavior,
  });

  final Rect rect;

  final Clip clipBehavior;

  ClipRectEngineLayer execute(SceneBuilder proxy) {
    return proxy.pushClipRect(
      rect,
      clipBehavior: clipBehavior,
    );
  }
}

class SceneBuilder_PushClipRRect_Record {
  SceneBuilder_PushClipRRect_Record({
    required this.rrect,
    required this.clipBehavior,
  });

  final RRect rrect;

  final Clip clipBehavior;

  ClipRRectEngineLayer execute(SceneBuilder proxy) {
    return proxy.pushClipRRect(
      rrect,
      clipBehavior: clipBehavior,
    );
  }
}

class SceneBuilder_PushClipPath_Record {
  SceneBuilder_PushClipPath_Record({
    required this.path,
    required this.clipBehavior,
  });

  final Path path;

  final Clip clipBehavior;

  ClipPathEngineLayer execute(SceneBuilder proxy) {
    return proxy.pushClipPath(
      path,
      clipBehavior: clipBehavior,
    );
  }
}

class SceneBuilder_PushOpacity_Record {
  SceneBuilder_PushOpacity_Record({
    required this.alpha,
    required this.offset,
  });

  final int alpha;

  final Offset? offset;

  OpacityEngineLayer execute(SceneBuilder proxy) {
    return proxy.pushOpacity(
      alpha,
      offset: offset,
    );
  }
}

class SceneBuilder_PushColorFilter_Record {
  SceneBuilder_PushColorFilter_Record({required this.filter});

  final ColorFilter filter;

  ColorFilterEngineLayer execute(SceneBuilder proxy) {
    return proxy.pushColorFilter(filter);
  }
}

class SceneBuilder_PushImageFilter_Record {
  SceneBuilder_PushImageFilter_Record({
    required this.filter,
    required this.offset,
  });

  final ImageFilter filter;

  final Offset offset;

  ImageFilterEngineLayer execute(SceneBuilder proxy) {
    return proxy.pushImageFilter(
      filter,
      offset: offset,
    );
  }
}

class SceneBuilder_PushBackdropFilter_Record {
  SceneBuilder_PushBackdropFilter_Record({
    required this.filter,
    required this.blendMode,
  });

  final ImageFilter filter;

  final BlendMode blendMode;

  BackdropFilterEngineLayer execute(SceneBuilder proxy) {
    return proxy.pushBackdropFilter(
      filter,
      blendMode: blendMode,
    );
  }
}

class SceneBuilder_PushShaderMask_Record {
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

  ShaderMaskEngineLayer execute(SceneBuilder proxy) {
    return proxy.pushShaderMask(
      shader,
      maskRect,
      blendMode,
      filterQuality: filterQuality,
    );
  }
}

class SceneBuilder_Pop_Record {
  SceneBuilder_Pop_Record();

  void execute(SceneBuilder proxy) {
    return proxy.pop();
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
