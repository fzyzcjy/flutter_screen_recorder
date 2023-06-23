import 'dart:developer';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';
import 'package:screen_recorder/src/expandos.dart';
import 'package:screen_recorder/src/frame_packet.dart';
import 'package:screen_recorder/src/generated/delegate/canvas.dart';
import 'package:screen_recorder/src/generated/delegate/paragraph_builder.dart';
import 'package:screen_recorder/src/generated/delegate/scene_builder.dart';
import 'package:screen_recorder/src/generated/serialization/serialization.dart';
import 'package:screen_recorder/src/my_picture_recorder.dart';
import 'package:screen_recorder/src/placeholder_data.dart';
import 'package:screen_recorder/src/record_list.dart';
import 'package:screen_recorder/src/serialization/context.dart';
import 'package:screen_recorder/src/serialization/wrapper_types.dart';
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
  final framePackets = <Uint8List>[];

  final _toBytesContext = ToBytesContext();

  Future<void> setup() async {
    PaintingContext.createPictureRecorder = () => recording ? MyPictureRecorder(PictureRecorder()) : PictureRecorder();
    PaintingContext.createCanvas = (recorder) => recording ? MyCanvas(recorder as MyPictureRecorder) : Canvas(recorder);
    TextPainter.createParagraphBuilder = (style) => recording ? MyParagraphBuilder(style) : ParagraphBuilder(style);
    RenderView.createSceneBuilder = () => recording ? MySceneBuilder(SceneBuilder()) : SceneBuilder();
    OffsetLayer.createSceneBuilder = () {
      print('OffsetLayer.createSceneBuilder ${StackTrace.current}');
      return recording ? MySceneBuilder(SceneBuilder()) : SceneBuilder();
    };
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

      // https://github.com/fzyzcjy/yplusplus/issues/9623#issuecomment-1603494622
      if (sceneBuilderRecordList != null) {
        final framePacket = FramePacket(
          scene: sceneBuilderRecordList,
          touch: currTouchPerFrameData,
        );

        final bytesBuilder = ContextBytesWriter(context: _toBytesContext);
        toBytesFramePacket(bytesBuilder, framePacket);
        final bytes = bytesBuilder.takeBytes();

        framePackets.add(bytes);

        overallUncompressedBytesLen += bytes.length;

        compressor.add(bytes);

        // assert(() {
        //   _sanityCheckSerialization(bytes);
        //   return true;
        // }());
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

// hard to check since FromBytesContext is across frames #9638
// void _sanityCheckSerialization(Uint8List srcBytes) {
//   final reader = ContextBytesReader(srcBytes, context: FromBytesContext());
//   fromBytesFramePacket(reader);
//   assert(reader.eof, 'can fromBytes and exactly consume all bytes');
//
//   // seems not easy to check, because some data like Picture are not serializable *themselves*, but need a record
//   // final againContextBytesWriter = ContextBytesWriter(copy: true);
//   // toBytesSceneBuilderRecordList(againContextBytesWriter, restoredData);
//   // final againBytes = againContextBytesWriter.takeBytes();
//   //
//   // assert(
//   //   listEquals(srcBytes, againBytes),
//   //   'sanityCheckSerialization failed '
//   //   'srcBytes.length=${srcBytes.length} '
//   //   'againBytes.length=${againBytes.length}',
//   // );
// }
