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

    layer ??= ScreenPlayerLayer();
    context.addLayer(layer!);

    // layer ??= OffsetLayer();
    //
    // _paintToLayer(layer! as OffsetLayer);
    //
    // context.addLayer(layer!);
    //
    // assert(() {
    //   layer!.debugCreator = debugCreator;
    //   return true;
    // }());
  }

// void _paintToLayer(OffsetLayer layer) {
//   // TODO child layer should be disposed?
//   layer.removeAllChildren();
//
//   final childColorFilterLayer = ColorFilterLayer();
//   childColorFilterLayer.colorFilter = _simpleColorFilter;
//   layer.append(childColorFilterLayer);
//
//   final grandchildPictureLayer = PictureLayer(Offset.zero & size);
//   grandchildPictureLayer.picture = _createPicture();
//   childColorFilterLayer.append(grandchildPictureLayer);
// }
//
}

class ScreenPlayerLayer extends ContainerLayer {
  @override
  void addToScene(SceneBuilder builder) {
    final picture = _createPicture();

    // ref: PictureLayer
    builder.addPicture(Offset.zero, picture);
  }
}

Picture _createPicture() {
  final recorder = PictureRecorder();
  final canvas = Canvas(recorder);
  canvas.drawCircle(
    const Offset(150, 150),
    150,
    Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill,
  );
  return recorder.endRecording();
}

const _simpleColorFilter =
    ColorFilter.matrix(<double>[-1, 0, 0, 0, 255, 0, -1, 0, 0, 255, 0, 0, -1, 0, 255, 0, 0, 0, 1, 0]);
