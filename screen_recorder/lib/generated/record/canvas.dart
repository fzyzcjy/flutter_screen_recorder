// ignore_for_file: unused_import, camel_case_types

import 'dart:typed_data';
import 'dart:ui';

class Canvas_Save_Record {
  Canvas_Save_Record();

  void execute(Canvas proxy) {
    return proxy.save();
  }
}

class Canvas_SaveLayer_Record {
  Canvas_SaveLayer_Record({
    required this.bounds,
    required this.paint,
  });

  final Rect? bounds;

  final Paint paint;

  void execute(Canvas proxy) {
    return proxy.saveLayer(
      bounds,
      paint,
    );
  }
}

class Canvas_Restore_Record {
  Canvas_Restore_Record();

  void execute(Canvas proxy) {
    return proxy.restore();
  }
}

class Canvas_RestoreToCount_Record {
  Canvas_RestoreToCount_Record({required this.count});

  final int count;

  void execute(Canvas proxy) {
    return proxy.restoreToCount(count);
  }
}

class Canvas_Translate_Record {
  Canvas_Translate_Record({
    required this.dx,
    required this.dy,
  });

  final double dx;

  final double dy;

  void execute(Canvas proxy) {
    return proxy.translate(
      dx,
      dy,
    );
  }
}

class Canvas_Scale_Record {
  Canvas_Scale_Record({
    required this.sx,
    required this.sy,
  });

  final double sx;

  final double? sy;

  void execute(Canvas proxy) {
    return proxy.scale(
      sx,
      sy,
    );
  }
}

class Canvas_Rotate_Record {
  Canvas_Rotate_Record({required this.radians});

  final double radians;

  void execute(Canvas proxy) {
    return proxy.rotate(radians);
  }
}

class Canvas_Skew_Record {
  Canvas_Skew_Record({
    required this.sx,
    required this.sy,
  });

  final double sx;

  final double sy;

  void execute(Canvas proxy) {
    return proxy.skew(
      sx,
      sy,
    );
  }
}

class Canvas_Transform_Record {
  Canvas_Transform_Record({required this.matrix4});

  final Float64List matrix4;

  void execute(Canvas proxy) {
    return proxy.transform(matrix4);
  }
}

class Canvas_ClipRect_Record {
  Canvas_ClipRect_Record({
    required this.rect,
    required this.clipOp,
    required this.doAntiAlias,
  });

  final Rect rect;

  final ClipOp clipOp;

  final bool doAntiAlias;

  void execute(Canvas proxy) {
    return proxy.clipRect(
      rect,
      clipOp: clipOp,
      doAntiAlias: doAntiAlias,
    );
  }
}

class Canvas_ClipRRect_Record {
  Canvas_ClipRRect_Record({
    required this.rrect,
    required this.doAntiAlias,
  });

  final RRect rrect;

  final bool doAntiAlias;

  void execute(Canvas proxy) {
    return proxy.clipRRect(
      rrect,
      doAntiAlias: doAntiAlias,
    );
  }
}

class Canvas_ClipPath_Record {
  Canvas_ClipPath_Record({
    required this.path,
    required this.doAntiAlias,
  });

  final Path path;

  final bool doAntiAlias;

  void execute(Canvas proxy) {
    return proxy.clipPath(
      path,
      doAntiAlias: doAntiAlias,
    );
  }
}

class Canvas_DrawColor_Record {
  Canvas_DrawColor_Record({
    required this.color,
    required this.blendMode,
  });

  final Color color;

  final BlendMode blendMode;

  void execute(Canvas proxy) {
    return proxy.drawColor(
      color,
      blendMode,
    );
  }
}

class Canvas_DrawLine_Record {
  Canvas_DrawLine_Record({
    required this.p1,
    required this.p2,
    required this.paint,
  });

  final Offset p1;

  final Offset p2;

  final Paint paint;

  void execute(Canvas proxy) {
    return proxy.drawLine(
      p1,
      p2,
      paint,
    );
  }
}

class Canvas_DrawPaint_Record {
  Canvas_DrawPaint_Record({required this.paint});

  final Paint paint;

  void execute(Canvas proxy) {
    return proxy.drawPaint(paint);
  }
}

class Canvas_DrawRect_Record {
  Canvas_DrawRect_Record({
    required this.rect,
    required this.paint,
  });

  final Rect rect;

  final Paint paint;

  void execute(Canvas proxy) {
    return proxy.drawRect(
      rect,
      paint,
    );
  }
}

class Canvas_DrawRRect_Record {
  Canvas_DrawRRect_Record({
    required this.rrect,
    required this.paint,
  });

  final RRect rrect;

  final Paint paint;

  void execute(Canvas proxy) {
    return proxy.drawRRect(
      rrect,
      paint,
    );
  }
}

class Canvas_DrawDRRect_Record {
  Canvas_DrawDRRect_Record({
    required this.outer,
    required this.inner,
    required this.paint,
  });

  final RRect outer;

  final RRect inner;

  final Paint paint;

  void execute(Canvas proxy) {
    return proxy.drawDRRect(
      outer,
      inner,
      paint,
    );
  }
}

class Canvas_DrawOval_Record {
  Canvas_DrawOval_Record({
    required this.rect,
    required this.paint,
  });

  final Rect rect;

  final Paint paint;

  void execute(Canvas proxy) {
    return proxy.drawOval(
      rect,
      paint,
    );
  }
}

class Canvas_DrawCircle_Record {
  Canvas_DrawCircle_Record({
    required this.c,
    required this.radius,
    required this.paint,
  });

