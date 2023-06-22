// ignore_for_file: unused_import, camel_case_types

// -------------------------------------------------------------
// AUTOMATICALLY GENERATED BY CODE GENERATOR, PLEASE DO NOT EDIT
// -------------------------------------------------------------

import 'dart:typed_data';
import 'dart:ui';

abstract class Canvas_RecordBase<Ret> {
  Ret execute(Canvas proxy);

  // TODO only a temporary workaround, should remove after implementing serialization
  Canvas_RecordBase<Ret> temporaryClone();
}

class Canvas_Save_Record implements Canvas_RecordBase<void> {
  Canvas_Save_Record();

  @override
  void execute(Canvas proxy) {
    return proxy.save();
  }

  @override
  Canvas_Save_Record temporaryClone() {
    return Canvas_Save_Record();
  }
}

class Canvas_SaveLayer_Record implements Canvas_RecordBase<void> {
  Canvas_SaveLayer_Record({
    required this.bounds,
    required this.paint,
  });

  final Rect? bounds;

  final Paint paint;

  @override
  void execute(Canvas proxy) {
    return proxy.saveLayer(
      bounds,
      paint,
    );
  }

  @override
  Canvas_SaveLayer_Record temporaryClone() {
    return Canvas_SaveLayer_Record(
      bounds: bounds,
      paint: paint,
    );
  }
}

class Canvas_Restore_Record implements Canvas_RecordBase<void> {
  Canvas_Restore_Record();

  @override
  void execute(Canvas proxy) {
    return proxy.restore();
  }

  @override
  Canvas_Restore_Record temporaryClone() {
    return Canvas_Restore_Record();
  }
}

class Canvas_RestoreToCount_Record implements Canvas_RecordBase<void> {
  Canvas_RestoreToCount_Record({required this.count});

  final int count;

  @override
  void execute(Canvas proxy) {
    return proxy.restoreToCount(count);
  }

  @override
  Canvas_RestoreToCount_Record temporaryClone() {
    return Canvas_RestoreToCount_Record(count: count);
  }
}

class Canvas_Translate_Record implements Canvas_RecordBase<void> {
  Canvas_Translate_Record({
    required this.dx,
    required this.dy,
  });

  final double dx;

  final double dy;

  @override
  void execute(Canvas proxy) {
    return proxy.translate(
      dx,
      dy,
    );
  }

  @override
  Canvas_Translate_Record temporaryClone() {
    return Canvas_Translate_Record(
      dx: dx,
      dy: dy,
    );
  }
}

class Canvas_Scale_Record implements Canvas_RecordBase<void> {
  Canvas_Scale_Record({
    required this.sx,
    required this.sy,
  });

  final double sx;

  final double? sy;

  @override
  void execute(Canvas proxy) {
    return proxy.scale(
      sx,
      sy,
    );
  }

  @override
  Canvas_Scale_Record temporaryClone() {
    return Canvas_Scale_Record(
      sx: sx,
      sy: sy,
    );
  }
}

class Canvas_Rotate_Record implements Canvas_RecordBase<void> {
  Canvas_Rotate_Record({required this.radians});

  final double radians;

  @override
  void execute(Canvas proxy) {
    return proxy.rotate(radians);
  }

  @override
  Canvas_Rotate_Record temporaryClone() {
    return Canvas_Rotate_Record(radians: radians);
  }
}

class Canvas_Skew_Record implements Canvas_RecordBase<void> {
  Canvas_Skew_Record({
    required this.sx,
    required this.sy,
  });

  final double sx;

  final double sy;

  @override
  void execute(Canvas proxy) {
    return proxy.skew(
      sx,
      sy,
    );
  }

  @override
  Canvas_Skew_Record temporaryClone() {
    return Canvas_Skew_Record(
      sx: sx,
      sy: sy,
    );
  }
}

class Canvas_Transform_Record implements Canvas_RecordBase<void> {
  Canvas_Transform_Record({required this.matrix4});

  final Float64List matrix4;

  @override
  void execute(Canvas proxy) {
    return proxy.transform(matrix4);
  }

  @override
  Canvas_Transform_Record temporaryClone() {
    return Canvas_Transform_Record(matrix4: matrix4);
  }
}

