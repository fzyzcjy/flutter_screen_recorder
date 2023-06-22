// ignore_for_file: unused_import, camel_case_types

// -------------------------------------------------------------
// AUTOMATICALLY GENERATED BY CODE GENERATOR, PLEASE DO NOT EDIT
// -------------------------------------------------------------

import 'dart:typed_data';
import 'dart:ui';

import 'package:screen_recorder/bytes_reader_writer.dart';
import 'package:screen_recorder/generated/serialization/serialization.dart';
import 'package:screen_recorder/serialization.dart';
import 'package:screen_recorder/temporary_clone.dart';

sealed class Canvas_RecordBase<Ret> {
  Canvas_RecordBase();

  static Canvas_RecordBase fromBytes(BytesReader reader) {
    final tag = fromBytesUint8(reader);
    switch (tag) {
      case 0:
        return Canvas_Save_Record.fromBytes(reader);
      case 1:
        return Canvas_SaveLayer_Record.fromBytes(reader);
      case 2:
        return Canvas_Restore_Record.fromBytes(reader);
      case 3:
        return Canvas_RestoreToCount_Record.fromBytes(reader);
      case 4:
        return Canvas_Translate_Record.fromBytes(reader);
      case 5:
        return Canvas_Scale_Record.fromBytes(reader);
      case 6:
        return Canvas_Rotate_Record.fromBytes(reader);
      case 7:
        return Canvas_Skew_Record.fromBytes(reader);
      case 8:
        return Canvas_Transform_Record.fromBytes(reader);
      case 9:
        return Canvas_ClipRect_Record.fromBytes(reader);
      case 10:
        return Canvas_ClipRRect_Record.fromBytes(reader);
      case 11:
        return Canvas_ClipPath_Record.fromBytes(reader);
      case 12:
        return Canvas_DrawColor_Record.fromBytes(reader);
      case 13:
        return Canvas_DrawLine_Record.fromBytes(reader);
      case 14:
        return Canvas_DrawPaint_Record.fromBytes(reader);
      case 15:
        return Canvas_DrawRect_Record.fromBytes(reader);
      case 16:
        return Canvas_DrawRRect_Record.fromBytes(reader);
      case 17:
        return Canvas_DrawDRRect_Record.fromBytes(reader);
      case 18:
        return Canvas_DrawOval_Record.fromBytes(reader);
      case 19:
        return Canvas_DrawCircle_Record.fromBytes(reader);
      case 20:
        return Canvas_DrawArc_Record.fromBytes(reader);
      case 21:
        return Canvas_DrawPath_Record.fromBytes(reader);
      case 22:
        return Canvas_DrawImage_Record.fromBytes(reader);
      case 23:
        return Canvas_DrawImageRect_Record.fromBytes(reader);
      case 24:
        return Canvas_DrawImageNine_Record.fromBytes(reader);
      case 25:
        return Canvas_DrawPicture_Record.fromBytes(reader);
      case 26:
        return Canvas_DrawParagraph_Record.fromBytes(reader);
      case 27:
        return Canvas_DrawPoints_Record.fromBytes(reader);
      case 28:
        return Canvas_DrawRawPoints_Record.fromBytes(reader);
      case 29:
        return Canvas_DrawVertices_Record.fromBytes(reader);
      case 30:
        return Canvas_DrawAtlas_Record.fromBytes(reader);
      case 31:
        return Canvas_DrawRawAtlas_Record.fromBytes(reader);
      case 32:
        return Canvas_DrawShadow_Record.fromBytes(reader);
      default:
        throw UnimplementedError('unknown tag=$tag');
    }
  }

  Ret execute(Canvas proxy);

  // TODO only a temporary workaround, should remove after implementing serialization
  Canvas_RecordBase<Ret> temporaryClone();

  void toBytes(BytesWriter writer) {
    toBytesUint8(writer, tag);
    toBytesWithoutTag(writer);
  }

  int get tag;

  void toBytesWithoutTag(BytesWriter writer);
}

class Canvas_Save_Record extends Canvas_RecordBase<void> {
  Canvas_Save_Record();

  factory Canvas_Save_Record.fromBytes(BytesReader reader) => fromBytesCanvasSaveRecord(reader);

  @override
  void execute(Canvas proxy) {
    return proxy.save();
  }

