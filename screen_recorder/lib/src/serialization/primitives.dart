import 'dart:convert';
import 'dart:typed_data';

import 'package:screen_recorder/src/serialization/context.dart';

int fromBytesUint8(ContextBytesReader reader) {
  return reader.readUint8();
}

void toBytesUint8(ContextBytesWriter writer, int value) {
  assert(value >= 0 && value <= 255);
  writer.writeUint8(value);
}

bool fromBytesBool(ContextBytesReader reader) {
  final byte = fromBytesUint8(reader);
  assert(byte == 0 || byte == 1);
  return byte != 0;
}

void toBytesBool(ContextBytesWriter writer, bool value) {
  toBytesUint8(writer, value ? 1 : 0);
}

int fromBytesInt(ContextBytesReader reader) {
  return reader.readInt64();
}

// TODO improve, do not create a brand new list?
// TODO consider byte order
// TODO same for toBytesDouble etc
void toBytesInt(ContextBytesWriter writer, int value) {
  writer.writeInt64(value);
}

double fromBytesFloat(ContextBytesReader reader) {
  return reader.readFloat32();
}

void toBytesFloat(ContextBytesWriter writer, double value) {
  writer.writeFloat32(value);
}

double fromBytesDouble(ContextBytesReader reader) {
  return reader.readFloat64();
}

void toBytesDouble(ContextBytesWriter writer, double value) {
  writer.writeFloat64(value);
}

Uint8List fromBytesUint8List(ContextBytesReader reader) {
  return fromBytesByteData(reader).buffer.asUint8List();
}

void toBytesUint8List(ContextBytesWriter writer, Uint8List value) {
  toBytesByteData(writer, value.buffer.asByteData());
}

Int32List fromBytesInt32List(ContextBytesReader reader) {
  return fromBytesByteData(reader).buffer.asInt32List();
}

void toBytesInt32List(ContextBytesWriter writer, Int32List value) {
  toBytesByteData(writer, value.buffer.asByteData());
}

Float32List fromBytesFloat32List(ContextBytesReader reader) {
  return fromBytesByteData(reader).buffer.asFloat32List();
}

void toBytesFloat32List(ContextBytesWriter writer, Float32List value) {
  toBytesByteData(writer, value.buffer.asByteData());
}

Float64List fromBytesFloat64List(ContextBytesReader reader) {
  return fromBytesByteData(reader).buffer.asFloat64List();
}

void toBytesFloat64List(ContextBytesWriter writer, Float64List value) {
  toBytesByteData(writer, value.buffer.asByteData());
}

ByteData fromBytesByteData(ContextBytesReader reader) {
  return Uint8List.fromList(fromBytesBytes(reader)).buffer.asByteData();
}

void toBytesByteData(ContextBytesWriter writer, ByteData value) {
  toBytesBytes(writer, value.buffer.asUint8List());
}

String fromBytesString(ContextBytesReader reader) {
  return utf8.decode(fromBytesBytes(reader));
}

void toBytesString(ContextBytesWriter writer, String value) {
  toBytesBytes(writer, utf8.encode(value));
}

List<int> fromBytesBytes(ContextBytesReader reader) {
  final length = fromBytesInt(reader);
  return reader.readBytes(length);
}

void toBytesBytes(ContextBytesWriter writer, List<int> value) {
  toBytesInt(writer, value.length); // TODO use 128-variant encoding, or use 4 bytes?
  writer.writeBytes(value);
}
