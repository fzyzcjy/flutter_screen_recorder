import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';
import 'package:screen_recorder/bytes_reader.dart';
import 'package:screen_recorder/data_per_frame.dart';
import 'package:screen_recorder/generated/delegate/canvas.dart';
import 'package:screen_recorder/generated/delegate/paragraph_builder.dart';
import 'package:screen_recorder/generated/delegate/scene_builder.dart';
import 'package:screen_recorder/generated/serialization/serialization.dart';
import 'package:screen_recorder/my_picture_recorder.dart';
import 'package:screen_recorder/simple_compressor.dart';

class ScreenRecorder {
  static const _kTag = 'ScreenRecorder';

  static final instance = ScreenRecorder._();

  ScreenRecorder._();

  var recording = true;

  var overallUncompressedBytesLen = 0;
  final compressor = SimpleCompressor();

  // final sceneBuilderDataArr = <SceneBuilderRecordList>[];
  final sceneBuilderDataArr = <Uint8List>[];

  void setup() {
    PaintingContext.createPictureRecorder = () => MyPictureRecorder(PictureRecorder());
    PaintingContext.createCanvas = (recorder) => MyCanvas(recorder as MyPictureRecorder);
    TextPainter.createParagraphBuilder = (style) => MyParagraphBuilder(style);
    RenderView.createSceneBuilder = () => recording ? MySceneBuilder(SceneBuilder()) : SceneBuilder();

    SchedulerBinding.instance.addPersistentFrameCallback((timeStamp) => _handlePersistentFrameCallback());
  }

  void _handlePersistentFrameCallback() {
    print('$_kTag PersistentFrameCallback '
        'overallUncompressedBytesLen=$overallUncompressedBytesLen '
        'compressor=$compressor');

    if (recording) {
      final sceneBuilderData = DataPerFrame.instance.sceneBuilderData;
      final bytesBuilder = BytesBuilder(copy: true);
      toBytesSceneBuilderRecordList(bytesBuilder, sceneBuilderData);
      final bytes = bytesBuilder.takeBytes();

      sceneBuilderDataArr.add(bytes);

      overallUncompressedBytesLen += bytes.length;
      compressor.add(bytes);

      assert(() {
        _sanityCheckSerialization(bytes);
        return true;
      }());
    }

    DataPerFrame.instance = DataPerFrame();
  }
}

void _sanityCheckSerialization(Uint8List srcBytes) {
  final reader = BytesReader(srcBytes);
  fromBytesSceneBuilderRecordList(reader);
  assert(reader.eof, 'can fromBytes and exactly consume all bytes');

  // seems not easy to check, because some data like Picture are not serializable *themselves*, but need a record
  // final againBytesBuilder = BytesBuilder(copy: true);
  // toBytesSceneBuilderRecordList(againBytesBuilder, restoredData);
  // final againBytes = againBytesBuilder.takeBytes();
  //
  // assert(
  //   listEquals(srcBytes, againBytes),
  //   'sanityCheckSerialization failed '
  //   'srcBytes.length=${srcBytes.length} '
  //   'againBytes.length=${againBytes.length}',
  // );
}
