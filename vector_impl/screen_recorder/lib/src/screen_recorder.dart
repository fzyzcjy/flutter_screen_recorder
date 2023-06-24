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
import 'package:screen_recorder/src/touch/touch_data.dart';

class ScreenRecorder {
  static const _kTag = 'ScreenRecorder';

  static final instance = ScreenRecorder._();

  ScreenRecorder._();

  var recording = true;

  var overallUncompressedBytesLen = 0;

  // final compressor = SimpleCompressor();

  // final sceneBuilderDataArr = <SceneBuilderRecordList>[];
  final framePackets = <Uint8List>[];

  final _toBytesContext = ToBytesContext();

  final _postFrameProcessInfos = <_PostFrameProcessInfo>[];

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

  void dumpDebugInfo({required bool verbose}) {
    print('$_kTag dumpDebugInfo '
        'overallUncompressedBytesLen=$overallUncompressedBytesLen '
        // 'compressor=$compressor'
        );
    if (verbose) {
      printWrapped(
          'postFrameTimeMicrosArr.where(superLong)=${_postFrameProcessInfos.where((e) => e.durationMicros >= 10000).toList()}');
      printWrapped(
          'postFrameTimeMicrosArr.where(long)=${_postFrameProcessInfos.where((e) => e.durationMicros >= 2000).toList()}');
      printWrapped(
          'postFrameTimeMicrosArr(all.duration)=${_postFrameProcessInfos.map((e) => e.durationMicros).toList()}');
      printWrapped(
          'postFrameTimeMicrosArr(all.bytes)=${_postFrameProcessInfos.map((e) => e.uncompressedBytesLen).toList()}');
      _postFrameProcessInfos.clear();
    }
  }

  void _handlePersistentFrameCallback() {
    assert(() {
      dumpDebugInfo(verbose: false);
      return true;
    }());

    if (!recording) return;

    Timeline.startSync('ScreenRecorder.PostFrame');
    final start = DateTime.now();

    final sceneBuilderRecordList = _lastSceneBuilderRecordList;
    _lastSceneBuilderRecordList = null;

    // https://github.com/fzyzcjy/yplusplus/issues/9623#issuecomment-1603494622
    if (sceneBuilderRecordList == null) return;

    final currTouchPerFrameData = touchPerFrameData;
    touchPerFrameData = TouchPerFrameData(positions: []);

    final int bytesLen;

    final framePacket = FramePacket(
      scene: sceneBuilderRecordList,
      touch: currTouchPerFrameData,
    );

    final bytesBuilder = ContextBytesWriter(context: _toBytesContext);
    toBytesFramePacket(bytesBuilder, framePacket);
    final bytes = bytesBuilder.takeBytes();

    framePackets.add(bytes);

    overallUncompressedBytesLen += bytes.length;
    bytesLen = bytes.length;

    // TODO should run in another isolate, otherwise it is slow #9648
    // compressor.add(bytes);

    // assert(() {
    //   _sanityCheckSerialization(bytes);
    //   return true;
    // }());

    Timeline.finishSync();
    _postFrameProcessInfos.add(_PostFrameProcessInfo(
      durationMicros: DateTime.now().difference(start).inMicroseconds,
      uncompressedBytesLen: bytesLen,
    ));
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

void printWrapped(String text) => RegExp('.{1,800}').allMatches(text).forEach((match) => print(match.group(0)));

class _PostFrameProcessInfo {
  final int durationMicros;
  final int uncompressedBytesLen;

  const _PostFrameProcessInfo({required this.durationMicros, required this.uncompressedBytesLen});

  @override
  String toString() => '(t=$durationMicros, len=$uncompressedBytesLen)';
}
