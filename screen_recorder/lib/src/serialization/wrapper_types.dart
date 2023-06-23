import 'package:screen_recorder/src/referable.dart';
import 'package:screen_recorder/src/serialization/context.dart';
import 'package:screen_recorder/src/serialization/primitives.dart';

T? fromBytesNullable<T extends Object>(ContextBytesReader reader, T Function(ContextBytesReader) fromBytesInner) {
  final hasContent = fromBytesBool(reader);
  return hasContent ? fromBytesInner(reader) : null;
}

void toBytesNullable<T extends Object>(
    ContextBytesWriter writer, T? value, void Function(ContextBytesWriter, T) toBytesInner) {
  toBytesBool(writer, value != null);
  if (value != null) toBytesInner(writer, value);
}

List<T> fromBytesList<T extends Object>(ContextBytesReader reader, T Function(ContextBytesReader) fromBytesInner) {
  final length = fromBytesInt(reader);
  return [for (var i = 0; i < length; ++i) fromBytesInner(reader)];
}

void toBytesList<T extends Object>(
    ContextBytesWriter writer, List<T> value, void Function(ContextBytesWriter, T) toBytesInner) {
  toBytesInt(writer, value.length);
  for (final item in value) {
    toBytesInner(writer, item);
  }
}

List<T>? fromBytesNullableList<T extends Object>(
    ContextBytesReader reader, T Function(ContextBytesReader) fromBytesInner) {
  return fromBytesNullable(reader, (reader) => fromBytesList(reader, fromBytesInner));
}

void toBytesNullableList<T extends Object>(
    ContextBytesWriter writer, List<T>? value, void Function(ContextBytesWriter, T) toBytesInner) {
  toBytesNullable(writer, value, (writer, value) => toBytesList(writer, value, toBytesInner));
}

T fromBytesReferable<T>(ContextBytesReader reader, ReferableReadContext context, T Function() fromBytesInner) {
  return TODO;
}

void toBytesReferable<T>(
    ContextBytesWriter writer, ReferableWriteContext context, T value, void Function() toBytesInner) {
  TODO;
}
