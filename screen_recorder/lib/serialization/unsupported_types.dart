import 'dart:ui';

import 'package:screen_recorder/bytes_reader_writer.dart';
import 'package:screen_recorder/placeholder_data.dart';

// ======================= types with throw error =========================

// TODO implement these

ColorFilter fromBytesColorFilter(BytesReader reader) => throw UnimplementedError();

void toBytesColorFilter(BytesWriter writer, ColorFilter value) {}

ImageFilter fromBytesImageFilter(BytesReader reader) => throw UnimplementedError();

void toBytesImageFilter(BytesWriter writer, ImageFilter value) {}

Shader fromBytesShader(BytesReader reader) => throw UnimplementedError();

void toBytesShader(BytesWriter writer, Shader value) {}

Vertices fromBytesVertices(BytesReader reader) => throw UnimplementedError();

void toBytesVertices(BytesWriter writer, Vertices value) {}

// ======================= types with placeholder/dummy data =========================

Image fromBytesImage(BytesReader reader) => PlaceholderData.instance.placeholderImage;

void toBytesImage(BytesWriter writer, Image value) {}
