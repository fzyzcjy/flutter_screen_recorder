import 'dart:typed_data';

import 'package:screen_recorder/bytes_reader.dart';
import 'package:screen_recorder/serialization/primitives.dart';

T? fromBytesNullable<T extends Object>(BytesReader reader, T Function(BytesReader) fromBytesInner) {
  final hasContent = fromBytesBool(reader);
  return hasContent ? fromBytesInner(reader) : null;
}

void toBytesNullable<T extends Object>(BytesBuilder writer, T? value, void Function(BytesBuilder, T) toBytesInner) {
  toBytesBool(writer, value != null);
  if (value != null) toBytesInner(writer, value);
}
