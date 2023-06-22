import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui';

import 'package:screen_recorder/expandos.dart';

void toBytesUint8(BytesBuilder builder, int value) {
  assert(value >= 0 && value <= 255);
  builder.addByte(value);
}

void toBytesBool(BytesBuilder builder, bool value) {
  builder.addByte(value ? 1 : 0);
}

// TODO improve, do not create a brand new list?
// TODO consider byte order
// TODO same for toBytesDouble etc
void toBytesInt(BytesBuilder builder, int value) {
  builder.add((Int64List(1)..[0] = value).buffer.asUint8List());
}

void toBytesFloat(BytesBuilder builder, double value) {
  builder.add((Float32List(1)..[0] = value).buffer.asUint8List());
}

void toBytesDouble(BytesBuilder builder, double value) {
  builder.add((Float64List(1)..[0] = value).buffer.asUint8List());
}

void toBytesString(BytesBuilder builder, String value) {
  // TODO add string length information
  builder.add(utf8.encode(value));
}

void toBytesEnum(BytesBuilder builder, Enum value) {
  toBytesUint8(builder, value.index);
}

void toBytesOffset(BytesBuilder builder, Offset value) {
  toBytesFloat(builder, value.dx);
  toBytesFloat(builder, value.dy);
}

void toBytesRect(BytesBuilder builder, Rect value) {
  // ref: Rect._getValue32
  toBytesFloat(builder, value.left);
  toBytesFloat(builder, value.top);
  toBytesFloat(builder, value.right);
  toBytesFloat(builder, value.bottom);
}

void toBytesRRect(BytesBuilder builder, RRect value) {
  // ref: RRect._getValue32
  toBytesFloat(builder, value.left);
  toBytesFloat(builder, value.top);
  toBytesFloat(builder, value.right);
  toBytesFloat(builder, value.bottom);
  toBytesFloat(builder, value.tlRadiusX);
  toBytesFloat(builder, value.tlRadiusY);
  toBytesFloat(builder, value.trRadiusX);
  toBytesFloat(builder, value.trRadiusY);
  toBytesFloat(builder, value.brRadiusX);
  toBytesFloat(builder, value.brRadiusY);
  toBytesFloat(builder, value.blRadiusX);
  toBytesFloat(builder, value.blRadiusY);
}

void toBytesPath(BytesBuilder builder, Path value) {
  builder.add(value.dump());
}

void toBytesPicture(BytesBuilder builder, Picture value) {
  value.record!.toBytes(builder);
}
