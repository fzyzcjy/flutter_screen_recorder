import 'dart:typed_data';

import 'package:screen_recorder/bytes_reader_writer.dart';
import 'package:screen_recorder/serialization/primitives.dart';

T? fromBytesNullable<T extends Object>(BytesReader reader, T Function(BytesReader) fromBytesInner) {
  final hasContent = fromBytesBool(reader);
  return hasContent ? fromBytesInner(reader) : null;
}

void toBytesNullable<T extends Object>(BytesBuilder writer, T? value, void Function(BytesBuilder, T) toBytesInner) {
  toBytesBool(writer, value != null);
  if (value != null) toBytesInner(writer, value);
}

List<T> fromBytesList<T extends Object>(BytesReader reader, T Function(BytesReader) fromBytesInner) {
  final length = fromBytesInt(reader);
  return [for (var i = 0; i < length; ++i) fromBytesInner(reader)];
}

void toBytesList<T extends Object>(BytesBuilder writer, List<T> value, void Function(BytesBuilder, T) toBytesInner) {
  toBytesInt(writer, value.length);
  for (final item in value) {
    toBytesInner(writer, item);
  }
}

List<T>? fromBytesNullableList<T extends Object>(BytesReader reader, T Function(BytesReader) fromBytesInner) {
  return fromBytesNullable(reader, (reader) => fromBytesList(reader, fromBytesInner));
}

void toBytesNullableList<T extends Object>(
    BytesBuilder writer, List<T>? value, void Function(BytesBuilder, T) toBytesInner) {
  toBytesNullable(writer, value, (writer, value) => toBytesList(writer, value, toBytesInner));
}
