import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui';

import 'package:screen_recorder/data_per_frame.dart';

ExperimentalData get _data => DataPerFrame.instance.experimentalData;

class MyCanvas implements Canvas {
  final Canvas canvas;

  MyCanvas(this.canvas);

  @override
  void clipPath(Path path, {bool doAntiAlias = true}) {
    _data.incrCount('clipPath');

    _data.bytes.addPath(path);
    _data.bytes.addBool(doAntiAlias);

    canvas.clipPath(path, doAntiAlias: doAntiAlias);
  }

  @override
  void clipRRect(RRect rrect, {bool doAntiAlias = true}) {
    _data.incrCount('clipRRect');

    _data.bytes.addRRect(rrect);
    _data.bytes.addBool(doAntiAlias);

    canvas.clipRRect(rrect, doAntiAlias: doAntiAlias);
  }

  @override
  void clipRect(Rect rect, {ClipOp clipOp = ClipOp.intersect, bool doAntiAlias = true}) {
    _data.incrCount('clipRect');

    _data.bytes.addRect(rect);
    _data.bytes.addUint8(clipOp.index);

    canvas.clipRect(rect, clipOp: clipOp, doAntiAlias: doAntiAlias);
  }

  @override
  void drawArc(Rect rect, double startAngle, double sweepAngle, bool useCenter, Paint paint) {
    _data.incrCount('drawArc');

    _data.bytes.addRect(rect);
    _data.bytes.addDouble(startAngle);
    _data.bytes.addDouble(sweepAngle);
    _data.bytes.addBool(useCenter);
    _data.bytes.addPaint(paint);

    canvas.drawArc(rect, startAngle, sweepAngle, useCenter, paint);
  }

  @override
  void drawAtlas(Image atlas, List<RSTransform> transforms, List<Rect> rects, List<Color>? colors, BlendMode? blendMode,
      Rect? cullRect, Paint paint) {
    _data.incrCount('drawAtlas');

    // TODO

    canvas.drawAtlas(atlas, transforms, rects, colors, blendMode, cullRect, paint);
  }

  @override
  void drawCircle(Offset c, double radius, Paint paint) {
    _data.incrCount('drawCircle');

    _data.bytes.addOffset(c);
    _data.bytes.addDouble(radius);
    _data.bytes.addPaint(paint);

    canvas.drawCircle(c, radius, paint);
  }

  @override
  void drawColor(Color color, BlendMode blendMode) {
    _data.incrCount('drawColor');

    _data.bytes.addUint32(color.value);
    _data.bytes.addUint8(blendMode.index);

    canvas.drawColor(color, blendMode);
  }

  @override
  void drawDRRect(RRect outer, RRect inner, Paint paint) {
    _data.incrCount('drawDRRect');

    _data.bytes.add(outer._getValue32().buffer.asUint8List());
    _data.bytes.add(inner._getValue32().buffer.asUint8List());
    _data.bytes.addPaint(paint);

    canvas.drawDRRect(outer, inner, paint);
  }

  @override
  void drawImage(Image image, Offset offset, Paint paint) {
    _data.incrCount('drawImage');

    // TODO image
    _data.bytes.addOffset(offset);
    _data.bytes.addPaint(paint);

    canvas.drawImage(image, offset, paint);
  }

  @override
  void drawImageNine(Image image, Rect center, Rect dst, Paint paint) {
    _data.incrCount('drawImageNine');

    // TODO image
    _data.bytes.addRect(center);
    _data.bytes.addRect(dst);
    _data.bytes.addPaint(paint);

    canvas.drawImageNine(image, center, dst, paint);
  }

  @override
  void drawImageRect(Image image, Rect src, Rect dst, Paint paint) {
    _data.incrCount('drawImageRect');

    // TODO image
    _data.bytes.addRect(src);
    _data.bytes.addRect(dst);
    _data.bytes.addPaint(paint);

    canvas.drawImageRect(image, src, dst, paint);
  }

  @override
  void drawLine(Offset p1, Offset p2, Paint paint) {
    _data.incrCount('drawLine');

    _data.bytes.addOffset(p1);
    _data.bytes.addOffset(p2);
    _data.bytes.addPaint(paint);

    canvas.drawLine(p1, p2, paint);
  }

