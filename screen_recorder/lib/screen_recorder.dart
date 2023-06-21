import 'dart:ui';

import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';
import 'package:screen_recorder/data_per_frame.dart';
import 'package:screen_recorder/my_canvas.dart';
import 'package:screen_recorder/my_paragraph_builder.dart';
import 'package:screen_recorder/my_scene_builder.dart';
import 'package:screen_recorder/simple_compressor.dart';

class ScreenRecorder {
  static const _kTag = 'ScreenRecorder';

  static setup() {
    PaintingContext.createCanvas = (recorder) => MyCanvas(Canvas(recorder));
    TextPainter.createParagraphBuilder = (style) => MyParagraphBuilder(style);
    RenderView.createSceneBuilder = () => MySceneBuilder(SceneBuilder());

    var overallUncompressedBytesLen = 0;
    final compressor = SimpleCompressor();

    SchedulerBinding.instance.addPersistentFrameCallback((timeStamp) {
      print('$_kTag PersistentFrameCallback '
          'overallUncompressedBytesLen=$overallUncompressedBytesLen '
          'compressor=$compressor '
          'dataPerFrame=${DataPerFrame.instance}');

      overallUncompressedBytesLen += DataPerFrame.instance.experimentalData.bytes.length;
      compressor.add(DataPerFrame.instance.experimentalData.bytes.takeBytes());

      DataPerFrame.instance = DataPerFrame();
    });
  }
}
