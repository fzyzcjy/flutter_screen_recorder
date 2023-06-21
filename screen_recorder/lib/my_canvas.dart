import 'dart:typed_data';
import 'dart:ui';

import 'package:screen_recorder/data_per_frame.dart';
import 'package:screen_recorder/dynamic_uint8_list.dart';

class MyCanvas implements Canvas {
  final Canvas canvas;

  MyCanvas(this.canvas);

  @override
  void clipPath(Path path, {bool doAntiAlias = true}) {
    DataPerFrame.instance.incrCount('clipPath');

    DataPerFrame.instance.bytes.addPath(path);
    DataPerFrame.instance.bytes.addBool(doAntiAlias);

    canvas.clipPath(path, doAntiAlias: doAntiAlias);
  }

  @override
  void clipRRect(RRect rrect, {bool doAntiAlias = true}) {
    DataPerFrame.instance.incrCount('clipRRect');

    DataPerFrame.instance.bytes.addRRect(rrect);
    DataPerFrame.instance.bytes.addBool(doAntiAlias);

    canvas.clipRRect(rrect, doAntiAlias: doAntiAlias);
  }

  @override
  void clipRect(Rect rect, {ClipOp clipOp = ClipOp.intersect, bool doAntiAlias = true}) {
    DataPerFrame.instance.incrCount('clipRect');

    DataPerFrame.instance.bytes.addRect(rect);
    DataPerFrame.instance.bytes.addUint8(clipOp.index);

    canvas.clipRect(rect, clipOp: clipOp, doAntiAlias: doAntiAlias);
  }

  @override
  void drawArc(Rect rect, double startAngle, double sweepAngle, bool useCenter, Paint paint) {
    DataPerFrame.instance.incrCount('drawArc');

    DataPerFrame.instance.bytes.addRect(rect);
    DataPerFrame.instance.bytes.addDouble(startAngle);
    DataPerFrame.instance.bytes.addDouble(sweepAngle);
    DataPerFrame.instance.bytes.addBool(useCenter);
    DataPerFrame.instance.bytes.addPaint(paint);

    canvas.drawArc(rect, startAngle, sweepAngle, useCenter, paint);
  }

  @override
  void drawAtlas(Image atlas, List<RSTransform> transforms, List<Rect> rects, List<Color>? colors, BlendMode? blendMode,
      Rect? cullRect, Paint paint) {
    DataPerFrame.instance.incrCount('drawAtlas');

    // TODO

    canvas.drawAtlas(atlas, transforms, rects, colors, blendMode, cullRect, paint);
  }

  @override
  void drawCircle(Offset c, double radius, Paint paint) {
    DataPerFrame.instance.incrCount('drawCircle');

    DataPerFrame.instance.bytes.addOffset(c);
    DataPerFrame.instance.bytes.addDouble(radius);
    DataPerFrame.instance.bytes.addPaint(paint);

    canvas.drawCircle(c, radius, paint);
  }

  @override
  void drawColor(Color color, BlendMode blendMode) {
    DataPerFrame.instance.incrCount('drawColor');

    DataPerFrame.instance.bytes.addUint32(color.value);
    DataPerFrame.instance.bytes.addUint8(blendMode.index);

    canvas.drawColor(color, blendMode);
  }

  @override
  void drawDRRect(RRect outer, RRect inner, Paint paint) {
    DataPerFrame.instance.incrCount('drawDRRect');

    DataPerFrame.instance.bytes.addAll(outer._getValue32().buffer.asUint8List());
    DataPerFrame.instance.bytes.addAll(inner._getValue32().buffer.asUint8List());
    DataPerFrame.instance.bytes.addPaint(paint);

    canvas.drawDRRect(outer, inner, paint);
  }

  @override
  void drawImage(Image image, Offset offset, Paint paint) {
    DataPerFrame.instance.incrCount('drawImage');

    // TODO image
    DataPerFrame.instance.bytes.addOffset(offset);
    DataPerFrame.instance.bytes.addPaint(paint);

    canvas.drawImage(image, offset, paint);
  }

