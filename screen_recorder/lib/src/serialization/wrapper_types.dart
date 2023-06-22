import 'package:screen_recorder/src/bytes_reader_writer.dart';
import 'package:screen_recorder/src/serialization/primitives.dart';

T? fromBytesNullable<T extends Object>(BytesReader reader, T Function(BytesReader) fromBytesInner) {
  final hasContent = fromBytesBool(reader);
  return hasContent ? fromBytesInner(reader) : null;
}

void toBytesNullable<T extends Object>(BytesWriter writer, T? value, void Function(BytesWriter, T) toBytesInner) {
  toBytesBool(writer, value != null);
  if (value != null) toBytesInner(writer, value);
}

List<T> fromBytesList<T extends Object>(BytesReader reader, T Function(BytesReader) fromBytesInner) {
  final length = fromBytesInt(reader);
  return [for (var i = 0; i < length; ++i) fromBytesInner(reader)];
}

void toBytesList<T extends Object>(BytesWriter writer, List<T> value, void Function(BytesWriter, T) toBytesInner) {
  toBytesInt(writer, value.length);
  for (final item in value) {
    toBytesInner(writer, item);
  }
}

List<T>? fromBytesNullableList<T extends Object>(BytesReader reader, T Function(BytesReader) fromBytesInner) {
  return fromBytesNullable(reader, (reader) => fromBytesList(reader, fromBytesInner));
}

void toBytesNullableList<T extends Object>(
    BytesWriter writer, List<T>? value, void Function(BytesWriter, T) toBytesInner) {
  toBytesNullable(writer, value, (writer, value) => toBytesList(writer, value, toBytesInner));
}