import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui';

import 'package:screen_recorder/bytes_reader.dart';
import 'package:screen_recorder/expandos.dart';

void toBytesUint8(BytesBuilder writer, int value) {
  assert(value >= 0 && value <= 255);
  writer.addByte(value);
}

int fromBytesUint8(BytesReader reader) {
  return reader.readByte();
}

void toBytesBool(BytesBuilder writer, bool value) {
  writer.addByte(value ? 1 : 0);
}

bool fromBytesBool(BytesReader reader) {
  final byte = reader.readByte();
  assert(byte == 0 || byte == 1);
  return byte != 0;
}

// TODO improve, do not create a brand new list?
// TODO consider byte order
// TODO same for toBytesDouble etc
void toBytesInt(BytesBuilder writer, int value) {
  writer.add((Int64List(1)..[0] = value).buffer.asUint8List());
}

int fromBytesInt(BytesReader reader) {
  return TODO;
}

void toBytesFloat(BytesBuilder writer, double value) {
  writer.add((Float32List(1)..[0] = value).buffer.asUint8List());
}

double fromBytesFloat(BytesReader reader) {
  return TODO;
}

void toBytesDouble(BytesBuilder writer, double value) {
  writer.add((Float64List(1)..[0] = value).buffer.asUint8List());
}

double fromBytesDouble(BytesReader reader) {
  return TODO;
}

void toBytesString(BytesBuilder writer, String value) {
  // TODO add string length information
  writer.add(utf8.encode(value));
}

String fromBytesString(BytesReader reader) {
  return TODO;
}

void toBytesEnum(BytesBuilder writer, Enum value) {
  toBytesUint8(writer, value.index);
}

// TODO code-generate this?
T fromBytesEnum<T>(BytesReader reader) {
  return TODO;
}

void toBytesOffset(BytesBuilder writer, Offset value) {
  toBytesFloat(writer, value.dx);
  toBytesFloat(writer, value.dy);
}

Offset fromBytesOffset(BytesReader reader) {
  return TODO;
}

// TODO maybe we can auto generate this as well?
void toBytesRect(BytesBuilder writer, Rect value) {
  // ref: Rect._getValue32
  toBytesFloat(writer, value.left);
  toBytesFloat(writer, value.top);
  toBytesFloat(writer, value.right);
  toBytesFloat(writer, value.bottom);
}

Rect fromBytesRect(BytesReader reader) {
  return TODO;
}

// TODO maybe we can auto generate this as well?
void toBytesRRect(BytesBuilder writer, RRect value) {
  // ref: RRect._getValue32
  toBytesFloat(writer, value.left);
  toBytesFloat(writer, value.top);
  toBytesFloat(writer, value.right);
  toBytesFloat(writer, value.bottom);
  toBytesFloat(writer, value.tlRadiusX);
  toBytesFloat(writer, value.tlRadiusY);
  toBytesFloat(writer, value.trRadiusX);
  toBytesFloat(writer, value.trRadiusY);
  toBytesFloat(writer, value.brRadiusX);
  toBytesFloat(writer, value.brRadiusY);
  toBytesFloat(writer, value.blRadiusX);
  toBytesFloat(writer, value.blRadiusY);
}

RRect fromBytesRRect(BytesReader reader) {
  return TODO;
}

void toBytesPath(BytesBuilder writer, Path value) {
  writer.add(value.dump());
}

Path fromBytesPath(BytesReader reader) {
  return TODO;
}

void toBytesPicture(BytesBuilder writer, Picture value) {
  value.record!.toBytes(writer);
}

Picture fromBytesPicture(BytesReader reader) {
  return TODO;
}
