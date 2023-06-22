import 'dart:typed_data';
import 'dart:ui';

import 'package:screen_recorder/bytes_reader.dart';
import 'package:screen_recorder/expandos.dart';

Picture fromBytesPicture(BytesReader reader) {
  return TODO;
}

void toBytesPicture(BytesBuilder writer, Picture value) {
  value.record!.toBytes(writer);
}

Paragraph fromBytesParagraph(BytesReader reader) {
  return TODO;
}

void toBytesParagraph(BytesBuilder writer, Paragraph value) {
  TODO;
}
