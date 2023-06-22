import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:screen_recorder/replayer/scene_builder.dart';
import 'package:screen_recorder/screen_recorder.dart';

class ScreenPlayerWidget extends StatefulWidget {
  const ScreenPlayerWidget({Key? key}) : super(key: key);

  @override
  State<ScreenPlayerWidget> createState() => _ScreenPlayerWidgetState();
}

class _ScreenPlayerWidgetState extends State<ScreenPlayerWidget> {
  var frameIndex = 0;

  @override
  void initState() {
    super.initState();

    // deliberately make it super slow for easy debuggign
    Timer.periodic(const Duration(milliseconds: 200), (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }

      setState(() {
        frameIndex = (frameIndex + 1) % ScreenRecorder.instance.sceneBuilderDataArr.length;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // use RepaintBoundary to ensure paint() gets offset=zero to ease programming
    return Stack(
      children: [
        RepaintBoundary(
          child: Transform.scale(
            // https://github.com/fzyzcjy/yplusplus/issues/9590#issuecomment-1601922243
            // TODO should be devicePixelRatio of the phone that *records* this, not the phone that *plays* this
            scale: 1 / View.of(context).devicePixelRatio,
            alignment: Alignment.topLeft,
            origin: Offset.zero,
            child: RepaintBoundary(
              child: _ScreenPlayerInnerWidget(
                frameIndex: frameIndex,
              ),
            ),
          ),
        ),
        Positioned(
          top: 64,
          left: 0,
          right: 0,
          child: Text(
            'Play frame #$frameIndex',
            style: const TextStyle(fontSize: 20, color: Colors.black),
          ),
        ),
      ],
    );
  }
}

class _ScreenPlayerInnerWidget extends LeafRenderObjectWidget {
  final int frameIndex;

  const _ScreenPlayerInnerWidget({required this.frameIndex});

  @override
  RenderObject createRenderObject(BuildContext context) => RenderScreenPlayer(frameIndex: frameIndex);

  @override
  void updateRenderObject(BuildContext context, RenderScreenPlayer renderObject) =>
      renderObject.frameIndex = frameIndex;
}

class RenderScreenPlayer extends RenderBox {
  RenderScreenPlayer({
    required int frameIndex,
  }) : _frameIndex = frameIndex;

  int get frameIndex => _frameIndex;
  int _frameIndex;

  set frameIndex(int value) {
    if (_frameIndex == value) return;
    _frameIndex = value;
    markNeedsPaint();
  }

  @override
  bool get sizedByParent => true;

  @override
  Size computeDryLayout(BoxConstraints constraints) => constraints.biggest;

  @override
  void paint(PaintingContext context, Offset offset) {
    print('$runtimeType.paint');

    // ref: _ColorFilterRenderObject, and expand source of pushColorFilter

    assert(offset == Offset.zero);

    layer ??= ScreenPlayerLayer(frameIndex: frameIndex);
    context.addLayer(layer!);

    (layer! as ScreenPlayerLayer).frameIndex = frameIndex;

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
  ScreenPlayerLayer({
    required int frameIndex,
  }) : _frameIndex = frameIndex;

  int get frameIndex => _frameIndex;
  int _frameIndex;

  set frameIndex(int value) {
    if (_frameIndex == value) return;
    _frameIndex = value;
    markNeedsAddToScene();
  }

  @override
  void addToScene(SceneBuilder builder) {
    print('$runtimeType.addToScene');

    SceneBuilderReplayer.replay(ScreenRecorder.instance.sceneBuilderDataArr[frameIndex], builder);

    // _addToSceneColorFilterLayer(builder, () {
    //   _addToScenePictureLayer(builder);
    // });
  }

// void _addToSceneColorFilterLayer(SceneBuilder builder, void Function() childAddToScene) {
//   // ref: ColorFilterLayer
//   engineLayer = builder.pushColorFilter(
//     _simpleColorFilter,
//     oldLayer: engineLayer as ColorFilterEngineLayer?,
//   );
//   childAddToScene();
//   builder.pop();
// }
//
// void _addToScenePictureLayer(SceneBuilder builder) {
//   final picture = _createPicture();
//   // ref: PictureLayer
//   builder.addPicture(Offset.zero, picture);
// }
}

// Picture _createPicture() {
//   final recorder = PictureRecorder();
//   final canvas = Canvas(recorder);
//   canvas.drawCircle(
//     const Offset(150, 150),
//     150,
//     Paint()
//       ..color = Colors.red
//       ..style = PaintingStyle.fill,
//   );
//   return recorder.endRecording();
// }
//
// const _simpleColorFilter =
//     ColorFilter.matrix(<double>[-1, 0, 0, 0, 255, 0, -1, 0, 0, 255, 0, 0, -1, 0, 255, 0, 0, 0, 1, 0]);
