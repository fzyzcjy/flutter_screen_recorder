import 'dart:convert';
import 'dart:typed_data';

import 'package:screen_recorder/src/bytes_reader_writer.dart';

int fromBytesUint8(BytesReader reader) {
  return reader.readUint8();
}

void toBytesUint8(BytesWriter writer, int value) {
  assert(value >= 0 && value <= 255);
  writer.writeUint8(value);
}

bool fromBytesBool(BytesReader reader) {
  final byte = fromBytesUint8(reader);
  assert(byte == 0 || byte == 1);
  return byte != 0;
}

void toBytesBool(BytesWriter writer, bool value) {
  toBytesUint8(writer, value ? 1 : 0);
}

int fromBytesInt(BytesReader reader) {
  return reader.readInt64();
}

// TODO improve, do not create a brand new list?
// TODO consider byte order
// TODO same for toBytesDouble etc
void toBytesInt(BytesWriter writer, int value) {
  writer.writeInt64(value);
}

double fromBytesFloat(BytesReader reader) {
  return reader.readFloat32();
}

void toBytesFloat(BytesWriter writer, double value) {
  writer.writeFloat32(value);
}

double fromBytesDouble(BytesReader reader) {
  return reader.readFloat64();
}

void toBytesDouble(BytesWriter writer, double value) {
  writer.writeFloat64(value);
}

Uint8List fromBytesUint8List(BytesReader reader) {
  return fromBytesByteData(reader).buffer.asUint8List();
}

void toBytesUint8List(BytesWriter writer, Uint8List value) {
  toBytesByteData(writer, value.buffer.asByteData());
}

Int32List fromBytesInt32List(BytesReader reader) {
  return fromBytesByteData(reader).buffer.asInt32List();
}

void toBytesInt32List(BytesWriter writer, Int32List value) {
  toBytesByteData(writer, value.buffer.asByteData());
}

Float32List fromBytesFloat32List(BytesReader reader) {
  return fromBytesByteData(reader).buffer.asFloat32List();
}

void toBytesFloat32List(BytesWriter writer, Float32List value) {
  toBytesByteData(writer, value.buffer.asByteData());
}

Float64List fromBytesFloat64List(BytesReader reader) {
  return fromBytesByteData(reader).buffer.asFloat64List();
}

void toBytesFloat64List(BytesWriter writer, Float64List value) {
  toBytesByteData(writer, value.buffer.asByteData());
}

ByteData fromBytesByteData(BytesReader reader) {
  return Uint8List.fromList(fromBytesBytes(reader)).buffer.asByteData();
}

void toBytesByteData(BytesWriter writer, ByteData value) {
  toBytesBytes(writer, value.buffer.asUint8List());
}

String fromBytesString(BytesReader reader) {
  return utf8.decode(fromBytesBytes(reader));
}

void toBytesString(BytesWriter writer, String value) {
  toBytesBytes(writer, utf8.encode(value));
}

List<int> fromBytesBytes(BytesReader reader) {
  final length = fromBytesInt(reader);
  return reader.readBytes(length);
}

void toBytesBytes(BytesWriter writer, List<int> value) {
  toBytesInt(writer, value.length); // TODO use 128-variant encoding, or use 4 bytes?
  writer.writeBytes(value);
}
