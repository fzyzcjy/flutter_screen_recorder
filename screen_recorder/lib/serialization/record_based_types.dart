import 'dart:ui';

import 'package:screen_recorder/bytes_reader_writer.dart';
import 'package:screen_recorder/delegate_base/paragraph.dart';
import 'package:screen_recorder/expandos.dart';
import 'package:screen_recorder/generated/record/canvas.dart';
import 'package:screen_recorder/generated/record/paragraph_builder.dart';
import 'package:screen_recorder/generated/record/scene_builder.dart';
import 'package:screen_recorder/generated/serialization/serialization.dart';
import 'package:screen_recorder/replayer/canvas.dart';
import 'package:screen_recorder/replayer/paragraph_builder.dart';

Picture fromBytesPicture(BytesReader reader) {
  return CanvasReplayer.replay(fromBytesCanvasRecordList(reader));
}

void toBytesPicture(BytesWriter writer, Picture value) {
  toBytesCanvasRecordList(writer, value.canvasRecordList!);
}

Paragraph fromBytesParagraph(BytesReader reader) {
  final paragraphBuilderRecordList = fromBytesParagraphBuilderRecordList(reader);
  final paragraphRecord = fromBytesParagraphRecord(reader);
  return ParagraphBuilderReplayer.replay(paragraphBuilderRecordList, paragraphRecord);
}

void toBytesParagraph(BytesWriter writer, Paragraph value) {
  final nativeParagraph = value.nativeParagraph;
  toBytesParagraphBuilderRecordList(writer, nativeParagraph.paragraphBuilderRecordList!);
  toBytesParagraphRecord(writer, nativeParagraph.paragraphRecord!);
}

const fromBytesParagraphBuilderRecordBase = ParagraphBuilder_RecordBase.fromBytes;
const fromBytesCanvasRecordBase = Canvas_RecordBase.fromBytes;
const fromBytesSceneBuilderRecordBase = SceneBuilder_RecordBase.fromBytes;

void toBytesParagraphBuilderRecordBase(BytesWriter writer, ParagraphBuilder_RecordBase value) => value.toBytes(writer);

void toBytesCanvasRecordBase(BytesWriter writer, Canvas_RecordBase value) => value.toBytes(writer);

void toBytesSceneBuilderRecordBase(BytesWriter writer, SceneBuilder_RecordBase value) => value.toBytes(writer);
