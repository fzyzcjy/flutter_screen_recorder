import 'dart:ui';

import 'package:screen_recorder/src/bytes_reader_writer.dart';
import 'package:screen_recorder/src/serialization/primitives.dart';

Path fromBytesPath(BytesReader reader) {
  return Path()..deserialize(fromBytesUint8List(reader));
}

void toBytesPath(BytesWriter writer, Path value) {
  toBytesUint8List(writer, value.serialize());
}