  @override
  int get tag => 0;
  @override
  void toBytesWithoutTag(BytesWriter writer) => toBytesCanvasSaveRecord(writer, this);
  @override
  Canvas_Save_Record temporaryClone() {
    return Canvas_Save_Record();
  }
}

class Canvas_SaveLayer_Record extends Canvas_RecordBase<void> {
  Canvas_SaveLayer_Record({
    required this.bounds,
    required this.paint,
  });

  factory Canvas_SaveLayer_Record.fromBytes(BytesReader reader) => fromBytesCanvasSaveLayerRecord(reader);

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
  int get tag => 1;
  @override
  void toBytesWithoutTag(BytesWriter writer) => toBytesCanvasSaveLayerRecord(writer, this);
  @override
  Canvas_SaveLayer_Record temporaryClone() {
    return Canvas_SaveLayer_Record(
      bounds: bounds,
      paint: paint,
    );
  }
}

class Canvas_Restore_Record extends Canvas_RecordBase<void> {
  Canvas_Restore_Record();

  factory Canvas_Restore_Record.fromBytes(BytesReader reader) => fromBytesCanvasRestoreRecord(reader);

  @override
  void execute(Canvas proxy) {
    return proxy.restore();
  }

  @override
  int get tag => 2;
  @override
  void toBytesWithoutTag(BytesWriter writer) => toBytesCanvasRestoreRecord(writer, this);
  @override
  Canvas_Restore_Record temporaryClone() {
    return Canvas_Restore_Record();
  }
}

class Canvas_RestoreToCount_Record extends Canvas_RecordBase<void> {
  Canvas_RestoreToCount_Record({required this.count});

  factory Canvas_RestoreToCount_Record.fromBytes(BytesReader reader) => fromBytesCanvasRestoreToCountRecord(reader);

  final int count;

  @override
  void execute(Canvas proxy) {
    return proxy.restoreToCount(count);
  }

  @override
  int get tag => 3;
  @override
  void toBytesWithoutTag(BytesWriter writer) => toBytesCanvasRestoreToCountRecord(writer, this);
  @override
  Canvas_RestoreToCount_Record temporaryClone() {
    return Canvas_RestoreToCount_Record(count: count);
  }
}

class Canvas_Translate_Record extends Canvas_RecordBase<void> {
  Canvas_Translate_Record({
    required this.dx,
    required this.dy,
  });

  factory Canvas_Translate_Record.fromBytes(BytesReader reader) => fromBytesCanvasTranslateRecord(reader);

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
  int get tag => 4;
  @override
  void toBytesWithoutTag(BytesWriter writer) => toBytesCanvasTranslateRecord(writer, this);
  @override
  Canvas_Translate_Record temporaryClone() {
    return Canvas_Translate_Record(
      dx: dx,
      dy: dy,
    );
  }
}

class Canvas_Scale_Record extends Canvas_RecordBase<void> {
  Canvas_Scale_Record({
    required this.sx,
    required this.sy,
  });

  factory Canvas_Scale_Record.fromBytes(BytesReader reader) => fromBytesCanvasScaleRecord(reader);

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
  int get tag => 5;
  @override
  void toBytesWithoutTag(BytesWriter writer) => toBytesCanvasScaleRecord(writer, this);
  @override
  Canvas_Scale_Record temporaryClone() {
    return Canvas_Scale_Record(
      sx: sx,
      sy: sy,
    );
  }
}

class Canvas_Rotate_Record extends Canvas_RecordBase<void> {
  Canvas_Rotate_Record({required this.radians});

  factory Canvas_Rotate_Record.fromBytes(BytesReader reader) => fromBytesCanvasRotateRecord(reader);

  final double radians;

  @override
  void execute(Canvas proxy) {
    return proxy.rotate(radians);
  }

  @override
  int get tag => 6;
  @override
  void toBytesWithoutTag(BytesWriter writer) => toBytesCanvasRotateRecord(writer, this);
  @override
  Canvas_Rotate_Record temporaryClone() {
    return Canvas_Rotate_Record(radians: radians);
  }
}

class Canvas_Skew_Record extends Canvas_RecordBase<void> {
  Canvas_Skew_Record({
    required this.sx,
    required this.sy,
  });

