import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ScreenPlayerInnerWidget extends LeafRenderObjectWidget {
  const ScreenPlayerInnerWidget({super.key});

  @override
  RenderObject createRenderObject(BuildContext context) => RenderScreenPlayer();

  @override
  void updateRenderObject(BuildContext context, covariant RenderObject renderObject) {}
}

class RenderScreenPlayer extends RenderBox {
  @override
  bool get sizedByParent => true;

  @override
  Size computeDryLayout(BoxConstraints constraints) => constraints.biggest;

  @override
  void paint(PaintingContext context, Offset offset) {
    // ref: _ColorFilterRenderObject, and expand source of pushColorFilter

    assert(offset == Offset.zero);

    layer ??= OffsetLayer();

    _paintToLayer(layer! as OffsetLayer);

    context.addLayer(layer!);

    assert(() {
      layer!.debugCreator = debugCreator;
      return true;
    }());
  }

  void _paintToLayer(OffsetLayer layer) {
    // TODO child layer should be disposed?
    layer.removeAllChildren();

    final childPictureLayer = PictureLayer(Offset.zero & size);

    // ref: PaintingContext._startRecording
    layer.append(childPictureLayer);

    // ref: PaintingContext.stopRecordingIfNeeded
    childPictureLayer.picture = _createPicture();
  }

  Picture _createPicture() {
    final recorder = PictureRecorder();
    final canvas = Canvas(recorder);
    canvas.drawCircle(
      const Offset(100, 100),
      200,
      Paint()
        ..color = Colors.blue
        ..style = PaintingStyle.fill,
    );
    return recorder.endRecording();
  }
}
