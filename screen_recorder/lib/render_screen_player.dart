import 'package:flutter/material.dart';

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
    TODO;
  }
}
