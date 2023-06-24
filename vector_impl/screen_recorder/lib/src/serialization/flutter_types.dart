import 'dart:ui';

import 'package:screen_recorder/src/serialization/context.dart';
import 'package:screen_recorder/src/serialization/primitives.dart';

Path fromBytesPath(ContextBytesReader reader) {
  return Path()..deserialize(fromBytesUint8List(reader));
}

void toBytesPath(ContextBytesWriter writer, Path value) {
  toBytesUint8List(writer, value.serialize());
}