  @override
  void drawImageNine(Image image, Rect center, Rect dst, Paint paint) {
    DataPerFrame.instance.incrCount('drawImageNine');

    // TODO image
    DataPerFrame.instance.bytes.addRect(center);
    DataPerFrame.instance.bytes.addRect(dst);
    DataPerFrame.instance.bytes.addPaint(paint);

    canvas.drawImageNine(image, center, dst, paint);
  }

  @override
  void drawImageRect(Image image, Rect src, Rect dst, Paint paint) {
    DataPerFrame.instance.incrCount('drawImageRect');

    // TODO image
    DataPerFrame.instance.bytes.addRect(src);
    DataPerFrame.instance.bytes.addRect(dst);
    DataPerFrame.instance.bytes.addPaint(paint);

    canvas.drawImageRect(image, src, dst, paint);
  }

  @override
  void drawLine(Offset p1, Offset p2, Paint paint) {
    DataPerFrame.instance.incrCount('drawLine');

    DataPerFrame.instance.bytes.addOffset(p1);
    DataPerFrame.instance.bytes.addOffset(p2);
    DataPerFrame.instance.bytes.addPaint(paint);

    canvas.drawLine(p1, p2, paint);
  }

  @override
  void drawOval(Rect rect, Paint paint) {
    DataPerFrame.instance.incrCount('drawOval');

    DataPerFrame.instance.bytes.addRect(rect);
    DataPerFrame.instance.bytes.addPaint(paint);

    canvas.drawOval(rect, paint);
  }

  @override
  void drawPaint(Paint paint) {
    DataPerFrame.instance.incrCount('drawPaint');

    DataPerFrame.instance.bytes.addPaint(paint);

    canvas.drawPaint(paint);
  }

  @override
  void drawParagraph(Paragraph paragraph, Offset offset) {
    DataPerFrame.instance.incrCount('drawParagraph');

    // NOTE: `Paragraph` is separately handled by MyParagraphBuilder
    DataPerFrame.instance.bytes.addOffset(offset);

    canvas.drawParagraph(paragraph, offset);
  }

  @override
  void drawPath(Path path, Paint paint) {
    DataPerFrame.instance.incrCount('drawPath');

    DataPerFrame.instance.bytes.addPath(path);
    DataPerFrame.instance.bytes.addPaint(paint);

    canvas.drawPath(path, paint);
  }

  @override
  void drawPicture(Picture picture) {
    DataPerFrame.instance.incrCount('drawPicture');

    // TODO picture

    canvas.drawPicture(picture);
  }

  @override
  void drawPoints(PointMode pointMode, List<Offset> points, Paint paint) {
    DataPerFrame.instance.incrCount('drawPoints');

    DataPerFrame.instance.bytes.addUint8(pointMode.index);
    for (final p in points) {
      DataPerFrame.instance.bytes.addOffset(p);
    }
    DataPerFrame.instance.bytes.addPaint(paint);

    canvas.drawPoints(pointMode, points, paint);
  }

  @override
  void drawRRect(RRect rrect, Paint paint) {
    DataPerFrame.instance.incrCount('drawRRect');

    DataPerFrame.instance.bytes.addRRect(rrect);
    DataPerFrame.instance.bytes.addPaint(paint);

    canvas.drawRRect(rrect, paint);
  }

  @override
  void drawRawAtlas(Image atlas, Float32List rstTransforms, Float32List rects, Int32List? colors, BlendMode? blendMode,
      Rect? cullRect, Paint paint) {
    DataPerFrame.instance.incrCount('drawRawAtlas');

    // TODO image

    canvas.drawRawAtlas(atlas, rstTransforms, rects, colors, blendMode, cullRect, paint);
  }

