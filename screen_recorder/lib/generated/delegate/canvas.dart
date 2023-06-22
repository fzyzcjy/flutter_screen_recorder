// ignore_for_file: unused_import

import 'dart:typed_data';
import 'dart:ui';

import 'package:screen_recorder/generated/record/canvas.dart';
import 'package:screen_recorder/manual/canvas.dart';

class MyCanvas with MyCanvasMixin implements Canvas {
  @override
  final Canvas proxy;

  MyCanvas(this.proxy);

  @override
  void save() {
    Canvas_Save_Record();
    return proxy.save();
  }

  @override
  void saveLayer(
    Rect? bounds,
    Paint paint,
  ) {
    Canvas_SaveLayer_Record(
      bounds: bounds,
      paint: paint,
    );
    return proxy.saveLayer(
      bounds,
      paint,
    );
  }

  @override
  void restore() {
    Canvas_Restore_Record();
    return proxy.restore();
  }

  @override
  void restoreToCount(int count) {
    Canvas_RestoreToCount_Record(count: count);
    return proxy.restoreToCount(count);
  }

  @override
  int getSaveCount() {
    return proxy.getSaveCount();
  }

  @override
  void translate(
    double dx,
    double dy,
  ) {
    Canvas_Translate_Record(
      dx: dx,
      dy: dy,
    );
    return proxy.translate(
      dx,
      dy,
    );
  }

  @override
  void scale(
    double sx, [
    double? sy,
  ]) {
    Canvas_Scale_Record(
      sx: sx,
      sy: sy,
    );
    return proxy.scale(
      sx,
      sy,
    );
  }

  @override
  void rotate(double radians) {
    Canvas_Rotate_Record(radians: radians);
    return proxy.rotate(radians);
  }

  @override
  void skew(
    double sx,
    double sy,
  ) {
    Canvas_Skew_Record(
      sx: sx,
      sy: sy,
    );
    return proxy.skew(
      sx,
      sy,
    );
  }

  @override
  void transform(Float64List matrix4) {
    Canvas_Transform_Record(matrix4: matrix4);
    return proxy.transform(matrix4);
  }

  @override
  Float64List getTransform() {
    return proxy.getTransform();
  }

  @override
  void clipRect(
    Rect rect, {
    ClipOp clipOp = ClipOp.intersect,
    bool doAntiAlias = true,
  }) {
    Canvas_ClipRect_Record(
      rect: rect,
      clipOp: clipOp,
      doAntiAlias: doAntiAlias,
    );
    return proxy.clipRect(
      rect,
      clipOp: clipOp,
      doAntiAlias: doAntiAlias,
    );
  }

  @override
  void clipRRect(
    RRect rrect, {
    bool doAntiAlias = true,
  }) {
    Canvas_ClipRRect_Record(
      rrect: rrect,
      doAntiAlias: doAntiAlias,
    );
    return proxy.clipRRect(
      rrect,
      doAntiAlias: doAntiAlias,
    );
  }

  @override
  void clipPath(
    Path path, {
    bool doAntiAlias = true,
  }) {
    Canvas_ClipPath_Record(
      path: path,
      doAntiAlias: doAntiAlias,
    );
    return proxy.clipPath(
      path,
      doAntiAlias: doAntiAlias,
    );
  }

  @override
  Rect getLocalClipBounds() {
    return proxy.getLocalClipBounds();
  }

  @override
  Rect getDestinationClipBounds() {
    return proxy.getDestinationClipBounds();
  }

  @override
  void drawColor(
    Color color,
    BlendMode blendMode,
  ) {
    Canvas_DrawColor_Record(
      color: color,
      blendMode: blendMode,
    );
    return proxy.drawColor(
      color,
      blendMode,
    );
  }

  @override
  void drawLine(
    Offset p1,
    Offset p2,
    Paint paint,
  ) {
    Canvas_DrawLine_Record(
      p1: p1,
      p2: p2,
      paint: paint,
    );
    return proxy.drawLine(
      p1,
      p2,
      paint,
    );
  }

  @override
  void drawPaint(Paint paint) {
    Canvas_DrawPaint_Record(paint: paint);
    return proxy.drawPaint(paint);
  }

  @override
  void drawRect(
    Rect rect,
    Paint paint,
  ) {
    Canvas_DrawRect_Record(
      rect: rect,
      paint: paint,
    );
    return proxy.drawRect(
      rect,
      paint,
    );
  }

  @override
  void drawRRect(
    RRect rrect,
    Paint paint,
  ) {
    Canvas_DrawRRect_Record(
      rrect: rrect,
      paint: paint,
    );
    return proxy.drawRRect(
      rrect,
      paint,
    );
  }

  @override
  void drawDRRect(
    RRect outer,
    RRect inner,
    Paint paint,
  ) {
    Canvas_DrawDRRect_Record(
      outer: outer,
      inner: inner,
      paint: paint,
    );
    return proxy.drawDRRect(
      outer,
      inner,
      paint,
    );
  }