  factory Canvas_Skew_Record.fromBytes(BytesReader reader) => fromBytesCanvasSkewRecord(reader);

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
  int get tag => 7;
  @override
  void toBytesWithoutTag(BytesWriter writer) => toBytesCanvasSkewRecord(writer, this);
  @override
  Canvas_Skew_Record temporaryClone() {
    return Canvas_Skew_Record(
      sx: sx,
      sy: sy,
    );
  }
}

class Canvas_Transform_Record extends Canvas_RecordBase<void> {
  Canvas_Transform_Record({required this.matrix4});

  factory Canvas_Transform_Record.fromBytes(BytesReader reader) => fromBytesCanvasTransformRecord(reader);

  final Float64List matrix4;

  @override
  void execute(Canvas proxy) {
    return proxy.transform(matrix4);
  }

  @override
  int get tag => 8;
  @override
  void toBytesWithoutTag(BytesWriter writer) => toBytesCanvasTransformRecord(writer, this);
  @override
  Canvas_Transform_Record temporaryClone() {
    return Canvas_Transform_Record(matrix4: matrix4.temporaryClone());
  }
}

class Canvas_ClipRect_Record extends Canvas_RecordBase<void> {
  Canvas_ClipRect_Record({
    required this.rect,
    required this.clipOp,
    required this.doAntiAlias,
  });

  factory Canvas_ClipRect_Record.fromBytes(BytesReader reader) => fromBytesCanvasClipRectRecord(reader);

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
  int get tag => 9;
  @override
  void toBytesWithoutTag(BytesWriter writer) => toBytesCanvasClipRectRecord(writer, this);
  @override
  Canvas_ClipRect_Record temporaryClone() {
    return Canvas_ClipRect_Record(
      rect: rect,
      clipOp: clipOp,
      doAntiAlias: doAntiAlias,
    );
  }
}

class Canvas_ClipRRect_Record extends Canvas_RecordBase<void> {
  Canvas_ClipRRect_Record({
    required this.rrect,
    required this.doAntiAlias,
  });

  factory Canvas_ClipRRect_Record.fromBytes(BytesReader reader) => fromBytesCanvasClipRRectRecord(reader);

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
  int get tag => 10;
  @override
  void toBytesWithoutTag(BytesWriter writer) => toBytesCanvasClipRRectRecord(writer, this);
  @override
  Canvas_ClipRRect_Record temporaryClone() {
    return Canvas_ClipRRect_Record(
      rrect: rrect,
      doAntiAlias: doAntiAlias,
    );
  }
}

class Canvas_ClipPath_Record extends Canvas_RecordBase<void> {
  Canvas_ClipPath_Record({
    required this.path,
    required this.doAntiAlias,
  });

  factory Canvas_ClipPath_Record.fromBytes(BytesReader reader) => fromBytesCanvasClipPathRecord(reader);

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
  int get tag => 11;
  @override
  void toBytesWithoutTag(BytesWriter writer) => toBytesCanvasClipPathRecord(writer, this);
  @override
  Canvas_ClipPath_Record temporaryClone() {
    return Canvas_ClipPath_Record(
      path: path.temporaryClone(),
      doAntiAlias: doAntiAlias,
    );
  }
}

class Canvas_DrawColor_Record extends Canvas_RecordBase<void> {
  Canvas_DrawColor_Record({
    required this.color,
    required this.blendMode,
  });

  factory Canvas_DrawColor_Record.fromBytes(BytesReader reader) => fromBytesCanvasDrawColorRecord(reader);

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
  int get tag => 12;
  @override
  void toBytesWithoutTag(BytesWriter writer) => toBytesCanvasDrawColorRecord(writer, this);
  @override
  Canvas_DrawColor_Record temporaryClone() {
    return Canvas_DrawColor_Record(
      color: color,
      blendMode: blendMode,
    );
  }
}

class Canvas_DrawLine_Record extends Canvas_RecordBase<void> {
  Canvas_DrawLine_Record({
    required this.p1,
    required this.p2,
    required this.paint,
  });

  factory Canvas_DrawLine_Record.fromBytes(BytesReader reader) => fromBytesCanvasDrawLineRecord(reader);

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
  int get tag => 13;
  @override
  void toBytesWithoutTag(BytesWriter writer) => toBytesCanvasDrawLineRecord(writer, this);
  @override
  Canvas_DrawLine_Record temporaryClone() {
    return Canvas_DrawLine_Record(
      p1: p1,
      p2: p2,
      paint: paint,
    );
  }
}