  @override
  void drawOval(Rect rect, Paint paint) {
    _data.incrCount('drawOval');

    _data.bytes.addRect(rect);
    _data.bytes.addPaint(paint);

    canvas.drawOval(rect, paint);
  }

  @override
  void drawPaint(Paint paint) {
    _data.incrCount('drawPaint');

    _data.bytes.addPaint(paint);

    canvas.drawPaint(paint);
  }

  @override
  void drawParagraph(Paragraph paragraph, Offset offset) {
    _data.incrCount('drawParagraph');

    // NOTE: `Paragraph` is separately handled by MyParagraphBuilder
    _data.bytes.addOffset(offset);

    canvas.drawParagraph(paragraph, offset);
  }

  @override
  void drawPath(Path path, Paint paint) {
    _data.incrCount('drawPath');

    _data.bytes.addPath(path);
    _data.bytes.addPaint(paint);

    canvas.drawPath(path, paint);
  }

  @override
  void drawPicture(Picture picture) {
    _data.incrCount('drawPicture');

    // TODO picture

    canvas.drawPicture(picture);
  }

  @override
  void drawPoints(PointMode pointMode, List<Offset> points, Paint paint) {
    _data.incrCount('drawPoints');

    _data.bytes.addUint8(pointMode.index);
    for (final p in points) {
      _data.bytes.addOffset(p);
    }
    _data.bytes.addPaint(paint);

    canvas.drawPoints(pointMode, points, paint);
  }

  @override
  void drawRRect(RRect rrect, Paint paint) {
    _data.incrCount('drawRRect');

    _data.bytes.addRRect(rrect);
    _data.bytes.addPaint(paint);

    canvas.drawRRect(rrect, paint);
  }

  @override
  void drawRawAtlas(Image atlas, Float32List rstTransforms, Float32List rects, Int32List? colors, BlendMode? blendMode,
      Rect? cullRect, Paint paint) {
    _data.incrCount('drawRawAtlas');

    // TODO image

    canvas.drawRawAtlas(atlas, rstTransforms, rects, colors, blendMode, cullRect, paint);
  }

  @override
  void drawRawPoints(PointMode pointMode, Float32List points, Paint paint) {
    _data.incrCount('drawRawPoints');

    _data.bytes.addUint8(pointMode.index);
    _data.bytes.add(points.buffer.asUint8List());
    _data.bytes.addPaint(paint);

    canvas.drawRawPoints(pointMode, points, paint);
  }

  @override
  void drawRect(Rect rect, Paint paint) {
    _data.incrCount('drawRect');

    _data.bytes.addRect(rect);
    _data.bytes.addPaint(paint);

    canvas.drawRect(rect, paint);
  }

  @override
  void drawShadow(Path path, Color color, double elevation, bool transparentOccluder) {
    _data.incrCount('drawShadow');

    _data.bytes.addPath(path);
    _data.bytes.addUint32(color.value);
    _data.bytes.addDouble(elevation);
    _data.bytes.addBool(transparentOccluder);

    canvas.drawShadow(path, color, elevation, transparentOccluder);
  }

  @override
  void drawVertices(Vertices vertices, BlendMode blendMode, Paint paint) {
    _data.incrCount('drawVertices');

    // TODO vertices
    _data.bytes.addUint8(blendMode.index);
    _data.bytes.addPaint(paint);

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

extension ExtBytesBuilderCanvas on BytesBuilder {
  void addUint8(int value) => add([value]);

  void addBool(bool value) => addUint8(value ? 1 : 0);

  void addUint32(int value) => add((Uint32List(1)..[0] = value).buffer.asUint8List());

  void addDouble(double value) => add((Float64List(1)..[0] = value).buffer.asUint8List());

  void addString(String s) => add(utf8.encode(s));

  void addRRect(RRect r) => add(r._getValue32().buffer.asUint8List());

  void addRect(Rect r) => add(r._getValue32().buffer.asUint8List());

  void addOffset(Offset offset) {
    addDouble(offset.dx);
    addDouble(offset.dy);
  }

  void addPaint(Paint paint) => add(paint.data.buffer.asUint8List());

  void addPath(Path p) => add(p.dump());
}
