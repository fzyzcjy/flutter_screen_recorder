import 'dart:typed_data';
import 'dart:ui';

class CanvasStat {
  static var instance = CanvasStat();

  final countMap = <String, int>{};

  void incrCount(String name) => countMap[name] = (countMap[name] ?? 0) + 1;
 
  int get totalCount => countMap.values.fold(0, (a, b) => a + b);

  @override
  String toString() => 'CanvasStat(countMap: $countMap, totalCount: $totalCount)';
}

class MyCanvas implements Canvas {
  final Canvas canvas;

  MyCanvas(this.canvas);

  @override
  void clipPath(Path path, {bool doAntiAlias = true}) {
    CanvasStat.instance.incrCount('clipPath');
    canvas.clipPath(path, doAntiAlias: doAntiAlias);
  }

  @override
  void clipRRect(RRect rrect, {bool doAntiAlias = true}) {
    CanvasStat.instance.incrCount('clipRRect');
    canvas.clipRRect(rrect, doAntiAlias: doAntiAlias);
  }

  @override
  void clipRect(Rect rect, {ClipOp clipOp = ClipOp.intersect, bool doAntiAlias = true}) {
    CanvasStat.instance.incrCount('clipRect');
    canvas.clipRect(rect, clipOp: clipOp, doAntiAlias: doAntiAlias);
  }

  @override
  void drawArc(Rect rect, double startAngle, double sweepAngle, bool useCenter, Paint paint) {
    CanvasStat.instance.incrCount('drawArc');
    canvas.drawArc(rect, startAngle, sweepAngle, useCenter, paint);
  }

  @override
  void drawAtlas(Image atlas, List<RSTransform> transforms, List<Rect> rects, List<Color>? colors, BlendMode? blendMode,
      Rect? cullRect, Paint paint) {
    CanvasStat.instance.incrCount('drawAtlas');
    canvas.drawAtlas(atlas, transforms, rects, colors, blendMode, cullRect, paint);
  }

  @override
  void drawCircle(Offset c, double radius, Paint paint) {
    CanvasStat.instance.incrCount('drawCircle');
    canvas.drawCircle(c, radius, paint);
  }

  @override
  void drawColor(Color color, BlendMode blendMode) {
    CanvasStat.instance.incrCount('drawColor');
    canvas.drawColor(color, blendMode);
  }

  @override
  void drawDRRect(RRect outer, RRect inner, Paint paint) {
    CanvasStat.instance.incrCount('drawDRRect');
    canvas.drawDRRect(outer, inner, paint);
  }

  @override
  void drawImage(Image image, Offset offset, Paint paint) {
    CanvasStat.instance.incrCount('drawImage');
    canvas.drawImage(image, offset, paint);
  }

  @override
  void drawImageNine(Image image, Rect center, Rect dst, Paint paint) {
    CanvasStat.instance.incrCount('drawImageNine');
    canvas.drawImageNine(image, center, dst, paint);
  }

  @override
  void drawImageRect(Image image, Rect src, Rect dst, Paint paint) {
    CanvasStat.instance.incrCount('drawImageRect');
    canvas.drawImageRect(image, src, dst, paint);
  }

  @override
  void drawLine(Offset p1, Offset p2, Paint paint) {
    CanvasStat.instance.incrCount('drawLine');
    canvas.drawLine(p1, p2, paint);
  }

  @override
  void drawOval(Rect rect, Paint paint) {
    CanvasStat.instance.incrCount('drawOval');
    canvas.drawOval(rect, paint);
  }

  @override
  void drawPaint(Paint paint) {
    CanvasStat.instance.incrCount('drawPaint');
    canvas.drawPaint(paint);
  }

  @override
  void drawParagraph(Paragraph paragraph, Offset offset) {
    CanvasStat.instance.incrCount('drawParagraph');
    canvas.drawParagraph(paragraph, offset);
  }

  @override
  void drawPath(Path path, Paint paint) {
    CanvasStat.instance.incrCount('drawPath');
    canvas.drawPath(path, paint);
  }

  @override
  void drawPicture(Picture picture) {
    CanvasStat.instance.incrCount('drawPicture');
    canvas.drawPicture(picture);
  }

  @override
  void drawPoints(PointMode pointMode, List<Offset> points, Paint paint) {
    CanvasStat.instance.incrCount('drawPoints');
    canvas.drawPoints(pointMode, points, paint);
  }

  @override
  void drawRRect(RRect rrect, Paint paint) {
    CanvasStat.instance.incrCount('drawRRect');
    canvas.drawRRect(rrect, paint);
  }

  @override
  void drawRawAtlas(Image atlas, Float32List rstTransforms, Float32List rects, Int32List? colors, BlendMode? blendMode,
      Rect? cullRect, Paint paint) {
    CanvasStat.instance.incrCount('drawRawAtlas');
    canvas.drawRawAtlas(atlas, rstTransforms, rects, colors, blendMode, cullRect, paint);
  }

  @override
  void drawRawPoints(PointMode pointMode, Float32List points, Paint paint) {
    CanvasStat.instance.incrCount('drawRawPoints');
    canvas.drawRawPoints(pointMode, points, paint);
  }

  @override
  void drawRect(Rect rect, Paint paint) {
    CanvasStat.instance.incrCount('drawRect');
    canvas.drawRect(rect, paint);
  }

  @override
  void drawShadow(Path path, Color color, double elevation, bool transparentOccluder) {
    CanvasStat.instance.incrCount('drawShadow');
    canvas.drawShadow(path, color, elevation, transparentOccluder);
  }

  @override
  void drawVertices(Vertices vertices, BlendMode blendMode, Paint paint) {
    CanvasStat.instance.incrCount('drawVertices');
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
