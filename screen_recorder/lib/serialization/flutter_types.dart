import 'dart:typed_data';
import 'dart:ui';

import 'package:screen_recorder/bytes_reader_writer.dart';
import 'package:screen_recorder/serialization/primitives.dart';

Path fromBytesPath(BytesReader reader) {
  return Path()
    ..deserialize(fromBytesUint8List(reader));
}

void toBytesPath(BytesWriter writer, Path value) {
  toBytesUint8List(writer, value.serialize());
}
