import 'dart:developer';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';
import 'package:screen_recorder/src/bytes_reader_writer.dart';
import 'package:screen_recorder/src/expandos.dart';
import 'package:screen_recorder/src/generated/delegate/canvas.dart';
import 'package:screen_recorder/src/generated/delegate/paragraph_builder.dart';
import 'package:screen_recorder/src/generated/delegate/scene_builder.dart';
import 'package:screen_recorder/src/generated/serialization/serialization.dart';
import 'package:screen_recorder/src/my_picture_recorder.dart';
import 'package:screen_recorder/src/placeholder_data.dart';
import 'package:screen_recorder/src/record_list.dart';
import 'package:screen_recorder/src/simple_compressor.dart';
import 'package:screen_recorder/src/touch/touch_data.dart';

class ScreenRecorder {
  static const _kTag = 'ScreenRecorder';

  static final instance = ScreenRecorder._();

  ScreenRecorder._();

  var recording = true;

  var overallUncompressedBytesLen = 0;
  final compressor = SimpleCompressor();

  // final sceneBuilderDataArr = <SceneBuilderRecordList>[];
  final sceneBuilderDataArr = <Uint8List>[];

  Future<void> setup() async {
    PaintingContext.createPictureRecorder = () => recording ? MyPictureRecorder(PictureRecorder()) : PictureRecorder();
    PaintingContext.createCanvas = (recorder) => recording ? MyCanvas(recorder as MyPictureRecorder) : Canvas(recorder);
    TextPainter.createParagraphBuilder = (style) => recording ? MyParagraphBuilder(style) : ParagraphBuilder(style);
    OffsetLayer.createSceneBuilder =
        RenderView.createSceneBuilder = () => recording ? MySceneBuilder(SceneBuilder()) : SceneBuilder();
    RenderView.onCallViewRender = _handleCallViewRender;

    SchedulerBinding.instance.addPersistentFrameCallback((timeStamp) => _handlePersistentFrameCallback());

    await PlaceholderData.instance.setup();
  }

  SceneBuilderRecordList? _lastSceneBuilderRecordList;
  var touchPerFrameData = TouchPerFrameData(positions: []);

  void _handleCallViewRender(Scene scene) {
    if (recording) {
      _lastSceneBuilderRecordList = scene.sceneBuilderRecordList!;
    }
  }

  void _handlePersistentFrameCallback() {
    assert(() {
      print('$_kTag PersistentFrameCallback '
          'overallUncompressedBytesLen=$overallUncompressedBytesLen '
          'compressor=$compressor');
      return true;
    }());

    if (recording) {
      Timeline.startSync('ScreenRecorder.PostFrame');

      final sceneBuilderRecordList = _lastSceneBuilderRecordList;
      _lastSceneBuilderRecordList = null;

      final currTouchPerFrameData = touchPerFrameData;
      touchPerFrameData = TouchPerFrameData(positions: []);
     
      TODO_about_touch;

      // https://github.com/fzyzcjy/yplusplus/issues/9623#issuecomment-1603494622
      if (sceneBuilderRecordList != null) {
        final bytesBuilder = BytesWriter();
        toBytesSceneBuilderRecordList(bytesBuilder, sceneBuilderRecordList);
        final bytes = bytesBuilder.takeBytes();

        sceneBuilderDataArr.add(bytes);

        overallUncompressedBytesLen += bytes.length;

        compressor.add(bytes);

        assert(() {
          _sanityCheckSerialization(bytes);
          return true;
        }());
      } else {
        assert(() {
          print('_handlePersistentFrameCallback but see sceneBuilderRecordList == null, thus do nothing');
          return true;
        }());
      }

      Timeline.finishSync();
    }
  }
}

void _sanityCheckSerialization(Uint8List srcBytes) {
  final reader = BytesReader(srcBytes);
  fromBytesSceneBuilderRecordList(reader);
  assert(reader.eof, 'can fromBytes and exactly consume all bytes');

  // seems not easy to check, because some data like Picture are not serializable *themselves*, but need a record
  // final againBytesWriter = BytesWriter(copy: true);
  // toBytesSceneBuilderRecordList(againBytesWriter, restoredData);
  // final againBytes = againBytesWriter.takeBytes();
  //
  // assert(
  //   listEquals(srcBytes, againBytes),
  //   'sanityCheckSerialization failed '
  //   'srcBytes.length=${srcBytes.length} '
  //   'againBytes.length=${againBytes.length}',
  // );
}
