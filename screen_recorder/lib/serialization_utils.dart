import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui';

import 'package:screen_recorder/bytes_reader.dart';
import 'package:screen_recorder/expandos.dart';

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

Path fromBytesPath(BytesReader reader) {
  return TODO;
}

void toBytesPath(BytesBuilder writer, Path value) {
  writer.add(value.dump());
}

Picture fromBytesPicture(BytesReader reader) {
  return TODO;
}

void toBytesPicture(BytesBuilder writer, Picture value) {
  value.record!.toBytes(writer);
}

ColorFilter fromBytesColorFilter(BytesReader reader) {
  return TODO;
}

void toBytesColorFilter(BytesBuilder writer, ColorFilter value) {
  TODO;
}

ImageFilter fromBytesImageFilter(BytesReader reader) {
  return TODO;
}

void toBytesImageFilter(BytesBuilder writer, ImageFilter value) {
  TODO;
}

Shader fromBytesShader(BytesReader reader) {
  return TODO;
}

void toBytesShader(BytesBuilder writer, Shader value) {
  TODO;
}

Paint fromBytesPaint(BytesReader reader) {
  return TODO;
}

void toBytesPaint(BytesBuilder writer, Paint value) {
  TODO;
}

Image fromBytesImage(BytesReader reader) {
  return TODO;
}

void toBytesImage(BytesBuilder writer, Image value) {
  TODO;
}

Vertices fromBytesVertices(BytesReader reader) {
  return TODO;
}

void toBytesVertices(BytesBuilder writer, Vertices value) {
  TODO;
}

Paragraph fromBytesParagraph(BytesReader reader) {
  return TODO;
}

void toBytesParagraph(BytesBuilder writer, Paragraph value) {
  TODO;
}

Color fromBytesColor(BytesReader reader) {
  return Color(fromBytesInt(reader));
}

void toBytesColor(BytesBuilder writer, Color value) {
  toBytesInt(writer, value.value);
}
