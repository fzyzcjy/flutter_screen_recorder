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
    final result = proxy.save();
    final record = Canvas_Save_Record();
    handleOp(result, record);
    return result;
  }

  @override
  void saveLayer(
    Rect? bounds,
    Paint paint,
  ) {
    final result = proxy.saveLayer(
      bounds,
      paint,
    );
    final record = Canvas_SaveLayer_Record(
      bounds: bounds,
      paint: paint,
    );
    handleOp(result, record);
    return result;
  }

  @override
  void restore() {
    final result = proxy.restore();
    final record = Canvas_Restore_Record();
    handleOp(result, record);
    return result;
  }

  @override
  void restoreToCount(int count) {
    final result = proxy.restoreToCount(count);
    final record = Canvas_RestoreToCount_Record(count: count);
    handleOp(result, record);
    return result;
  }

  @override
  int getSaveCount() {
    final result = proxy.getSaveCount();
    handleOp(result);
    return result;
  }

  @override
  void translate(
    double dx,
    double dy,
  ) {
    final result = proxy.translate(
      dx,
      dy,
    );
    final record = Canvas_Translate_Record(
      dx: dx,
      dy: dy,
    );
    handleOp(result, record);
    return result;
  }

  @override
  void scale(
    double sx, [
    double? sy,
  ]) {
    final result = proxy.scale(
      sx,
      sy,
    );
    final record = Canvas_Scale_Record(
      sx: sx,
      sy: sy,
    );
    handleOp(result, record);
    return result;
  }

  @override
  void rotate(double radians) {
    final result = proxy.rotate(radians);
    final record = Canvas_Rotate_Record(radians: radians);
    handleOp(result, record);
    return result;
  }

  @override
  void skew(
    double sx,
    double sy,
  ) {
    final result = proxy.skew(
      sx,
      sy,
    );
    final record = Canvas_Skew_Record(
      sx: sx,
      sy: sy,
    );
    handleOp(result, record);
    return result;
  }

  @override
  void transform(Float64List matrix4) {
    final result = proxy.transform(matrix4);
    final record = Canvas_Transform_Record(matrix4: matrix4);
    handleOp(result, record);
    return result;
  }

  @override
  Float64List getTransform() {
    final result = proxy.getTransform();
    handleOp(result);
    return result;
  }

  @override
  void clipRect(
    Rect rect, {
    ClipOp clipOp = ClipOp.intersect,
    bool doAntiAlias = true,
  }) {
    final result = proxy.clipRect(
      rect,
      clipOp: clipOp,
      doAntiAlias: doAntiAlias,
    );
    final record = Canvas_ClipRect_Record(
      rect: rect,
      clipOp: clipOp,
      doAntiAlias: doAntiAlias,
    );
    handleOp(result, record);
    return result;
  }

  @override
  void clipRRect(
    RRect rrect, {
    bool doAntiAlias = true,
  }) {
    final result = proxy.clipRRect(
      rrect,
      doAntiAlias: doAntiAlias,
    );
    final record = Canvas_ClipRRect_Record(
      rrect: rrect,
      doAntiAlias: doAntiAlias,
    );
    handleOp(result, record);
    return result;
  }

  @override
  void clipPath(
    Path path, {
    bool doAntiAlias = true,
  }) {
    final result = proxy.clipPath(
      path,
      doAntiAlias: doAntiAlias,
    );
    final record = Canvas_ClipPath_Record(
      path: path,
      doAntiAlias: doAntiAlias,
    );
    handleOp(result, record);
    return result;
  }

  @override
  Rect getLocalClipBounds() {
    final result = proxy.getLocalClipBounds();
    handleOp(result);
    return result;
  }

  @override
  Rect getDestinationClipBounds() {
    final result = proxy.getDestinationClipBounds();
    handleOp(result);
    return result;
  }

  @override
  void drawColor(
    Color color,
    BlendMode blendMode,
  ) {
    final result = proxy.drawColor(
      color,
      blendMode,
    );
    final record = Canvas_DrawColor_Record(
      color: color,
      blendMode: blendMode,
    );
    handleOp(result, record);
    return result;
  }

  @override
  void drawLine(
    Offset p1,
    Offset p2,
    Paint paint,
  ) {
    final result = proxy.drawLine(
      p1,
      p2,
      paint,
    );
    final record = Canvas_DrawLine_Record(
      p1: p1,
      p2: p2,
      paint: paint,
    );
    handleOp(result, record);
    return result;
  }

  @override
  void drawPaint(Paint paint) {
    final result = proxy.drawPaint(paint);
    final record = Canvas_DrawPaint_Record(paint: paint);
    handleOp(result, record);
    return result;
  }

  @override
  void drawRect(
    Rect rect,
    Paint paint,
  ) {
    final result = proxy.drawRect(
      rect,
      paint,
    );
    final record = Canvas_DrawRect_Record(
      rect: rect,
      paint: paint,
    );
    handleOp(result, record);
    return result;
  }

  @override
  void drawRRect(
    RRect rrect,
    Paint paint,
  ) {
    final result = proxy.drawRRect(
      rrect,
      paint,
    );
    final record = Canvas_DrawRRect_Record(
      rrect: rrect,
      paint: paint,
    );
    handleOp(result, record);
    return result;
  }

  @override
  void drawDRRect(
    RRect outer,
    RRect inner,
    Paint paint,
  ) {
    final result = proxy.drawDRRect(
      outer,
      inner,
      paint,
    );
    final record = Canvas_DrawDRRect_Record(
      outer: outer,
      inner: inner,
      paint: paint,
    );
    handleOp(result, record);
    return result;
  }

  @override
  void drawOval(
    Rect rect,
    Paint paint,
  ) {
    final result = proxy.drawOval(
      rect,
      paint,
    );
    final record = Canvas_DrawOval_Record(
      rect: rect,
      paint: paint,
    );
    handleOp(result, record);
    return result;
  }

  @override
  void drawCircle(
    Offset c,
    double radius,
    Paint paint,
  ) {
    final result = proxy.drawCircle(
      c,
      radius,
      paint,
    );
    final record = Canvas_DrawCircle_Record(
      c: c,
      radius: radius,
      paint: paint,
    );
    handleOp(result, record);
    return result;
  }

  @override
  void drawArc(
    Rect rect,
    double startAngle,
    double sweepAngle,
    bool useCenter,
    Paint paint,
  ) {
    final result = proxy.drawArc(
      rect,
      startAngle,
      sweepAngle,
      useCenter,
      paint,
    );
    final record = Canvas_DrawArc_Record(
      rect: rect,
      startAngle: startAngle,
      sweepAngle: sweepAngle,
      useCenter: useCenter,
      paint: paint,
    );
    handleOp(result, record);
    return result;
  }

  @override
  void drawPath(
    Path path,
    Paint paint,
  ) {
    final result = proxy.drawPath(
      path,
      paint,
    );
    final record = Canvas_DrawPath_Record(
      path: path,
      paint: paint,
    );
    handleOp(result, record);
    return result;
  }

  @override
  void drawImage(
    Image image,
    Offset offset,
    Paint paint,
  ) {
    final result = proxy.drawImage(
      image,
      offset,
      paint,
    );
    final record = Canvas_DrawImage_Record(
      image: image,
      offset: offset,
      paint: paint,
    );
    handleOp(result, record);
    return result;
  }

  @override
  void drawImageRect(
    Image image,
    Rect src,
    Rect dst,
    Paint paint,
  ) {
    final result = proxy.drawImageRect(
      image,
      src,
      dst,
      paint,
    );
    final record = Canvas_DrawImageRect_Record(
      image: image,
      src: src,
      dst: dst,
      paint: paint,
    );
    handleOp(result, record);
    return result;
  }

  @override
  void drawImageNine(
    Image image,
    Rect center,
    Rect dst,
    Paint paint,
  ) {
    final result = proxy.drawImageNine(
      image,
      center,
      dst,
      paint,
    );
    final record = Canvas_DrawImageNine_Record(
      image: image,
      center: center,
      dst: dst,
      paint: paint,
    );
    handleOp(result, record);
    return result;
  }

  @override
  void drawPicture(Picture picture) {
    final result = proxy.drawPicture(picture);
    final record = Canvas_DrawPicture_Record(picture: picture);
    handleOp(result, record);
    return result;
  }

  @override
  void drawParagraph(
    Paragraph paragraph,
    Offset offset,
  ) {
    final result = proxy.drawParagraph(
      paragraph,
      offset,
    );
    final record = Canvas_DrawParagraph_Record(
      paragraph: paragraph,
      offset: offset,
    );
    handleOp(result, record);
    return result;
  }

  @override
  void drawPoints(
    PointMode pointMode,
    List<Offset> points,
    Paint paint,
  ) {
    final result = proxy.drawPoints(
      pointMode,
      points,
      paint,
    );
    final record = Canvas_DrawPoints_Record(
      pointMode: pointMode,
      points: points,
      paint: paint,
    );
    handleOp(result, record);
    return result;
  }

  @override
  void drawRawPoints(
    PointMode pointMode,
    Float32List points,
    Paint paint,
  ) {
    final result = proxy.drawRawPoints(
      pointMode,
      points,
      paint,
    );
    final record = Canvas_DrawRawPoints_Record(
      pointMode: pointMode,
      points: points,
      paint: paint,
    );
    handleOp(result, record);
    return result;
  }

  @override
  void drawVertices(
    Vertices vertices,
    BlendMode blendMode,
    Paint paint,
  ) {
    final result = proxy.drawVertices(
      vertices,
      blendMode,
      paint,
    );
    final record = Canvas_DrawVertices_Record(
      vertices: vertices,
      blendMode: blendMode,
      paint: paint,
    );
    handleOp(result, record);
    return result;
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
    final result = proxy.drawAtlas(
      atlas,
      transforms,
      rects,
      colors,
      blendMode,
      cullRect,
      paint,
    );
    final record = Canvas_DrawAtlas_Record(
      atlas: atlas,
      transforms: transforms,
      rects: rects,
      colors: colors,
      blendMode: blendMode,
      cullRect: cullRect,
      paint: paint,
    );
    handleOp(result, record);
    return result;
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
    final result = proxy.drawRawAtlas(
      atlas,
      rstTransforms,
      rects,
      colors,
      blendMode,
      cullRect,
      paint,
    );
    final record = Canvas_DrawRawAtlas_Record(
      atlas: atlas,
      rstTransforms: rstTransforms,
      rects: rects,
      colors: colors,
      blendMode: blendMode,
      cullRect: cullRect,
      paint: paint,
    );
    handleOp(result, record);
    return result;
  }

  @override
  void drawShadow(
    Path path,
    Color color,
    double elevation,
    bool transparentOccluder,
  ) {
    final result = proxy.drawShadow(
      path,
      color,
      elevation,
      transparentOccluder,
    );
    final record = Canvas_DrawShadow_Record(
      path: path,
      color: color,
      elevation: elevation,
      transparentOccluder: transparentOccluder,
    );
    handleOp(result, record);
    return result;
  }
}