class Canvas_DrawPaint_Record extends Canvas_RecordBase<void> {
  Canvas_DrawPaint_Record({required this.paint});

  factory Canvas_DrawPaint_Record.fromBytes(BytesReader reader) => fromBytesCanvasDrawPaintRecord(reader);

  final Paint paint;

  @override
  void execute(Canvas proxy) {
    return proxy.drawPaint(paint);
  }

  @override
  int get tag => 14;
  @override
  void toBytesWithoutTag(BytesWriter writer) => toBytesCanvasDrawPaintRecord(writer, this);
  @override
  Canvas_DrawPaint_Record temporaryClone() {
    return Canvas_DrawPaint_Record(paint: paint);
  }
}

class Canvas_DrawRect_Record extends Canvas_RecordBase<void> {
  Canvas_DrawRect_Record({
    required this.rect,
    required this.paint,
  });

  factory Canvas_DrawRect_Record.fromBytes(BytesReader reader) => fromBytesCanvasDrawRectRecord(reader);

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
  int get tag => 15;
  @override
  void toBytesWithoutTag(BytesWriter writer) => toBytesCanvasDrawRectRecord(writer, this);
  @override
  Canvas_DrawRect_Record temporaryClone() {
    return Canvas_DrawRect_Record(
      rect: rect,
      paint: paint,
    );
  }
}

class Canvas_DrawRRect_Record extends Canvas_RecordBase<void> {
  Canvas_DrawRRect_Record({
    required this.rrect,
    required this.paint,
  });

  factory Canvas_DrawRRect_Record.fromBytes(BytesReader reader) => fromBytesCanvasDrawRRectRecord(reader);

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
  int get tag => 16;
  @override
  void toBytesWithoutTag(BytesWriter writer) => toBytesCanvasDrawRRectRecord(writer, this);
  @override
  Canvas_DrawRRect_Record temporaryClone() {
    return Canvas_DrawRRect_Record(
      rrect: rrect,
      paint: paint,
    );
  }
}

class Canvas_DrawDRRect_Record extends Canvas_RecordBase<void> {
  Canvas_DrawDRRect_Record({
    required this.outer,
    required this.inner,
    required this.paint,
  });

  factory Canvas_DrawDRRect_Record.fromBytes(BytesReader reader) => fromBytesCanvasDrawDRRectRecord(reader);

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
  int get tag => 17;
  @override
  void toBytesWithoutTag(BytesWriter writer) => toBytesCanvasDrawDRRectRecord(writer, this);
  @override
  Canvas_DrawDRRect_Record temporaryClone() {
    return Canvas_DrawDRRect_Record(
      outer: outer,
      inner: inner,
      paint: paint,
    );
  }
}

class Canvas_DrawOval_Record extends Canvas_RecordBase<void> {
  Canvas_DrawOval_Record({
    required this.rect,
    required this.paint,
  });

  factory Canvas_DrawOval_Record.fromBytes(BytesReader reader) => fromBytesCanvasDrawOvalRecord(reader);

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
  int get tag => 18;
  @override
  void toBytesWithoutTag(BytesWriter writer) => toBytesCanvasDrawOvalRecord(writer, this);
  @override
  Canvas_DrawOval_Record temporaryClone() {
    return Canvas_DrawOval_Record(
      rect: rect,
      paint: paint,
    );
  }
}

class Canvas_DrawCircle_Record extends Canvas_RecordBase<void> {
  Canvas_DrawCircle_Record({
    required this.c,
    required this.radius,
    required this.paint,
  });

  factory Canvas_DrawCircle_Record.fromBytes(BytesReader reader) => fromBytesCanvasDrawCircleRecord(reader);

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
  int get tag => 19;
  @override
  void toBytesWithoutTag(BytesWriter writer) => toBytesCanvasDrawCircleRecord(writer, this);
  @override
  Canvas_DrawCircle_Record temporaryClone() {
    return Canvas_DrawCircle_Record(
      c: c,
      radius: radius,
      paint: paint,
    );
  }
}

class Canvas_DrawArc_Record extends Canvas_RecordBase<void> {
  Canvas_DrawArc_Record({
    required this.rect,
    required this.startAngle,
    required this.sweepAngle,
    required this.useCenter,
    required this.paint,
  });