class Canvas_ClipRect_Record implements Canvas_RecordBase<void> {
  Canvas_ClipRect_Record({
    required this.rect,
    required this.clipOp,
    required this.doAntiAlias,
  });

  final Rect rect;

  final ClipOp clipOp;

  final bool doAntiAlias;

  @override
  void execute(Canvas proxy) {
    return proxy.clipRect(
      rect,
      clipOp: clipOp,
      doAntiAlias: doAntiAlias,
    );
  }

  @override
  Canvas_ClipRect_Record temporaryClone() {
    return Canvas_ClipRect_Record(
      rect: rect,
      clipOp: clipOp,
      doAntiAlias: doAntiAlias,
    );
  }
}

class Canvas_ClipRRect_Record implements Canvas_RecordBase<void> {
  Canvas_ClipRRect_Record({
    required this.rrect,
    required this.doAntiAlias,
  });

  final RRect rrect;

  final bool doAntiAlias;

  @override
  void execute(Canvas proxy) {
    return proxy.clipRRect(
      rrect,
      doAntiAlias: doAntiAlias,
    );
  }

  @override
  Canvas_ClipRRect_Record temporaryClone() {
    return Canvas_ClipRRect_Record(
      rrect: rrect,
      doAntiAlias: doAntiAlias,
    );
  }
}

class Canvas_ClipPath_Record implements Canvas_RecordBase<void> {
  Canvas_ClipPath_Record({
    required this.path,
    required this.doAntiAlias,
  });

  final Path path;

  final bool doAntiAlias;

  @override
  void execute(Canvas proxy) {
    return proxy.clipPath(
      path,
      doAntiAlias: doAntiAlias,
    );
  }

  @override
  Canvas_ClipPath_Record temporaryClone() {
    return Canvas_ClipPath_Record(
      path: path,
      doAntiAlias: doAntiAlias,
    );
  }
}

class Canvas_DrawColor_Record implements Canvas_RecordBase<void> {
  Canvas_DrawColor_Record({
    required this.color,
    required this.blendMode,
  });

  final Color color;

  final BlendMode blendMode;

  @override
  void execute(Canvas proxy) {
    return proxy.drawColor(
      color,
      blendMode,
    );
  }

  @override
  Canvas_DrawColor_Record temporaryClone() {
    return Canvas_DrawColor_Record(
      color: color,
      blendMode: blendMode,
    );
  }
}

class Canvas_DrawLine_Record implements Canvas_RecordBase<void> {
  Canvas_DrawLine_Record({
    required this.p1,
    required this.p2,
    required this.paint,
  });

  final Offset p1;

  final Offset p2;

  final Paint paint;

  @override
  void execute(Canvas proxy) {
    return proxy.drawLine(
      p1,
      p2,
      paint,
    );
  }

  @override
  Canvas_DrawLine_Record temporaryClone() {
    return Canvas_DrawLine_Record(
      p1: p1,
      p2: p2,
      paint: paint,
    );
  }
}

class Canvas_DrawPaint_Record implements Canvas_RecordBase<void> {
  Canvas_DrawPaint_Record({required this.paint});

  final Paint paint;

  @override
  void execute(Canvas proxy) {
    return proxy.drawPaint(paint);
  }

  @override
  Canvas_DrawPaint_Record temporaryClone() {
    return Canvas_DrawPaint_Record(paint: paint);
  }
}

class Canvas_DrawRect_Record implements Canvas_RecordBase<void> {
  Canvas_DrawRect_Record({
    required this.rect,
    required this.paint,
  });

  final Rect rect;

  final Paint paint;

  @override
  void execute(Canvas proxy) {
    return proxy.drawRect(
      rect,
      paint,
    );
  }

  @override
  Canvas_DrawRect_Record temporaryClone() {
    return Canvas_DrawRect_Record(
      rect: rect,
      paint: paint,
    );
  }
}

class Canvas_DrawRRect_Record implements Canvas_RecordBase<void> {
  Canvas_DrawRRect_Record({
    required this.rrect,
    required this.paint,
  });

  final RRect rrect;

  final Paint paint;

  @override
  void execute(Canvas proxy) {
    return proxy.drawRRect(
      rrect,
      paint,
    );
  }

