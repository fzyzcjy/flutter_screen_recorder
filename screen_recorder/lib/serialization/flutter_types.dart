import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui';

import 'package:screen_recorder/bytes_reader.dart';
import 'package:screen_recorder/expandos.dart';

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
