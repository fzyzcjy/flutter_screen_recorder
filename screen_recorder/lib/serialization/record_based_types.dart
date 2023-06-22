import 'dart:typed_data';
import 'dart:ui';

import 'package:screen_recorder/bytes_reader.dart';
import 'package:screen_recorder/expandos.dart';
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