  factory Canvas_DrawArc_Record.fromBytes(BytesReader reader) => fromBytesCanvasDrawArcRecord(reader);

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
  int get tag => 20;
  @override
  void toBytesWithoutTag(BytesWriter writer) => toBytesCanvasDrawArcRecord(writer, this);
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

class Canvas_DrawPath_Record extends Canvas_RecordBase<void> {
  Canvas_DrawPath_Record({
    required this.path,
    required this.paint,
  });

  factory Canvas_DrawPath_Record.fromBytes(BytesReader reader) => fromBytesCanvasDrawPathRecord(reader);

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
  int get tag => 21;
  @override
  void toBytesWithoutTag(BytesWriter writer) => toBytesCanvasDrawPathRecord(writer, this);
  @override
  Canvas_DrawPath_Record temporaryClone() {
    return Canvas_DrawPath_Record(
      path: path.temporaryClone(),
      paint: paint,
    );
  }
}

class Canvas_DrawImage_Record extends Canvas_RecordBase<void> {
  Canvas_DrawImage_Record({
    required this.image,
    required this.offset,
    required this.paint,
  });

  factory Canvas_DrawImage_Record.fromBytes(BytesReader reader) => fromBytesCanvasDrawImageRecord(reader);

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
  int get tag => 22;
  @override
  void toBytesWithoutTag(BytesWriter writer) => toBytesCanvasDrawImageRecord(writer, this);
  @override
  Canvas_DrawImage_Record temporaryClone() {
    return Canvas_DrawImage_Record(
      image: image,
      offset: offset,
      paint: paint,
    );
  }
}

class Canvas_DrawImageRect_Record extends Canvas_RecordBase<void> {
  Canvas_DrawImageRect_Record({
    required this.image,
    required this.src,
    required this.dst,
    required this.paint,
  });

  factory Canvas_DrawImageRect_Record.fromBytes(BytesReader reader) => fromBytesCanvasDrawImageRectRecord(reader);

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
  int get tag => 23;
  @override
  void toBytesWithoutTag(BytesWriter writer) => toBytesCanvasDrawImageRectRecord(writer, this);
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

class Canvas_DrawImageNine_Record extends Canvas_RecordBase<void> {
  Canvas_DrawImageNine_Record({
    required this.image,
    required this.center,
    required this.dst,
    required this.paint,
  });

  factory Canvas_DrawImageNine_Record.fromBytes(BytesReader reader) => fromBytesCanvasDrawImageNineRecord(reader);

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
  int get tag => 24;
  @override
  void toBytesWithoutTag(BytesWriter writer) => toBytesCanvasDrawImageNineRecord(writer, this);
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

class Canvas_DrawPicture_Record extends Canvas_RecordBase<void> {
  Canvas_DrawPicture_Record({required this.picture});

  factory Canvas_DrawPicture_Record.fromBytes(BytesReader reader) => fromBytesCanvasDrawPictureRecord(reader);

  final Picture picture;

  @override
  void execute(Canvas proxy) {
    return proxy.drawPicture(picture);
  }

  @override
  int get tag => 25;
  @override
  void toBytesWithoutTag(BytesWriter writer) => toBytesCanvasDrawPictureRecord(writer, this);
  @override
  Canvas_DrawPicture_Record temporaryClone() {
    return Canvas_DrawPicture_Record(picture: picture);
  }
}

class Canvas_DrawParagraph_Record extends Canvas_RecordBase<void> {
  Canvas_DrawParagraph_Record({
    required this.paragraph,
    required this.offset,
  });

  factory Canvas_DrawParagraph_Record.fromBytes(BytesReader reader) => fromBytesCanvasDrawParagraphRecord(reader);

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
  int get tag => 26;
  @override
  void toBytesWithoutTag(BytesWriter writer) => toBytesCanvasDrawParagraphRecord(writer, this);
  @override
  Canvas_DrawParagraph_Record temporaryClone() {
    return Canvas_DrawParagraph_Record(
      paragraph: paragraph,
      offset: offset,
    );
  }
}

class Canvas_DrawPoints_Record extends Canvas_RecordBase<void> {
  Canvas_DrawPoints_Record({
    required this.pointMode,
    required this.points,
    required this.paint,
  });

