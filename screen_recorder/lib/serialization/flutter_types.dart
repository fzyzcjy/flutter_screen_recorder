import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui';

import 'package:screen_recorder/bytes_reader.dart';
import 'package:screen_recorder/expandos.dart';
import 'package:screen_recorder/serialization/primitives.dart';

Path fromBytesPath(BytesReader reader) {
  return TODO;
}

void toBytesPath(BytesBuilder writer, Path value) {
  writer.add(value.dump());
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

Color fromBytesColor(BytesReader reader) {
  return Color(fromBytesInt(reader));
}

void toBytesColor(BytesBuilder writer, Color value) {
  toBytesInt(writer, value.value);
}

TextHeightBehavior fromBytesTextHeightBehavior(BytesReader reader) {
  return TODO;
}

void toBytesTextHeightBehavior(BytesBuilder writer, TextHeightBehavior value) {
  TODO;
}

FontWeight fromBytesFontWeight(BytesReader reader) {
  return TODO;
}

void toBytesFontWeight(BytesBuilder writer, FontWeight value) {
  TODO;
}

Locale fromBytesLocale(BytesReader reader) {
  return TODO;
}

void toBytesLocale(BytesBuilder writer, Locale value) {
  TODO;
}

TextDecoration fromBytesTextDecoration(BytesReader reader) {
  return TODO;
}

void toBytesTextDecoration(BytesBuilder writer, TextDecoration value) {
  TODO;
}

TextDecorationStyle fromBytesTextDecorationStyle(BytesReader reader) {
  return TODO;
}

void toBytesTextDecorationStyle(BytesBuilder writer, TextDecorationStyle value) {
  TODO;
}

Shadow fromBytesShadow(BytesReader reader) {
  return TODO;
}

void toBytesShadow(BytesBuilder writer, Shadow value) {
  TODO;
}

FontFeature fromBytesFontFeature(BytesReader reader) {
  return TODO;
}

void toBytesFontFeature(BytesBuilder writer, FontFeature value) {
  TODO;
}

FontVariation fromBytesFontVariation(BytesReader reader) {
  return TODO;
}

void toBytesFontVariation(BytesBuilder writer, FontVariation value) {
  TODO;
}

X fromBytesX(BytesReader reader) {
  return TODO;
}

void toBytesX(BytesBuilder writer, X value) {
  TODO;
}
