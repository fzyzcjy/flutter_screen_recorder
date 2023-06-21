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

    layer ??= ColorFilterLayer();
   
    // TODO play with the layer

    context.addLayer(layer!);

    assert(() {
      layer!.debugCreator = debugCreator;
      return true;
    }());
  }
}