  factory Canvas_DrawPoints_Record.fromBytes(BytesReader reader) => fromBytesCanvasDrawPointsRecord(reader);

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
  int get tag => 27;
  @override
  void toBytesWithoutTag(BytesWriter writer) => toBytesCanvasDrawPointsRecord(writer, this);
  @override
  Canvas_DrawPoints_Record temporaryClone() {
    return Canvas_DrawPoints_Record(
      pointMode: pointMode,
      points: points,
      paint: paint,
    );
  }
}

class Canvas_DrawRawPoints_Record extends Canvas_RecordBase<void> {
  Canvas_DrawRawPoints_Record({
    required this.pointMode,
    required this.points,
    required this.paint,
  });

  factory Canvas_DrawRawPoints_Record.fromBytes(BytesReader reader) => fromBytesCanvasDrawRawPointsRecord(reader);

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
  int get tag => 28;
  @override
  void toBytesWithoutTag(BytesWriter writer) => toBytesCanvasDrawRawPointsRecord(writer, this);
  @override
  Canvas_DrawRawPoints_Record temporaryClone() {
    return Canvas_DrawRawPoints_Record(
      pointMode: pointMode,
      points: points.temporaryClone(),
      paint: paint,
    );
  }
}

class Canvas_DrawVertices_Record extends Canvas_RecordBase<void> {
  Canvas_DrawVertices_Record({
    required this.vertices,
    required this.blendMode,
    required this.paint,
  });

  factory Canvas_DrawVertices_Record.fromBytes(BytesReader reader) => fromBytesCanvasDrawVerticesRecord(reader);

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
  int get tag => 29;
  @override
  void toBytesWithoutTag(BytesWriter writer) => toBytesCanvasDrawVerticesRecord(writer, this);
  @override
  Canvas_DrawVertices_Record temporaryClone() {
    return Canvas_DrawVertices_Record(
      vertices: vertices,
      blendMode: blendMode,
      paint: paint,
    );
  }
}

class Canvas_DrawAtlas_Record extends Canvas_RecordBase<void> {
  Canvas_DrawAtlas_Record({
    required this.atlas,
    required this.transforms,
    required this.rects,
    required this.colors,
    required this.blendMode,
    required this.cullRect,
    required this.paint,
  });

  factory Canvas_DrawAtlas_Record.fromBytes(BytesReader reader) => fromBytesCanvasDrawAtlasRecord(reader);

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
  int get tag => 30;
  @override
  void toBytesWithoutTag(BytesWriter writer) => toBytesCanvasDrawAtlasRecord(writer, this);
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

class Canvas_DrawRawAtlas_Record extends Canvas_RecordBase<void> {
  Canvas_DrawRawAtlas_Record({
    required this.atlas,
    required this.rstTransforms,
    required this.rects,
    required this.colors,
    required this.blendMode,
    required this.cullRect,
    required this.paint,
  });

  factory Canvas_DrawRawAtlas_Record.fromBytes(BytesReader reader) => fromBytesCanvasDrawRawAtlasRecord(reader);

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
  int get tag => 31;
  @override
  void toBytesWithoutTag(BytesWriter writer) => toBytesCanvasDrawRawAtlasRecord(writer, this);
  @override
  Canvas_DrawRawAtlas_Record temporaryClone() {
    return Canvas_DrawRawAtlas_Record(
      atlas: atlas,
      rstTransforms: rstTransforms.temporaryClone(),
      rects: rects.temporaryClone(),
      colors: colors,
      blendMode: blendMode,
      cullRect: cullRect,
      paint: paint,
    );
  }
}

class Canvas_DrawShadow_Record extends Canvas_RecordBase<void> {
  Canvas_DrawShadow_Record({
    required this.path,
    required this.color,
    required this.elevation,
    required this.transparentOccluder,
  });

  factory Canvas_DrawShadow_Record.fromBytes(BytesReader reader) => fromBytesCanvasDrawShadowRecord(reader);

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
  int get tag => 32;
  @override
  void toBytesWithoutTag(BytesWriter writer) => toBytesCanvasDrawShadowRecord(writer, this);
  @override
  Canvas_DrawShadow_Record temporaryClone() {
    return Canvas_DrawShadow_Record(
      path: path.temporaryClone(),
      color: color,
      elevation: elevation,
      transparentOccluder: transparentOccluder,
    );
  }
}
