import 'dart:typed_data';
import 'dart:ui';

import 'package:screen_recorder/bytes_reader.dart';
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

void toBytesPicture(BytesBuilder writer, Picture value) {
  toBytesCanvasRecordList(writer, value.record!);
}

Paragraph fromBytesParagraph(BytesReader reader) {
  return ParagraphBuilderReplayer.replay(fromBytesParagraphBuilderRecordList(reader));
}

void toBytesParagraph(BytesBuilder writer, Paragraph value) {
  toBytesParagraphBuilderRecordList(writer, value.record!);
}

const fromBytesParagraphBuilderRecordBase = ParagraphBuilder_RecordBase.fromBytes;
const fromBytesCanvasRecordBase = Canvas_RecordBase.fromBytes;
const fromBytesSceneBuilderRecordBase = SceneBuilder_RecordBase.fromBytes;

void toBytesParagraphBuilderRecordBase(BytesBuilder writer, ParagraphBuilder_RecordBase value) => value.toBytes(writer);

void toBytesCanvasRecordBase(BytesBuilder writer, Canvas_RecordBase value) => value.toBytes(writer);

void toBytesSceneBuilderRecordBase(BytesBuilder writer, SceneBuilder_RecordBase value) => value.toBytes(writer);