  @override
  Canvas_DrawRRect_Record temporaryClone() {
    return Canvas_DrawRRect_Record(
      rrect: rrect,
      paint: paint,
    );
  }
}

class Canvas_DrawDRRect_Record implements Canvas_RecordBase<void> {
  Canvas_DrawDRRect_Record({
    required this.outer,
    required this.inner,
    required this.paint,
  });

  final RRect outer;

  final RRect inner;

  final Paint paint;

  @override
  void execute(Canvas proxy) {
    return proxy.drawDRRect(
      outer,
      inner,
      paint,
    );
  }

  @override
  Canvas_DrawDRRect_Record temporaryClone() {
    return Canvas_DrawDRRect_Record(
      outer: outer,
      inner: inner,
      paint: paint,
    );
  }
}

class Canvas_DrawOval_Record implements Canvas_RecordBase<void> {
  Canvas_DrawOval_Record({
    required this.rect,
    required this.paint,
  });

  final Rect rect;

  final Paint paint;

  @override
  void execute(Canvas proxy) {
    return proxy.drawOval(
      rect,
      paint,
    );
  }

  @override
  Canvas_DrawOval_Record temporaryClone() {
    return Canvas_DrawOval_Record(
      rect: rect,
      paint: paint,
    );
  }
}

class Canvas_DrawCircle_Record implements Canvas_RecordBase<void> {
  Canvas_DrawCircle_Record({
    required this.c,
    required this.radius,
    required this.paint,
  });

  final Offset c;

  final double radius;

  final Paint paint;

  @override
  void execute(Canvas proxy) {
    return proxy.drawCircle(
      c,
      radius,
      paint,
    );
  }

  @override
  Canvas_DrawCircle_Record temporaryClone() {
    return Canvas_DrawCircle_Record(
      c: c,
      radius: radius,
      paint: paint,
    );
  }
}

class Canvas_DrawArc_Record implements Canvas_RecordBase<void> {
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

  @override
  void execute(Canvas proxy) {
    return proxy.drawArc(
      rect,
      startAngle,
      sweepAngle,
      useCenter,
      paint,
    );
  }

  @override
  Canvas_DrawArc_Record temporaryClone() {
    return Canvas_DrawArc_Record(
      rect: rect,
      startAngle: startAngle,
      sweepAngle: sweepAngle,
      useCenter: useCenter,
      paint: paint,
    );
  }
}

class Canvas_DrawPath_Record implements Canvas_RecordBase<void> {
  Canvas_DrawPath_Record({
    required this.path,
    required this.paint,
  });

  final Path path;

  final Paint paint;

  @override
  void execute(Canvas proxy) {
    return proxy.drawPath(
      path,
      paint,
    );
  }

  @override
  Canvas_DrawPath_Record temporaryClone() {
    return Canvas_DrawPath_Record(
      path: path,
      paint: paint,
    );
  }
}

class Canvas_DrawImage_Record implements Canvas_RecordBase<void> {
  Canvas_DrawImage_Record({
    required this.image,
    required this.offset,
    required this.paint,
  });

  final Image image;

  final Offset offset;

  final Paint paint;

  @override
  void execute(Canvas proxy) {
    return proxy.drawImage(
      image,
      offset,
      paint,
    );
  }

  @override
  Canvas_DrawImage_Record temporaryClone() {
    return Canvas_DrawImage_Record(
      image: image,
      offset: offset,
      paint: paint,
    );
  }
}

class Canvas_DrawImageRect_Record implements Canvas_RecordBase<void> {
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

  @override
  void execute(Canvas proxy) {
    return proxy.drawImageRect(
      image,
      src,
      dst,
      paint,
    );
  }

  @override
  Canvas_DrawImageRect_Record temporaryClone() {
    return Canvas_DrawImageRect_Record(
      image: image,
      src: src,
      dst: dst,
      paint: paint,
    );
  }
}

class Canvas_DrawImageNine_Record implements Canvas_RecordBase<void> {
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

  @override
  void execute(Canvas proxy) {
    return proxy.drawImageNine(
      image,
      center,
      dst,
      paint,
    );
  }

  @override
  Canvas_DrawImageNine_Record temporaryClone() {
    return Canvas_DrawImageNine_Record(
      image: image,
      center: center,
      dst: dst,
      paint: paint,
    );
  }
}

