import 'dart:ui';

import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';
import 'package:screen_recorder/data_per_frame.dart';
import 'package:screen_recorder/my_canvas.dart';
import 'package:screen_recorder/my_paragraph_builder.dart';
import 'package:screen_recorder/my_scene_builder.dart';
import 'package:screen_recorder/scene_builder_record.dart';
import 'package:screen_recorder/simple_compressor.dart';

class ScreenRecorder {
  static const _kTag = 'ScreenRecorder';

  static final instance = ScreenRecorder._();

  ScreenRecorder._();

  var recording = true;

  var overallUncompressedBytesLen = 0;
  final compressor = SimpleCompressor();

  final sceneBuilderDataArr = <SceneBuilderData>[];

  void setup() {
    PaintingContext.createCanvas = (recorder) => MyCanvas(Canvas(recorder));
    TextPainter.createParagraphBuilder = (style) => MyParagraphBuilder(style);
    RenderView.createSceneBuilder = () => MySceneBuilder(SceneBuilder());

    SchedulerBinding.instance.addPersistentFrameCallback((timeStamp) => _handlePersistentFrameCallback());
  }

  void _handlePersistentFrameCallback() {
    print('$_kTag PersistentFrameCallback '
        'overallUncompressedBytesLen=$overallUncompressedBytesLen '
        'compressor=$compressor '
        'experimentalData=${DataPerFrame.instance.experimentalData}');

    overallUncompressedBytesLen += DataPerFrame.instance.experimentalData.bytes.length;
    compressor.add(DataPerFrame.instance.experimentalData.bytes.takeBytes());

    if (recording) {
      sceneBuilderDataArr.add(DataPerFrame.instance.sceneBuilderData);
    }

    DataPerFrame.instance = DataPerFrame();
  }
}