  final Offset c;

  final double radius;

  final Paint paint;

  void execute(Canvas proxy) {
    return proxy.drawCircle(
      c,
      radius,
      paint,
    );
  }
}

class Canvas_DrawArc_Record {
  Canvas_DrawArc_Record({
    required this.rect,
    required this.startAngle,
    required this.sweepAngle,
    required this.useCenter,
    required this.paint,
  });

  final Rect rect;

  final double startAngle;

  final double sweepAngle;

  final bool useCenter;

  final Paint paint;

  void execute(Canvas proxy) {
    return proxy.drawArc(
      rect,
      startAngle,
      sweepAngle,
      useCenter,
      paint,
    );
  }
}

class Canvas_DrawPath_Record {
  Canvas_DrawPath_Record({
    required this.path,
    required this.paint,
  });

  final Path path;

  final Paint paint;

  void execute(Canvas proxy) {
    return proxy.drawPath(
      path,
      paint,
    );
  }
}

class Canvas_DrawImage_Record {
  Canvas_DrawImage_Record({
    required this.image,
    required this.offset,
    required this.paint,
  });

  final Image image;

  final Offset offset;

  final Paint paint;

  void execute(Canvas proxy) {
    return proxy.drawImage(
      image,
      offset,
      paint,
    );
  }
}

class Canvas_DrawImageRect_Record {
  Canvas_DrawImageRect_Record({
    required this.image,
    required this.src,
    required this.dst,
    required this.paint,
  });

  final Image image;

  final Rect src;

  final Rect dst;

  final Paint paint;

  void execute(Canvas proxy) {
    return proxy.drawImageRect(
      image,
      src,
      dst,
      paint,
    );
  }
}

class Canvas_DrawImageNine_Record {
  Canvas_DrawImageNine_Record({
    required this.image,
    required this.center,
    required this.dst,
    required this.paint,
  });

  final Image image;

  final Rect center;

  final Rect dst;

  final Paint paint;

  void execute(Canvas proxy) {
    return proxy.drawImageNine(
      image,
      center,
      dst,
      paint,
    );
  }
}

class Canvas_DrawPicture_Record {
  Canvas_DrawPicture_Record({required this.picture});

  final Picture picture;

  void execute(Canvas proxy) {
    return proxy.drawPicture(picture);
  }
}

class Canvas_DrawParagraph_Record {
  Canvas_DrawParagraph_Record({
    required this.paragraph,
    required this.offset,
  });

  final Paragraph paragraph;

  final Offset offset;

  void execute(Canvas proxy) {
    return proxy.drawParagraph(
      paragraph,
      offset,
    );
  }
}

class Canvas_DrawPoints_Record {
  Canvas_DrawPoints_Record({
    required this.pointMode,
    required this.points,
    required this.paint,
  });

  final PointMode pointMode;

  final List<Offset> points;

  final Paint paint;

  void execute(Canvas proxy) {
    return proxy.drawPoints(
      pointMode,
      points,
      paint,
    );
  }
}

class Canvas_DrawRawPoints_Record {
  Canvas_DrawRawPoints_Record({
    required this.pointMode,
    required this.points,
    required this.paint,
  });

  final PointMode pointMode;

  final Float32List points;

  final Paint paint;

  void execute(Canvas proxy) {
    return proxy.drawRawPoints(
      pointMode,
      points,
      paint,
    );
  }
}

class Canvas_DrawVertices_Record {
  Canvas_DrawVertices_Record({
    required this.vertices,
    required this.blendMode,
    required this.paint,
  });

  final Vertices vertices;

  final BlendMode blendMode;

  final Paint paint;

  void execute(Canvas proxy) {
    return proxy.drawVertices(
      vertices,
      blendMode,
      paint,
    );
  }
}

class Canvas_DrawAtlas_Record {
  Canvas_DrawAtlas_Record({
    required this.atlas,
    required this.transforms,
    required this.rects,
    required this.colors,
    required this.blendMode,
    required this.cullRect,
    required this.paint,
  });

  final Image atlas;

  final List<RSTransform> transforms;

  final List<Rect> rects;

  final List<Color>? colors;

  final BlendMode? blendMode;

  final Rect? cullRect;

  final Paint paint;

  void execute(Canvas proxy) {
    return proxy.drawAtlas(
      atlas,
      transforms,
      rects,
      colors,
      blendMode,
      cullRect,
      paint,
    );
  }
}

class Canvas_DrawRawAtlas_Record {
  Canvas_DrawRawAtlas_Record({
    required this.atlas,
    required this.rstTransforms,
    required this.rects,
    required this.colors,
    required this.blendMode,
    required this.cullRect,
    required this.paint,
  });

  final Image atlas;

  final Float32List rstTransforms;

  final Float32List rects;

  final Int32List? colors;

  final BlendMode? blendMode;

  final Rect? cullRect;

  final Paint paint;

  void execute(Canvas proxy) {
    return proxy.drawRawAtlas(
      atlas,
      rstTransforms,
      rects,
      colors,
      blendMode,
      cullRect,
      paint,
    );
  }
}

class Canvas_DrawShadow_Record {
  Canvas_DrawShadow_Record({
    required this.path,
    required this.color,
    required this.elevation,
    required this.transparentOccluder,
  });

  final Path path;

  final Color color;

  final double elevation;

  final bool transparentOccluder;

  void execute(Canvas proxy) {
    return proxy.drawShadow(
      path,
      color,
      elevation,
      transparentOccluder,
    );
  }
}
