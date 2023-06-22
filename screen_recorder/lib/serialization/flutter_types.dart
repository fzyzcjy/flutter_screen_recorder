import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui';

import 'package:screen_recorder/bytes_reader.dart';
import 'package:screen_recorder/expandos.dart';
import 'package:screen_recorder/serialization/primitives.dart';

Path fromBytesPath(BytesReader reader) {
  return TODO;
}

void toBytesPath(BytesBuilder writer, Path value) {
  writer.add(value.dump());
}
