import 'dart:developer';
import 'dart:ui';

import 'package:screen_recorder/src/delegate_base/paragraph.dart';
import 'package:screen_recorder/src/expandos.dart';
import 'package:screen_recorder/src/generated/record/canvas.dart';
import 'package:screen_recorder/src/generated/record/paragraph_builder.dart';
import 'package:screen_recorder/src/generated/record/scene_builder.dart';
import 'package:screen_recorder/src/generated/serialization/serialization.dart';
import 'package:screen_recorder/src/replayer/canvas.dart';
import 'package:screen_recorder/src/replayer/paragraph_builder.dart';
import 'package:screen_recorder/src/serialization/context.dart';

Picture fromBytesPicture(ContextBytesReader reader) {
  return CanvasReplayer.replay(fromBytesCanvasRecordList(reader));
}

void toBytesPicture(ContextBytesWriter writer, Picture value) {
  Timeline.startSync('toBytesPicture');
  toBytesCanvasRecordList(writer, value.canvasRecordList!);
  Timeline.finishSync();
}

Paragraph fromBytesParagraph(ContextBytesReader reader) {
  final paragraphBuilderRecordList = fromBytesParagraphBuilderRecordList(reader);
  final paragraphRecord = fromBytesParagraphRecord(reader);
  return ParagraphBuilderReplayer.replay(paragraphBuilderRecordList, paragraphRecord);
}

void toBytesParagraph(ContextBytesWriter writer, Paragraph value) {
  final nativeParagraph = value.nativeParagraph;
  toBytesParagraphBuilderRecordList(writer, nativeParagraph.paragraphBuilderRecordList!);
  toBytesParagraphRecord(writer, nativeParagraph.paragraphRecord!);
}

const fromBytesParagraphBuilderRecordBase = ParagraphBuilder_RecordBase.fromBytes;
const fromBytesCanvasRecordBase = Canvas_RecordBase.fromBytes;
const fromBytesSceneBuilderRecordBase = SceneBuilder_RecordBase.fromBytes;

void toBytesParagraphBuilderRecordBase(ContextBytesWriter writer, ParagraphBuilder_RecordBase value) =>
    value.toBytes(writer);

void toBytesCanvasRecordBase(ContextBytesWriter writer, Canvas_RecordBase value) => value.toBytes(writer);

void toBytesSceneBuilderRecordBase(ContextBytesWriter writer, SceneBuilder_RecordBase value) {
  Timeline.startSync('toBytesSceneBuilderRecordBase');
  value.toBytes(writer);
  Timeline.finishSync();
}
