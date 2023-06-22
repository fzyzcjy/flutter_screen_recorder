import 'dart:ui';

import 'package:flutter/material.dart' as material;
import 'package:screen_recorder/src/bytes_reader_writer.dart';
import 'package:screen_recorder/src/placeholder_data.dart';

Image fromBytesImage(BytesReader reader) => PlaceholderData.instance.placeholderImage;

void toBytesImage(BytesWriter writer, Image value) {}

Vertices fromBytesVertices(BytesReader reader) =>
    // dummy (empty) vertices
    Vertices(VertexMode.triangles, []);

void toBytesVertices(BytesWriter writer, Vertices value) {}

ColorFilter fromBytesColorFilter(BytesReader reader) =>
    // identity ColorFilter
    const ColorFilter.matrix([1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0]);

void toBytesColorFilter(BytesWriter writer, ColorFilter value) {}

ImageFilter fromBytesImageFilter(BytesReader reader) =>
    // identity filter
    ImageFilter.matrix(material.Matrix4.identity().storage);

void toBytesImageFilter(BytesWriter writer, ImageFilter value) {}

Shader fromBytesShader(BytesReader reader) =>
    // dummy shader
    Gradient.radial(Offset.zero, 50, [material.Colors.red, material.Colors.blue]);

void toBytesShader(BytesWriter writer, Shader value) {}
