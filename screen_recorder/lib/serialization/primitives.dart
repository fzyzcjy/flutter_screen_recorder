import 'dart:convert';
import 'dart:typed_data';

import 'package:screen_recorder/bytes_reader.dart';

int fromBytesUint8(BytesReader reader) {
  return reader.readByte();
}

void toBytesUint8(BytesBuilder writer, int value) {
  assert(value >= 0 && value <= 255);
  writer.addByte(value);
}

bool fromBytesBool(BytesReader reader) {
  final byte = reader.readByte();
  assert(byte == 0 || byte == 1);
  return byte != 0;
}

void toBytesBool(BytesBuilder writer, bool value) {
  writer.addByte(value ? 1 : 0);
}

int fromBytesInt(BytesReader reader) {
  return TODO;
}

// TODO improve, do not create a brand new list?
// TODO consider byte order
// TODO same for toBytesDouble etc
void toBytesInt(BytesBuilder writer, int value) {
  writer.add((Int64List(1)..[0] = value).buffer.asUint8List());
}

double fromBytesFloat(BytesReader reader) {
  return TODO;
}

void toBytesFloat(BytesBuilder writer, double value) {
  writer.add((Float32List(1)..[0] = value).buffer.asUint8List());
}

double fromBytesDouble(BytesReader reader) {
  return TODO;
}

void toBytesDouble(BytesBuilder writer, double value) {
  writer.add((Float64List(1)..[0] = value).buffer.asUint8List());
}

Int32List fromBytesInt32List(BytesReader reader) {
  return TODO;
}

void toBytesInt32List(BytesBuilder writer, Int32List value) {
  TODO;
}

Float32List fromBytesFloat32List(BytesReader reader) {
  return TODO;
}

void toBytesFloat32List(BytesBuilder writer, Float32List value) {
  TODO;
}

Float64List fromBytesFloat64List(BytesReader reader) {
  return TODO;
}

void toBytesFloat64List(BytesBuilder writer, Float64List value) {
  TODO;
}

ByteData fromBytesByteData(BytesReader reader) {
  return TODO;
}

void toBytesByteData(BytesBuilder writer, ByteData value) {
  TODO;
}

String fromBytesString(BytesReader reader) {
  return TODO;
}

void toBytesString(BytesBuilder writer, String value) {
  // TODO add string length information
  writer.add(utf8.encode(value));
}
