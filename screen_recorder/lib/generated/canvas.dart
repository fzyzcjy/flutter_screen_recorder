import 'dart:typed_data';
import 'dart:ui';

mixin CanvasMixin implements Canvas {
  Canvas get proxy;

  @override
  void save() {
    return proxy.save();
  }

  @override
  void saveLayer(
    Rect? bounds,
    Paint paint,
  ) {
    return proxy.saveLayer(
      bounds,
      paint,
    );
  }

  @override
  void restore() {
    return proxy.restore();
  }

  @override
  void restoreToCount(int count) {
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
    return proxy.scale(
      sx,
      sy,
    );
  }

  @override
  void rotate(double radians) {
    return proxy.rotate(radians);
  }

  @override
  void skew(
    double sx,
    double sy,
  ) {
    return proxy.skew(
      sx,
      sy,
    );
  }

  @override
  void transform(Float64List matrix4) {
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
    return proxy.drawLine(
      p1,
      p2,
      paint,
    );
  }

  @override
  void drawPaint(Paint paint) {
    return proxy.drawPaint(paint);
  }

  @override
  void drawRect(
    Rect rect,
    Paint paint,
  ) {
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
    return proxy.drawImageNine(
      image,
      center,
      dst,
      paint,
    );
  }

  @override
  void drawPicture(Picture picture) {
    return proxy.drawPicture(picture);
  }

  @override
  void drawParagraph(
    Paragraph paragraph,
    Offset offset,
  ) {
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
    return proxy.drawShadow(
      path,
      color,
      elevation,
      transparentOccluder,
    );
  }
}