class Canvas_DrawPicture_Record implements Canvas_RecordBase<void> {
  Canvas_DrawPicture_Record({required this.picture});

  final Picture picture;

  @override
  void execute(Canvas proxy) {
    return proxy.drawPicture(picture);
  }

  @override
  Canvas_DrawPicture_Record temporaryClone() {
    return Canvas_DrawPicture_Record(picture: picture);
  }
}

class Canvas_DrawParagraph_Record implements Canvas_RecordBase<void> {
  Canvas_DrawParagraph_Record({
    required this.paragraph,
    required this.offset,
  });

  final Paragraph paragraph;

  final Offset offset;

  @override
  void execute(Canvas proxy) {
    return proxy.drawParagraph(
      paragraph,
      offset,
    );
  }

  @override
  Canvas_DrawParagraph_Record temporaryClone() {
    return Canvas_DrawParagraph_Record(
      paragraph: paragraph,
      offset: offset,
    );
  }
}

class Canvas_DrawPoints_Record implements Canvas_RecordBase<void> {
  Canvas_DrawPoints_Record({
    required this.pointMode,
    required this.points,
    required this.paint,
  });

  final PointMode pointMode;

  final List<Offset> points;

  final Paint paint;

  @override
  void execute(Canvas proxy) {
    return proxy.drawPoints(
      pointMode,
      points,
      paint,
    );
  }

  @override
  Canvas_DrawPoints_Record temporaryClone() {
    return Canvas_DrawPoints_Record(
      pointMode: pointMode,
      points: points,
      paint: paint,
    );
  }
}

class Canvas_DrawRawPoints_Record implements Canvas_RecordBase<void> {
  Canvas_DrawRawPoints_Record({
    required this.pointMode,
    required this.points,
    required this.paint,
  });

  final PointMode pointMode;

  final Float32List points;

  final Paint paint;

  @override
  void execute(Canvas proxy) {
    return proxy.drawRawPoints(
      pointMode,
      points,
      paint,
    );
  }

  @override
  Canvas_DrawRawPoints_Record temporaryClone() {
    return Canvas_DrawRawPoints_Record(
      pointMode: pointMode,
      points: points,
      paint: paint,
    );
  }
}

class Canvas_DrawVertices_Record implements Canvas_RecordBase<void> {
  Canvas_DrawVertices_Record({
    required this.vertices,
    required this.blendMode,
    required this.paint,
  });

  final Vertices vertices;

  final BlendMode blendMode;

  final Paint paint;

  @override
  void execute(Canvas proxy) {
    return proxy.drawVertices(
      vertices,
      blendMode,
      paint,
    );
  }

  @override
  Canvas_DrawVertices_Record temporaryClone() {
    return Canvas_DrawVertices_Record(
      vertices: vertices,
      blendMode: blendMode,
      paint: paint,
    );
  }
}

class Canvas_DrawAtlas_Record implements Canvas_RecordBase<void> {
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

  @override
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

  @override
  Canvas_DrawAtlas_Record temporaryClone() {
    return Canvas_DrawAtlas_Record(
      atlas: atlas,
      transforms: transforms,
      rects: rects,
      colors: colors,
      blendMode: blendMode,
      cullRect: cullRect,
      paint: paint,
    );
  }
}

class Canvas_DrawRawAtlas_Record implements Canvas_RecordBase<void> {
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

  @override
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

  @override
  Canvas_DrawRawAtlas_Record temporaryClone() {
    return Canvas_DrawRawAtlas_Record(
      atlas: atlas,
      rstTransforms: rstTransforms,
      rects: rects,
      colors: colors,
      blendMode: blendMode,
      cullRect: cullRect,
      paint: paint,
    );
  }
}

class Canvas_DrawShadow_Record implements Canvas_RecordBase<void> {
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

  @override
  void execute(Canvas proxy) {
    return proxy.drawShadow(
      path,
      color,
      elevation,
      transparentOccluder,
    );
  }

  @override
  Canvas_DrawShadow_Record temporaryClone() {
    return Canvas_DrawShadow_Record(
      path: path,
      color: color,
      elevation: elevation,
      transparentOccluder: transparentOccluder,
    );
  }
}
