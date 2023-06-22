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
  return reader.byteData.getInt64(reader.index);
}

// TODO improve, do not create a brand new list?
// TODO consider byte order
// TODO same for toBytesDouble etc
void toBytesInt(BytesBuilder writer, int value) {
  writer.add((Int64List(1)..[0] = value).buffer.asUint8List());
}

double fromBytesFloat(BytesReader reader) {
  return reader.byteData.getFloat32(reader.index);
}

void toBytesFloat(BytesBuilder writer, double value) {
  writer.add((Float32List(1)..[0] = value).buffer.asUint8List());
}

double fromBytesDouble(BytesReader reader) {
  return reader.byteData.getFloat64(reader.index);
}

void toBytesDouble(BytesBuilder writer, double value) {
  writer.add((Float64List(1)..[0] = value).buffer.asUint8List());
}

Int32List fromBytesInt32List(BytesReader reader) {
  return fromBytesByteData(reader).buffer.asInt32List();
}

void toBytesInt32List(BytesBuilder writer, Int32List value) {
  toBytesByteData(writer, value.buffer.asByteData());
}

Float32List fromBytesFloat32List(BytesReader reader) {
  return fromBytesByteData(reader).buffer.asFloat32List();
}

void toBytesFloat32List(BytesBuilder writer, Float32List value) {
  toBytesByteData(writer, value.buffer.asByteData());
}

Float64List fromBytesFloat64List(BytesReader reader) {
  return fromBytesByteData(reader).buffer.asFloat64List();
}

void toBytesFloat64List(BytesBuilder writer, Float64List value) {
  toBytesByteData(writer, value.buffer.asByteData());
}

ByteData fromBytesByteData(BytesReader reader) {
  return Uint8List.fromList(fromBytesBytes(reader)).buffer.asByteData();
}

void toBytesByteData(BytesBuilder writer, ByteData value) {
  toBytesBytes(writer, value.buffer.asUint8List());
}

String fromBytesString(BytesReader reader) {
  return utf8.decode(fromBytesBytes(reader));
}

void toBytesString(BytesBuilder writer, String value) {
  toBytesBytes(writer, utf8.encode(value));
}

List<int> fromBytesBytes(BytesReader reader) {
  final length = fromBytesInt(reader);
  return reader.readBytes(length);
}

void toBytesBytes(BytesBuilder writer, List<int> value) {
  toBytesInt(writer, value.length); // TODO use 128-variant encoding, or use 4 bytes?
  writer.add(value);
}