  @override
  void drawOval(
    Rect rect,
    Paint paint,
  ) {
    Canvas_DrawOval_Record(
      rect: rect,
      paint: paint,
    );
    return proxy.drawOval(
      rect,
      paint,
    );
  }

  @override
  void drawCircle(
    Offset c,
    double radius,
    Paint paint,
  ) {
    Canvas_DrawCircle_Record(
      c: c,
      radius: radius,
      paint: paint,
    );
    return proxy.drawCircle(
      c,
      radius,
      paint,
    );
  }

  @override
  void drawArc(
    Rect rect,
    double startAngle,
    double sweepAngle,
    bool useCenter,
    Paint paint,
  ) {
    Canvas_DrawArc_Record(
      rect: rect,
      startAngle: startAngle,
      sweepAngle: sweepAngle,
      useCenter: useCenter,
      paint: paint,
    );
    return proxy.drawArc(
      rect,
      startAngle,
      sweepAngle,
      useCenter,
      paint,
    );
  }

  @override
  void drawPath(
    Path path,
    Paint paint,
  ) {
    Canvas_DrawPath_Record(
      path: path,
      paint: paint,
    );
    return proxy.drawPath(
      path,
      paint,
    );
  }

  @override
  void drawImage(
    Image image,
    Offset offset,
    Paint paint,
  ) {
    Canvas_DrawImage_Record(
      image: image,
      offset: offset,
      paint: paint,
    );
    return proxy.drawImage(
      image,
      offset,
      paint,
    );
  }

  @override
  void drawImageRect(
    Image image,
    Rect src,
    Rect dst,
    Paint paint,
  ) {
    Canvas_DrawImageRect_Record(
      image: image,
      src: src,
      dst: dst,
      paint: paint,
    );
    return proxy.drawImageRect(
      image,
      src,
      dst,
      paint,
    );
  }

  @override
  void drawImageNine(
    Image image,
    Rect center,
    Rect dst,
    Paint paint,
  ) {
    Canvas_DrawImageNine_Record(
      image: image,
      center: center,
      dst: dst,
      paint: paint,
    );
    return proxy.drawImageNine(
      image,
      center,
      dst,
      paint,
    );
  }

  @override
  void drawPicture(Picture picture) {
    Canvas_DrawPicture_Record(picture: picture);
    return proxy.drawPicture(picture);
  }

  @override
  void drawParagraph(
    Paragraph paragraph,
    Offset offset,
  ) {
    Canvas_DrawParagraph_Record(
      paragraph: paragraph,
      offset: offset,
    );
    return proxy.drawParagraph(
      paragraph,
      offset,
    );
  }

  @override
  void drawPoints(
    PointMode pointMode,
    List<Offset> points,
    Paint paint,
  ) {
    Canvas_DrawPoints_Record(
      pointMode: pointMode,
      points: points,
      paint: paint,
    );
    return proxy.drawPoints(
      pointMode,
      points,
      paint,
    );
  }

  @override
  void drawRawPoints(
    PointMode pointMode,
    Float32List points,
    Paint paint,
  ) {
    Canvas_DrawRawPoints_Record(
      pointMode: pointMode,
      points: points,
      paint: paint,
    );
    return proxy.drawRawPoints(
      pointMode,
      points,
      paint,
    );
  }

  @override
  void drawVertices(
    Vertices vertices,
    BlendMode blendMode,
    Paint paint,
  ) {
    Canvas_DrawVertices_Record(
      vertices: vertices,
      blendMode: blendMode,
      paint: paint,
    );
    return proxy.drawVertices(
      vertices,
      blendMode,
      paint,
    );
  }

  @override
  void drawAtlas(
    Image atlas,
    List<RSTransform> transforms,
    List<Rect> rects,
    List<Color>? colors,
    BlendMode? blendMode,
    Rect? cullRect,
    Paint paint,
  ) {
    Canvas_DrawAtlas_Record(
      atlas: atlas,
      transforms: transforms,
      rects: rects,
      colors: colors,
      blendMode: blendMode,
      cullRect: cullRect,
      paint: paint,
    );
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
  void drawRawAtlas(
    Image atlas,
    Float32List rstTransforms,
    Float32List rects,
    Int32List? colors,
    BlendMode? blendMode,
    Rect? cullRect,
    Paint paint,
  ) {
    Canvas_DrawRawAtlas_Record(
      atlas: atlas,
      rstTransforms: rstTransforms,
      rects: rects,
      colors: colors,
      blendMode: blendMode,
      cullRect: cullRect,
      paint: paint,
    );
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
  void drawShadow(
    Path path,
    Color color,
    double elevation,
    bool transparentOccluder,
  ) {
    Canvas_DrawShadow_Record(
      path: path,
      color: color,
      elevation: elevation,
      transparentOccluder: transparentOccluder,
    );
    return proxy.drawShadow(
      path,
      color,
      elevation,
      transparentOccluder,
    );
  }
}