  @override
  void drawRawPoints(PointMode pointMode, Float32List points, Paint paint) {
    DataPerFrame.instance.incrCount('drawRawPoints');

    DataPerFrame.instance.bytes.addUint8(pointMode.index);
    DataPerFrame.instance.bytes.addAll(points.buffer.asUint8List());
    DataPerFrame.instance.bytes.addPaint(paint);

    canvas.drawRawPoints(pointMode, points, paint);
  }

  @override
  void drawRect(Rect rect, Paint paint) {
    DataPerFrame.instance.incrCount('drawRect');

    DataPerFrame.instance.bytes.addRect(rect);
    DataPerFrame.instance.bytes.addPaint(paint);

    canvas.drawRect(rect, paint);
  }

  @override
  void drawShadow(Path path, Color color, double elevation, bool transparentOccluder) {
    DataPerFrame.instance.incrCount('drawShadow');

    DataPerFrame.instance.bytes.addPath(path);
    DataPerFrame.instance.bytes.addUint32(color.value);
    DataPerFrame.instance.bytes.addDouble(elevation);
    DataPerFrame.instance.bytes.addBool(transparentOccluder);

    canvas.drawShadow(path, color, elevation, transparentOccluder);
  }

  @override
  void drawVertices(Vertices vertices, BlendMode blendMode, Paint paint) {
    DataPerFrame.instance.incrCount('drawVertices');

    // TODO vertices
    DataPerFrame.instance.bytes.addUint8(blendMode.index);
    DataPerFrame.instance.bytes.addPaint(paint);

    canvas.drawVertices(vertices, blendMode, paint);
  }

  @override
  Rect getDestinationClipBounds() {
    return canvas.getDestinationClipBounds();
  }

  @override
  Rect getLocalClipBounds() {
    return canvas.getLocalClipBounds();
  }

  @override
  int getSaveCount() {
    return canvas.getSaveCount();
  }

  @override
  Float64List getTransform() {
    return canvas.getTransform();
  }

  @override
  void restore() {
    canvas.restore();
  }

  @override
  void restoreToCount(int count) {
    canvas.restoreToCount(count);
  }

  @override
  void rotate(double radians) {
    canvas.rotate(radians);
  }

  @override
  void save() {
    canvas.save();
  }

  @override
  void saveLayer(Rect? bounds, Paint paint) {
    canvas.saveLayer(bounds, paint);
  }

  @override
  void scale(double sx, [double? sy]) {
    canvas.scale(sx, sy);
  }

  @override
  void skew(double sx, double sy) {
    canvas.skew(sx, sy);
  }

  @override
  void transform(Float64List matrix4) {
    canvas.transform(matrix4);
  }

  @override
  void translate(double dx, double dy) {
    canvas.translate(dx, dy);
  }
}

// copied from RRect
extension on RRect {
  Float32List _getValue32() {
    final Float32List result = Float32List(12);
    result[0] = left;
    result[1] = top;
    result[2] = right;
    result[3] = bottom;
    result[4] = tlRadiusX;
    result[5] = tlRadiusY;
    result[6] = trRadiusX;
    result[7] = trRadiusY;
    result[8] = brRadiusX;
    result[9] = brRadiusY;
    result[10] = blRadiusX;
    result[11] = blRadiusY;
    return result;
  }
}

extension on Rect {
  Float32List _getValue32() {
    final Float32List result = Float32List(4);
    result[0] = left;
    result[1] = top;
    result[2] = right;
    result[3] = bottom;
    return result;
  }
}

extension ExtDynamicUint8ListCanvas on DynamicUint8List {
  void addRRect(RRect r) => addAll(r._getValue32().buffer.asUint8List());

  void addRect(Rect r) => addAll(r._getValue32().buffer.asUint8List());

  void addOffset(Offset offset) {
    addDouble(offset.dx);
    addDouble(offset.dy);
  }

  void addPaint(Paint paint) => addAll(paint.data.buffer.asUint8List());

  void addPath(Path p) => addAll(p.dump());
}
